var util = require('util');

var app = require('./app');

var log = util.log;

app.listen(3000, function() {
  log('Listening on port 3000');
});
