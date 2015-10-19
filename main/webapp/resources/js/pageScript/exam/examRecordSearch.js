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
            data.forEach(function(value){
                $("#searchNotFound").hide();
                var pretest = value[4];
                var posttest = value[5];
                if( pretest == null){
                    pretest ="-";
                }
                if( posttest== null){
                    posttest= "-";
                }
                var i = 1;
                $("#tbodyExamRecord").append(
                    '<tr id = "row'+i+'" value='+i+' onclick="markingPaper(this)">'+
                    '<td><label >'+value[0]+'</label></td>'+
                    '<td><label >'+value[1]+'</label></td>'+
                    '<td><label >'+value[2]+'</label></td>'+
                    '<td><label >'+value[3]+'</label></td>'+
                    '<td><center><label >'+pretest+'</label></center></td>'+
                    '<td><center><label >'+posttest+'</label></center></td>'+
                    '<td><label >'+value[6]+'</label></td>'+
                    '<td><label >'+value[7]+'</label></td>'+
                    '<td><label >'+value[8]+'</label></td>'+
                    '</tr>'

                )
                i++;
            });
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
function markingPaper(e){
    $("#modalMarkingPaper").modal('show');

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