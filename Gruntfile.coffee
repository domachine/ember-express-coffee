
path = require 'path'
loadGruntTasks = require 'load-grunt-tasks'

module.exports = (grunt) ->
  grunt.initConfig
    watch:
      templates:
        files: [ 'client/templates/**/*.hbs' ]
        tasks: [ 'emberTemplates' ]
      coffee:
        files: [ 'client/coffee/**/*.coffee' ]
        tasks: [ 'coffee:client' ]
      html:
        files: [ 'client/*.html' ]
        tasks: [ 'copy:html' ]
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
      server:
        expand: true
        cwd: 'src'
        src: [ '**/*.coffee' ]
        dest: '.'
        ext: '.js'
    useminPrepare:
      options:
        dest: 'public'
      html: 'client/index.html'
    copy:
      html:
        files: [
          expand: true
          cwd: 'client'
          src: '*.html'
          dest: 'views/'
        ]
    usemin:
      html: 'views/index.html'
    clean:
      '.tmp': [ '.tmp' ]
      views: [ 'views/index.html' ]
      public: [ 'public/js', 'public/css' ]
      client: [ 'client/js' ]
      server: [ 'lib', 'routes', 'app.js', 'routes.js' ]

  loadGruntTasks grunt
  grunt.registerTask 'default', [ 'coffee:client', 'emberTemplates', 'copy' ]
  grunt.registerTask 'build', [
    'default'
    'coffee:server'
    'useminPrepare'
    'concat'
    'uglify'
    'cssmin'
    'copy'
    'usemin'
  ]
