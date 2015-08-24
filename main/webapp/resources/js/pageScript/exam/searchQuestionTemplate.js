

$(document).ready(function(){


    $("#advanceBtn").click(function(){
        var str = $("#search").prop('outerHTML') + "&nbsp" + $("#clear").prop('outerHTML');
        $("#advanceBody").collapse('toggle');

//      if ($("#advanceBtn").hasClass("btn btn-primary")) {
//        $("#advanceBtn").removeClass("glyphicon glyphicon-chevron-down").addClass("glyphicon glyphicon-chevron-up");
//        $("#btnAdvanceSearch").html(str);
//
//        $("#btnSearch").hide();
//        $("#btnAdvanceSearch").show();
////        $("#clear").hide();
//      } else {
//        $("#advanceBtn").removeClass("glyphicon glyphicon-chevron-down").addClass("glyphicon glyphicon-chevron-up");
////        $("#search").show();
////        $("#clear").show();
//        $("#btnSearch").show();
//        $("#btnAdvanceSearch").hide();
//      }
        if($("#advanceBtn").children("span").hasClass("glyphicon glyphicon-chevron-down")){
            $("#advanceBtn").children("span").removeClass("glyphicon glyphicon-chevron-down").addClass("glyphicon glyphicon-chevron-up");
//        $("btnAdvanceSearch").html(str);
            $("#btnSearch").hide();
            $("#btnAdvanceSearch").show();
//        $("#search").hide();
//        $("#clear").hide();
        }
        else{
            $("#advanceBtn").children("span").removeClass("glyphicon glyphicon-chevron-up").addClass("glyphicon glyphicon-chevron-down");

            $("#btnSearch").show();
            $("#btnAdvanceSearch").hide();
//        $("#search").show();
//        $("#clear").show();
        }
    });


    $(".datepicker").datepicker();

    $(".searchInputSubmitBtn").on('click',function(){
        submitSearchQuestion();
    })
})

var submitSearchQuestion = function(){
    var SI = { // SearchInput
        category:getSearchCategoryInput(),
        subCategory:getSearchSubCategoryInput(),
        createBy:getSearchCreateByInput(),
        questionId:$('#searchQuestionIdInput').val(),
        questionDesc:$("#searchQuestionDescInput").val(),
        createDateFrom:$('#searchCreateDateFromInput').val(),
        createDateTo:$("#searchCreateDateToInput").val(),
        scoreFrom:$("#searchScoreFromInput").val(),
        scoreTo:$("#searchScoreToInput").val(),
        status:$("#searchStatusInput").val()
    }


}

