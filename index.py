from flask import Flask
from flask.ext.mysqldb import MySQL

app = Flask(__name__)
app.config['MYSQL_DB'] = 'test'
mysql = MySQL(app)


@app.route('/')
def welcome():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT * FROM book''')
    result = cur.fetchall()
    return str(result)

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=80)
