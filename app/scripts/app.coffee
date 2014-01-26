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
    .otherwise
      redirectTo: '/'
