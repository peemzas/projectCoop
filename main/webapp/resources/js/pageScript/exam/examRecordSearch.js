/**
 * Created by Jobz on 6/10/2558.
 */
$("#btnExamRecordSearch").on('click',function() {
   searchPaper();
});
$("#btnExamRecordSearchClearInput").on('click',function(){
    clearInput();
});
function clearInput(){
    $("#searchPaperInput").val("");
    $("#forPosition").val(0);
}
function searchPaper(){
    var code = $("#searchPaperInput").val();
    var position = $("#forPosition").val();
    code = code.substr(0, code.indexOf(' '));
    var dataResponse = $.ajax({
        type: "POST",
        url: "/TDCS/exam/getQueryExamRecordSearch",
        async: false,
        data:{
            code : code,
            position : position
        },
        success: function(data){
            $("#tbodyExamRecord").empty();
            if(data.size == null){
                $("#searchNotFound").show();
            }
            data.forEach(function(value){
                $("#searchNotFound").hide();
                $("#tbodyExamRecord").append(
                    '<tr>'+
                    '<td><label >'+value.examRecord.paper.code+'</label></td>'+
                    '<td><label >'+value.examRecord.paper.name+'</label></td>'+
                    '<td><label >'+value.examRecord.user.thFname+'</label></td>'+
                    '<td><label >'+value.examRecord.user.position.posiName+'</label></td>'+
                    '<td><label >Pretest</label></td>'+
                    '<td><label >Postest</label></td>'+
                    '<td><label >'+value.examRecord.paper.maxScore+'</label></td>'+
                    '<td><label >'+value.examRecord.paper.createBy.thFname+'</label></td>'+
                    '<td><label >'+value.examRecord.paper.paperStatus.description+'</label></td>'+
                    '</tr>'

                )
            });
        },
        error: function(){
            alert("error");
        }
    });

    $("#searchPaperInput").keyup(function(e) {
        if (e.which > 0) {
            e.preventDefault();
            listSearchPaper();
        }
    });
}

function listSearchPaper() {
    var availableall = [];

    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllPapers",
        async: false,
        success: function (data) {
            data.forEach(function (value) {
                availableall.push(value.code + ' : ' + value.name);
            });
        },
        error: function (data) {
            alert('error while request...');
        }
    });

    var search = $("#searchPaperInput").val();
    $("#searchPaperInput").typeahead('destroy').typeahead({
        source: availableall,
        minLength: 0,
        items: 20
    }).focus().val('').keyup().val(search);
}