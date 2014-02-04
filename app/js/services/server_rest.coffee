'use strict';

mod = angular.module('jswcServices', ['ngResource'])

mod.factory 'api', ($resource, myconfig) ->

  url = myconfig.votingAPIUrl

  api =

    # voting API
    Voting: $resource("#{url}voting", {}, {})

    # vote API
    Vote: $resource("#{url}vote/:votingId", {}, {})


