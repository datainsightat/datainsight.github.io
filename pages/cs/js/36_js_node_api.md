# App.js

    var express = require("express");
    var app = express();
    var request = require("request");
    app.set("view engine","ejs")

    app.get("/", function(req, res){
       res.render("search"); 
    });

    app.get("/results", function(req, res){
        var query = req.query.search;
        var url = "https://api.themoviedb.org/3/search/movie?api_key=a89f45294eccf3b6023cb14f5660dd3b&language=en-US&page=1&include_adult=false&query="+query;
        request(url, function(error,response, body){
            if(!error && response.statusCode == 200){
                var data = JSON.parse(body);
                res.render("results", {data: data});
            };
        });
    });

    app.listen(process.env.PORT, process.env.IP,function(){
        console.log("Server is running ...");
    });
    
 package.json
 
     {
      "name": "36_js_node_api",
      "version": "1.0.0",
      "description": "",
      "main": "app.js",
      "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1"
      },
      "author": "",
      "license": "ISC",
      "dependencies": {
        "ejs": "^2.6.1",
        "express": "^4.16.4",
        "request": "^2.88.0"
      }
    }
