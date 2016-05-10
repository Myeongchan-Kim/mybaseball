var express = require('express');
var router = express.Router();

router.route('/league/:leagueId')
.get(function (req, res){
  res.render('showLeague', {data: req.params.leagueId});
});

router.route('/league/rank/team/:leagueId')
.get(function (req, res){
  res.render('showLeague', {data: req.params.leagueId});
});

router.route('/league/rank/batter/:leagueId')
.get(function (req, res){
  res.render('showLeague', {data: req.params.leagueId});
});

router.route('/league/rank/pitcher/:leagueId')
.get(function (req, res){
  res.render('showLeague', {data: req.params.leagueId});
});

router.route('/team/:id')
.get(function (req, res){
  res.render('test', {data:req.params.id});
});

router.route('/player/:id')
.get(function (req, res){
  res.render('test', {data:req.params.id});
});

router.route('/game/:id')
.get(function (req, res){
  res.render('test', {data:req.params.id});
});

module.exports = router;
