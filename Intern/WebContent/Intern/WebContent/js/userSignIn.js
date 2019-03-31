var userSignIn = angular.module("userSignIn", []);
userSignIn.controller('userSignIn', function($scope,$http) {
	//alert("login controller");
	$scope.login = function() {
		alert("login function");
		var query = '?email=' + $scope.emailId+ '&pswd=' + $scope.pswd;
		//alert(query);
		var url = 'LoginProcessServlet' + query;
		//alert("After Servlet");
		$http.get(url).then(function(response) {
			var status = response.data.customer;
			if(status != "") {
				$scope.showStatus = false;
				$scope.hideStatus = false;
				var fname = status[0].firstName;
				var lname = status[0].lastName;
				alert("Redirecting.....");
				window.location="loginHomePage.html";
			} else {
				alert("Invalid username or password");
			}
		});
	}
});
