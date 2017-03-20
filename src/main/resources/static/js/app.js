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
        .when('/admin/home', {
            templateUrl: 'templates/home.html',
            controller: 'adminController'
        }).when('/admin/errorPage', {
            templateUrl: 'templates/errorPage.html',
            controller: 'adminController'
        })
        .when('/', {
            templateUrl: 'templates/home.html',
            controller: 'adminController'
        })
        .when('/admin/books', {
            templateUrl: 'templates/books.html',
            controller: 'booksController'
        })
        .when('/admin', {
            templateUrl: 'templates/home.html',
            controller: 'adminController'
        }) .when('/admin/peoples', {
            templateUrl: 'templates/peoples.html',
            controller: 'peoplesController'
        })
        .when('/admin/orders', {
            templateUrl: 'templates/orders.html',
            controller: 'ordersController'
        });
    
    $locationProvider.html5Mode({enabled: true});
}]);

app.filter('capitalize', function() {
    return function(token) {
        return token.substr(1).charAt(0).toUpperCase() + token.slice(2);
    }
});