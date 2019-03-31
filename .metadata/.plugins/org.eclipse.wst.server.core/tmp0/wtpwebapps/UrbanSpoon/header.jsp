<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Urban Spoon</title>
<style type="text/css">
body {
	margin: 0px;
}

#header {
	background-color:white;
	height: 40%;
	width:100%;
}

ul, li {
	float: left;
	display: inline;
	margin: -10PX 0PX 0PX 10PX;
}

a {
	background: #ea800e;
	padding: 8px;
}

#right {
	float: right;
}

input[type="search"] {
	width: 35%;
	border-radius: 10px;
	height: 15%;
	border-color:#ea800e;
	margin-left:50px;
	margin-top:115px;
}
#image img {
	width: 100%;
	height :20%;
	position: absolute;
	/*border-radius: 12px;*/
}

input[type="submit"] {
	height: 15%;
	border-radius: 7px;
	border-color:#ea800e;
	
}
</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"53302",secure:"53305"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>

<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-8" data-genuitec-path="/UrbanSpoon/WebContent/header.jsp">
	<div id="header" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-8" data-genuitec-path="/UrbanSpoon/WebContent/header.jsp">
		<div id="image">
			<img alt="" src="images/UrbanSpoonHead.jpg">
		</div>
		<div>
			<input type="search" name="search" placeholder="search for item">
			<input type="submit" name="search" value="search">
		</div>

		<div id="right">
			<ul>
				<c:if test="${ loggedUser eq null }">
					<li><a href="HomeController">Home</a></li>
					<li><a href="HomeController?action=restaurant">Restaurant</a></li>
					<li><a href="HomeController?action=register">Register</a></li>
					<li><a href="HomeController?action=login">Login</a></li>
				</c:if>
				<c:if test="${ loggedUser ne null }">
					<li><a href="HomeController?action=logout">Logout</a></li>
				</c:if>
			</ul>
		</div>

	</div>
</body>
</html>