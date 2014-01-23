'use strict'

angular.module('jswcApp')
  .controller 'IndexCtrl', ($scope, Votings) ->
    $scope.votings = Votings.query()
    
    $scope.cfg =
      formForVoting: ''
    
    ee = """
    <form name="voteform" class="form-horizontal" role="form" ng-controller="">
      <div class="radio" ng-repeat="for opt in voting.options">
        <label class="checkbox-inline">
        <input type="radio" name="{{opt.id}}" value="{{opt.id}}">
          {{opt.name}}
          <a class="btn btn-small" ng-show="{{opt.url}}" href="{{opt.url}}">
            <i class="icon icon-share"></i>
          </a>
          <p ng-show="{{opt.desc}}">{{opt.desc}}</p>
        </label>
      </div>
      <button type="submit" class="btn btn-primary"><i class="icon icon-ok"></i> OK</button>
      <button type="button" class="btn" ng-click="destroyVotingForm();">Cancel</button>
    </form>
    """
    
    $scope.doVote = ($event) ->
      $scope.cfg.formForVoting = ''
    
    $scope.voteForm = (voting, $event) ->
      renderOptions = (opts) ->
        r = []
        for opt, idx in opts
          s = """<div class="radio"><label class="checkbox-inline">
            <input type="radio" name="#{idx}" value="#{idx}">
            #{opt.name}
            """
          if opt.url
            s += """<a class="btn btn-small" href="#{opt.url}">
              <i class="icon icon-share"></i>
            </a>"""
          s += "<p>#{opt.desc}</p>" if opt.desc
          s += '</label></div>'
          r.push(s)
        r.join('')

        
      template = """
      <form name="voteform" class="form-horizontal" role="form">
        #{renderOptions(voting.options)}
        <button type="submit" class="btn btn-primary"><i class="icon icon-ok"></i> OK</button>
        <button type="button" class="btn" ng-click="destroyVotingForm();">Cancel</button>
      </form>
      """
      
      $scope.destroyVotingForm()
      $scope.votingForm = $compile(ee)($scope)
      $($event.target.parentElement).append($scope.votingForm)
      
      
    $scope.destroyVotingForm = () ->
      return if not $scope.votingForm
      
      $($scope.votingForm).remove()