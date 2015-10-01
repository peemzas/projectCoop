/**
 * Created by Phuthikorn_T on 1/10/2558.
 */

$('#marking-body').on('focusout', '.scoreInput', function () {
    var maxScore = parseFloat($(this).parent().parent().children().children('h5').children('span').text());
    if (!isNaN(($(this).val()))) {
        if ($(this).val() > maxScore) {
            alert('คะแนนที่ให้มากกว่าคะแนนเต็ม' + $(this).val());
            $(this).val('');
            //setTimeout(function(){
            //    $(this).click();
            //}, 1);
            //$(this).click();
            document.getSelection().removeAllRanges();
            jumpToElement($(this))
        }
        updateSumScore()
    } else {
        alert('กรุณากรอกคะแนนเป็นตัวเลข');
        $(this).val('');
        document.getSelection().removeAllRanges();
        jumpToElement($(this), 250)
    }
})

var goToUnfinishBtn = $('#goToUnfinish');
var goToUnfinishBtnInitialText = goToUnfinishBtn.text();
$(".submitMarkingBtn").on('click', function () {
    confirmationModalUpdate()
})

goToUnfinishBtn.on('click', function () {
    jumpToElement($('.questionContainer[questionNo="' + $(this).val() + '"'), 100)
})

$('#toTop').on('click', function () {
    $("html, body").animate({scrollTop: 0}, "fast");
})

$('#toBottom').on('click', function () {
    $("html, body").animate({scrollTop: $(document).height()}, "fast");
})


//-------------------------------------------------
function markingRecord(questionId, score) {
    this.questionId = questionId;
    this.score = score;
}

var submitMarking = function () {
    var questions = $('#marking-body .questionContainer');
    var markingArray = [];

    $.each(questions, function (index, value) {
        var questionId = $(this).attr('questionId')
        var score = parseFloat($(this).find('.scoreInput').val())

        if (!isNaN(score)) {
            markingArray.push(new markingRecord(questionId,score))
        }
    })

    //AJAX
}

var confirmationModalUpdate = function () {
    unmarkedQuestionArray = checkMarkingCompletion();
    var confirmMessage = '';
    var confirmMessageElement = $('#submitMarkingModalMessage');

    if (unmarkedQuestionArray != null) {
        confirmMessage = 'มีข้อสอบที่ยังไม่ได้ให้คะแนน ได้แก่ข้อที่<br/>[ ';
        for (var i = 0; i < unmarkedQuestionArray.length; i++) {
            if (i == 0) {
                confirmMessage = confirmMessage + unmarkedQuestionArray[i]
            } else {
                confirmMessage = confirmMessage + ", " + unmarkedQuestionArray[i]
            }
        }
        confirmMessage += " ]";
        goToUnfinishBtn.val(unmarkedQuestionArray[0]);
        goToUnfinishBtn.text(goToUnfinishBtnInitialText + " " + unmarkedQuestionArray[0])
        goToUnfinishBtn.show();
    } else {
        confirmMessage = 'ยืนยันการส่งผลตรวจ'
        goToUnfinishBtn.hide()
    }
    confirmMessageElement.empty();
    confirmMessageElement.append(confirmMessage)
}

var checkMarkingCompletion = function () {
    var questions = $('#marking-body .questionContainer')
    var unfinishedArray = [];

    $.each(questions, function (index, value) {
        var questionNo = $(this).attr('questionNo');
        if (isNaN(parseFloat($(this).find('.scoreInput').val()))) {
            unfinishedArray.push(questionNo)
        }
    })
    if (unfinishedArray.length == 0) {
        // unfinishedArray is empty == all Question are answered
        return null
    } else {
        return unfinishedArray
    }
}

var objectiveScore = $('#sumScore').attr('objectiveScore')
var updateSumScore = function () {
    var sumScore = parseFloat(objectiveScore);

    $.each($('.scoreInput'), function (index, value) {
        if (!isNaN(parseFloat(value.value))) {
            sumScore = sumScore + parseFloat(value.value);
        }
    })
    $('#sumScore').val(parseFloat(sumScore))
}

var jumpToElement = function (element, offset) {
    $('html, body').animate({
        scrollTop: (element.offset().top - offset)
    });
}