/**
 * Created by Nuts on 2/27/2017.
 */

(function () {
    angular.module('server').controller('toolbarCtrl',  ['$http', '$location', function ($http, $location) {
        this.menuItems = ['/books', '/orders', '/peoples'];

        this.isActive = function (item) {
            return item === $location.path();
        };
    }])
})();