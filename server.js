var express = require('express');
var path = require('path');
var jsdom = require("jsdom");


var app = express();
// var myFirebaseRef = new Firebase("https://bankhackathon.firebaseio.com/");


app.use(express.static(__dirname));

app.get('/', function (req, res) {
    res.sendFile('form.html', {root: __dirname })
});

app.listen(3141, function () {
  console.log('3141');
});

// app.post('/firebase1', function(req, res){
// 	console.log("got into submit basic");	
	
// 	jsdom.env({
//     file: 'form.html',
//     done: function (err, window) {
//         GLOBAL.window = window;
//         GLOBAL.document = window.document;
// 		parse();
//     	}
// 	});

	
// });
