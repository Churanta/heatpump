# from pytz import timezone
from datetime import datetime
from flask import Flask, request, jsonify, session, redirect, url_for, render_template, flash
from flaskext.mysql import MySQL
from awscrt import io, mqtt, auth, http
from awsiot import mqtt_connection_builder
import time as t
import json
# from flask_json import FlaskJSON, JsonError, json_response, as_json
from random import randint
import pymysql
import re
import random
import string
app = Flask(__name__)

# Change this to your secret key (can be anything, it's for extra protection)
app.secret_key = 'Thinkfinity Labs'

mysql = MySQL()

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_pASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'heat_pump'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

# this will be the login page
@app.route('/login', methods=['GET', 'POST'])
def login():
 # connect
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)

    # Output message if something goes wrong...
    msg = ''
    # Check if "name" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' and 'name' in request.form and 'password' in request.form:
        # Create variables for easy access
        name = request.form['name']
        password = request.form['password']
        # Check if account exists using MySQL
        cursor.execute(
            'SELECT * FROM tbl_admin WHERE name = %s OR email = %s AND password = %s', (name, name, password))
        # Fetch one record and return result
        account = cursor.fetchone()

    # If account exists in accounts table in out database
        if account:
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['id'] = account['id']
            session['name'] = account['name']
            session['password'] = account['password']
            session['email'] = account['email']
            return redirect(url_for('home'))
        else:
            # Account doesnt exist or name/password incorrect
            return redirect(url_for('login'))

    return render_template('login.html', msg=msg)

# this will be the registration page
@app.route('/register', methods=['GET', 'POST'])
def register():
 # connect
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)

    # Output message if something goes wrong...
    msg = ''
    # Check if "name", "password" and "email" POST requests exist (user submitted form)
    if request.method == 'POST' and 'name' in request.form and 'password' in request.form and 'email' in request.form:
        # Create variables for easy access
        name = request.form['name']
        password = request.form['password']
        email = request.form['email']

    # Check if account exists using MySQL
        cursor.execute(
            'SELECT * FROM tbl_admin WHERE name = %s', (name))
        account = cursor.fetchone()
        # If account exists show error and validation checks
        if account:
            msg = 'Account already exists!'
        else:
            print("everything is perfect before random")

            uid_new = random_uid(1)
            NULL = ""
            # Account doesnt exists and the form data is valid, now insert new account into accounts table
            cursor.execute('INSERT INTO tbl_admin VALUES (%s, %s, %s, %s, %s, %s, %s, %s)', (uid_new, name, email, password, NULL, NULL, NULL, 0))
            conn.commit()
            return render_template('login.html', msg=msg)

    elif request.method == 'POST':
        # Form is empty... (no POST data)
        msg = 'Please fill out the form!'
    # Show registration form with message (if any)
    return render_template('register.html', msg=msg)


@app.route('/home', methods=['GET', 'POST'])
def home():
    # Check if user is loggedin
    if 'loggedin' in session:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        if request.method == 'POST' and 'rcp_temp' in request.form and 'rcp_humidity' in request.form and 'rcp_cmt' in request.form and 'rcp_name' in request.form:
            # Create variables for easy access
            rcp_temp = request.form['rcp_temp']
            rcp_humidity = request.form['rcp_humidity']
            rcp_cmt = request.form['rcp_cmt']
            rcp_name = request.form['rcp_name']
            rcp_id = random_rcp_uid(2)
            rcp_uid = session.get('id')
            # Account doesnt exists and the form data is valid, now insert new account into accounts table
            cursor.execute('INSERT INTO tbl_recipe VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)',
                                (rcp_uid, rcp_id, rcp_name , rcp_temp, rcp_humidity, rcp_cmt, 0, 0, 0))
            conn.commit()
            return redirect(url_for('list'))
         # User is loggedin show them the home page
        return render_template('index.html', name=session.get('name'))
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route('/')
def home2():
    # Check if user is loggedin
    if 'loggedin' in session:
        conn = mysql.connect()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        if request.method == 'POST' and 'rcp_temp' in request.form and 'rcp_humidity' in request.form and 'rcp_cmt' in request.form and 'rcp_name' in request.form:
            # Create variables for easy access
            rcp_temp = request.form['rcp_temp']
            rcp_humidity = request.form['rcp_humidity']
            rcp_cmt = request.form['rcp_cmt']
            rcp_name = request.form['rcp_name']
            rcp_id = random_rcp_uid(2)
            rcp_uid = session.get('id')
            # Account doesnt exists and the form data is valid, now insert new account into accounts table
            cursor.execute('INSERT INTO tbl_recipe VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)',
                                (rcp_uid, rcp_id, rcp_name, rcp_temp, rcp_humidity, rcp_cmt, 0, 0, 0))
            conn.commit()
            return redirect(url_for('list'))
         # User is loggedin show them the home page
        return render_template('index.html', name=session.get('name'))
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

# this will be the logout page


@app.route('/logout')
def logout():
    # Remove session data, this will log the user out
    session.pop('loggedin', None)
    session.pop('id', None)
    session.pop('name', None)
    # Redirect to login page
    return redirect(url_for('login'))

@app.route('/list', methods=['POST', 'GET'])
def list():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    rcp_uid = session.get('id')
    Notification_list=[]
    def fetch_list() -> dict:
        cursor.execute('SELECT * FROM `tbl_recipe` WHERE rcp_uid=%s',(rcp_uid))
        recipe_list = cursor.fetchall()
        conn.commit()
        conn.close()
        for results in recipe_list:
            lists = {
                "rcp_name": results['rcp_name'],
                "rcp_temp": results['rcp_temp'],
                "rcp_humidity":results['rcp_humidity'],
                "rcp_ctime": results['rcp_ctime']
            }
            Notification_list.append(lists)
        return Notification_list
    session['list'] = fetch_list()     
    return render_template('/list.html',name=session.get('name'),items= session['list'])

@app.route('/device', methods=['POST', 'GET'])
def device():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    UserId = session.get('id')
    cursor.execute('SELECT * FROM `tbl_devices` WHERE `id`=%s',(UserId))
     # Fetch one record and return result
    device = cursor.fetchone()
    conn.commit()
    device_count = device['device_count']
    device_list = []
    def fetch_list() -> dict:
        cursor.execute('SELECT * FROM `tbl_devices` WHERE `id`=%s',(UserId))
        devices = cursor.fetchall()
        conn.commit()
        for j in devices:
            lists = {
                "device_id": j['device_id'],
                "id": j['id'],
                "device_nm": j['device_nm'],
                "time_left": j['time_left']
            }
            device_list.append(lists)
        return device_list
    session['device_list'] = fetch_list()
    return render_template('/device.html', name=session.get('name'), devices=session['device_list'], device_count=device_count)

@app.route('/Notifications', methods=['POST', 'GET'])
def Notifications():
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    id = session.get('id') 
    cursor.execute('SELECT * FROM `tbl_notifi` WHERE `id`=%s',(id))
    # Fetch one record and return result
    notifi = cursor.fetchone()
    conn.commit()
    total_list = notifi['not_list_total']
    Notification_list = []
    def fetch_list() -> dict:
        cursor.execute('SELECT * FROM `tbl_notifi` WHERE `id`=%s',(id))
        notifi_list = cursor.fetchall()
        conn.commit()
        for result in notifi_list:
            lists ={
                "Dev_id": result['Dev_id'],
                "not_type": result['not_type'],
                "not_comment": result['not_comment'],
                "time": result['not_time']
            }
            Notification_list.append(lists)
        return Notification_list
    session['notifi_list'] = fetch_list()
    print("///////////////////////////////")
    print(session['notifi_list'])
    return render_template('/Notifications.html', name=session.get('name'), notifications = session['notifi_list'], total_lists=total_list)
    
@app.route('/Help',)
def Help():    
    return render_template('/Help.html',name=session.get('name') ) 

@app.route('/auth')
def api():
    chart ={"data":"Please Fill Proper Details"}
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    if request.method == 'GET' and 'email' in request.args and 'pass' in request.args:
        user = request.args['email']
        pswd = request.args['pass'] 
        access = 0
        
        cursor.execute(
            'SELECT * FROM tbl_admin WHERE email = %s ', (user))
        # Fetch one record and return result
        account = cursor.fetchone()
        if account:
            db_email= account['email']
            passwordword=account['password']
            if db_email == user and passwordword == pswd:
                access = 1
                chart= {"Response":200,
                "name": account['name'],
                "photo": account['photo'],
                "url": account['url'],
                "logo": account['logo'],
                "time": account['created_time'],
                "access":access}
            elif db_email != user or passwordword != pswd:
                chart= {"Response":400,
                "API":"False",
                "name": user,
                "Password":pswd,
                "access":access}
    else:
        chart= {"Response":400,
                "API":"False",
                "name": user,
                "Password":pswd,
                "access":access}
        
    return chart
        
#------authentication for app end-------------#
def random_uid(id_type):
    #saving the randome values by types of id's
    new_id = random_string(7, 9)    
    print(new_id)
    id_chk = 0
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    def chk_database(id_type):
        cursor.execute(
            'SELECT * FROM uid_detail WHERE id = %s AND id_usage = %s', (new_id, id_type))
        # Fetch one record and return result
        id_chk = cursor.fetchone()
    while(id_chk == True):
        print(new_id,"   rejected")
        new_id =  random_string(7, 9)
        chk_database(id_type)
    print(new_id,"   approved")
    cursor.execute('INSERT INTO uid_detail VALUES (%s, %s)',
        (id_type ,new_id))
    conn.commit()
    return new_id

def random_rcp_uid(id_type):
    #saving the randome values by types of id's
    new_recp_id = random_string(7, 9)    
    print(new_recp_id)
    id_chk = 0
    conn = mysql.connect()
    cursor = conn.cursor(pymysql.cursors.DictCursor)
    def chk_database(id_type):
        cursor.execute(
            'SELECT * FROM uid_detail WHERE id = %s AND id_usage = %s', (new_recp_id, id_type))
        # Fetch one record and return result
        id_chk = cursor.fetchone()
    while(id_chk == True):
        print(new_id,"   rejected")
        new_id =  random_string(7, 9)
        chk_database(id_type)
    print(new_recp_id,"   approved")
    cursor.execute('INSERT INTO uid_detail VALUES (%s, %s)',
        (id_type ,new_recp_id))
    conn.commit()
    return new_recp_id




def random_string(letter_count, digit_count): 
    #Creating random id for the user
    #combining values was missed which is needed to be done
    str1 = ''.join((random.choice(string.ascii_letters) for x in range(letter_count)))  
    str1 += ''.join((random.choice(string.digits) for x in range(digit_count)))  
    return str1



