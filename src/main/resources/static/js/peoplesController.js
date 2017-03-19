(function () {
    angular.module('server')
        .controller('peoplesController',  ["$scope",'$http', '$location',
            function ($scope, $http, $location) {
                $scope.users = [];

                $scope.pageSize = 9;
                $scope.maxSize = 5;
                $scope.totalItems = 0;
                $scope.currentPage = 0;

                $scope.setCurrentPage = function(n) {
                    $scope.currentPage = n;
                };

                $scope.getPage = function (page) {
                    $scope.setCurrentPage(page);
                    $http.get('/admin/user/' + parseInt(page) + '/' + 9)
                        .then(function (response) {
                            $scope.users = response.data.content;
                        }, function () {

                        });
                };

                $scope.init = function () {
                    $http.get('/admin/user/page')
                        .then(function (response) {
                            $scope.totalItems = parseInt(response.data);
                        }, function () {

                        });
                };

                $scope.getPage(0);

                $scope.pageChanged = function() {
                    $scope.getPage($scope.currentPage);
                };

                // $scope.delete = function (id) {
                //     $http.delete('/api/book/' + id)
                //         .then(function (response) {
                //             $scope.init();
                //             $scope.getPage(0);
                //         }, function () {
                //
                //         });
                // };


                $scope.isActive = function(index){
                    return $scope.currentPage === index;
                };

                $scope.range = function() {
                    return new Array(parseInt($scope.totalItems / $scope.pageSize)); // TODO No.
                };

            }])
})();