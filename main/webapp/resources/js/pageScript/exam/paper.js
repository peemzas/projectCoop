$(document).ready(function(){
    $.ajax({
        type : "POST",
        url : "/TDCS/exam/getAllPapers",
        contentType: "application/json",
        async : false,
        success : function(data){

        }
    });
});