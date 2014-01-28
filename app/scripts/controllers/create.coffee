app = angular.module('jswcControllers')

app.controller "CreateController", ($scope, $location, api) ->
  
  now = new Date()

  $scope.voting =
    name: ''
    desc: ''
    url: ''
    begin: moment(now).add('days', 1).toDate()
    end: moment(now).add('days', 2).toDate()
    category_id: 1
    options: []

  $scope.create = (form) ->
    if form.$valid
      api.Voting.save $scope.voting, ->
        $location.path "/"
      , (e) ->
        alert(e.data)

  $scope.removeOpt = (opt) ->
    $scope.voting.options.splice($scope.voting.options.indexOf(opt), 1)
    
  $scope.addOpt = ->
    $scope.voting.options.push
      name: ''
      desc: ''
      url: ''