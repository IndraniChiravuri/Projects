var app = angular.module('app',[]);
app.controller('myCtrl', function($scope) {
	$scope.c = [{'firstname':'Indrani', 'lastname' : 'chiravuri'},
	            {'firstname' : 'Anoop', 'lastname' : 'nuli'}];
});