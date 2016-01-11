from flask import Flask, render_template
from flask.ext.mysqldb import MySQL

app = Flask(__name__)
app.config['MYSQL_DB'] = 'mybaseball'
app.config['MYSQL_USER'] = 'guest'
app.config['MYSQL_PASSWORD'] = 'aOVG1L2xDC'
app.config['MYSQL_HOST'] = 'localhost'
mysql = MySQL(app)


@app.route('/')
def test():
    cur = mysql.connection.cursor()
    cur.execute('''USE test ''')
    key_list = ['title', 'author']
    key_string = ', '.join(key_list)
    cur.execute('SELECT ' + key_string + ' FROM book')

    result = cur.fetchall()

    return render_template('layout.html')

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=80)
