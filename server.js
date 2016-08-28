var express = require('express')
var path = require('path');
var fs = require('fs');
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

function data() {
	return "mem";
}

app.post('/submit', function (req, res) {
    console.log('submit pressed');
    console.log(data());
	var view = data()
    fs.readFile("test", 'utf8', function (err,data) {
        if (err) {
            return console.log(err);
        }
        var result = data.replace(/\/\/string to be replaced/g, view);

        fs.writeFile("testcopy", result, 'utf8', function (err) {
            if (err) return console.log(err);
        });
    });
});

app.listen(3141)
console.log('3141');
