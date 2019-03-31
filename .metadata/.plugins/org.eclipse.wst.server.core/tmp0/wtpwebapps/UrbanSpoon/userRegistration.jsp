<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"53302",secure:"53305"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-20" data-genuitec-path="/UrbanSpoon/WebContent/userRegistration.jsp">
	<jsp:include page="header.jsp"></jsp:include>

	<div id="container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-20" data-genuitec-path="/UrbanSpoon/WebContent/userRegistration.jsp"> 
		<div align="center" id="register">
			<form action="HomeController" id="user" method="post">
				<h4>User</h4>
				<fieldset id="fields">
					<input type="hidden" name="action" value="user_registration">
					<label>FirstName</label> <input type="text" name="FirstName">
					<label>LastName</label> <input type="text" name="LastName">
					<label>Email Id</label> <input type="email" name="EmailId">
					<label>Password</label> <input type="password" name="password">
					<label>Confirm Password</label> <input type="password" name="password"> 
					<label>PhoneNumber</label> <input type="number" name="phoneNumber"> 
					<input type="submit" value="REGISTER">
				</fieldset>

			</form>

</body>
</html>