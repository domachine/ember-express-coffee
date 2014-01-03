
module.exports = (app) ->

  # Load all routes lazily.
  routes = [

    # List your routes here.

  ]

  # Register all routes to the passed app.
  route(app) for route in routes
