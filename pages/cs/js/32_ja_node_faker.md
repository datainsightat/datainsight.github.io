    var faker = require('faker');

    console.log("My Products:\n");

    for (var i=1; i<=10;i++) {
        var randomProduct= faker.commerce.productName();
        var randomPrice= faker.commerce.price();
        console.log(randomProduct + ': ' + randomPrice + ' €');
    }
