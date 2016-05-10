var express = require('express');
var router = express.Router();

router.route('/')
.get(function (req, res){
  res.redirect('/search/league');
});

router.route('/league')
.get(function (req, res){
  res.render('searchLeague', {data:"leagueDefault"});
});

router.route('/team')
.get(function (req, res){
  res.render('test', {data:"search team"});
});

router.route('/player')
.get(function (req, res){
  res.render('test', {data:"search player"});
});

router.route('/game')
.get(function (req, res){
  res.render('test', {data:"search game"});
});

module.exports = router;
