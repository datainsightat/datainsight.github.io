var boxes = document.querySelectorAll(".box");
var pickedColor;
var selectedColor;
var mode = 'hard';

function init(mode) {

    for (i=0; i<boxes.length; i++) {
        if ((mode === "easy")&(i > 2)) {
            boxes[i].style.display = 'none';
        } else {
            boxes[i].style.display = 'block';
        }
    }

    document.querySelector("h1").style.backgroundColor = "cornflowerblue";
    document.querySelector("#feedback").textContent = "";

    setBoxColor(mode);
    addEventListener();
}

function setBoxColor (mode) {
    for (i=0;i<boxes.length;i++) {
        boxes[i].style.backgroundColor = getRandomColor();
    }
    if (mode === 'easy') {
        colCount = 2;
    } else {
        colCount = 5;
    }
    var pickedColorIndex = Math.floor(Math.random() * colCount);
    pickedColor = boxes[pickedColorIndex].style.backgroundColor;
    document.querySelector("#pickedColor").textContent = pickedColor;
}

function getRandomColor() {
    var r = Math.floor(Math.random()*256);
    var g = Math.floor(Math.random()*256);
    var b = Math.floor(Math.random()*256);
    return "rgb(" + r + ", " + g + ", " + b + ")";
}

function addEventListener () {
    for (i=0;i<boxes.length;i++) {
        boxes[i].addEventListener("click",function(){
            selectedColor = this.style.backgroundColor;
            if (selectedColor === pickedColor) {
                document.querySelector("#feedback").textContent = "You made it!";
                document.querySelector("h1").style.backgroundColor = selectedColor;
                for (i=0;i<boxes.length;i++) {
                    boxes[i].style.backgroundColor = selectedColor;
                }
            } else {
                document.querySelector("#feedback").textContent = "That's not right";
                this.style.backgroundColor = "darkgrey";
            }
        });
    }
}

init(mode);
