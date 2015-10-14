var questionIdString = new Array();
var allQuestionIdOnTableCreatePaper = new Array();

var minutes;
var hours;
var questionsInPaper = new Array();
var newQuestionScore = new Array();
var sumPaperScore = 0;

var btnSearchStatus;
var categoryId;
var subcategoryId;
var arrayEmpNameToQuery = new Array();
var jsonObj = {};
var itemLenght;
var tempArray = new Array();

var questionDescriptionSearch = "";
var questionCreateDateFromSearch = "";
var questionCreateDateToSearch = "";
var questionScoreToSearch = "";
var questionScoreFromSearch = "";

var tmpQ = new Array();
var itm = {};

var paperId = 0;

$(document).ready(function(){

    if($.isNumeric(Number(getValueFromUrl()))){
        paperId = Number(getValueFromUrl());
        onLoadPageEditPaper();
        showUpdatePaper(paperId);
    }
    else{
        onLoadPageCreatePaper();
    }

    $("#updatePaperBtn").unbind('click').click(function(){
        updatePaper();
    });

    $("#generalSearchButtonInModalSelectionQuestion").unbind('click').click(function(){
        btnSearchStatus = 0;
        generalSearchQuestion(btnSearchStatus);
    });

    $("#advSearchBtn").unbind('click').click(function(){
        btnSearchStatus = 1;
        generalSearchQuestion(btnSearchStatus);
    });

    $("#selectSubCategoryToSelection").change(function(){
        subcategoryId = $("#selectSubCategoryToSelection").val();
    });

    if($("#newPaperScore").val() == ""){
        $("#maxScore").val(0);
    }

    $("#newPaperScore").change(function(){
        if($("#newPaperScore").val() == ""){
            $("#maxScore").val(0);
            $("#newPaperScore").val(0);
        }
        else{
            $("#maxScore").val($("#newPaperScore").val());
        }
    });

    $("#cancelCreatePaperBtn").unbind('click').click(function(){
        if(!confirm('คุณต้องการยกเลิกการสร้างชุดข้อสอบหรือไม่')){
            return false;
        }
    });

    $("#tbSelectQuestion").delegate('tr', 'click', function(){
        questionInfo();
    });

    $("#selectionQuestionBtnInpagePaper").on('click' ,function(){
        viewQuestions();
        if($("#tbSelectQuestion #tbodySelectQuestion tr").length == 0){
            $("#questionsAreEmpty").show();
            $("#removeRowSelected").attr('disabled', 'disabled');
            $("#addQuestionBtn").attr('disabled', 'disabled');
            $("#tbSelectQuestion").hide();
        }
    });

    $("#checkQuestionAll").click(function(event){
        if(this.checked){
            $(".selectQ").each(function(){
                this.checked = true;
            });
        }
        else{
            $(".selectQ").each(function(){
                this.checked = false;
            });
        }
    });
    $(".checkAllQuestionFromCreatePaperPage").click(function(){
        if(this.checked){
            $(".selectedQuestion").each(function(){
                this.checked = true;
            });
        }
        else{
            $(".selectedQuestion").each(function(){
                this.checked = false;
            });
        }
    });
    $("#removeRowSelected").on('click', function(){
        $("#tbSelectQuestion tr").has('input[class="selectQ"]:checked').remove();
        viewQuestions();
    });
    $("#removeRowQuestionSelect").on('click', function(){
        $("#tbSelectedQuestionToPaper tr").has('input[class="selectedQuestion"]:checked').remove();
        if($("#tbodySelectedQuestionToPaper tr").length == 0){
            $("#tbSelectedQuestionToPaper").hide();
            $("#questionNotFound").show();
            $("#score").val(0);
        }
        scoreOnChange();
    });

    $("#createPaperBtn").unbind('click').click(function(){
        newQuestionScore = [];
        $("#tbodySelectedQuestionToPaper tr input[type='number']").each(function(){
            newQuestionScore.push($(this).val());
        });
        minutes =  $("#minutes").val();
        hours = $("#hours").val();
        createPaper();
    });

    $("#date").datepicker();
    function select(){
        $('#obj').click(function(){
            $('#objective').show();
            $('#objective2').show();
            $('#subjective').hide();
            $('#subjective2').hide();
        });

        $('#sub').click(function(){
            $('#subjective').show();
            $('#subjective2').show();
            $('#objective').hide();
            $('#objective2').hide();
        })
    }
});

$("#addQuestionBtn").on('click', function(){
    $("#tbSelectQuestion tbody input:checkbox:checked").each(function(){
        var qId = $(this).parent().siblings().map(function(){
            return $(this).text();
        }).get(0);
        addQuestionToPaper(qId);
        scoreOnChange();
    });
});

function viewQuestions(){
    if($("#tbSelectedQuestionToPaper").is(":hidden") || $("#selectQuest").is(":visible") || $("#questionsAreEmpty").is(':visible')){
        //alert('1');
        $("#checkQuestionAll").attr('checked', false);
        var dataResponse = $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/TDCS/exam/getAllQuestionDetail",
            async: false,
            success: function(dataResponse){
                dataFound();
                $("#tbodySelectQuestion").empty();
                dataResponse.forEach(function(value){
                    var qDescription = value.description;
                    if(value.description.length > 60){
                        qDescription = (value.description).substring(0, 50);
                    }
                    $("#tbodySelectQuestion").append(
                        '<tr>'+
                        '<td style="display: none;"><label id="labelQuestionId'+value.id+'">'+value.id+'</td>'+
                        '<td><input class="selectQ" name="selectQ" type="checkbox"/></td>'+
                        '<td style="text-align: left;"><label id="labelCategoryName'+value.id+'">'+value.subCategory.category.name+'<label></td>'+
                        '<td style="text-align: left;"><label id="labelSubCategoryName'+value.id+'">'+value.subCategory.name+'</label></td>'+
                        '<td style="text-align: left;"><button class="btn btn-link btn-info btn-sm" type="button"><span class="glyphicon glyphicon-info-sign"></span></span></button><label id="labelQuestionDesc'+value.id+'">'+qDescription+'</label></td>'+
                        '<td><label id="labelQuestionTypeDesc'+value.id+'">'+value.questionType.description+'</td>'+
                        '<td><label id="labelDiffDesc'+value.id+'">'+value.difficultyLevel.description+'</td>'+
                        '<td><label id="labelScore'+value.id+'">'+value.score+'</td>'+

                        '<td><label id="labelQuestionCreateBy'+value.id+'">'+value.createBy.thFname+" "+value.createBy.thLname+'</td>'+
                        '<td style="display: none;"><label id="labelQuestionCreateDate'+value.id+'">'+value.createDate+'</td>'+

                        '<td style="display: none; text-align: center"><button id="btnQuestionInfo'+value.id+'" data-toggle="modal" data-target="#showQuestionInfoModal" class="btn btn-info" type="button" onclick="showInfo('+value.id+')"><span class="glyphicon glyphicon-book"></span></button></td>'+
                        '</tr>'
                    );
                });
            },
            error: function(){
                alert("เกิดข้อผิดพลาดขณะร้องขอข้อมูล...");
            }
        });
    }
    if($("#tbodySelectQuestion tr").length != 0 && $("#tbodySelectedQuestionToPaper tr").length != 0){
        $("#tbSelectQuestion").show();
        $("#questionsAreEmpty").hide();
        $("#removeRowSelected").removeAttr('disabled');
        $("#addQuestionBtn").removeAttr('disabled');
        allQuestionIdOnTableCreatePaper = [];
        $("#tbodySelectedQuestionToPaper tr input:checkbox").each(function(){
            var temp = $(this).parent().siblings().map(function(){
                return $(this).text();
            }).get(0);
            allQuestionIdOnTableCreatePaper.push(temp);
        });
        // converse array to json.
        var toJsonObject = {};
        var tempz = new Array();
        for(var i = 0; i < allQuestionIdOnTableCreatePaper.length; i++){
            var item = {
                "id" : allQuestionIdOnTableCreatePaper[i]
            };
            tempz.push(item);
        }
        toJsonObject = JSON.stringify(tempz);

        var dataResponse = $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/TDCS/exam/getQuestionNotInSelected",
            data: toJsonObject,
            async: false,
            success: function(data){
                if(data.length == 0){
                    //alert('2');
                    dataNotFound();
                }
                else{
                    dataFound();
                    //alert('3');
                    $("#checkQuestionAll").attr('checked', false);
                    $("#tbSelectQuestion").show();
                    $("#tbodySelectQuestion").empty();
                    data.forEach(function(valuez){
                        //var qDescriptionz = valuez.descriptionz;
                        //if(valuez.descriptionz.length > 60){
                        //    qDescription = (valuez.descriptionz).substring(0, 55)+' >>';
                        //}
                        $("#tbodySelectQuestion").append(
                            '<tr>'+
                            '<td style="display: none;"><label id="labelQuestionId'+valuez.idz+'">'+valuez.idz+'</td>'+
                            '<td><input class="selectQ" name="selectQ" type="checkbox"/></td>'+
                            '<td style="text-align: left;"><label id="labelCategoryName'+valuez.idz+'">'+valuez.subCategoryz.category.name+'<label></td>'+
                            '<td style="text-align: left;"><label id="labelSubCategoryName'+valuez.idz+'">'+valuez.subCategoryz.name+'</label></td>'+
                            '<td style="text-align: left;"><button class="btn btn-link btn-info btn-sm" type="button"><span class="glyphicon glyphicon-info-sign"></span></span></button><label id="labelQuestionDesc'+valuez.idz+'">'+valuez.descriptionz+'</label></td>'+
                            '<td><label id="labelQuestionTypeDesc'+valuez.idz+'">'+valuez.questionTypez.description+'</td>'+
                            '<td><label id="labelDiffDesc'+valuez.idz+'">'+valuez.difficultyLevelz.description+'</td>'+
                            '<td><label id="labelScore'+valuez.idz+'">'+valuez.score+'</td>'+

                            '<td><label id="labelQuestionCreateBy'+valuez.idz+'">'+valuez.createByz.thFname+" "+valuez.createByz.thLname+'</td>'+
                            '<td style="display: none;"><label id="labelQuestionCreateDate'+valuez.idz+'">'+valuez.createDatez+'</td>'+

                            '<td style="display: none; text-align: center"><button id="btnQuestionInfo'+valuez.idz+'" data-toggle="modal" data-target="#showQuestionInfoModal" class="btn btn-info" type="button" onclick="showInfo('+valuez.idz+')"><span class="glyphicon glyphicon-book"></span></button></td>'+
                            '</tr>'
                        );
                    });
                }
                //if($("#tbSelectQuestion").is(":hidden") && data.length != 0){
            },
            error: function(){
                alert("เกิดข้อผิดพลาดขณะร้องขอข้อมูล...");
            }
        });
    }
}

function showInfo(showInfoId){
    $("#showQuestionInfoModal .modal-body").empty();
    $("#showQuestionInfoModal .modal-body").append(
        '<div class="row">'+
            '<div class="col-sm-3 text-right"><b>หมายเลขข้อสอบ :</b></div><div class="col-sm-9" style="margin-left: -20px;"> '+$("#labelQuestionId"+showInfoId).text()+'</div><br/>'+
            '<div class="col-sm-3 text-right"><b>วิชา :</b></div><div class="col-sm-9" style="margin-left: -20px;"> '+$("#labelCategoryName"+showInfoId).text()+'</div><br/>'+
            '<div class="col-sm-3 text-right"><b>รายวิชา :</b></div><div class="col-sm-9" style="margin-left: -20px;"> '+$("#labelSubCategoryName"+showInfoId).text()+'</div><br/>'+
            '<div class="col-sm-3 text-right"><b>ผู้สร้างข้อสอบ :</b></div><div class="col-sm-9" style="margin-left: -20px;"> '+$("#labelQuestionCreateBy"+showInfoId).text()+'</div><br/>'+
            '<div class="col-sm-3 text-right"><b>วันที่สร้างข้อสอบ :</b></div><div class="col-sm-9" style="margin-left: -20px;"> '+$("#labelQuestionCreateDate"+showInfoId).text()+'</div><br/>'+
            '<div class="col-sm-3 text-right"><b>ระดับ :</b></div><div class="col-sm-9" style="margin-left: -20px;"> '+$("#labelQuestionTypeDesc"+showInfoId).text()+'</div><br/>'+
            '<div class="col-sm-3 text-right"><b>คะแนน :</b></div><div class="col-sm-9" style="margin-left: -20px;"> '+$("#labelScore"+showInfoId).text()+'</div><br/>'+
            '<div class="col-sm-12" style="width: 90%; height: 50px; margin: 5%; background-color: #ffffff;border: solid #c3c3c3 1px;">'+
            '<h3>'+$("#labelQuestionDesc"+showInfoId).text()+'</h3>'+
            '</div>'+
        '<div>'
    )
}

function addQuestionToPaper(qId){
    questionIdString = [];
    questionIdString.push(qId);
    var newScore = $('#labelScore'+qId).text();
    $("#tbSelectedQuestionToPaper").show();
    $("#tbodySelectedQuestionToPaper").append(
        '<tr>'+
            '<td style="display: none;">'+$("#labelQuestionId"+qId).text()+'</td>'+
            '<td><input type="checkbox" class="selectedQuestion"/></td>'+
            '<td>'+$("#labelQuestionTypeDesc"+qId).text()+'</td>'+
            '<td>'+$("#labelCategoryName"+qId).text()+'</td>'+
            '<td>'+$("#labelSubCategoryName"+qId).text()+'</td>'+
            '<td style="text-align: left;">'+$("#labelQuestionDesc"+qId).text()+'</td>'+
            '<td>'+$("#labelDiffDesc"+qId).text()+'</td>'+
            '<td><input id="newScore'+qId+'" onchange="scoreOnChange()" name="newScore" type="number" class="form-control innput-sm"  min="1" max="50" value="'+newScore+'"/></td>'+
            '<td>'+$("#labelQuestionCreateBy"+qId).text()+'</td>'+
        '</tr>'
    );
    $("#questionNotFound").hide();
    questionsInPaper.push(qId);
    sumScore(Number($("#newScore"+qId).val()));
    $("#score").val(sumPaperScore);
}

function createPaper(){

    if($("#score").val() > $("#maxScore").val()){
        alert('Score out of range!!!');
        $("#maxScore").focus();
        $("#score").css('border-color', 'red');
        return false;
    }
    var paperId = $("#newPaperId").val();
    var paperName = $("#newPaperName").val();
    var paperScore = $("#newPaperScore").val();
    var paperTime = ((parseInt(hours) * 60) + parseInt(minutes));
    var paperForPosition = $("#newPaperForPosition").val();
    var jsonObjQuestion = {};
    var tempArrayQuestion = new Array();

    for(var idx = 0; idx < questionsInPaper.length; idx++){
        var item = {
            "qId": questionsInPaper[idx],
            "qScore" : newQuestionScore[idx]
        };
        tempArrayQuestion.push(item);
    }
    jsonObjQuestion = JSON.stringify(tempArrayQuestion);

    $.ajax({
        type: "POST",
        url: "/TDCS/exam/createPaper",
        data: {
            paperId : paperId,
            paperName : paperName,
            paperScore : paperScore,
            paperTime : paperTime,
            paperForPosition : paperForPosition,
            jsonObjQuestion : jsonObjQuestion
        },
        success: function(){
            alert('เพิ่มชุดข้อสอบเรียบร้อยแล้ว');
            window.location.href = "/TDCS/exam/managePapers";
        },
        error: function(){
            alert('เกิดข้อผิดพลาด');
        }
    });

    //questionsInPaper = [];
    //newQuestionScore = [];
}

function questionInfo(){

}

function onLoadPageCreatePaper(){
    $("#questionNotFound").show();
    $("#tbSelectedQuestionToPaper").hide();
    $("#removeRowSelected").removeAttr('disabled');
    $("#addQuestionBtn").removeAttr('disabled');
    $("#score").val(0);
    $("#maxScore").val(0);
    $("#hours").defaultValue = "0";
}

function onLoadPageEditPaper(){
    $("#questionNotFound").hide();
    $("#removeRowSelected").removeAttr('disabled');
    $("#addQuestionBtn").removeAttr('disabled');
    $("#score").val(0);
    $("#maxScore").val(0);
    $("#hours").defaultValue = "0";
}

function sumScore(score){
    sumPaperScore = sumPaperScore + Number(score);
}

function scoreOnChange(){
    var sumScoreChanged = 0;
    $("#tbodySelectedQuestionToPaper tr input[type='number']").each(function(){
        sumScoreChanged = sumScoreChanged + Number($(this).val());
    });
    $("#score").val(sumScoreChanged);
}

function generalSearchQuestion(btnSearchStatus) {

    itemLenght = ($("#showEmployeeSelected").children("button")).length;
    subcategoryId = subcategoryId;
    questionDescriptionSearch = $("#searchQuestionDescInput").val();
    if(questionDescriptionSearch == ""? questionDescriptionSearch = "": questionDescriptionSearch = $("#searchQuestionDescInput").val());
    questionCreateDateFromSearch = $("#searchCreateDateFromInput").val();
    if(questionCreateDateFromSearch == ""? questionCreateDateFromSearch = "": questionCreateDateFromSearch = $("#searchCreateDateFromInput").val());
    questionCreateDateToSearch = $("#searchCreateDateToInput").val();
    if(questionCreateDateToSearch == ""? questionCreateDateToSearch = "": questionCreateDateToSearch = $("#searchCreateDateToInput").val());
    questionScoreFromSearch = $("#searchScoreFromInput").val();
    if(questionScoreFromSearch == ""? questionScoreFromSearch = "": questionScoreFromSearch = $("#searchScoreFromInput").val());
    questionScoreToSearch = $("#searchScoreToInput").val();
    if(questionScoreToSearch == ""? questionScoreToSearch = "": questionScoreToSearch = $("#searchScoreToInput").val());
    questionCreateDateFromSearch = $("#searchCreateDateFromInput").val();
    if(questionCreateDateFromSearch == ""? questionCreateDateFromSearch = "": questionCreateDateFromSearch = $("#searchCreateDateFromInput").val());
    questionCreateDateToSearch = $("#searchCreateDateToInput").val();
    if(questionCreateDateToSearch == ""? questionCreateDateToSearch = "": questionCreateDateToSearch = $("#searchCreateDateToInput").val());

    if(itemLenght > 0){

        for (i = 0; i < itemLenght; i++) {
            var temp = $("#showEmployeeSelected").children("button")[i].innerHTML;
            alert(temp);
            temp = temp.substring(temp.indexOf('_')+1, temp.indexOf('z'));
            arrayEmpNameToQuery.push(temp);

            //arrayEmpNameToQueryCase1 = arrayEmpNameToQuery;
        }
        if(btnSearchStatus == 0){

            for (var index = 0; index < allQuestionIdOnTableCreatePaper.length; index ++){
                itm = {
                    "qId" : allQuestionIdOnTableCreatePaper[index]
                };
                tmpQ.push(itm);
            }
            for (var idx = 0; idx < arrayEmpNameToQuery.length; idx++) {
                var items = {
                    "thFname": arrayEmpNameToQuery[idx],
                    "subCategoryId": subcategoryId,
                    "btnSearchStatus" : btnSearchStatus,
                    "allQuestionIdOnTableCreatePaper" : tmpQ,
                    "questionDescriptionSearch" : questionDescriptionSearch,
                    "questionCreateDateFromSearch" : questionCreateDateFromSearch,
                    "questionCreateDateToSearch" : questionCreateDateToSearch,
                    "questionScoreToSearch" : questionScoreToSearch,
                    "questionScoreFromSearch" : questionScoreFromSearch
                };
                tempArray.push(items);
            }
            arrayEmpNameToQuery = [];
        }

        if(btnSearchStatus == 1){
            for (var index = 0; index < allQuestionIdOnTableCreatePaper.length; index ++){
                itm = {
                    "qId" : allQuestionIdOnTableCreatePaper[index]
                };
                tmpQ.push(itm);
            }
            for (var idx = 0; idx < arrayEmpNameToQuery.length; idx++) {
                var items = {
                    "thFname": arrayEmpNameToQuery[idx],
                    "subCategoryId": subcategoryId,
                    "btnSearchStatus" : btnSearchStatus,
                    "allQuestionIdOnTableCreatePaper" : tmpQ,
                    "questionDescriptionSearch" : questionDescriptionSearch,
                    "questionCreateDateFromSearch" : questionCreateDateFromSearch,
                    "questionCreateDateToSearch" : questionCreateDateToSearch,
                    "questionScoreToSearch" : questionScoreToSearch,
                    "questionScoreFromSearch" : questionScoreFromSearch
                };
                tempArray.push(items);
            }
        }
    }
    else{
        if(btnSearchStatus == 0){
            for (var index3 = 0; index3 < allQuestionIdOnTableCreatePaper.length; index3 ++){
                itm = {
                    "qId" : allQuestionIdOnTableCreatePaper[index3]
                };
                tmpQ.push(itm);
            }
            var item = {
                "thFname": '0',
                "subCategoryId": subcategoryId,
                "btnSearchStatus" : btnSearchStatus,
                "allQuestionIdOnTableCreatePaper" : tmpQ,
                "questionDescriptionSearch" : questionDescriptionSearch,
                "questionCreateDateFromSearch" : questionCreateDateFromSearch,
                "questionCreateDateToSearch" : questionCreateDateToSearch,
                "questionScoreToSearch" : questionScoreToSearch,
                "questionScoreFromSearch" : questionScoreFromSearch
            };
            tempArray.push(item);
        }
        if(btnSearchStatus == 1){
            for (var index4 = 0; index4 < allQuestionIdOnTableCreatePaper.length; index4 ++){
                itm = {
                    "qId" : allQuestionIdOnTableCreatePaper[index4]
                };
                tmpQ.push(itm);
            }
            var item2 = {
                "thFname": '0',
                "subCategoryId": subcategoryId,
                "btnSearchStatus" : btnSearchStatus,
                "allQuestionIdOnTableCreatePaper" : tmpQ,
                "questionDescriptionSearch" : questionDescriptionSearch,
                "questionCreateDateFromSearch" : questionCreateDateFromSearch,
                "questionCreateDateToSearch" : questionCreateDateToSearch,
                "questionScoreToSearch" : questionScoreToSearch,
                "questionScoreFromSearch" : questionScoreFromSearch
            };
            tempArray.push(item2);
        }
    }
    jsonObj = JSON.stringify(tempArray);
    //alert(jsonObj);
    var dataResponse = $.ajax({
        type: "POST",
        url: "/TDCS/exam/generalQuestionSearch",
        dataType: "json",
        contentType: 'application/json',
        mimeType: 'application/json',
        data: jsonObj,
        success: function (result) {
            if(result.length == 0){
                dataNotFound();
            }
            else{
                dataFound();
                $("#tbodySelectQuestion").empty();
                result.forEach(function(i){
                    var qDescriptions = i.descriptions;
                    if(i.descriptions.length > 60){
                        qDescriptions = (i.descriptions).substring(0, 50);
                    }
                    $("#tbodySelectQuestion").append(
                        '<tr>'+
                        '<td style="display: none;"><label id="labelQuestionId'+i.ids+'">'+i.ids+'</td>'+
                        '<td><input class="selectQ" name="selectQ" type="checkbox"/></td>'+
                        '<td style="text-align: left;"><label id="labelCategoryName'+i.ids+'">'+i.subCategorys.category.name+'<label></td>'+
                        '<td style="text-align: left;"><label id="labelSubCategoryName'+i.ids+'">'+i.subCategorys.name+'</label></td>'+
                        '<td style="text-align: left;"><button class="btn btn-link btn-info btn-sm" type="button"><span class="glyphicon glyphicon-info-sign"></span></span></button><label id="labelQuestionDesc'+i.ids+'">'+qDescriptions+'</label></td>'+
                        '<td><label id="labelQuestionTypeDesc'+i.ids+'">'+i.questionTypes.description+'</td>'+
                        '<td><label id="labelDiffDesc'+i.ids+'">'+i.difficultyLevels.description+'</td>'+
                        '<td><label id="labelScore'+i.ids+'">'+i.scores+'</td>'+

                        '<td><label id="labelQuestionCreateBy'+i.ids+'">'+i.createBys.thFname+" "+i.createBys.thLname+'</td>'+
                        '<td style="display: none;"><label id="labelQuestionCreateDate'+i.ids+'">'+i.createDates+'</td>'+

                        '<td style="display: none; text-align: center"><button id="btnQuestionInfo'+i.ids+'" data-toggle="modal" data-target="#showQuestionInfoModal" class="btn btn-info" type="button" onclick="showInfo('+i.ids+')"><span class="glyphicon glyphicon-book"></span></button></td>'+
                        '</tr>'
                    );
                });
            }
        },
        error: function () {
            alert('เกิดข้อผิดพลาด');
        }
    });
    arrayEmpNameToQuery = [];
    tempArray = [];
    tmpQ = [];
    allQuestionIdOnTableCreatePaper = [];
}

function dataNotFound(){
    $("#questionsAreEmpty").show();
    $("#removeRowSelected").attr('disabled', 'disabled');
    $("#addQuestionBtn").attr('disabled', 'disabled');
    $("#tbSelectQuestion").hide();
}

function dataFound(){
    $("#questionsAreEmpty").hide();
    $("#removeRowSelected").removeAttr('disabled');
    $("#addQuestionBtn").removeAttr('disabled');
    $("#tbSelectQuestion").show();
}

function getSqlDateFormat(questionCreateDateFromSearch){

    var sqlDate = "";
    var day = questionCreateDateFromSearch.substring(0, 2);
    var month = questionCreateDateFromSearch.substring(3, 5);
    var year = questionCreateDateFromSearch.substring(6, 10);

    switch(month){
        case '01':
            month = 'ม.ค.';
            break;
        case '02':
            month = 'ก.พ.';
            break;
        case '03':
            month = 'มี.ค.';
            break;
        case '04':
            month = 'เม.ย.';
            break;
        case '05':
            month = 'พ.ค.';
            break;
        case '06':
            month = 'มิ.ย.';
            break;
        case '07':
            month = 'ก.ค.';
            break;
        case '08':
            month = 'ส.ค.';
            break;
        case '09':
            month = 'ก.ย.';
            break;
        case '10':
            month = 'ต.ค.';
            break;
        case '11':
            month = 'พ.ย.';
            break;
        case '12':
            month = 'ธ.ค.';
            break;
        default:
            alert('ไม่มีเดือน');
    }
    sqlDate = day+" "+month+" "+year;

    return sqlDate;
}

function toUrl(paperId){
    window.location.href = "/TDCS/exam/createPaper?pId="+paperId;
}

function getValueFromUrl(){
    var pidFromUrl = window.location.href;
    pidFromUrl = pidFromUrl.substring(pidFromUrl.indexOf('?') + 5, pidFromUrl.length);

    return pidFromUrl;
}

function showUpdatePaper(paperId){

    $.ajax({
        type: "POST",
        url: "/TDCS/exam/getPaper",
        data : {
            paperId : paperId
        },
        async: false,
        success: function(data){
            $("#tbodySelectedQuestionToPaper").empty();
            data.forEach(function(j){
                $("#newPaperId").val(j.examPaper.code);
                if($("#newPaperName").val(j.examPaper.name) == null? $("#newPaperName").val(''): $("#newPaperName").val(j.examPaper.name));
                $("#newPaperScore").val(j.examPaper.maxScore);
                $("#maxScore").val(j.examPaper.maxScore);
                $("#newPaperForPosition").val(j.examPaper.position.posiId);
                var paperTime = j.examPaper.timeLimit;
                var hours = paperTime / 60;
                var minutes = paperTime % 60;
                $("#hours").val(hours);
                $("#minutes").val(minutes);
                var qdesc = j.question.description;
                if(qdesc.length > 60){
                    qdesc = qdesc.substring(0, 60)+' >>';
                }
                $("#tbodySelectedQuestionToPaper").append(
                    '<tr>'+
                        '<td style="display: none;">'+ j.question.id+'</td>'+
                        '<td><input type="checkbox" class="selectedQuestion"/></td>'+
                        '<td>'+ j.question.questionType.description+'</td>'+
                        '<td>'+ j.question.subCategory.category.name+'</td>'+
                        '<td>'+ j.question.subCategory.name+'</td>'+
                        '<td style="text-align: left;">'+ j.question.description+'</td>'+
                        '<td>'+ j.question.difficultyLevel.description+'</td>'+
                        '<td><input id="newScore'+j.question.id+'" onchange="scoreOnChange()" name="newScore" type="number" class="form-control innput-sm"  min="1" max="50" value="'+ j.score+'"/></td>'+
                        '<td>'+ j.question.createBy.thFname+' '+j.question.createBy.thLname+'</td>'+
                    '</tr>'
                );
                sumScore(j.score);
                $("#score").val(sumPaperScore);
            });
        },
        error: function(){
            alert("เกิดข้อผิดพลาดขณะร้องขอข้อมูล...");
        }
    });
    sumPaperScore = 0;
    onLoadPageUpdatePaper();
}

function onLoadPageUpdatePaper(){
    $("h3").text('แก้ไขชุดข้อสอบ');
    $("#createPaperBtn").hide();
    $("#updatePaperBtn").show();
}

function updatePaper(){

    if($("#score").val() > $("#maxScore").val()){
        alert('Score out of range!!!');
        $("#maxScore").focus();
        $("#score").css('border-color', 'red');
        return false;
    }
    var paperCodeUpdate = $("#newPaperId").val();
    var paperNameUpdate = $("#newPaperName").val();
    var paperScoreUpdate = $("#newPaperScore").val();
    var paperTimeUpdate = ((parseInt($("#hours").val()) * 60) + parseInt($("#minutes").val()));
    var paperForPositionUpdate = $("#newPaperForPosition").val();
    var jsonObjQuestionUpdate = {};
    var tempArrayQuestionUpdate = new Array();
    alert(questionsInPaper+" "+newQuestionScore);
    for(var idx = 0; idx < questionsInPaper.length; idx++){
        var item = {
            "qId": questionsInPaper[idx],
            "qScore" : newQuestionScore[idx]
        };
        tempArrayQuestionUpdate.push(item);
    }
    jsonObjQuestionUpdate = JSON.stringify(tempArrayQuestionUpdate);
    //alert(jsonObjQuestionUpdate);
    $.ajax({
        type: "POST",
        url: "/TDCS/exam/updatePaper",
        data: {
            paperCodeUpdate  : paperCodeUpdate,
            paperNameUpdate  : paperNameUpdate ,
            paperScoreUpdate  : paperScoreUpdate ,
            paperTimeUpdate  : paperTimeUpdate ,
            paperForPositionUpdate  : paperForPositionUpdate ,
            jsonObjQuestionUpdate  : jsonObjQuestionUpdate
        },
        success: function(){
            alert('แก้ไขชุดข้อสอบเรียบร้อยแล้ว');
            window.location.href = "/TDCS/exam/managePapers";
        },
        error: function(){
            alert('เกิดข้อผิดพลาด');
        }
    });
}