/**
 * Created by Phuthikorn_T on 14/8/2558.
 */

//$('#submitCreateBtn').text('ยืนยัน');
//$('#createQuestModalTitle').text('แก้ไขข้อสอบ');

$(document).ready(function () {
    listAllQuestion();
    alert("HI")
})

var generateEventHandler = function () {

    $(".actionEditBtn").on('click', function () {
        $('#submitCreateBtn').text('ยืนยัน');
        $('#createQuestModalTitle').text('แก้ไขข้อสอบ');
        setQuestionObj($(this).parents('tr'));
        setEditModalParameter();
    })
    $('.createQuestionBtn').on('click', function () {
        $('#createQuestModalTitle').text('สร้างข้อสอบ');
        $('#submitCreateBtn').text('ตกลง');
        createQuestionModalClearInput();
    })
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





var questionObj;
var setQuestionObj = function (tr) {
    questionObj = tr;
}

editQuestion = function () { // THIS FUNCTION IS CALLED FROM webapp/WEB-INF/pages/exam/modal/createQuestionModal.jsp
    // IF THIS ISN'T WORKING TRY PUT THE CODE IN editQuestion() in createQuestionModal.jsp instead
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
    //if (!$.trim(correctChoice).length) {
    //    correctChoice == 0;
    //    console.log(correctChoice)
    //}

    if (correctChoice == undefined) {
        correctChoice = 0;
    }

    var questionType = null;
    if (questionTypeString == 'Objective') {
        questionType = 1;
    } else {
        questionType = 2;
    }

//if (questionType == 1) {
    choiceDesc = new Array($('#choice1').val(), $('#choice2').val(), $('#choice3').val(), $('#choice4').val());
//}
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

            setCreateModalCategory(question.subCategory.category.name)
            setCreateModalSubCategory(question.subCategory.name)
            setCreateModalQuestionType(question.questionType.description)
            setCreateModalDufficulty(question.difficultyLevel.level)
            setCreateModalScore(question.score)
            setCreateModalQuestionDesc(question.description)

            updateCreateModalLayout()
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

var listAllQuestion = function () {
    var questionList = $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/TDCS/exam/getAllReadyQuestion",
            success: function (questionList) {
                $('tbody').empty();
                questionList.forEach(function (quest) {
                    var createDate = new Date(quest.createDate);
                    var formattedDate = createDate.getDate() + "/" + createDate.getMonth() + "/" + createDate.getFullYear();

                    $("#tableBody").append('<tr questionId=' + quest.id + '>' +
                    '<td class="questionId">' + quest.id + '</td>' +
                    '<td class="questionDescription">' + quest.description + '</td>' +
                    '<td class="questionType">' + quest.questionTypeDesc + '</td>' +
                    '<td class="questionDifficulty">' + quest.difficultyDesc + '</td>' +
                    '<td class="questionScore">' + quest.score + '</td>' +
                    '<td class="questionCategory">' + quest.categoryName + '</td>' +
                    '<td class="questionSubCategory">' + quest.subCategoryName + '</td>' +
                    '<td class="questionCreateBy">' + quest.createByEmpId + '</td>' +
                    '<td class="questionCreateDate">' + formattedDate + '</td>' +
                    '<td>' +
                    '<div class="btn-group">' +
                    '<button class="btn dropdown-toggle" data-toggle="dropdown">' +
                    'เลือก<span class="caret"></span>' +
                    '</button>' +
                    '<ul class="dropdown-menu actionBtn">' +
                    '<li><a class="actionViewBtn" data-toggle="modal" data-target="#questionDetailModal">ดู</a></li>' +
                    '<li><a class="actionEditBtn" data-toggle = "modal" data-target = "#createQuest">แก้ไข</a></li>' +
                    '<li><a class="actionDeleteBtn">ลบ</a></li>' +
                    '</ul>' +
                    '</div>' +
                    '</td>' +
                    "</tr>")
                    //return false;
                })
                generateEventHandler();
            }, error: function () {
                console.log("Error in listAllQuestion() ajax");
            }

        }
    )

}

var deleteQuestion = function (questionId) {
    $.ajax({
        type: 'POST',
        url: '/TDCS/exam/deleteQuestion',
        data: {
            questionId: questionId
        },
        success: function () {
            alert("Delete Success");
            listAllQuestion();
        }, error: function () {
            alert("Failed");
        }
    })

}

