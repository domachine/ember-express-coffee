
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

    .
    |-- bower.json
    |-- client
    |   |-- coffee
    |   |   |-- app.coffee
    |   |   |-- models
    |   |   |   `-- color.coffee
    |   |   |-- routes
    |   |   |   `-- index.coffee
    |   |   |-- runner.coffee
    |   |   `-- tests.coffee
    |   |-- css
    |   |   |-- runner.css
    |   |   `-- style.css
    |   |-- index.jade
    |   `-- templates
    |       |-- application.hbs
    |       `-- index.hbs
    |-- Gruntfile.coffee
    |-- package.json
    |-- public
    |-- README.md
    |-- src
    |   |-- app.coffee
    |   `-- server.coffee
    `-- views

  This is the source structure layed out.  `client/` includes
  everything which has to do with the client: stylesheets,
  coffee-scripts and the templates used in the ember application.  The
  server sources are located in `src/`.  Everytime you add something
  (stylesheet, coffee-script etc.) to your application you have to
  make sure to link it in your `index.jade` file which is the
  entrypoint of the application and looks like this:

  ```jade
    doctype html
    html
      head
        meta(charset='utf-8')
        title Ember Starter Kit
        if env == 'development'
          link(rel='stylesheet'
               href='bower_components/bootstrap/dist/css/bootstrap.css')
        else
          link(rel='stylesheet'
               href='bower_components/bootstrap/dist/css/bootstrap.min.css')
        // build:css css/main.css
        link(rel='stylesheet' href='css/style.css')
        // endbuild
      body
        // build:js js/components.js
        script(src='bower_components/jquery/jquery.js')
        script(src='bower_components/handlebars/handlebars.js')
        script(src='bower_components/bootstrap/dist/js/bootstrap.js')
        // endbuild
        if env == 'development'
          script(src='bower_components/ember/ember.js')
          script(src='bower_components/ember-data/ember-data.js')
        else
          script(src='bower_components/ember/ember.min.js')
          script(src='bower_components/ember-data/ember-data.min.js')
        // build:js js/main.js
        script(src='js/templates.js')
        script(src='js/app.js')
        script(src='js/models/color.js')
        script(src='js/routes/index.js')
        // endbuild
        if env == 'development'
          // to activate the test runner, add the "?test" query string parameter
          script(src='js/runner.js')
  ```

### Deploy

  To run your application in `production` mode use the following:

    $ grunt build
    $ NODE_ENV=production npm start
