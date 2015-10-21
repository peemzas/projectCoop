/**
 * Created by Jobz on 6/10/2558.
 */
$("#btnExamRecordSearch").on('click',function() {
    generalSearchQuestion();
});
$("#btnExamRecordSearchClearInput").on('click',function(){
    clearInput();
});
function clearInput(){
    $("#searchPaperInput").val("");
    $("#forPosition").val(0);
    $("#showEmployeeSelected").empty();
}
var itemLenght;
var code;
var position;
var arrayItemToQuery = new Array();
var tempArray = new Array();
var jsonObj = {};
function generalSearchQuestion(){
    itemLenght = ($("#showEmployeeSelected").children("button")).length;
    code = $("#searchPaperInput").val();
    position = $("#forPosition").val();
    code = code.substr(0, code.indexOf(' '));

    if(itemLenght > 0) {
        for (i = 0; i < itemLenght; i++) {
            var temp = $("#showEmployeeSelected").children("button")[i].innerHTML;
            temp = temp.substring(temp.indexOf('_') + 1, temp.indexOf('z'));
            arrayItemToQuery.push(temp);

        }
    }
    for (var idx = 0; idx < arrayItemToQuery.length; idx++) {
        var items = {
            userId: arrayItemToQuery[idx]
        }
        tempArray.push(items);
    }
    var a = {
        code: code,
        position : position
    }
    tempArray.push(a);
    arrayItemToQuery= [];

    jsonObj = JSON.stringify(tempArray);
    //alert(jsonObj);
    var dataResponse = $.ajax({
        type: "POST",
        url: "/TDCS/exam/getQueryExamRecordSearch",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        headers: {
            Accept: "application/json"
        },
        async: false,
        data: jsonObj,
        success: function(data){
            $("#tbodyExamRecord").empty();
            if(data.size == null){
                $("#searchNotFound").show();
            }
            //data.forEach(function(value){
            var index = 0;
            for(var i = 0; i < data.length; i ++){
                $("#searchNotFound").hide();
                var posttest;
                var pretest;
                var first = data[i].examRecord.user.thFname;
                var paperId1 = data[i].examRecord.paper.code;
                pretest =  Number(data[i].objectiveScore)+ Number (data[i].subjectiveScore);
                if(i > 0){
                    var secound = data[i-1].examRecord.user.thFname;
                    var paperId2 = data[i-1].examRecord.paper.code
                    posttest = Number (data[i].subjectiveScore)+Number(data[i].objectiveScore);
                }
                if((first == secound) && (paperId1 == paperId2)){
                    $("#tbodyExamRecord").children('tr:eq('+(index++)+')').children('td:eq(5)').html(posttest);
                }
                else{
                    $("#tbodyExamRecord").append(
                        '<tr onclick="markingPaper(this)">'+
                        '<td class="text-center"><label >'+data[i].examRecord.paper.code+'</label></td>'+
                        '<td><label >'+data[i].examRecord.paper.name+'</label></td>'+
                        '<td><label >'+data[i].examRecord.user.thFname+'</label></td>'+
                        '<td><label >'+data[i].examRecord.user.position.posiName+'</label></td>'+
                        '<td class="text-center"><label >'+pretest+'</label></td>'+
                        '<td class="text-center"><label ></label></td>'+
                        '<td class="text-center"><label >'+data[i].examRecord.paper.maxScore+'</label></td>'+
                        '<td><label >'+data[i].examRecord.paper.createBy.thFname+'</label></td>'+
                        '<td><label >'+data[i].status.description+'</label></td>'+
                        '</tr>'

                    );
                }
            }
        },
        error: function(){
            alert("error");
        }
    });
    arrayItemToQuery = [];
    tempArray = [];

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