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
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-24" data-genuitec-path="/UrbanSpoon/WebContent/viewItems.jsp">
	<div data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-24" data-genuitec-path="/UrbanSpoon/WebContent/viewItems.jsp">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div id="maincontainer">
	<form action="RestaurantController" id="view_recipes" method="post" enctype="multipart/form-data">
	<input type = "hidden" name="action" value="view_recipes">
	<h4>RECIPE LIST</h4>	
		<c:forEach items="${recipesList}" var="recipe">
			<div id="box">
				<h5>
					<c:out value="${recipe.name}">${recipe.name}</c:out>
				</h5>
				<a href=""><img alt="" src="images/recipes/${recipe.imagePath}"></a>
				<div>${recipes.ratings}</div>
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