<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
<style type="text/css">
</style>
<script type="text/javascript">
	function userform() {
		document.getElementById("user").style.display = "block";
		document.getElementById("restaurant").style.display = "none";

	}
	function restaurantform() {
		document.getElementById("restaurant").style.display = "block";
		document.getElementById("user").style.display = "none";

	}
</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"53302",secure:"53305"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body onload="userform()" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-14" data-genuitec-path="/UrbanSpoon/WebContent/registration.jsp">
	<jsp:include page="header.jsp"></jsp:include>

	<div id="container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-14" data-genuitec-path="/UrbanSpoon/WebContent/registration.jsp"> 
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
			<form action="HomeController" id="restaurant" method="post" enctype="multipart/form-data">
				<h4>Restaurant</h4>
				<fieldset id="fields">
				   <input type="hidden" name="action" value="restaurant_registration">
					<label>Restaurant Name</label> <input type="text" name="name"> <label>Email Id</label>
					<input type="email" name="emailId"> <label>Password</label> <input
						type="password" name="password">
						<label>Confirm Password</label>
					<input type="password" name="password"> <label>Location:</label><input
						type="text" name="location"> <label>City:</label><input
						type="text" name="city"> <label>Postal Code:</label><input
						type="text" name="postalCode"> <label>State:</label><input
						type="text" name="state"> <label>Branch Phone Number:</label><input
						type="number" name="phonenumber"> 
						<label>Country:</label><input
						type="text" name="country"><label>Image:</label><input
						type="file" name="imagePath">
						<label>RegistrationId</label> <input
						type="text" name="registrationId">
						 <input type="submit"
						value="submit">
				</fieldset>

			</form>

			<button onclick="userform()">User</button>
			<button onclick="restaurantform()">Restaurant</button>
		</div>

	</div>

	<jsp:include page="footer.html"></jsp:include>
</body>
</html>