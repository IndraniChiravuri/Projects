<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
<script>

function validate(){
	var username=document.form.userName.value;
	var password=document.form.password.value;
	if(username=="" ){
	 alert("Enter Username!");
	  return false;
	}
	if(password==""){
	 alert("Enter Password!");
	  return false;
	}
	return true;
	}</script>
<style type="text/css">

</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"53302",secure:"53305"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-12" data-genuitec-path="/UrbanSpoon/WebContent/login.jsp"> 
	<jsp:include page="header.jsp"></jsp:include>


	<div id="container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-12" data-genuitec-path="/UrbanSpoon/WebContent/login.jsp">
		<div align="center" id="register">
			<form name = "form" action="HomeController" id="restaurant" method="post" >
				<fieldset id="fields">
				<input type="hidden" name="action" value="restaurant_login"> 
					<label>Name</label> <input type="text" name="userName" value="${userName}"> <label>Password</label>
					<input type="password" name="password"> <label></label>				
					<span type = "msg"></span>
					<input type="submit" onclick = "return validate()" value="submit">	
				</fieldset>

			</form>
		</div>

	</div>


	<jsp:include page="footer.html"></jsp:include>
</body>
</html>