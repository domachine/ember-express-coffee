
App.IndexRoute = Ember.Route.extend
  model: () -> this.store.find 'color'
