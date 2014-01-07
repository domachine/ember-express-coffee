
path = require 'path'

loadGruntTasks = require 'load-grunt-tasks'

module.exports = (grunt) ->
  grunt.initConfig
    watch:
      options:
        livereload: true
      templates:
        files: [ 'client/templates/**/*.hbs' ]
        tasks: [ 'emberTemplates' ]
      coffee:
        files: [ 'client/coffee/**/*.coffee' ]
        tasks: [ 'coffee:client' ]
      html:
        files: [ 'client/*.jade' ]
        tasks: [ 'jade:development' ]
      css:
        files: [ 'client/css/**/*.css' ]
    emberTemplates:
      options:
        templateBasePath: 'client/templates/'
      compile:
        files:
          'client/js/templates.js': 'client/templates/**/*.hbs'
    coffee:
      client:
        options:
          sourceMap: true
        expand: true
        cwd: 'client/coffee'
        src: [ '**/*.coffee' ]
        dest: 'client/js/'
        ext: '.js'
    jade:
      options:
        pretty: true
      development:
        expand: true
        cwd: 'client'
        src: [ '*.jade' ]
        dest: 'public'
        ext: '.html'
        options:
          data:
            env: 'development'
      production:
        expand: true
        cwd: 'client'
        src: [ '*.jade' ]
        dest: 'public'
        ext: '.html'
        options:
          data:
            env: 'production'
    connect:
      server:
        options:
          port: 3000
          livereload: true
          middleware: (connect) ->
            [ require('./app') ]
    useminPrepare:
      options:
        dest: 'public'
        root: 'client'
      html: [ 'public/*.html' ]
    usemin:
      html: [ 'public/*.html' ]
    clean:
      '.tmp': [ '.tmp' ]
      views: [ 'views/index.html' ]
      public: [ 'public/js', 'public/css', 'public/*.html' ]
      client: [ 'client/js' ]

  loadGruntTasks grunt
  grunt.registerTask 'default', [
    'coffee:client'
    'emberTemplates'
    'jade:development'
  ]
  grunt.registerTask 'server', [
    'default'
    'connect:server'
    'watch'
  ]
  grunt.registerTask 'build', [
    'coffee'
    'emberTemplates'
    'jade:production'
    'useminPrepare'
    'concat'
    'uglify'
    'cssmin'
    'usemin'
  ]
