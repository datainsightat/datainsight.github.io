var a = -10;

console.log("1 Print all numbers between -10 and 19");

for (a; a <= 19; a++) {
    console.log(a);
}

console.log("2. Print all even numbers between 10 and 40");

for (a=10;a<=40;a++) {
    console.log(a);
}

console.log("3. Print all odd numbers between 300 and 333");

for (a=300; a<= 333; a++) {
    if (a%2!==0) {
        console.log(a);
    }
}

console.log("4. Print all numbers divisible by 5 AND 3 between 5 and 50");

for (a=5; a<=50; a++) {
    if((a%3===0) && (a%5===0)) {
        console.log(a);
    }
}
