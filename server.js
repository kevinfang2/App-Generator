var express = require('express')
var path = require('path');
var fs = require('fs');
var app = express();
var firebase = require('firebase');
var archiver = require('archiver');


app.set('view engine', 'ejs');

app.use(express.static(__dirname));

app.get('/', function (req, res) {
	res.render('pages/form');
});

app.get('/products', function(req, res) {
	res.render('pages/products');
});



String.prototype.format = function() {
    var s = this,
        i = arguments.length;

    while (i--) {
        s = s.replace(new RegExp('\\{' + i + '\\}', 'gm'), arguments[i]);
    }
    return s;
};

var myFirebaseRef = new firebase("https://bankhackathon.firebaseio.com/");
var dataArray = "";
myFirebaseRef.on("value", function(snapshot) {
	console.log("change detected");
	var data = snapshot.val().items;
	dataArray = Object.keys(data).map(function(k) { return data[k] });
}, function (errorObject) {
	console.log("The read failed: " + errorObject.code);
});

function data() {
	var retString = "";
	for (i in dataArray) {
		var item = dataArray[i];
		var str = '[titles addObject:@"{0}"];\n\t[costs addObject:@"{1}"];\n\t[description addObject:@"{2}"];\n\t[images addObject:@"{3}"];'.format(item.Name, item.cost, item.Description, item.image.replace("data:image/jpeg;base64,","").replace("data:image/png;base64,",""));
		retString += str;
	}
	return retString;
}

app.get('/submit', function (req, res) {
    console.log('submit pressed');
	var populationData = data()
    fs.readFile("ItemsViewController.m", 'utf8', function (err,data) {
        if (err) {
            return console.log(err);
        }
        var result = data.replace(/\/\/string to be replaced/g, populationData);

        fs.writeFile("App/SimplifySDKSampleApp/SimplifySDKSampleApp/ViewControllers/ItemsViewController.m", result, 'utf8', function (err) {
            if (err) return console.log(err);
        });
    });

	var archive = archiver.create('zip', {});
	res.setHeader('Content-Type', 'application/zip');
	res.attachment('App/SimplifySDKSampleApp.zip');
	archive.on('error', function(err) {
		res.status(500).send({error: err.message});
	});
	//on stream closed we can end the request
	res.on('close', function() {
		console.log('Archive wrote %d bytes', archive.pointer());
		// return res.status(200).send('OK').end();
	});
	//this is the streaming magic
	archive.pipe(res);
	var directory = 'App';
	archive.directory(directory);
	archive.finalize();
});


app.listen(3141)
console.log('3141');
