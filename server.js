var express = require('express')
var path = require('path');

var app = express();

app.set('view engine', 'ejs');


app.use(express.static(__dirname));

app.get('/', function (req, res) {
	res.render('pages/form');
});

app.get('/products', function(req, res) {
	res.render('pages/products');
 	// res.render('products.ejs', {root: __dirname})
});

app.listen(3141)
console.log('3141');
