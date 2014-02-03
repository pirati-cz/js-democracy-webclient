'use strict';

angular.module('jswcServices', ['ngResource']).factory 'api', ($resource) ->

  url = ""

  api =

    # voting API
    Voting: $resource("#{url}voting", {}, {})

    # vote API
    Vote: $resource("#{url}vote/:votingId", {}, {})


