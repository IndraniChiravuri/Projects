var userSignUp = angular.module('userSignUp', []);
userSignUp.controller('myController', function($scope,$http) {
	$scope.signUpProcess = function() {
		//alert("Entered controllr");
		var queryString = '?email=' + $scope.emailId+ '&pswd=' + $scope.pswd + '&fname=' +
			$scope.fname + '&lname=' + $scope.lname;
		//alert(queryString);
		var url = 'SignUpProcessServlet' + queryString;
		$http.get(url).then(function(response) {
			//alert("Entered Servlet");
			//alert(response.data.status);
			var regStatus = response.data.status;
			alert(regStatus);
			
		});
	};
});