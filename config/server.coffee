
genVotings = (prefs) ->
  rv = []
  for p, idx in prefs
    rv.push
      _id: idx
      name: "Voting #{p}"
      desc: "Some #{p} description"
      url: "http://www.pirati.cz/#{p}"
      voted: ""
      opts: [{
        id: 0
        name: "#{p} opt1"
        desc: "#{p} opt1 long, long desc, just as it shall be"
      }, {
        id: 1
        name: "#{p} opt2"
        desc: "#{p} opt2 long, long desc, just as it shall be"
        url: "http://johoho111111.cs"
      }]
  rv

votings = genVotings [
  'about vote', 'nomination EU', 'silly flag change', 'are we humans'
]

module.exports =

  drawRoutes: (app) ->
    app.get '/voting', (req, res) ->
      res.json(votings)

    app.post '/voting', (req, res) ->
      newVoting = req.body
      newVoting._id = votings.length + 1
      votings.push newVoting
      res.send 200