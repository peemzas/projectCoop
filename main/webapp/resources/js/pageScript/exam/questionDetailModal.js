/**
 * Created by Phuthikorn_T on 18/8/2558.
 */

    $(document).ready(function(){
        $("#correctDetail1").hide();
        $("#correctDetail2").hide();
        $("#correctDetail3").hide();
        $("#correctDetail4").hide();
    })

var updateDetailModal = function (tr) {
    //$(".actionViewBtn").on('click,function(){ -------------------------

    for(var i=1;i<=4;i++){
        $('#correctDetail'+i).hide();
    }

    var id = tr.attr('questionId');
    $('#idDetail').text(id);
    $('#scoreDetail').text(tr.children('td.questionScore').text());
    $('#categoryDetail').text(tr.children('td.questionCategory').text());
    $('#subCategoryDetail').text(tr.children('td.questionSubCategory').text());
    $('#difficultyDetail').text(tr.children('td.questionDifficulty').text());
    $('#createByDetail').text(tr.children('td.questionCreateBy').text());
    $('#createDateDetail').text(tr.children('td.questionCreateDate').text());
    $('#questionTypeDetail').text(tr.children('td.questionType').text());
    $('#questionDescDetail').text(tr.children('td.questionDescription').text());
    $.ajax({
        type: 'POST',
        url: '/TDCS/exam/getChoiceDetail',
        data: {
            questionId: id
        },success:function(choices){
            var i = 1;
            choices.forEach(function(choice){

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
