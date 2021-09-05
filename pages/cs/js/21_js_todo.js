console.log("Connected!");

var todos = [];

var input = prompt("What would you like to do?");

while (input !== "quit") {
    //handle input
    if (input === "list") {
        listTodos();
    } else if (input === "new") {
        newTodo();
    } else if (input === "delete") {
        deleteTodos();
    }

    //ask for new input
    var input = prompt("What would you like to do?");
}

console.log("OK, you quit the app");

function listTodos() {
    console.log("**********");
    todos.forEach(function(i, index){
        console.log(index + ": " + i);
    });
    console.log("**********");
}

function newTodo(){
    //ask for new todo
    var newtodo = prompt("Enter new todo");
    //add to array
    todos.push(newtodo);
    console.log("Added Todo");
}

function deleteTodos(){
    //ask for index
    var index = prompt("Enter index of todo to delete");
    //delete the todo
    //splice()
    todos.splice(index, 1);
    console.log("Delete Todo");
}
