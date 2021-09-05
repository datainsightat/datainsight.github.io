//Define Variables
var number = 7;
var guess = 0;

//Loop until number is guessed
while (guess !== number) {

    //Ask for number
    var guess = Number(prompt("Pleaser enter a number"));
    
    //Check number
    if (guess < number) {
        alert("Your number is too small");
    } else if (guess > number) { 
        alert("Your number is too big");
    } else {
        alert("You number is right!");
        break;
    }
}
