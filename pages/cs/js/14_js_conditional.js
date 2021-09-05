var age = Number(prompt("Pleaser enter you age: "));
if (age < 0) {
    console.log("Error");
} else if (age === 21) {
    console.log("Happy 21st birthday!");
} else if (age % 2 === 0) {
    console.log("You age is odd!");
}
