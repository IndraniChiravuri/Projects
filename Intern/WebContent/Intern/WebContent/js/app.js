var internshalaApp = angular.module('internshalaApp', ["ngRoute"]);
//alert("App");
internshalaApp.config(function($routeProvider) {
    $routeProvider
    .when("/home", {
    	templateUrl : "HomePage.html",
    })
    .when("/interns", {
    	templateUrl : "Interns.html",
    })
    .when("/about", {
        templateUrl : "contactUs.html",
    })
    .when("/login", {
        templateUrl : "LoginForm.html",
        controller : "LoginController"
    })
    .when("/signup", {
        templateUrl : "SignUpForm.html",
        controller : "myController"
    });
});
//alert("App");
internshalaApp.controller('myController', function($scope,$http) {
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

internshalaApp.controller('LoginController', function($scope,$http) {
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
				alert("Hello" + fname + " " + lname);
				window.location="loginHomePage.html";
			} else {
				alert("Invalid username or password");
			}
		});
	}
});
internshalaApp.controller('DisplayController', function displayController($scope,
		$http){
		$http.get('DisplayRoomsServlet').then(function(response) {
		$scope.rooms = response.data.records;
		});
		});
internshalaApp.controller('BookController', function bookController($scope,$http) {
	   $scope.bookFun = function() {
		   		window.location = "Book.html";
	   }
	
});
