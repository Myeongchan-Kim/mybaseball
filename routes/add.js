var express = require('express');
var router = express.Router();

router.route('/')
.get(function (req, res){
  res.render('test', {data:"default add"});
});

router.route('/league')
.get(function (req, res){
  res.render('test', {data:"add league"});
});

router.route('/team')
.get(function (req, res){
  res.render('test', {data:"add team"});
});

router.route('/player')
.get(function (req, res){
  res.render('test', {data:"add player"});
});

router.route('/game')
.get(function (req, res){
  res.render('test', {data:"add game"});
});


module.exports = router;
