/**
 * Created by Phuthikorn_T on 13/8/2558.
 */

$(".choiceRadioAddon").on('click', function () {
    $(this).children().prop("checked", true);
    //$('.correctRadio:checked').hasClass();
    var correctRadioNotChecked = $('.correctRadio:not(:checked)')
    correctRadioNotChecked.parent().removeClass('success');
    correctRadioNotChecked.show();
    correctRadioNotChecked.parent().children('div').hide();
    var correctRadioChecked = $('.correctRadio:checked')
    correctRadioChecked.parent().addClass('success');
    correctRadioChecked.parent().children('div').show();
    correctRadioChecked.hide();
})

$('#select-QuestionType').on('change', function () {
    updateCreateModalLayout()
})


$('#submitCreateBtn').on('click', function () {
    if ($('#createQuestModalTitle').text() == 'สร้างข้อสอบ') {
        saveQuestion();

    } else if ($('#createQuestModalTitle').text() == 'แก้ไขข้อสอบ') {
        alert('case แก้ไขข้อสอบ');
        editQuestion();
    } else {
        alert('Fail to determine function please Check createQuestionModal.js')
    }
})

var editQuestion = function () {
} // FOR EDIT FROM webapp/WEB-INF/page/exam/manageQuestion.jsp

function saveQuestion() {

    var categoryName = $("#categoryInputForCreateQuestion").val();
    var subCategoryName = $("#subCategoryInputForCreateQuestion").val();
    var questionTypeString = $("#select-QuestionType").val();
    var score = $("#questionScoreForCreateQuestion").val();
    var choiceDesc = null;
    var questionDesc = $("#questionDescription").val();
    var difficulty = $("input[name='level']:checked").val();
    var correctChoice = parseInt($(".correctRadio:checked").val());

    var questionType = null;
    if (questionTypeString == 'Objective') {
        questionType = 1;
    } else if (questionTypeString == 'Subjective') {
        questionType = 2;
    }

    if (questionType == 1) {
        choiceDesc = new Array($('#choice1').val(), $('#choice2').val(), $('#choice3').val(), $('#choice4').val()).toString();

        var dat = $.ajax({
            type: 'POST',
            url: '/TDCS/exam/addQuestion',
            data: {
                categoryName: categoryName,
                subCategoryName: subCategoryName,
                questionDesc: questionDesc,
                choiceDescArray: choiceDesc,
                correctChoice: correctChoice,
                questionType: questionType,
                difficulty: parseInt(difficulty),
                score: parseFloat(score)
            }
            ,
            success: function (question) {
                alert('สร้างข้อสอบสำเร็จ รหัสข้อสอบ' + question.id);
                $('#tableBody').empty();
                listSearchQuestion();
            },
            error: function () {
                alert('Error');
            }
        })
    } else {
        var dat = $.ajax({
            type: 'POST',
            url: '/TDCS/exam/addQuestion',
            //async: false,
            data: {
                categoryName: categoryName,
                subCategoryName: subCategoryName,
                questionDesc: questionDesc,
                questionType: questionType,
                difficulty: parseInt(difficulty),
                score: parseInt(score)
            }
            ,
            success: function (question) {
                alert('สร้างข้อสอบสำเร็จ รหัสข้อสอบ' + question.id);
                $('#tableBody').empty();
                listAllQuestion();
            },
            error: function () {
                alert('Error');
            }
        })
    }
    createQuestionModalClearInput();
}

var createQuestionModalClearInput = function () {
    $("#categoryInputForCreateQuestion").val("");
    $("#subCategoryInputForCreateQuestion").val("");
    $("#select-QuestionType").val("");
    $("#questionScoreForCreateQuestion").val("");
    $("#questionDescription").val("");
    $("input[name='level']").attr('checked', false);
    $(".correctRadio").attr('checked', false);
    $(".choiceDesc").val("");
}

var setCreateModalCategory = function (category) {
    $("#categoryInputForCreateQuestion").val(category);
}
var setCreateModalSubCategory = function (subCategory) {
    $("#subCategoryInputForCreateQuestion").val(subCategory);
}
var setCreateModalQuestionType = function (questionType) {
    if (questionType == 'อัตนัย') {
        $("#select-QuestionType").val("Subjective")
    } else if (questionType == 'ปรนัย') {
        $("#select-QuestionType").val("Objective")
    }
}
var setCreateModalScore = function (score) {
    $("#questionScoreForCreateQuestion").val(score);
}
var setCreateModalDufficulty = function (difficultyLevel) {
    $("input[name='level']").prop('checked', false)
    $("input[name='level'][value=" + difficultyLevel + "]").prop('checked', true)
}
var setCreateModalCorrectQuestion = function (correctQuestion) {
    $(".correctRadio").prop('checked', false);
    $(".correctRadio:eq(" + (correctQuestion - 1) + ")").click();
}
var setCreateModalIthChoice = function (cDesc, position) {
    $("#choice" + position).val(cDesc);
}
var setCreateModalQuestionDesc = function (questionDesc) {
    $("#questionDescription").val(questionDesc);
}
var createModalShowObjevtive = function () {
    $('#answerInput').show();
    $('#submitBtnContainer').val('Objective');
}
var createModalShowSubjevtive = function () {
    $('#answerInput').hide();
    $('#submitBtnContainer').val('Subjective');
}
var updateCreateModalLayout = function(){
    $('#submitBtnContainer').show();

    if ($('#select-QuestionType').val() == 'Objective') {
        createModalShowObjevtive();
    }
    else if ($('#select-QuestionType').val() == 'Subjective') {
        createModalShowSubjevtive();
    }
}