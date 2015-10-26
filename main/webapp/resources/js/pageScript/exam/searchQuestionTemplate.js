$(document).ready(function () {


    $("#advanceBtn").click(function () {
        var str = $("#search").prop('outerHTML') + "&nbsp" + $("#clear").prop('outerHTML');
        $("#advanceBody").collapse('toggle');

        if ($("#advanceBtn").children("span").hasClass("glyphicon glyphicon-chevron-down")) {
            $("#advanceBtn").children("span").removeClass("glyphicon glyphicon-chevron-down").addClass("glyphicon glyphicon-chevron-up");
            $("#btnSearch").hide();
            $("#btnAdvanceSearch").show();
        }
        else {
            $("#advanceBtn").children("span").removeClass("glyphicon glyphicon-chevron-up").addClass("glyphicon glyphicon-chevron-down");

            $("#btnSearch").show();
            $("#btnAdvanceSearch").hide();
        }
    });


    $(".datepicker").datepicker();

})

var searchQuestionResultList

var getSearchQuestionResultListBasic = function(){
    submitSearchQuestionBasic()
    return searchQuestionResultList
}

var getSearchQuestionResultListAdv = function () {
    submitSearchQuestionAdv()
    return searchQuestionResultList
}

var submitSearchQuestionBasic = function () {
    searchResultReady = false;
    var SI = { // SearchInput
        category: getSearchCategoryInputValue(),
        subCategory: getSearchSubCategoryInputValue(),
        createBy: getSearchCreateByInput(),
        //questionId: null,
        questionDesc: null,
        createDateFrom: null,
        createDateTo: null,
        scoreFrom: null,
        scoreTo: null
        //status: null
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
            searchQuestionResultList = dat
        },
        error: function () {
            alert("ERROR in submitSearchQuestionAdv()")
        }
    })
}



var submitSearchQuestionAdv = function () {
    searchResultReady = false;
    var SI = { // SearchInput
        category: getSearchCategoryInputValue(),
        n: getSearchSubCategoryInputValue(),
        createBy: getSearchCreateByInput(),
        //questionId: $('#searchQuestionIdInput').val(),
        questionDesc: $("#searchQuestionDescInput").val(),
        createDateFrom: $('#searchCreateDateFromInput').val(),
        createDateTo: $("#searchCreateDateToInput").val(),
        scoreFrom: $("#searchScoreFromInput").val(),
        scoreTo: $("#searchScoreToInput").val()
        //status: $("#searchStatusInput").val()
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
            searchQuestionResultList = dat
        },
        error: function () {
            alert("ERROR in submitSearchQuestionAdv()")
        }
    })
}

var clearAllSearchQuestionField = function () {
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
    clearAllSearchQuestionField();
})



