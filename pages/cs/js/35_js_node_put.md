# app.js

    //express, ejs, body-parser

    var express = require('express');
    var app = express();

    var bodyParser = require("body-parser");
    app.use(bodyParser.urlencoded({extended: true}));

    app.set("view engine", "ejs");

    var stuff = ["car", "Ski", "T-Shirts"];

    app.get("/", function(req, res){
        res.render("home");
    });

    app.post("/addItem", function(req,res){
        var newItem = req.body.newItem;
        stuff.push(newItem);
        res.redirect("/stuff");
    });

    app.get("/stuff", function(req, res){
        res.render("stuff", {stuff: stuff});
    });

    app.listen(process.env.PORT, process.env.IP, function(){
        console.log("Serv
        
 # package.json
 
     {
      "name": "35_js_node_put",
      "version": "1.0.0",
      "description": "",
      "main": "app.js",
      "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1"
      },
      "author": "",
      "license": "ISC",
      "dependencies": {
        "body-parser": "^1.18.3",
        "ejs": "^2.6.1",
        "express": "^4.16.4"
      }
    }
