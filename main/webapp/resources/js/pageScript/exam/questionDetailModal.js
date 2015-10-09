/**
 * Created by Phuthikorn_T on 18/8/2558.
 */

$(document).ready(function () {
    $("#correctDetail1").hide();
    $("#correctDetail2").hide();
    $("#correctDetail3").hide();
    $("#correctDetail4").hide();
})

$('#detailEditBtn').on('click', function () {
    $('#questionDetailModal').modal('toggle')
    $('tr[questionId="' + $(this).val() + '"').find('.actionEditBtn').click()
})

$("#updateInfoIcon").popover({trigger: "hover"});
$('#popoverData').popover();


var updateDetailModal = function (tr) {

    for (var i = 1; i <= 4; i++) {
        $('#correctDetail' + i).hide();
    }

    var id = tr.attr('questionId');
    //$('#idDetail').text(id);

    $.ajax({
        type: 'POST',
        url: '/TDCS/exam/getQuestionDetail',
        data: {
            questionId: id
        }, success: function (question) {

            var createDate = new Date(question.createDate);
            var formattedCreateDate = createDate.getDate() + '/' + createDate.getMonth() + '/' + createDate.getFullYear();
            var updateDate;
            var formattedUpdateDate;
            if (question.updateDate != null) {
                updateDate = new Date(question.updateDate);
                formattedUpdateDate = updateDate.getDate() + '/' + updateDate.getMonth() + '/' + createDate.getFullYear();
                var updateDetail = $('#updateDetail')
                updateDetail.empty()
                updateDetail.append(formattedUpdateDate + '&nbsp;' +
                '<span id="updateInfoIcon" class="glyphicon glyphicon-info-sign btn-link" data-content="อัพเดทโดย : ' + question.updateBy.thFname + ' ' + question.updateBy.thLname +
                '" rel="popover" data-placement="top" data-trigger="hover" style="text-decoration: none"></span>')

                $("#updateInfoIcon").popover({trigger: "hover"});

            }

            $('#detailEditBtn').val(question.id);
            $('#scoreDetail').text(question.score);
            $('#categoryDetail').text(question.subCategory.category.name + " : " + question.subCategory.category.id);
            $('#subCategoryDetail').text(question.subCategory.name);
            $('#difficultyDetail').text(question.difficultyLevel.description);
            $('#createByDetail').text(question.createBy.thFname + " " + question.createBy.thLname);
            $('#createDateDetail').text(formattedCreateDate);
            $('#questionTypeDetail').text(question.questionType.description);
            $('#questionDescDetail').text(question.description);
            //$('#updateDetail').text(formattedUpdateDate);

            var i = 1;
            question.choices.forEach(function (choice) {

                $('#choiceDetail' + i).text(choice.description);
                if (choice.correction.value == 1) {
                    $('#correctDetail' + i).show();
                }
                i++;
            })

            if(question.questionType.id == 1){
                $('#choiceDetailContainer').show()
            }else{
                $('#choiceDetailContainer').hide()
            }

        }, error: function () {
            alert("Failed");
        }
    })
}