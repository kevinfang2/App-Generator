function funct1(){
  var firebase = require("/node_modules/firebase");

  var config = {
    apiKey: "AIzaSyDOw9YSWVKhFTJP9xrusituLGnHxE5Uayo",
    authDomain: "bankhackathon-b9f7a.firebaseapp.com",
    databaseURL: "https://bankhackathon-b9f7a.firebaseio.com/",
    storageBucket: "bankhackathon-b9f7a.appspot.com",
  };
  
  firebase.initializeApp(config);

  console.log(document.getElementById("name").value);
  firebase.database().ref('users/').set({
    "name": "same"
  //   "placename": document.getElementById("placename").value,
  //   "address" : document.getElementById("address").value,
  //   "city" : document.getElementById("city").value,
  //   "state": document.getElementById("state").value,
  //   "zip" : document.getElementById("zip").value
  });
}