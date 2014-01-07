var path = require('path');

var express = require('express');

var app = module.exports = express();
app.use(app.router);
if (app.get('env') === 'development') {
  app.use(express.static(path.resolve('client')));
  app.use(express.static(path.resolve('public')));
} else {
  app.use(
    '/bower_components',
    express.static(path.resolve('client/bower_components'))
  );
  app.use(express.static(path.resolve('public')));
}
