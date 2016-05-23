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

router.route('/team/:id').get(function (req, res){
  var query = util.format("select * from team where team_id = %d;", req.params.id);
  pool.query(query, function(err, rows, fields) {
    if (err) throw err;
    var team_info = rows
    query  = util.format("CALL load_batter_record_of_team(%d);", req.params.id);
    pool.query( query, function (err, rows, fields){
      var batter_table = rows[0];
      res.render('show_team', {team_info: team_info, batter_list: batter_table});
    })
  });
});

router.route('/player/:id').get(function (req, res){
  var query = util.format("select player_id, player_name, birth, if(pro = 1, '선출', '비선출') as pro, highschool, main_position from player where player_id = %d", req.params.id);
  pool.query(query, function(err, rows, fields) {
    var player_info = rows;
    query = util.format("CALL load_player_history(%d);", req.params.id);
    pool.query(query, function(err, rows, fields) {
      res.render('show_player', {player_info:player_info, player_history : rows[0], data: JSON.stringify(rows)});
    });
  });
});

router.route('/game/:id')
.get(function (req, res){
  res.render('test', {data:req.params.id});
});

module.exports = router;
