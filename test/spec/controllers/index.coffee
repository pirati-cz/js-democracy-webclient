describe 'js-democracy-webclient app', ->

  beforeEach ->
    @addMatchers toEqualData: (expected) ->
      angular.equals @actual, expected

  beforeEach module("jswcApp")
  beforeEach module("jswcServices")
  
  describe "IndexCtrl", ->
    scope = undefined
    ctrl = undefined
    $httpBackend = undefined
    
    data = [
      name: "voting1-hujaja"
    ,
      name: "voting2-helaja"
    ]
    
    beforeEach inject((_$httpBackend_, $rootScope, $controller) ->
      $httpBackend = _$httpBackend_
      scope = $rootScope.$new()
      $httpBackend.expectGET("/votings").respond data
      ctrl = $controller('IndexCtrl', $scope: scope)
    )
    
    it "should create voting models fetched from API", ->
      $httpBackend.flush()
      expect(scope.votings).toEqualData data

    it "should set the default value of cfg", ->
      expect(scope.cfg.formForVoting).toBe ""




