/**
 * Created by Phuthikorn_T on 13/8/2558.
 */

$(".choiceRadioAddon").on('click',function(){
    $(this).children().prop("checked",true);
    //$('.correctRadio:checked').hasClass();
    $('.correctRadio:not(:checked)').parent().removeClass('success');
    $('.correctRadio:not(:checked)').show();
    $('.correctRadio:not(:checked)').parent().children('div').hide();
    $('.correctRadio:checked').parent().addClass('success');
    $('.correctRadio:checked').parent().children('div').show();
    $('.correctRadio:checked').hide();
})


$('#select-QuestionType').on('change',function(){

    $('#submitBtnContainer').show();

    if(this.value == 'Objective'){
        //$('#objective').show();
        $('#answerInput').show();
        //$('#subjective').hide();
        //$('#subjective2').hide();

        $('#submitBtnContainer').val('Objective');
    }
    else if(this.value == 'Subjective'){
        //$('#subjective').show();
        //$('#subjective2').show();
        //$('#objective').hide();
        $('#answerInput').hide();

        $('#submitBtnContainer').val('Subjective');
    }
})

$('#submitCreateBtn').on('click',function(){
    if($('#createQuestModalTitle').text() == 'สร้างข้อสอบ'){
        alert('Hi There')
        saveQuestion();

    }else if($('#createQuestModalTitle').text() == 'แก้ไขข้อสอบ'){
        alert('case แก้ไขข้อสอบ');
        editQuestion();
    }else{alert('Fail to determine function please Check createQuestionModal.js')}
})

var editQuestion = function (){} // FOR EDIT FROM webapp/WEB-INF/page/exam/manageQuestion.jsp

function saveQuestion(){

    alert("Inserting Question");

    var categoryName = $("#categoryInputForCreateQuestion").val();
    var subCategoryName = $("#subCategoryInputForCreateQuestion").val();
    var questionTypeString = $("#select-QuestionType").val();
    var score = $("#questionScoreForCreateQuestion").val();
    var choiceDesc = null;
    var questionDesc = $("#questionDescription").val();
    var difficulty = $("input[name='level']:checked").val();
    var correctChoice = parseInt($(".correctRadio:checked").val());

    var questionType = null;
    if(questionTypeString == 'Objective'){
        questionType = 1;
    }else if(questionTypeString == 'Subjective'){
        questionType = 2;
    }

    if(questionType==1){
        choiceDesc = new Array($('#choice1').val(),$('#choice2').val(),$('#choice3').val(),$('#choice4').val()).toString();

        var dat = $.ajax({
            type:'POST',
            url:'/TDCS/exam/addQuestion',
            data:{
                categoryName:categoryName,
                subCategoryName:subCategoryName,
                questionDesc:questionDesc,
                choiceDescArray:choiceDesc,
                correctChoice:correctChoice,
                questionType:questionType,
                difficulty:parseInt(difficulty),
                score:parseInt(score)}
            ,
            success:function(){
                alert('Success');
            },
            error:function(){
                alert('Error');
            }
        })
    }else{
        var dat = $.ajax({
            type:'POST',
            url:'/TDCS/exam/addQuestion',
            data:{
                categoryName:categoryName,
                subCategoryName:subCategoryName,
                questionDesc:questionDesc,
                questionType:questionType,
                difficulty:parseInt(difficulty),
                score:parseInt(score)}
            ,
            success:function(){
                alert('Success');
            },
            error:function(){
                alert('Error');
            }
        })
    }






}