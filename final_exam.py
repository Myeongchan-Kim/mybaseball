from flask import Flask
from flask.ext.mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_USER'] = 'myungchan'
app.config['MYSQL_PASSWORD'] = 'dbgood'
app.config['MYSQL_DB'] = 'myungchan'
app.config['MYSQL_HOST'] = '10.73.38.158'
mysql = MySQL(app)


@app.route('/')
def test():
    cur = mysql.connection.cursor()
    result_header = '''
    <body>
        <h1> Next Student List </h1>
        <ul>
    '''
    result_tail = '''
        </ul>
    </body>
    '''

    result_body = ""
    row_header = "<li>"
    row_tail = "</li>"

    cur.execute('USE myungchan')
    cur.execute('''
    SELECT m.track_name, s.name FROM major AS m
        INNER JOIN student AS s
        ON m.s_id = s.id
    ''')
    data = cur.fetchall()
    for row in data:
        row_body = row_header + "name : %s , track : %s " % (row[1], row[0])
        result_body += row_body

    result_string = result_header + result_body + result_tail
    return result_string


if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=80)
