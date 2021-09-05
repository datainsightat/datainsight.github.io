function isEven(a) {
    if (a%2 === 0) {
        return true;
    } else {
        return false;
    }
}

function factorial(a) {
    for (i = 1; a > 0; a--) {
        i *= a;
    }
    return i;
}

function kebabToSnake(a) {
    var count = (a.match(/-/g) || []).length;
    for (i=1;i<=count;i++) {
        a = a.replace("-","_");
    }
    return a;
}
