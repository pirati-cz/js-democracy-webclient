'use strict'

app = angular.module('jswcApp', [
  'jswcControllers',
  'jswcServices',
  'ui.bootstrap.datetimepicker'
])

app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/index.html'
      controller: 'IndexCtrl'
      
    .when '/create',
      templateUrl: 'views/create.html'
      controller: 'CreateController'

    .when '/login',
      templateUrl: 'views/login.html'
      controller: 'LoginController'

    .otherwise
      redirectTo: '/'


# add authentication
app.run ($rootScope, $location, AuthenticationService) ->

  # enumerate routes that don't need authentication
  routesNoRequiringAuth = ['/login']

  # check if current location matches route
  routeClean = (route) ->
    return route in routesNoRequiringAuth


  $rootScope.$on "$routeChangeStart", (event, next, current) ->

    # if route requires auth and user is not logged in
    if not routeClean($location.url()) and not AuthenticationService.isLoggedIn()
    # redirect back to login
      $location.path "/login"


# automatic redirect to login page when 401 from REST service
app.config ($httpProvider) ->
  logsOutUserOn401 = ["$q", "$location", ($q, $location) ->
    success = (response) ->
      response

    error = (response) ->
      if response.status is 401
        # redirect them back to login page
        $location.path "/login"
        $q.reject response
      else
        $q.reject response

    (promise) ->
      promise.then success, error
  ]
  $httpProvider.responseInterceptors.push logsOutUserOn401