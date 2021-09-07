var p1Button = document.querySelector("#p1");
var p2Button = document.querySelector("#p2");
var p1Display = document.querySelector("#p1Display");
var p2Display = document.querySelector("#p2Display");
var playToDisplay = document.querySelector("#playToDisplay");
var reset= document.querySelector("#reset");
var p1Score = 0;
var p2Score = 0;
var gameOver = false;
var winningScore = document.querySelector("#playTo").value;

p1Button.addEventListener("click",function() {
    if (!gameOver) {
        p1Score ++;
        if (p1Score == winningScore) {
            gameOver = true;
            p1Display.style.color = "green";
        }
        p1Display.textContent = p1Score;
    }
});

p2Button.addEventListener("click",function() {
    if (!gameOver) {
        p2Score ++;
        if (p2Score == winningScore) {
            gameOver = true;
            p2Display.style.color = "green";
        }
        p2Display.textContent = p2Score;
    }
});

reset.addEventListener("click", function(){
    winningScore = document.querySelector("#playTo").value;
    p1Score = 0;
    p2Score = 0;
    p1Display.textContent = 0;
    p2Display.textContent = 0;
    p1Display.style.color = "black";
    p2Display.style.color = "black";
    playToDisplay.textContent = winningScore;
    gameOver = false;
})
