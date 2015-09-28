$(document).ready(function () {


    $("#advanceBtn").click(function () {
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
        if ($("#advanceBtn").children("span").hasClass("glyphicon glyphicon-chevron-down")) {
            $("#advanceBtn").children("span").removeClass("glyphicon glyphicon-chevron-down").addClass("glyphicon glyphicon-chevron-up");
//        $("btnAdvanceSearch").html(str);
            $("#btnSearch").hide();
            $("#btnAdvanceSearch").show();
//        $("#search").hide();
//        $("#clear").hide();
        }
        else {
            $("#advanceBtn").children("span").removeClass("glyphicon glyphicon-chevron-up").addClass("glyphicon glyphicon-chevron-down");

            $("#btnSearch").show();
            $("#btnAdvanceSearch").hide();
//        $("#search").show();
//        $("#clear").show();
        }
    });


    $(".datepicker").datepicker();

})

var searchQuestionResultList
var getSearchQuestionResultList = function () {
    submitSearchQuestion()
    return searchQuestionResultList
}

var submitSearchQuestion = function () {
    searchResultReady = false;
    var SI = { // SearchInput
        category: getSearchCategoryInputValue(),
        subCategory: getSearchSubCategoryInputValue(),
        createBy: getSearchCreateByInput(),
        questionId: $('#searchQuestionIdInput').val(),
        questionDesc: $("#searchQuestionDescInput").val(),
        createDateFrom: $('#searchCreateDateFromInput').val(),
        createDateTo: $("#searchCreateDateToInput").val(),
        scoreFrom: $("#searchScoreFromInput").val(),
        scoreTo: $("#searchScoreToInput").val(),
        status: $("#searchStatusInput").val()
    }
    var ajaxDat = $.ajax({
        type: "POST",
        url: "/TDCS/exam/searchQuestion",
        async: false,
        data: {
            categoryId: SI.category,
            subCatName: SI.subCategory,
            createBy: SI.createBy,
            //questionId: SI.questionId,
            questionDesc: SI.questionDesc,
            createDateFrom: SI.createDateFrom,
            createDateTo: SI.createDateTo,
            scoreFrom: SI.scoreFrom,
            scoreTo: SI.scoreTo
            //status: SI.status
        },
        success: function (dat) {
            //console.log(dat)
            searchQuestionResultList = dat
        },
        error: function () {
            alert("ERROR in submitSearchQuestion()")
        }
    })
}

var clearAllField = function () {
    catAndSubcatSelectNothing();
    questionId: $('#searchQuestionIdInput').val("");
    questionDesc: $("#searchQuestionDescInput").val("");
    createDateFrom: $('#searchCreateDateFromInput').val("");
    createDateTo: $("#searchCreateDateToInput").val("");
    scoreFrom: $("#searchScoreFromInput").val("");
    scoreTo: $("#searchScoreToInput").val("");
    status: $("#searchStatusInput").val("");
    clearCreateByInput();
}

$(".searchInputClearBtn").on('click',function(){
    clearAllField();
})
