/**
 * Created by Nuts on 2/22/2017.
 */
(function () {
    angular.module("server")
        .directive("customHeader", function () {
            return {
                templateUrl: "templates/head.html"
            }
        })
})();