var express = require('express')
var path = require('path');
var fs = require('fs');
var app = express();
var firebase = require('firebase');

app.set('view engine', 'ejs');


app.use(express.static(__dirname));

app.get('/', function (req, res) {
	res.render('pages/form');
});

app.get('/products', function(req, res) {
	res.render('pages/products');
 	// res.render('products.ejs', {root: __dirname})
});

String.prototype.format = function() {
    var s = this,
        i = arguments.length;

    while (i--) {
        s = s.replace(new RegExp('\\{' + i + '\\}', 'gm'), arguments[i]);
    }
    return s;
};

function data() {
	var myFirebaseRef = new firebase("https://bankhackathon.firebaseio.com/");
	var dataArray = "";
	var retString = "";
	console.log("MEM");
	var ret = ""
	myFirebaseRef.on("value", function(snapshot) {
		var data = snapshot.val().items;
		dataArray = Object.keys(data).map(function(k) { return data[k] });
	}, function (errorObject) {
		console.log("The read failed: " + errorObject.code);
	});
	for (i in dataArray) {
		var item = dataArray[i];
		var str = '[titles addObject:@"{0}"];\n\t[description addObject:@"{1}"];\n\t[images addObject:@"{2}"];'.format(item.Name, item.Description, item.image);
		retString += str;
	}
	return retString;
}

app.post('/submit', function (req, res) {
    console.log('submit pressed');
	var populationData = data()
    fs.readFile("SimplifySDKSampleApp/SimplifySDKSampleApp/ViewControllers/ItemsViewController.m", 'utf8', function (err,data) {
        if (err) {
            return console.log(err);
        }
        var result = data.replace(/\/\/string to be replaced/g, populationData);

        fs.writeFile("ItemsViewController.m", result, 'utf8', function (err) {
            if (err) return console.log(err);
        });
    });
});

app.listen(3141)
console.log('3141');
