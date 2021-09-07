var test = [15, 8, 97];

printReverse();
isUniform();
sumArray();
maxArray();

//printReverse
function printReverse() {
    var testRev = [];
    for (i = test.length; i >= 0; i--) {
        testRev.push(test[i]);
    };
    testRev.forEach(function (it){
        console.log(it);
    });
}

//isUniform
function isUniform() {
    check = test[0];
    for (i=1; i < test.length; i ++) {
        if (check === test[i]) {
            continue;
        } else {
            console.log("No");
            break;
        };
    }
}

//sumArray
function sumArray() {
    sum = 0;
    for (i=0;i<test.length;i++) {
        sum += test[i];
    }
    console.log(sum);
}

//max
function maxArray() {
    max = 0;
    for (i=0; i<test.length;i++) {
        if (max < test[i]) {
            max = test[i];
        }
    }
    console.log(max);
}
