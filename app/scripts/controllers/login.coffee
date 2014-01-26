app = angular.module('jswcControllers')

app.controller "LoginController", ($scope, $location, AuthenticationService) ->

  $scope.credentials =
    uname = ''
    passwd = ''

  $scope.loginUser = (credentials) ->
    if credentials.$valid
      AuthenticationService.login $scope.credentials, ->
        $location.path "/"

  #$scope.loginAdmin = ->
#
    # this should be replaced with a call to your API for user verification (or you could also do it in the service)
    #AuthenticationService.login
      #name: "Admin"
      #role: "admin"