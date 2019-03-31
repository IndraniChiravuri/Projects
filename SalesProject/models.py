from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, String, Integer
from sqlalchemy import create_engine

Base = declarative_base()

class newManager(Base):
	__tablename__ = 'managers'
	#docstring for newManager
	username = Column(String(100))
	email = Column(String(30), primary_key = True)
	password = Column(String(20))
class suggestionsclass(Base):
	__tablename__ = "predictsuggestions"
	sid = Column(Integer(), primary_key = True) 
	category = Column(String(20))
	scategory = Column(String(20))
	region = Column(String(10))
	atype = Column(String(20))
	suggestion = Column(String(500))
class oasuggestionsclass(Base):
	__tablename__ = "oapredictsuggestions"
	sid = Column(Integer(), primary_key = True) 
	region = Column(String(10))
	atype = Column(String(20))
	suggestion = Column(String(500))

engine = create_engine('sqlite:///sales.db')
Base.metadata.create_all(engine)
