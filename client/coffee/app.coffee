window.App = Ember.Application.create()

App.Store = DS.Store.extend
  adapter: DS.FixtureAdapter

App.Router.map () ->
  # put your routes here
