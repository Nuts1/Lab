/**
 * Created by Nuts on 2/21/2017.
 */
(function () {
    angular.module('server').controller('loginController', function ($http, $scope) {
        $scope.email = "";
        $scope.password = "";

        this.onSubmit = function(){
            var transform = function(data){
                return $.param(data);
            };

            $http.post('/j_spring_security_check', {
                password: $scope.password,
                email: $scope.email
            }, {headers:
                    {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                transformRequest:
                    function(obj) {
                        var str = [];
                        for(var p in obj)
                            str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                        return str.join("&");
                    }
            })
            .then(function (data, status, header) {
                    window.location = "/admin"
                },
                function (data, status) {
                    // TODO Show error massage
                });
        };
    });
})();