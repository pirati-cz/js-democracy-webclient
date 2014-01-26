'use strict'

app = angular.module('jswcApp', [
  'jswcControllers',
  'jswcServices'
])

app.config ($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'views/index.html'
      controller: 'IndexCtrl'

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

