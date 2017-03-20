/**
 * Created by Nuts on 2/27/2017.
 */
(function () {
    angular.module('server')  .controller('ordersController',  ["$scope",'$http', '$location',
        function ($scope, $http, $location) {
            $scope.orders = [];

            $scope.pageSize = 9;
            $scope.maxSize = 5;
            $scope.totalItems = 0;
            $scope.currentPage = 0;

            $scope.setCurrentPage = function(n) {
                $scope.currentPage = n;
            };

            $scope.getPage = function (page) {
                $scope.setCurrentPage(page);
                $http.get('/admin/order/' + parseInt(page) + '/' + 9)
                    .then(function (response) {
                        $scope.orders = response.data.content;
                    }, function () {

                    });
            };

            $scope.init = function () {
                $http.get('/admin/order/page')
                    .then(function (response) {
                        $scope.totalItems = parseInt(response.data);
                    }, function () {

                    });
            };

            $scope.getPage(0);

            $scope.pageChanged = function() {
                $scope.getPage($scope.currentPage);
            };


            $scope.isActive = function(index){
                return $scope.currentPage === index;
            };

            $scope.range = function() {
                return new Array(parseInt($scope.totalItems / $scope.pageSize)); // TODO No.
            };

        }])
})();