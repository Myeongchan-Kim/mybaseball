var express = require('express');
var app = express();
var handlebars = require('express-handlebars').create({defaultLayout:'main'}); //템플릿
var bodyparser = require('body-parser').urlencoded({extended:true}); //form 평문전달
var cookieParser = require('cookie-parser'); //쿠키 관리
var session = require('express-session'); //세션

app.use(session({
  secret:'my_secret',
  resave:false,
  saveUninitialized:true,
}));
app.use(cookieParser());
app.use(bodyparser);
app.engine('handlebars', handlebars.engine);
app.set('view engine', 'handlebars');
app.set('port', process.env.PORT || 3000);

app.get('/', function(req, res){
  res.render('index');
});

app.use(express.static(__dirname + '/static'));

app.use(function (req, res){
  res.type('text/plain');
  res.status('404');
  res.send('404 - Page not found');
});

app.use(function(err, req, res, next){
  console.error(err.stack);
  res.type('text/plain');
  res.status('500');
  res.send('500 - Server Error');
});

app.listen(app.get('port'), function (){
  console.log('Express started on http://localhost:' + app.get('port') + '; press Ctrl-C to terminate.');
});
