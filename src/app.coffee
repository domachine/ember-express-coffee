
path = require 'path'
express = require 'express'

app = module.exports = express()

# Insert router in middleware stack.
app.use app.router

# Mount file servers
if app.get('env') is 'development'

  # Serve full client sources during development
  app.use express.static(path.resolve 'client')
  app.use express.static(path.resolve 'public')
else

  # Serve public/ and bower_components/ only in production mode.
  app.use(
    '/bower_components'
    express.static(path.resolve 'client/bower_components')
  )
  app.use(express.static(path.resolve 'public'))
