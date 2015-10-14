/**
 * Created by Phuthikorn_T on 14/8/2558.
 */

$(document).ready(function () {
    clearAllSearchQuestionField()
    listSearchQuestion();
})


$('tbody').on('click','td:not(.questionSelect)',function(){
    var questionDetailModal = $('#questionDetailModal')
    questionDetailModal.modal('hide');
    questionDetailModal.modal('show');

    updateDetailModal($(this).parent());
    setQuestionObj($(this).parent())
})

$('.deleteSelectedBtn').on('click',function(){
    deleteSelectedQuestion();
})

$('.createQuestionBtn').on('click', function () {
    $('#createQuestModalTitle').text('สร้างข้อสอบ');
    $('#submitCreateBtn').text('ตกลง');
    createQuestionModalClearInput();
})

$('.searchSubmitBtn').on('click',function(){
    listSearchQuestion($(this));
})

var deleteSelectedQuestion = function(){
    console.log('prepare to delete')
    var selectedQuestions = $('.questionSelectBox:checked');
    var questionIds = [];
    var i = 0;
    selectedQuestions.each(function(){
        questionIds[i] = $(this).parent().parent().attr('questionId')
        i++
    })
    console.log('deleting '+ questionIds)
    deleteQuestions(questionIds);
}



var generateEventHandler = function () {


    $('.actionViewBtn').on('click', function () {
        var tr = $(this).parents('tr');
        updateDetailModal(tr);
    })
    $(".actionDeleteBtn").on('click', function () {
        var questionId = parseInt($(this).parents('tr').attr('questionId'));
        var r = confirm("ลบข้อสอบที่ " + questionId);
        if (r == true) {
            deleteQuestion(questionId);
        }
    })

}

$('#selectAllItem').on('click',function(){
    if($(this).prop('checked')){
        $('tbody').find('.questionSelectBox').prop('checked',true)
    }else{
        $('tbody').find('.questionSelectBox').prop('checked',false)
    }
})

var questionObj;
var setQuestionObj = function (tr) {
    questionObj = tr;
}

editQuestion = function () { // THIS FUNCTION IS CALLED FROM webapp/WEB-INF/pages/exam/modal/createQuestionModal.jsp
    var questionId = questionObj.attr('questionId');
    var categoryName = $("#categoryInputForCreateQuestion").val();
    var subCategoryName = $("#subCategoryInputForCreateQuestion").val();
    var questionTypeString = $("#select-QuestionType").val();
    var score = $("#questionScoreForCreateQuestion").val();
    var choiceDesc = null;
    var questionDesc = $("#questionDescription").val();
    var difficulty = $("input[name='level']:checked").val();
    var correctC = $(".correctRadio:checked")
    var correctChoice = correctC.val();

    if (correctChoice == undefined) {
        correctChoice = 0;
    }

    var questionType = null;
    if (questionTypeString == 'Objective') {
        questionType = 1;
    } else {
        questionType = 2;
    }

    choiceDesc = new Array($('#choice1').val(), $('#choice2').val(), $('#choice3').val(), $('#choice4').val());

    var dat = $.ajax({
        type: 'POST',
        url: '/TDCS/exam/editQuestion',
        data: {
            questionId: questionId,
            categoryName: categoryName,
            subCategoryName: subCategoryName,
            questionDesc: questionDesc,
            choiceDescArray: choiceDesc.toString(),
            correctChoice: parseInt(correctChoice),
            questionType: questionType,
            difficulty: parseInt(difficulty),
            score: parseInt(score)
        }
        ,
        success: function () {
            alert('Success');
            listAllQuestion();
        },
        error: function () {
            alert('Error');
        }
    })

}

var setEditModalParameter = function () {

    var tr = questionObj;
    var ajaxDat1 = $.ajax({ //quesotion
        type: "POST",
        url: "/TDCS/exam/getQuestionDetail",
        data: {
            questionId: tr.attr('questionId')
        },
        success: function (question) {
            createQuestionModalClearInput();
            setCreateModalCategory(question.subCategory.category.name);
            setCreateModalSubCategory(question.subCategory.name);
            setCreateModalQuestionType(question.questionType.description);
            setCreateModalDufficulty(question.difficultyLevel.level);
            setCreateModalScore(question.score);
            setCreateModalQuestionDesc(question.description);

            updateCreateModalLayout();
        },
        error: function () {
            console.log("fail in ajaxDat1");
        }
    })

    var ith = 1;
    var ajaxDat2 = $.ajax({ //choices
        type: "POST",
        url: "/TDCS/exam/getChoiceDetail",
        data: {
            questionId: tr.attr('questionId')
        },
        success: function (choices) {
            choices.forEach(function (choice) {
                setCreateModalIthChoice(choice.description, ith);
                if (choice.correction.value == 1) {
                    setCreateModalCorrectQuestion(ith);
                }
                ith = ith + 1;
            })
        },
        error: function () {
            console.log("fail in ajaxDat2")
        }
    })
}

var deleteQuestions = function (questionIds) {
    $.ajax({
        type: 'POST',
        url: '/TDCS/exam/deleteQuestion',
        data: {
            questionArray: JSON.stringify(questionIds)
        },
        success: function () {
            alert("Delete Success");
            listSearchQuestion($('#advSearchBtn'));
        }, error: function () {
            alert("Failed");
        }
    })

}

var listSearchQuestion = function (btn) {
    console.log('hello')
    var data;

    if(btn == undefined || btn.attr('id') != 'advSearchBtn'){
        data = getSearchQuestionResultListBasic();
    }
    else{
        data = getSearchQuestionResultListAdv();
    }

    $("tbody").empty();
    data.forEach(function (q) {
        var createDate = new Date(q.createDate);
        var formattedDate = createDate.getDate() + "/" + (parseInt(createDate.getMonth()) + 1) + "/" + createDate.getFullYear();
        $("#tableBody").append('<tr questionId=' + q.id + '>' +
        '<td class="questionSelect"><input type="checkbox" class="form-control questionSelectBox"/></td>' +
        '<td class="questionType">' + q.questionType.description + '</td>' +
        '<td class="questionCategory">' + q.subCategory.category.name + '</td>' +
        '<td class="questionSubCategory">' + q.subCategory.name + '</td>' +
        '<td class="questionDescription" align="left">' + q.description.substring(0, 100) + '</td>' +
        '<td class="questionDifficulty">' + q.difficultyLevel.description + '</td>' +
        '<td class="questionScore">' + q.score + '</td>' +
        '<td class="questionCreateBy">' + q.createBy.thFname + ' ' + q.createBy.thLname + '</td>' +
        '<td class="questionCreateDate">' + formattedDate + '</td>' +
        "</tr>")
        if (q.description.length > 100) {
            $('td[class="questionDescription"]:last').append("....")
        }
    })

    $('tbody tr td:not(.questionSelect)').css('cursor','pointer');
    $('.questionSelectBox').css('cursor','pointer');

    generateEventHandler();
}

//===================================================================================EVENT TRIGGER=================================================================================================//


$(".searchInputSubmitBtn").on('click', function () {
    listSearchQuestion()
})
