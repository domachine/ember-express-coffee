
module.exports = (app) ->

  # Load all routes lazily
  routes = [
    require('./routes/index')
  ]

  # Register all routes to the passed app
  route(app) for route in routes
