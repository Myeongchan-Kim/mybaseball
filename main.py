# -*- coding: utf-8 -*-
from flask import Flask, render_template, redirect, url_for
from flask.ext.mysqldb import MySQL

app = Flask(__name__)
app.config['MYSQL_DB'] = 'mybaseball'
app.config['MYSQL_USER'] = 'guest'
app.config['MYSQL_PASSWORD'] = 'aOVG1L2xDC'
app.config['MYSQL_HOST'] = 'localhost'
mysql = MySQL(app)
charset = 'utf-8'
object_type_list = ['league', 'team', 'player', 'game']


def get_table(object_type, id_num):
    cur = mysql.connection.cursor()
    cur.execute('USE mybaseball')
    tables = []
    if id_num == 0:
        description = ('No', " ", 'Data')
    elif object_type == object_type_list[0]:
        query = "CALL load_rank_table(%d)" % id_num
        cur.execute(query)
        table = {
            "index": [
                '팀명'.decode(charset),
                '승'.decode(charset),
                '무'.decode(charset),
                '패'.decode(charset),
                '승률'.decode(charset)
            ],
            "value": cur.fetchall()
        }
        tables.append(table)

        query = "SELECT league_year, league_name FROM league WHERE league_id = %d" % id_num
        cur.execute(query)
        description = cur.fetchall()
        query = '''
            SELECT game_id , league_name , round , gameday , home, away, result, hscore, ascore
            FROM show_games where league_id = %d
        ''' % id_num
        cur.execute(query)
        table = {
            "index": ['id'.decode(charset),
                      '리그명'.decode(charset),
                      '라운드'.decode(charset),
                      '경기날짜'.decode(charset),
                      'home', 'away',
                      'result',
                      'hscore', 'ascore'],
            "value": cur.fetchall()
        }
        tables.append(table)
    elif object_type == object_type_list[1]:
        pass
    return description, tables


@app.route('/')
def test():
    global object_type_list
    cur = mysql.connection.cursor()
    cur.execute('''USE test ''')
    key_list = ['title', 'author']
    key_string = ', '.join(key_list)
    cur.execute('SELECT ' + key_string + ' FROM book')

    result = cur.fetchall()

    return render_template('layout.html', object_list=object_type_list)


@app.route('/add/<object_type>', methods=['GET'])
def add_object(object_type):
    global object_type_list
    if object_type not in object_type_list:
        return render_template('error.html')

    html_file_name = 'add_' + object_type + '.html'
    return render_template(html_file_name, object_list=object_type_list)


@app.route('/show/<object_type>/<int:id_num>', methods=['GET'])
def show_object(object_type, id_num):
    global object_type_list
    if object_type not in object_type_list:
        return render_template('error.html')
    html_file_name = 'show_' + object_type + '.html'
    (description, table) = get_table(object_type, id_num)
    return render_template(html_file_name,
                           object_list=object_type_list,
                           description=description,
                           table_list=table)


@app.route('/search/<object_type>')
def search(object_type):
    global object_type_list
    html_file_name = 'search_' + object_type + '.html'
    return render_template(html_file_name, object_list=object_type_list)


if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=80)
