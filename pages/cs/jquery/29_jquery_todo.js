$("#inputText").keypress(function(event){
    if (event.which === 13) {
        $("ul").append('<li><span class="itemClass">X</span> ' + $(this).val() + '</li>');
        $(this).val("");
    }
})

$('#toDoItems').on("click",".itemClass",function(){
    $(this).parent().fadeOut(500,function(){
        $(this).remove();
    })
})

$('#toDoItems').on("click","li",function(){
    $(this).toggleClass("checked");
})
