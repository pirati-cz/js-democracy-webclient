app = angular.module('jswcControllers')

app.controller "CreateController", ($scope, $location, api) ->

  $scope.voting =
    name: ''
    desc: ''
    url: ''
    begin: new Date()
    end: new Date()
    category: 1

  $scope.create = (form) ->
    if form.$valid
      api.Voting.save $scope.voting, ->
        $location.path "/"
      , (e) ->
        alert(e.data)
