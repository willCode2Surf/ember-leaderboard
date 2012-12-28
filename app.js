
/**
 * Module dependencies.
 */

var express = require('express')
  , resource = require('express-resource')
  , stitch = require('stitch')
  , mongoose = require('mongoose')
  , routes = require('./routes')
  , user = require('./routes/user')
  , http = require('http')
  , path = require('path');

var package = stitch.createPackage({
  paths: [__dirname + '/app'],
  dependencies: [
    __dirname + '/components/jquery/jquery.js',
    __dirname + '/components/handlebars/handlebars-1.0.0-rc.1.js',
    __dirname + '/components/ember/ember.js',
    __dirname + '/components/ember-data/ember-data.js'
  ]
});

mongoose.connect('localhost', 'users');

var app = express();

app.configure(function(){
  app.set('port', process.env.PORT || 3000);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'ejs');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.cookieParser('lsdafjklsdoweqruiowe9231478923'));
  app.use(express.session());
  app.use(app.router);
  app.use(require('stylus').middleware(__dirname + '/public'));
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

app.get('/application.js', package.createServer());
app.get('/', routes.index);
app.resource('users', user);

http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});
