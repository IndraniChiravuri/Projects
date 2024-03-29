<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Main.css">
<style type="text/css">
#maincontainer {
	height: 115%;;
}
#box {
	width: 18%;
	background-color: #fcabba;
	border-radius: 5px;
	padding: 5px;
	margin: 3px 0px 0px 15px;
	float: left;
}
img {
	border-radius: 2px;
	width: 70%;
}
</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"53302",secure:"53305"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-22" data-genuitec-path="/UrbanSpoon/WebContent/viewCuisines.jsp">
	<div data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-22" data-genuitec-path="/UrbanSpoon/WebContent/viewCuisines.jsp">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div id="maincontainer">
	<form action="RestaurantController" id="view_cuisines" method="post" >
	<input type = "hidden" name="action" value="view_cuisines">
	<h4>CUISINES LIST</h4>	
		
		<c:forEach items="${cuisinesList}" var="cuisine">
			<div id="box">
				<h5>
					<c:out value="${cuisine.name}">${cuisine.name}</c:out>
				</h5>
				<c:out value="${cuisine.country}">${cuisine.country}</c:out>
				<p>
					<c:out value="${cuisine.description}">${cuisine.description}</c:out>
			
			</div>
		</c:forEach>
		${errorMessage}
	</form>
	</div>
	<div>
		<jsp:include page="footer.html"></jsp:include>

	</div>
</body>
</html>