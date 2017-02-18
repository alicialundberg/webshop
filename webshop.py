from flask import Flask, request, render_template, session, redirect, url_for
import MySQLdb


app = Flask(__name__)
app.config.from_object(__name__)
app.secret_key = 'unicorn'
info = []


@app.route('/register')
def register():
    return render_template('register.html')

@app.route('/signup', methods=['GET','POST'])
def signup():
    try:
        firstname = request.form['firstName']
        lastname = request.form['lastName']
        ssn = request.form['ssn']
        adress = request.form['adress']
        city = request.form['city']
        email = request.form['email']
        phone = request.form['phone']
        password = request.form['password']

        # If firstname email and password has a value:
        if firstname and email and password:
            conn = MySQLdb.connect(host="", user='', passwd='', db='webshop', use_unicode=True, charset="utf8")
            cursor = conn.cursor()
            check = cursor.execute('SELECT * FROM Customer WHERE email =%s',(email, ))

            if int(check) > 0:
                return render_template('register.html')
            else:
                cursor.execute("INSERT INTO Customer (firstname, lastname, ssn, adress, city, email, phone, password) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)",(firstname, lastname, ssn, adress, city, email, phone, password))
                conn.commit()
                return render_template('login.html')

    except Exception as e:
        return(str(e))

@app.route("/logout/")
def logout():
    session['logged_in'] = False
    return render_template('login.html')

@app.route("/login", methods=['GET','POST'])
# Whole login method is coded by Sentdex and modified by me.
def login():
    error = ""
    try:
        attempted_customer = request.form['customer']
        attempted_password = request.form['password']

        if attempted_customer and attempted_password:
            conn = MySQLdb.connect(host="", user='', passwd='', db='webshop', use_unicode=True, charset="utf8")
            cursor = conn.cursor()
            customer = cursor.execute('SELECT * FROM Customer WHERE email=%s and password=%s',(attempted_customer,attempted_password ))

            if int(customer) > 0:
                session['logged_in'] = True
                session['customer'] = attempted_customer
                return redirect(url_for('dashboard'))
            else:
                return render_template("login.html", error=error)

    except Exception as e:
        return render_template('login.html', error = error)

    return render_template('login.html')

@app.route('/dashboard', methods=['GET'])
def dashboard():
    if 'customer' in session:
       info  = session['customer']

       conn = MySQLdb.connect(host="", user='', passwd='', db='webshop', use_unicode=True, charset="utf8")
       cursor = conn.cursor()
       cursor.execute('SELECT customer_id,firstname,lastname,ssn,adress,city,email,phone FROM Customer WHERE email=%s',(info, ))
       customer = []
       for data in cursor:
           x = []
           x.append(str(data[0]))            #customer_id
           x.append(data[1].encode('utf-8')) #firstname
           x.append(data[2].encode('utf-8')) #lastname
           x.append(data[3].encode('utf-8')) #ssn
           x.append(data[4].encode('utf-8')) #adress
           x.append(data[5].encode('utf-8')) #city
           x.append(data[6].encode('utf-8')) #email
           x.append(str(data[7]))            #phone
           customer.append(x)
           print(customer)

    return render_template('dashboard.html', customer=customer)

if __name__ == "__main__":
    app.run()
