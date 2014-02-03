
genVotings = (cnt) ->
    rv = []
    for i in cnt:
      rv.push
        _id: 0,
        name: "Voting#{i}"
        desc: "Some voting1 description"
        url: "http://www.pirati.cz/votings/1"
        voted: ""
        opts: [{
          id: 0
          name: "voting1 opt1"
          desc: "voting1 opt1 long, long desc, just as it shall be"
        }, {
          id: 1
          name: "voting1 opt2"
          desc: "voting1 opt2 long, long desc, just as it shall be"
          url: "http://johoho111111.cs"
        }]
    rv

  votings = genVotings(4)

module.exports =

  drawRoutes: (app) ->
    app.get '/voting', (req, res) ->
      res.json(votings)
