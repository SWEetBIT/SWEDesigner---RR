//moustache
const mu = require('./utility/parser');

//forge
var encr = require('./utility/encrypt');

//express
const express = require('express');
var bodyParser = require('body-parser');
const app = express();

//port
const port = 3000;

app.use(bodyParser.text());
app.post("/salvatore", function(req, res){
  var myBytes = req.body;
  var encripted = encr.encrypt(myBytes);
  encr.decrypt(encripted);
  res.send("critta e decritta porco dio!");
})

/*app.use(bodyParser.json());
app.post("/salvatore", function(req,res) {
  var myMu = req.body;
  mu.parse(myMu);
  res.send("madonna ladra");
})*/



app.listen(port, ()=>{
  console.log("SERVER WORKS!!!" + port);
});