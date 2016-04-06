// Basic set up of a server running on port 3000
// Includes, express for routing and swig for node templating
var express = require('express'),
    swig = require('swig'),
    app = express(),
    riot = require('riot')

app.engine('html', swig.renderFile);

app.set('view engine', 'html');
// Lets use views for our pages and public for assets
app.set('views',__dirname + '/views');
app.use(express.static(__dirname + '/public'));

app.get('/', function(req, res){
  res.render('index');
})


app.get('/basic_tag_with_runtime_compilation', function(req, res){
  res.render('basic_tag_with_runtime_compilation');
})

app.get('/tag_with_object_runtime_compilation', function(req, res){
  res.render('tag_with_object_runtime_compilation');
})

app.get('/tag_with_css_runtime_compilation', function(req, res){
  res.render('tag_with_css_runtime_compilation');
})

app.listen(3000, function(){
  console.log('Stuff happens on port 3000');
})

