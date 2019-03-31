var Hotel = angular.module('Hotel', []);


Hotel.controller('SignUpModalController', function signUpModalController(
		$scope, $http) {
	$scope.processRegistration = function() {
		var queryString = '?p1=' + $scope.firstName + '&p2=' + $scope.lastName
				+ '&p3=' + $scope.email + '&p4=' + $scope.contactNumber
				+ '&p5=' + $scope.gender + '&p6=' + $scope.password;
		var url = 'SignUpProcessServlet' + queryString;
		$http.get(url).then(function(response) {

			var regStatus = response.data.status;

			document.getElementById("signUpForm").reset();
			window.location = "SignInForm.html";
		});
	};
	$scope.processCancellation = function() {
		document.getElementById("signUpForm").reset();
		window.location = "MainPage.html";
	};
});
Hotel.controller(
				'SignInController',
				function signInController($scope, $http) {
					$scope.processSignIn = function() {
						var queryString = '?p1=' + $scope.emailAddress + '&p2='
								+ $scope.loginPassword;
						var url = 'SignInProcessServlet' + queryString;
						$http
								.get(url)
								.then(
										function(response) {
											var customerData = response.data.customer;
											if (customerData != "") {
												$scope.showStatus = false;
												$scope.hideStatus = false;
												var fName = customerData[0].firstName;
												var lName = customerData[0].lastName;
												document.getElementById("displayArea").innerHTML = "Valid Access";
												document.getElementById("displayArea").innerHTML = "Welcome "
														+ fName + " " + lName;
												document.getElementById("displayArea").innerHTML = "Hi, "
														+  lName;
												alert("Hi, " + lName);
												window.location = "rooms.html";
												
											} else {
												document.getElementById("displayArea").innerHTML = "Invalid Access";
												document.getElementById("displayArea").innerHTML = "Email ID or Password incorrect.";
												document.getElementById(
														"signInForm").reset();
											}
										});
					};
				});

Hotel.controller('DisplayController', function displayController($scope,
		$http){
		$http.get('DisplayRoomsServlet').then(function(response) {
		$scope.rooms = response.data.records;
		});
		});
Hotel.controller('BookController', function bookController($scope,$http) {
	   $scope.bookFun = function() {
		   		window.location = "Book.html";
	   }
	
});