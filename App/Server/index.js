//moustache
const mu = require('./utility/parser');

//express
const express = require('express');
var bodyParser = require('body-parser');
const app = express();

//port
const port = 3000;

app.use(bodyParser.json());
app.post("/salvatore", function(req,res) {
  var myMu = req.body;
  mu.parse(myMu);
  res.send("madonna ladra");
})

app.listen(port, ()=>{
  console.log("SERVER WORKS!!!" + port);
});