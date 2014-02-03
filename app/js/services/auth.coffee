
app = angular.module('jswcServices')

app.factory "AuthenticationService", ($http, SessionService) ->

  login: (user, done) ->
    # this method could be used to call the API and set the user instead of taking it in the function params
    SessionService.currentUser = user
    done()

  logout: (done) ->
    SessionService.currentUser = ''
    done()

  isLoggedIn: ->
    SessionService.currentUser isnt null


app.factory 'SessionService', ->
  currentUser: null