from flask import Flask, render_template, url_for, flash, redirect, request
from flask import session
from sqlalchemy.orm import sessionmaker
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine
from sqlalchemy import Column,String, Integer
from models import newManager, Base, suggestionsclass, oasuggestionsclass
import os


app = Flask(__name__)


# Connect to database
engine = create_engine('sqlite:///sales.db',connect_args={'check_same_thread':False},echo=True)
Base.metadata.bind = engine
# Create session
DBSession = sessionmaker(bind=engine)
session = DBSession()

class SuggestionsConnecting():
	name = Column(String(20))
	analysistype = Column(String(10))
	region = Column(String(10))
	scategory = Column(String(20))

@app.route("/", methods = ["GET","POST"])
def home():
	return render_template('home.html')

# @app.route("/", methods = ["GET","POST"])
# def home():
# 	colorname = "#4CAF50"
# 	if request.method == 'POST':
# 		managers = session.query(newManager).all()
# 		for i in managers:
# 			if ((i.email == request.form['email']) and (i.password == request.form['password'])) :
# 				return redirect(url_for('layout'))
# 		colorname = "red"
# 		flash("Please enter correct username and password!!!")
# 		return redirect(url_for('home', colorname = colorname))
# 	return render_template('home.html',title="Home")

@app.route("/register/", methods = ["GET","POST"])
def register():
	if request.method == 'POST':
		if ((request.form['uname'] == '') or (request.form['email'] == '') or 
				(request.form['password'] == '')) :
			flash('Please enter all the fields')
			redirect(url_for('register'))
		else:
			managers = session.query(newManager).all()
			for i in managers:
				if i.email == request.form['email'] :
					flash("Email already exists!!!",)
					return redirect(url_for('register'))
			manager = newManager(username=request.form['uname'], email=request.form['email'],
					password=request.form['password'])
			session.add(manager)
			session.commit()
			flash('You have Signed In!!! Please Login In')
			return redirect(url_for('login'))
	return render_template('register.html',title='Register')

@app.route("/layout/", methods = ["GET","POST"])
def layout():
	return render_template('layout.html',title='Layout')


@app.route("/login/", methods = ["GET","POST"])
def login():
	if request.method == 'POST':
		if ((request.form['email'] == '') or (request.form['password'] == '')) :
			flash('Please enter all the fields')
			redirect(url_for('login'))
		else:
			managers = session.query(newManager).all()
			for i in managers:
				if ((i.email == request.form['email']) and (i.password == request.form['password'])) :
					return redirect(url_for('layout'))
			colorname = "red"
			flash("Please enter correct username and password!!!")
			return redirect(url_for('login', colorname = colorname))
	return render_template('login.html',title='Layout')


@app.route("/analysistypes/", methods = ["GET","POST"])
def analysisTypes():
	return render_template('analysistypes.html',title="Types")

@app.route("/homenavbar/", methods = ["GET","POST"])
def homenavbar():
	return render_template('homenavbar.html')

@app.route("/slideshow/")
def slideshow():
	return render_template('slideshow.html')

@app.route("/fpassword/", methods = ["GET","POST"])
def fpassword():
	if request.method == 'POST':
		if ((request.form['email'] == '') or (request.form['password'] == '')) :
			flash('Please enter all the fields')
			return redirect(url_for('fpassword'))
		else:
			emailid = request.form['email']
			managers = session.query(newManager).filter_by(email = emailid).one()
			managers.password = request.form['password']
			session.commit()
			flash("You have changed the password successfully Please Log In!!!")
			return redirect(url_for('login'))
	return render_template('fpassword.html')

@app.route("/specificProduct/", methods = ["GET","POST"])
def specificProduct():
	if request.method=='POST':
		SuggestionsConnecting.name = request.form['Category']
		SuggestionsConnecting.scategory = request.form['Sub-Category']
		SuggestionsConnecting.region = request.form['Region']
		SuggestionsConnecting.analysistype = request.form['typeOA']
		imagename = specificproduct(SuggestionsConnecting.name,SuggestionsConnecting.analysistype,SuggestionsConnecting.region,SuggestionsConnecting.scategory)
		imagename1 = imagename + "sp1.png"
		imagename = imagename + "sp.png"
		return render_template('image1.html', imagename = imagename, imagename1 = imagename1, iname = SuggestionsConnecting.name+" "+SuggestionsConnecting.scategory+" "+SuggestionsConnecting.region+ " Analysis")
	return render_template('specificProduct.html',title='Specific Product')

@app.route("/overallAnalysis/", methods = ['GET','POST'])
def overallAnalysis():
	if request.method=='POST':
		SuggestionsConnecting.name = request.form['Region']
		SuggestionsConnecting.analysistype = request.form['typeOA']
		imagename = overallsales(SuggestionsConnecting.name,SuggestionsConnecting.analysistype)
		imagename1 = imagename + "oa1.png"
		imagename = imagename + "oa.png"
		if SuggestionsConnecting.analysistype == 'Q':
			atype = "Quarterly"
		else:
			atype = "Monthly" 
		return render_template('image2.html', imagename = imagename, imagename1 = imagename1, iname = SuggestionsConnecting.name+" "+atype+"-Wise Analysis")
	return render_template('overallAnalysis.html',title='Overall Analysis')

@app.route("/suggestion/", methods = ['GET','POST'])
def suggestion():
	category = SuggestionsConnecting.name
	scategory = SuggestionsConnecting.scategory
	region = SuggestionsConnecting.region
	if SuggestionsConnecting.analysistype == 'Q':
		classanalysistype = "Quarterly"
	else:
		classanalysistype = "Monthly" 
	predictsuggestions = session.query(suggestionsclass).filter_by(category = category, scategory = scategory, region = region, atype = classanalysistype).one()
	print(predictsuggestions)
	#return render_template('suggestion.html',suggestionlist = "Hi...")
	return render_template('suggestion.html', suggestionlist = predictsuggestions.suggestion.split('.'))

@app.route("/oasuggestion/", methods = ['GET','POST'])
def oasuggestion():
	category = SuggestionsConnecting.name
	if SuggestionsConnecting.analysistype == 'Q':
		classanalysistype = "Quarterly"
	else:
		classanalysistype = "Monthly" 
	predictsuggestions = session.query(oasuggestionsclass).filter_by(region = category, atype = classanalysistype).one()
	
	return render_template('suggestion.html', suggestionlist = predictsuggestions.suggestion.split('.'))



@app.route("/image1/", methods = ['GET','POST'])
def image1():
	return render_template('image1.html')

@app.route("/image2/", methods = ['GET','POST'])
def image2():
	return render_template('image2.html')


@app.route("/navbar/")
def navbar():
	return render_template('navbar.html',title='navbar')



def specificproduct(category,analysistype,region,scategory):
    import pandas as pd
    import numpy as np
    import matplotlib.pyplot as plt
    from fbprophet import Prophet
    specpro = pd.read_excel("sample - Copy.xls")
    specpro = specpro[['Order Date','Region','Category','Sales','Sub-Category']]
    specpro = specpro.loc[specpro['Category'] == category]
    specpro = specpro.loc[specpro['Sub-Category'] == scategory]
    specpro = specpro.loc[specpro['Region'] == region]
    #print(specpro)
    specpro = specpro[['Order Date','Sales']]
    specpro = specpro.groupby('Order Date')['Sales'].sum().reset_index()
    specpro = specpro.set_index('Order Date')
    specpro = specpro['Sales'].resample(analysistype).sum()
    specpro = pd.DataFrame({'ds':specpro.index, 'y':specpro.values})
    #furniture = furniture.rename(columns={'Order Date': 'ds', 'Sales': 'y'})
    furlist = list(specpro['y'])
    furlist = [int(x) for x in furlist]
    specpro['y'] = furlist
    specpro['y'] = np.log(specpro['y']).round(3)
    specpro1 = specpro['y'].replace(-np.inf, 0)
    specpro['y'] = specpro1
    prophet_model = Prophet(interval_width=0.95)
    prophet_model = Prophet(daily_seasonality=True)
    #prophet_model = Prophet(weekly_seasonality=True)
    prophet_model.fit(specpro)
    specpro_forecast = prophet_model.make_future_dataframe(periods=12, freq=analysistype)
    specpro_forecast = prophet_model.predict(specpro_forecast)
    plt.figure(figsize=(18, 6))
    prophet_model.plot(specpro_forecast, xlabel = 'Date', ylabel = 'Sales').savefig('static/images/'+category+scategory+region+analysistype+'sp.png')
    prophet_model.plot_components(specpro_forecast).savefig('static/images/'+category+scategory+region+analysistype+'sp1.png')
    plt.title('Specific Product Sales');
    return category+scategory+region+analysistype
	
def overallsales(region,analysistype):
    import pandas as pd
    import numpy as np
    import matplotlib.pyplot as plt
    from fbprophet import Prophet
    overall = pd.read_excel("sample - Copy.xls")
    overall = overall[['Order Date','Region','Category','Sales']]
    overall = overall.loc[overall['Region'] == region]
    overall = overall[['Order Date','Sales']]
    overall = overall.groupby('Order Date')['Sales'].sum().reset_index()
    overall = overall.set_index('Order Date')
    overall = overall['Sales'].resample(analysistype).sum()
    overall = pd.DataFrame({'ds':overall.index, 'y':overall.values})
    #furniture = furniture.rename(columns={'Order Date': 'ds', 'Sales': 'y'})
    furlist = list(overall['y'])
    furlist = [int(x) for x in furlist]
    overall['y'] = furlist
    overall['y'] = np.log(overall['y'])
    prophet_model = Prophet(interval_width=0.95)
    prophet_model = Prophet(daily_seasonality=True)
    prophet_model.fit(overall)
    overall_forecast = prophet_model.make_future_dataframe(periods=12, freq=analysistype)
    overall_forecast = prophet_model.predict(overall_forecast)
    plt.figure(figsize=(18, 6))
    prophet_model.plot(overall_forecast, xlabel = 'Date', ylabel = 'Sales').savefig('static/images/'+region+analysistype+'oa.png')
    prophet_model.plot_components(overall_forecast).savefig('static/images/'+region+analysistype+'oa1.png')
    plt.title('Overall Sales');
    return region+analysistype

@app.route('/logout')
def logout():
   return redirect(url_for('home'))

if __name__ == '__main__':
	app.secret_key = 'super secret key'
	app.run(debug=True)