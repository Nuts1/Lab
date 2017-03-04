/**
 * Created by Nuts on 2/28/2017.
 */
(function () {
    angular.module('server').controller('booksController', function ($scope, $http) {

        $scope.books = {};
        $scope.currentPage = 0;

        $scope.addBookItem = 0;

        $scope.init = function () {
            $http.get('/api/page')
                .then(function (response) {
                    $scope.pages = parseInt(response.data);
                }, function () {

                });
        };

        $scope.upload = function () {
            $http.post('/api/page', $scope.addBookItem)
                .then(function (response) {
                    $scope.pages = parseInt(response.data);
                }, function () {

                });
        };

        $scope.$watch('pages', function( newValue, oldValue ){
            if($scope.pages > 0) {
                $scope.getPage(0);
            }
        }, true);

        $scope.setCurrentPage = function(n) {
            $scope.currentPage = n;
        };

        $scope.isActive = function(index){
            return $scope.currentPage === index;
        };

        $scope.$watch('currentPage', function( newValue, oldValue ){
            $scope.getPage($scope.currentPage);
        }, true);

        $scope.getPage = function (page) {
            $http.get('/api/books/' + parseInt(page))
                .then(function (response) {
                    $scope.books = response.data.content;
                }, function () {

                });
        };

        $scope.range = function() {
            return new Array(parseInt($scope.pages));
        };
    })
})();