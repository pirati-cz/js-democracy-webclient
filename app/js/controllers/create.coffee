app = angular.module('jswcControllers')

app.controller "CreateController", ($scope, $location, api) ->

  now = new Date()

  $scope.voting =
    name: ''
    desc: ''
    url: ''
    begin: moment(now).add('days', 2).toDate()
    end: moment(now).add('days', 4).toDate()
    category_id: 1
    opts: []

  $scope.create = (form) ->
    if form.$valid
      api.Voting.save $scope.voting, ->
        $location.path "/"
      , (e) ->
        alert(e.data)

  $scope.removeOpt = (opt) ->
    $scope.voting.opts.splice($scope.voting.opts.indexOf(opt), 1)

  $scope.addOpt = ->
    $scope.voting.opts.push
      name: ''
      desc: ''
      url: ''