
util = require 'util'

app = require './app'

log = util.log

app.listen 3000, () ->
  log 'Listening on port 3000'
