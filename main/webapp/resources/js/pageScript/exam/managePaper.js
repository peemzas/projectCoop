var questionIdString = new Array();
var allQuestionIdOnTableCreatePaper = new Array();

var minutes;
var hours;
var questionsInPaper = new Array();
var newQuestionScore = new Array();
var sumPaperScore = 0;

$(document).ready(function(){
    onLoadPage();

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
    $("#checkAllQuestionFromCreatePaperPage").click(function(){
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
    });
});

function viewQuestions(){
    if($("#tbSelectedQuestionToPaper").is(":hidden") || $("#selectQuest").is(":visible")){
        //alert('1');
        $("#checkQuestionAll").attr('checked', false);
        var dataResponse = $.ajax({
            type: "POST",
            contentType: "application/json",
            //url : "/TDCS/exam/searchQuestion",
            url: "/TDCS/exam/getAllQuestionDetail",
            async: false,
            success: function(dataResponse){
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
                    $("#questionsAreEmpty").show();
                    $("#removeRowSelected").attr('disabled', 'disabled');
                    $("#addQuestionBtn").attr('disabled', 'disabled');
                    $("#tbSelectQuestion").hide();
                }
                //if($("#tbSelectQuestion").is(":hidden") && data.length != 0){
                if(data.length > 0){
                    //alert('3');
                    $("#checkQuestionAll").attr('checked', false);
                    $("#tbSelectQuestion").show();
                    $("#tbodySelectQuestion").empty();
                    data.forEach(function(valuez){
                        var qDescriptionz = valuez.descriptionz;
                        if(valuez.descriptionz.length > 60){
                            qDescription = (valuez.descriptionz).substring(0, 60)+' >>';
                        }
                        $("#tbodySelectQuestion").append(
                            '<tr>'+
                            '<td style="display: none;"><label id="labelQuestionId'+valuez.idz+'">'+valuez.idz+'</td>'+
                            '<td><input class="selectQ" type="checkbox"/></td>'+
                            '<td><label id="labelCategoryName'+valuez.idz+'">'+valuez.subCategoryz.category.name+'<label></td>'+
                            '<td><label id="labelSubCategoryName'+valuez.idz+'">'+valuez.subCategoryz.name+'</label></td>'+
                            '<td style="text-align: left;"><label id="labelQuestionDesc'+valuez.idz+'">'+qDescriptionz+'</label></td>'+
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

function onLoadPage(){
    $("#questionNotFound").show();
    $("#tbSelectedQuestionToPaper").hide();
    $("#removeRowSelected").removeAttr('disabled');
    $("#addQuestionBtn").removeAttr('disabled');
    $("#score").val(0);
    $("#maxScore").val(0);
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