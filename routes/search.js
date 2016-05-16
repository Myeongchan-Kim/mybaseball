var express = require('express');
var router = express.Router();
var util = require('util');

var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host : 'localhost',
  database : 'mybaseball',
  user : 'guest',
  password : 'aOVG1L2xDC'
});

router.route('/').get(function (req, res){
  res.redirect('/search/league');
});

router.route('/league/').get(function (req, res){
  var query = util.format("SELECT league_id, league_year, league_name FROM league;");
  pool.query(query, function(err, rows, fields) {
    if (err) throw err;
    res.render('searchLeague', {data: rows});
  });
});

router.route('/league/:id').get(function (req, res){
  var query = util.format("SELECT league_id, league_year, league_name FROM league WHERE league_id = %d;", req.params.id);
  pool.query(query, function(err, rows, fields) {
    if (err) throw err;
    res.render('searchLeague', {data: rows});
  });
});

router.route('/team').get(function (req, res){
  res.render('test', {data:"search team"});
});

router.route('/player').get(function (req, res){
  res.render('test', {data:"search player"});
});

router.route('/game').get(function (req, res){
  res.render('test', {data:"search game"});
});

module.exports = router;
