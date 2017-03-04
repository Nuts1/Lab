/**
 * Created by Nuts on 2/21/2017.
 */
(function () {
    angular.module('server').controller('mainController', function ($http, $scope) {
        $scope.goToUrl = function (url) {
            window.location.href = url;
        }
    })
})();