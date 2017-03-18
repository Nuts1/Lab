/**
 * Created by Nuts on 2/28/2017.
 */
(function () {
    angular.module('server')
        .directive("fileread", [function () {
            return {
                scope: {
                    fileread: "="
                },
                link: function (scope, element, attributes) {
                    element.bind("change", function (changeEvent) {
                        var reader = new FileReader();
                        reader.onload = function (loadEvent) {
                            scope.$apply(function () {
                                scope.fileread = loadEvent.target.result;
                            });
                        };
                        reader.readAsDataURL(changeEvent.target.files[0]);
                    });
                }
            }
        }])
        .controller('booksController', ["$scope", "$http", "$routeParams",
            function ($scope, $http, $routeParams) {

                $scope.books = {};
                $scope.addBookItem = {};

                $scope.pageSize = 9;
                $scope.maxSize = 5;
                $scope.totalItems = 0;
                $scope.currentPage = 0;

                $scope.setCurrentPage = function(n) {
                    $scope.currentPage = n;
                };

                $scope.getPage = function (page) {
                    $scope.setCurrentPage(page);
                    $http.get('/api/books/' + parseInt(page) + '/' + 9)
                        .then(function (response) {
                            $scope.books = response.data.content;
                        }, function () {

                        });
                };

                $scope.init = function () {
                    $http.get('/api/page')
                        .then(function (response) {
                            $scope.totalItems = parseInt(response.data);
                        }, function () {

                        });
                };

                $scope.getPage(0);

                $scope.pageChanged = function() {
                    $scope.getPage($scope.currentPage);
                };

                $scope.upload = function () {
                    $http.post('/api/upload', $scope.addBookItem, {
                        headers: {'Content-Type': undefined }
                    }).then(function (response) {
                            //TODO
                      }, function () {

                      });
                };

                $scope.delete = function (id) {
                    $http.delete('/api/book/' + id)
                        .then(function (response) {
                            $scope.init();
                            $scope.getPage(0);
                        }, function () {

                        });
                };


                $scope.isActive = function(index){
                    return $scope.currentPage === index;
                };

                $scope.range = function() {
                    return new Array(parseInt($scope.totalItems / $scope.pageSize)); // TODO No.
                };
            }])
})();