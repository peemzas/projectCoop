/**
 * Created by Phuthikorn_T on 14/10/2558.
 */

$('.resultDetail').on('click',function(){
    var resultId = $(this).attr('resultId');
    updateResultDetail(resultId)


    //$('#objectiveShowScore').text($(this).attr('objectiveScore'));
    //$('#subjectiveShowScore').text($(this).attr('subjectiveScore'));
    //$('#commentTextArea').val($(this).attr('comment'));
    //
    //$('#markedByShow').text($(this).parent().parent().find('.col-markedBy').text());
    //
    //var sumScoreShowText = "คะแนนที่ได้ = " + $(this).parent().parent().find('.col-sum-score').text() + "/" + $(this).parent().parent().find('.col-max-score').text()
    //
    //$('#sumScoreShow').text(sumScoreShowText);
})

var updateResultDetail = function(resultId){
    $.ajax({
        type:"POST",
        url: '/TDCS/exam/checkScore/getResultDetail',
        data:{
            resultId:resultId
        },
        success:function(res){
            if(res != null) {
                $('#objectiveShowScore').text(res.objectiveScore);
                $('#subjectiveShowScore').text(res.subjectiveScore);
                $('#commentTextArea').val(res.comment);
                $('#markedByShow').text(res.markedBy.thFname + " " + res.markedBy.thLname);
                var sumScoreShowText = "คะแนนที่ได้ = " + (parseFloat(res.objectiveScore) + parseFloat(res.subjectiveScore)) + "/" + res.examRecord.paper.maxScore
                $('#sumScoreShow').text(sumScoreShowText);
            }else{
                $('#showScore').modal('hide')
                alert('ไม่มีบันทึกการทำ Post Test')
            }
        },
        error:function(){
            alert('error occur')
            $('#showScore').modal('hide')
        }
    })
}