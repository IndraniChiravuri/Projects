<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">

<script>
	function validate() {
		var username = document.form.userName.value;
		var password = document.form.password.value;
		if (username == "") {
			alert("Enter Username!");
			return false;
		}
		if (password == "") {
			alert("Enter Password!");
			return false;
		}
		return true;
	}
	function signup(pageURL) {
		window.location.href("pageURL");
		
		
		
	}
	
</script>
<style type="text/css">
</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"53302",secure:"53305"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-19" data-genuitec-path="/UrbanSpoon/WebContent/userLogin.jsp">
	<jsp:include page="header.jsp"></jsp:include>


	<div id="container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-19" data-genuitec-path="/UrbanSpoon/WebContent/userLogin.jsp">
		<div align="center" id="register">
			<form  action="HomeController" id="feedback" method="post">
				<fieldset id="fields">

					<input type="hidden" name="action" value="feedback_login"> <label>Name</label>
					<input type="text" name="userName" value="${userName}"> <label>Password</label>
					<input type="password" name="password"> <label></label>
					

					<span type="msg"></span> <input type="submit"
						onclick="return validate()" value="submit"><br>
					<li><a href="HomeController?action=register">Sign up</a></li>
				</fieldset>

			</form>
		</div>

	</div>


	<jsp:include page="footer.html"></jsp:include>
</body>
</html>