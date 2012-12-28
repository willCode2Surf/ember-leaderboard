var User = require('../models/user')

exports.index = function(req, res){
  User.find(function(err, users){
    res.json(200, { "users": users });
  });
};

exports.show = function(req, res){
  User.findById(req.params.user, function(err, user){
    res.json(200, { "user": user });
  });
};

exports.create = function(req, res){
  user = new User(req.body.user);
  user.save(function(err, user) {
    res.json(200);
  });
};

exports.destroy = function(req, res){
  User.findByIdAndRemove(req.params.user, function(err, user) {
    res.json(200);
  });
};

exports.update = function(req, res){
  User.findByIdAndUpdate(req.params.user, req.body.user, function(err, user) {
    res.json(200);
  });
};
