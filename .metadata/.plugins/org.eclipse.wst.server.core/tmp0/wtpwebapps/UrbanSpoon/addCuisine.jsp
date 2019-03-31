<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
<style type="text/css">

</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"53302",secure:"53305"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-2" data-genuitec-path="/UrbanSpoon/WebContent/addCuisine.jsp">
<jsp:include page="header.jsp"></jsp:include>

<div id="container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-2" data-genuitec-path="/UrbanSpoon/WebContent/addCuisine.jsp">
<div align="center" id="subcontainer">
<form action="RestaurantController" id = "restaurant" method="post">
	<h3>Add Cuisines</h3>
	<fieldset id="restaurant">
	<input type = "hidden" name="action" value="add_cuisine">
	<label for="Country">Country:</label>
		<input type="text" name="txtClassroomName" size="20">
	<label for="Name of cuisine">Name of Cuisine:</label>
		<input type="text" name="txtSchoolName" size="20">
		<label for="Description">Description:</label>
		<input type="text" name="description" size="20">
		
	<input type="submit" value="Submit">
</fieldset>
</form>
</div>
</div>
<jsp:include page="footer.html"></jsp:include>
</body>
</html>