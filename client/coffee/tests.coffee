App.rootElement = "#ember-testing"
App.setupForTesting()
App.injectTestHelpers()
module "Integration tests",
  setup: ->
    Ember.run App, App.advanceReadiness

  teardown: ->
    App.reset()

test "/", ->
  visit("/").then ->
    equal find("h2").text(), "Welcome to Ember.js", "Application header is rendered"
    equal find("li").length, 3, "There are three items in the list"
