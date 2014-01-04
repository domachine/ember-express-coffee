
# Ember-express-coffee

  I'm currently experimenting with *emberjs* and *coffee-script*.  So
  I was searching to get started using those two.  Of course I
  stumbled across `yeoman/generator-ember` which seems to have
  *coffee-script* support.  But this support doesn't work that well
  since it's hard to use it with *coffee-script*'s `sourceMap` feature
  (see
  [this](http://mikefowler.me/2013/10/28/coffeescript-source-maps-with-yeoman/))
  which is important for me.  Additionally it feels like the folks
  from `yeoman/generator-ember` are more focused on getting the js
  thing to go which is ok.  But since I want to try *coffee-script* I
  want, for example, the Gruntfile to be in *coffee-script*, too.  So
  I took the time to learn about the grunt-plugins used in
  `yeoman/generator-ember` and combined them in this project without
  the bloat I don't need.  One time this will maybe become a yeoman
  generator.  Any contributions or tips are welcome.

  Happy hacking!

## Getting started

    $ npm install
    $ bower install
    $ grunt server

  This launches a `connect` instance and mounts the application.  So
  all you have to do is open `http://localhost:3000` in your browser
  and start coding.  After each change the page is reloaded
  automatically due to `livereload`.

### Source structure

  Coming soon!

### Deploy

  To run your application in `production` mode use the following:

    $ grunt build
    $ NODE_ENV=production npm start
