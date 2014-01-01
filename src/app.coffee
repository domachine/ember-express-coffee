
path = require 'path'
express = require 'express'

eco = require './lib/eco'
routes = require './routes'

app = module.exports = express()

# Register eco as template engine.
eco app
app.use (req, res, next) ->

  # Export the current runtime environment to templates.
  res.locals(env: app.get 'env')
  next()

# Insert router in middleware stack.
app.use app.router
if app.get('env') is 'development'

  # Serve full client sources during development
  app.use express.static(path.resolve('client'))
else

  # Serve public/ and bower_components/ only in production mode.
  app.use(
    '/bower_components'
    express.static(path.resolve 'client/bower_components')
  )
  app.use(express.static(path.resolve 'public'))

# Register routes.
routes(app)
