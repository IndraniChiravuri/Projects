from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from models import suggestionsclass,oasuggestionsclass

engine = create_engine('sqlite:///sales.db',connect_args={'check_same_thread':False},echo=True)
Base = declarative_base()
Base.metadata.bind = engine
# Create session
DBSession = sessionmaker(bind=engine)
session = DBSession()

fccqs = suggestionsclass(category = "Furniture", scategory = 'Chairs', region = 'Central', atype = "Quarterly", suggestion = "Quarterly sales of Furniture has been linearly increasing over time. Increase the volume of Furniture category in next Quarter.")
session.add(fccqs)
session.commit()

fccms = suggestionsclass(category = "Furniture", scategory = 'Chairs', region = 'Central',atype = "Monthly", suggestion = "Monthly sales of Furniture has a steep increase. Increase the volume of Furniture category in further months.")
session.add(fccms)
session.commit()

oacqs = suggestionsclass(category = "Office Supplies",scategory = 'Art', region = 'Central', atype = "Quarterly", suggestion = "Quarterly sales of Art in Central Region has been linearly increasing over time. Increase the volume of Office Supplies category in next Quarter.")
session.add(oacqs)
session.commit()

oacms = suggestionsclass(category = "Office Supplies",scategory = 'Art', region = 'Central', atype = "Monthly", suggestion = "Monthly sales of Art in Central Region has a steep increase. Increase the volume of Office Supplies category in further months.")
session.add(oacms)
session.commit()

tpcqs = suggestionsclass(category = "Technology", scategory = 'Phones', region = 'Central', atype = "Quarterly", suggestion = "Phones in Central Region has a high demand in next quarter. Increase the products in this category to acquire some more high sales.  ")
session.add(tpcqs)
session.commit()

tpcms = suggestionsclass(category = "Technology", scategory = 'Phones', region = 'Central',atype = "Monthly", suggestion = "Monthly sales of Phones in Central Region has a steep increase. Increase the volume of Technology category products in further months.")
session.add(tpcms)
session.commit()

cqs = oasuggestionsclass(region = "Central", atype = "Quarterly", suggestion = "Quarterly sales of Central Region has been linearly increasing over time. Increase all the products in next Quarter.")
session.add(cqs)
session.commit()

cms = oasuggestionsclass(region = "Central", atype = "Monthly", suggestion = "Monthly sales of Central Region has been slightly increasing over time. Maintain the same volume or decrease the volume of products during June to November.")
session.add(cms)
session.commit()

sqs = oasuggestionsclass(region = "South", atype = "Quarterly", suggestion = "Quarterly sales of South region is slightly increasing over time. Maintain the same volume of products throughout the coming years.")
session.add(sqs)
session.commit()

sms = oasuggestionsclass(region = "South", atype = "Monthly", suggestion = "Monthly sales of South region is slightly increasing over time. Maintain high volume of products during March.")
session.add(sms)
session.commit()

eqs = oasuggestionsclass(region = "East", atype = "Quarterly", suggestion = "Quarterly sales of East region is slightly increasing over time. Maintain low volume of products during June to July.")
session.add(eqs)
session.commit()

ems = oasuggestionsclass(region = "East", atype = "Monthly", suggestion = "Monthly sales of East region is slightly increasing over time. Maintain low volume of products during October to November.")
session.add(ems)
session.commit()

wqs = oasuggestionsclass(region = "West", atype = "Quarterly", suggestion = "Quarterly sales of West region has a steep increase. Maintain low volume of products during June to July.")
session.add(wqs)
session.commit()

wms = oasuggestionsclass(region = "West", atype = "Monthly", suggestion = "Monthly sales of West region has been linearly increasing over time. Maintain low volume of products during June to July.")
session.add(wms)
session.commit()

print("Successfully entered")