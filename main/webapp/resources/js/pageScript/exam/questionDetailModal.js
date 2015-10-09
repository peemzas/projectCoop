/**
 * Created by Phuthikorn_T on 18/8/2558.
 */

    $(document).ready(function(){
        $("#correctDetail1").hide();
        $("#correctDetail2").hide();
        $("#correctDetail3").hide();
        $("#correctDetail4").hide();
    })

var updateDetailModal = function(tr){

    for(var i=1;i<=4;i++){
        $('#correctDetail'+i).hide();
    }

    var id = tr.attr('questionId');
    //$('#idDetail').text(id);

    $.ajax({
        type: 'POST',
        url: '/TDCS/exam/getQuestionDetail',
        data: {
            questionId: id
        },success:function(question){

            $('#scoreDetail').text(question.score);
            $('#categoryDetail').text(question.subCategory.category.name+" : "+question.subCategory.category.id);
            $('#subCategoryDetail').text(question.subCategory.name);
            $('#difficultyDetail').text(question.difficultyLevel.description);
            $('#createByDetail').text(question.createBy.thFname+" "+question.createBy.thLname);
            $('#createDateDetail').text(question.createDate);
            $('#questionTypeDetail').text(question.questionType.description);
            $('#questionDescDetail').text(question.description);
            $('#questionUpdateDetail').text(question.descriptioUpdateDate);

            var i = 1;
            question.choices.forEach(function(choice){

                $('#choiceDetail'+i).text(choice.description);
                if(choice.correction.value == 1)
                {
                    $('#correctDetail'+i).show();
                }
                i++;
            })
        },error:function(){
            alert("Failed");
        }
    })
}