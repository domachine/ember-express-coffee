
# Ember-express-coffee

  I'm currently experimenting with emberjs and coffee-script.  So I
  was searching to get started using those two.  Of course I stumbled
  across `yeoman/generator-ember` which seems to have coffee-script
  support.  But support doesn't work that well since it's hard to use
  it with coffee-script's `sourceMap` feature (see
  [this](http://mikefowler.me/2013/10/28/coffeescript-source-maps-with-yeoman/))
  which is important for me.  Additionally it feels like the folks
  from `yeoman/generator-ember` are more focused on getting the js
  thing to go which is ok.  But since I want to try coffee-script I
  want the Gruntfile to be in coffee script, too.  So I took the time
  to learn about the grunt-plugins used in `yeoman/generator-ember`
  and combined them in this project without the bloat I don't need.
  One time this will maybe become a yeoman generator.

  Happy hacking!

## Getting started

    $ npm install
    $ bower install
    $ grunt
    $ coffee src/server.coffee

  There's also a `watch` task which compiles the `.coffee` files when
  changes become available.

More to come ...
