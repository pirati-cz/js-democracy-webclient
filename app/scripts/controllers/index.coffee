'use strict'

angular.module('jswcControllers', [])
  .controller 'IndexCtrl', ($scope, api) ->
    
    $scope.votings = api.Voting.query()
    
    $scope.cfg =
      formForVoting: ''
      message: false
    
    $scope.doVote = ($event, voting) ->
      $scope.cfg.message = 'voting in progress'
      api.Vote.save {}, voting.voted, ->
        $scope.cfg.message = false
      , ->
        $scope.cfg.message = false
      $scope.cfg.formForVoting = ''
    
