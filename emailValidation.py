import re

def validateEmail(email):
	return len(email) > 7 and re.match("^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,3}|[0-9]{1,3})(\\]?)$", email) != None
if validateEmail(input()) :
	print("Given email is valid")
else:
	print("Given email is not valid")