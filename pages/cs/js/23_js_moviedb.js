//Define Array
//Movie, Rating, Has Watched

movieDB = [
    {"name":"In Bruges", "rating":5, "hasWatched": true},
    {"name":"Frozen", "rating":4.5, "hasWatched":false},
    {"name":"Mad Max Fury Road", "rating":5, "hasWatched":true},
    {"name":"Ley Miserables", "rating":3.5, "hasWatched":false}
];

//LoopArray
movieDB.forEach(function(i){
    var status = "";
    if (i.hasWatched == true) {
        status = "You have watched";
    } else {
        status = "You have not seen";
    }
    console.log(status,  '"'+i.name+'"', '-',i.rating,'stars');
})
