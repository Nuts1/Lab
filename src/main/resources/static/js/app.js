/**
 * Created by Nuts on 2/21/2017.
 */
var app = angular.module('server', ['ngRoute', 'ngResource']);

app.config(["$routeProvider", "$httpProvider", "$locationProvider",
        function ($routeProvider, $httpProvider, $locationProvider) {
        $routeProvider.when('/login', {
            templateUrl: 'templates/login.html',
            controller: 'loginController'
        })
        .when('/home', {
            templateUrl: 'templates/home.html',
            controller: 'adminController'
        }).when('/errorPage', {
            templateUrl: 'templates/errorPage.html',
            controller: 'adminController'
        })
        .when('/', {
            templateUrl: 'templates/home.html',
            controller: 'adminController'
        })
        .when('/books', {
            templateUrl: 'templates/books.html',
            controller: 'booksController'
        })
        .when('/emails', {
            templateUrl: 'templates/emails.html',
            controller: 'adminController'
        })
        .when('/admin', {
            templateUrl: 'templates/home.html',
            controller: 'adminController'
        }) .when('/peoples', {
            templateUrl: 'templates/peoples.html',
            controller: 'peoplesController'
        })
        .when('/errors', {
            templateUrl: 'templates/errors.html',
            controller: 'errorsController'
        });
    
    $locationProvider.html5Mode({enabled: true});
}]);

app.filter('capitalize', function() {
    return function(token) {
        return token.substr(1).charAt(0).toUpperCase() + token.slice(2);
    }
});