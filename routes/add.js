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

router.route('/')
.get(function (req, res){
  res.redirect('/add/league');
});

router.route('/organization').get(function (req, res){
  var query = util.format("SELECT org_num, org_name FROM organization;");
  pool.query(query, function(err, rows, fields) {
    if (err) throw err;
    res.render('add_organization', {org_list:rows});
  });
});

router.route('/organization').post(function (req, res){
  var query = util.format("INSERT INTO organization (org_name) VALUES ('%s');",req.body.org_name);
  pool.query(query, function(err, rows, fields) {
    if (err)
      res.redirect("/error/query");
    res.redirect("/add/organization");
  });
});

router.route('/league').get(function (req, res){
  var query = util.format("SELECT org_num, org_name FROM organization;");
  pool.query(query, function(err, rows, fields) {
    if (err) throw err;
    res.render('add_league', {org_list: rows, data:JSON.stringify(rows)});
  });
});

router.route('/league').post(function (req, res){
  var query = util.format(
    "INSERT INTO league (org_num, league_year, league_name) VALUES (%d, %d, '%s');",
     req.body.org_num, req.body.league_year, req.body.league_name);
    console.log(query);
  pool.query(query, function(err, rows, fields) {
    if (err)
      res.redirect("/error/query");
    res.redirect("/search/league");
  });
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
