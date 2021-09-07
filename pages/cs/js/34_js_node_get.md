# app.js

    var express = require("express");
    var app = express();
    var sounds = {'cow':'moe ',
                'cat':'meow ',
                'dog':'woof ',
                'bird':'tweet ',
                'mouse':'beep'};

    app.get("/:animal/:count",function(req,res) {
        var animal = req.params.animal;
        var count = parseInt(req.params.count);
        var sound = sounds[animal];

        res.send("The " + animal + " says " + sound.repeat(count) + "!");
    });

    app.get("*",function(req,res) {
        res.send("Sorry, page not found. Please enter /animal/count ...");
    });

    app.listen(process.env.PORT, process.env.IP,function(){
        console.log("Server is running ...");
    });
    
# package.json

    {
      "name": "34_js_node_get",
      "version": "1.0.0",
      "description": "Node express Demo",
      "main": "app.js",
      "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1"
      },
      "author": "",
      "license": "ISC",
      "dependencies": {
        "express": "^4.16.4"
      }
    }
