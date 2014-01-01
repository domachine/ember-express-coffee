
fs = require 'fs'
Q = require 'q'
eco = require 'eco'

#
# Register eco engine to the passed app.
#

module.exports = (app, ext = 'html') ->
  app.set 'view engine', ext
  app.engine ".#{ext}", (path, options, callback) ->
    return Q.ninvoke(fs, 'readFile', path)
      .then (content) ->
        callback null, eco.render(content.toString(), options)
      .fail callback
