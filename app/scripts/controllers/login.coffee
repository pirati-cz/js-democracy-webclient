app = angular.module('jswcControllers')

app.controller "LoginController",
($scope, $rootScope, $location, AuthenticationService) ->

  $scope.credentials =
    uname: ''
    passwd: ''

  $scope.loginUser = (credentials) ->
    if credentials.$valid
      AuthenticationService.login $scope.credentials, ->
        $location.path "/"

        $rootScope.loggedUser = $scope.credentials.uname
        $rootScope.logout = ->
          AuthenticationService.logout ->
            $rootScope.loggedUser = ''
            $location.path "/login"
