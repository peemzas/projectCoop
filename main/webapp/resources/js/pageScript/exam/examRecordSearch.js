/**
 * Created by Jobz on 6/10/2558.
 */
$(document).ready(function(){
    generalSearchQuestion();
});
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
            var indexPostTest =0;
            var indexPreTest = 0;
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
                    //if(data[i].status.id ==5){posttest=" ";}
                    $('#tbodyExamRecord').children('tr:eq('+(indexPostTest-1)+')').children('td:eq(5)').attr('resultId',data[i].id);
                    if (data[i].status.id != 6 && data[i].status.id != 7) {
                        //alert(indexPostTest)
                        $("#tbodyExamRecord").children('tr:eq(' + (indexPostTest-1) + ')').children('td:eq(5)').html('<button onclick="markBtn(this)" class="btn btn-warning btn btn-sm" type="button">ตรวจ</button>');
                    } else {
                        $("#tbodyExamRecord").children('tr:eq('+(indexPostTest-1)+')').children('td:eq(5)').html(posttest);
                        $("#tbodyExamRecord").children('tr:eq('+(indexPostTest-1)+')').children('td:eq(8)').html('<button onclick="remarkBtn(this)" class="btn btn-success btn btn-sm" type="button">ตรวจแล้ว</button>');
                    }
                }
                else {
                    //alert("else"+" "+i)
                    //indexPostTest++;
                    if (data[i].examRecord.user.position.posiName == "Software Developer Trainee") {
                        data[i].examRecord.user.position.posiName = "Dev";
                    }
                    if (data[i].examRecord.user.position.posiName == "Assistant Business Analyst") {
                        data[i].examRecord.user.position.posiName = "BA";
                    }

                    $("#tbodyExamRecord").append(
                        '<tr>' +
                        '<td class="text-center"><label >' + data[i].examRecord.paper.code + '</label></td>' +
                        '<td><label >' + data[i].examRecord.paper.name + '</label></td>' +
                        '<td><label >' + data[i].examRecord.user.thFname + "    " + data[i].examRecord.user.thLname + '</label></td>' +
                        '<td class="text-center"><label >' + data[i].examRecord.user.position.posiName + '</label></td>' +
                        '<td class="text-center" resultId="' + data[i].id + '"><label ></label></td>' +
                        '<td class="text-center" resultId=""><label ></label></td>' +
                        '<td class="text-center"><label >' + data[i].examRecord.paper.maxScore + '</label></td>' +
                        '<td><label >' + data[i].examRecord.paper.createBy.thFname + '</label></td>' +
                        '<td class="text-center"><label >' + data[i].status.description + '</label></td>' +
                        '</tr>'
                    );
                    //alert(indexPreTest)
                    if (data[i].status.id != 6 && data[i].status.id != 7) {
                        $("#tbodyExamRecord").children('tr:eq(' + (indexPreTest) + ')').children('td:eq(4)').html('<button onclick="markBtn(this)" class="btn btn-warning btn btn-sm" type="button">ตรวจ</button>');
                        indexPreTest++;
                        indexPostTest++;
                    } else {
                        $("#tbodyExamRecord").children('tr:eq('+(indexPreTest)+')').children('td:eq(4)').html(pretest);
                        $("#tbodyExamRecord").children('tr:eq('+(indexPreTest)+')').children('td:eq(8)').html('<button onclick="remarkBtn(this)" class="btn btn-success btn btn-sm" type="button">ตรวจแล้ว</button>');
                        indexPreTest++;
                        indexPostTest++;
                    }
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

var tbodytrResuiltId;
function markBtn(element) {
    $("#alertModalChangPage").modal("show");
    tbodytrResuiltId=element.parentNode.getAttribute("resultId");
    //alert(tbodytrResuiltId);
}
$("#okBtnChangPage").on("click",function(){
    location.href = "/TDCS/exam/marking?resultId="+ tbodytrResuiltId;
});

var pretestResultId;
var posttestResultId;
function remarkBtn(element) {
    $('#pretestBtn').prop( "disabled", true );
    $('#posttestBtn').prop( "disabled", true );
    $("#alertModalRemark").modal("show");
    pretestResultId=element.parentNode.parentNode.childNodes[4].getAttribute('resultId');
    posttestResultId=element.parentNode.parentNode.childNodes[5].getAttribute('resultId');
    //alert(pretestResultId+"  // "+posttestResultId)
    if(pretestResultId!=""  ){
        $('#pretestBtn').prop( "disabled", false );
    }
    if(posttestResultId!="" ){
        $('#posttestBtn').prop( "disabled", false );
    }
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