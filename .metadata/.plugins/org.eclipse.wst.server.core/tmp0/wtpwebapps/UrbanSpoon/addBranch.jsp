<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
<script>
function addbranch() {
	document.getElementById("addbranch").style.display = "block";
	document.getElementById("display").style.display = "none";

}
</script>
<style type="text/css">
#container {
	height: 150%;
}

#subcontainer {
	width: 30%;
	height: 119%;
	background-color: orange;
	border-width: 2px;
	margin: 0px auto;
	position: absolute;
	margin-left: 500px;
}

label {
	display: inline-block;
	width: 90px;
	margin-right: 30px;
	text-align: right;
}

#fields input {
	width: 50%;
	height: 35px;
	border-radius: 6px;
	padding: 0px 13px 4px 23px;
	margin-bottom: 27px;
}
</style>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"53302",secure:"53305"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-1" data-genuitec-path="/UrbanSpoon/WebContent/addBranch.jsp">
	<jsp:include page="header.jsp" />
	<div id="container" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-1" data-genuitec-path="/UrbanSpoon/WebContent/addBranch.jsp">
	<div align="center" id="subcontainer">
			<form action="RestaurantController" id="Branch" method="post" enctype = "multipart/form-data">
				<h2>Add Branch</h2>
				<fieldset id="fields">
					<input type = "hidden" name="action" value="add_branch">
					<label>Location</label> <input type="text" name="location">
					<label>City</label> <input type="text" name="city"> 
					<label>State</label> <input type="text" name="state">
					<label>Country</label> <input type="text" name="country">
					<label>Postal Code</label> <input type="text" name="postal_code">  
					<label>Phone Number</label> <input type="text" name="phone_number"> 
					<label>Email Id</label> <input type="email" name="email_id">
					<label>Image </label> <input type="file" name="image"> 
					<input type="submit" value="ADD">
				</fieldset>
			</form>

		</div>
	</div>
	</div>


	<div>
		<jsp:include page="footer.html"></jsp:include>
	</div>
</body></html>