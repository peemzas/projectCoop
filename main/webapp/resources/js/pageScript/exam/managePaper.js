var questionIdString = new Array();
var allQuestionIdOnTableCreatePaper = new Array();

var minutes;
var hours;
var questionsInPaper = new Array();
var newQuestionScore = new Array();

$("document").ready(function(){
    $("#questionNotFound").show();
    $("#tbSelectedQuestionToPaper").hide();
    $("#removeRowSelected").removeAttr('disabled');
    $("#addQuestionBtn").removeAttr('disabled');
    //$("#checkQuestionAll").attr('checked', false);

    //$("#selectionQuestionBtnInpagePaper").unbind(click).click(function(){
    $("#selectionQuestionBtnInpagePaper").on('click' ,function(){
        if($("#tbSelectQuestion #tbodySelectQuestion tr").length == 0){
            $("#questionsAreEmpty").show();
            $("#removeRowSelected").attr('disabled', 'disabled');
            $("#addQuestionBtn").attr('disabled', 'disabled');
            $("#tbSelectQuestion").hide();
        }
        else{
            viewQuestions();
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
        }
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
    //alert("hihihihi");
    $("#tbSelectQuestion tbody input:checkbox:checked").each(function(){
        var qId = $(this).parent().siblings().map(function(){
            return $(this).text();
        }).get(0);
        addQuestionToPaper(qId);
    });
});

function viewQuestions(){
    alert('his');

    if($("#tbSelectedQuestionToPaper").is(":hidden") || $("#selectQuest").is(":visible")){
        //alert('1');
        $("#checkQuestionAll").attr('checked', false);
        var dataResponse = $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/TDCS/exam/getAllQuestionDetail",
            async: false,
            success: function(dataResponse){
                $("#tbodySelectQuestion").empty();
                dataResponse.forEach(function(value){
                    $("#tbodySelectQuestion").append(
                        '<tr>'+
                        '<td style="display: none;"><label id="labelQuestionId'+value.id+'">'+value.id+'</td>'+
                        '<td><input class="selectQ" name="selectQ" type="checkbox"/></td>'+
                        '<td style="text-align: left;"><label id="labelCategoryName'+value.id+'">'+value.subCategory.category.name+'<label></td>'+
                        '<td style="text-align: left;"><label id="labelSubCategoryName'+value.id+'">'+value.subCategory.name+'</label></td>'+
                        '<td style="text-align: left;"><label id="labelQuestionDesc'+value.id+'">'+value.description+'</label></td>'+
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
        //alert(allQuestionIdOnTableCreatePaper);
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
                        $("#tbodySelectQuestion").append(
                            '<tr>'+
                            '<td style="display: none;"><label id="labelQuestionId'+valuez.idz+'">'+valuez.idz+'</td>'+
                            '<td><input class="selectQ" type="checkbox"/></td>'+
                            '<td><label id="labelCategoryName'+valuez.idz+'">'+valuez.subCategoryz.category.name+'<label></td>'+
                            '<td><label id="labelSubCategoryName'+valuez.idz+'">'+valuez.subCategoryz.name+'</label></td>'+
                            '<td style="text-align: left;"><label id="labelQuestionDesc'+valuez.idz+'">'+valuez.descriptionz+'</label></td>'+
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

//This function for get values from modal Question.
//function selectQuestion(){
//    $("#tbSelectQuestion tbody input:checkbox:checked").each(function(){
//        var qId = $(this).parent().siblings().map(function(){
//            return $(this).text();
//        }).get(0);
//        addQuestionToPaper(qId);
//    });
//}

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
            '<td><input id="newScore'+qId+'" name="newScore" type="number" class="form-control"  min="1" max="50" value="'+newScore+'"/></td>'+
            '<td>'+$("#labelQuestionCreateBy"+qId).text()+'</td>'+
        '</tr>'
    );
    $("#questionNotFound").hide();
    //
    questionsInPaper.push(qId);
}

function createPaper(){
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

    //alert(paperId+" "+paperName+" "+paperScore+" "+paperTime+" "+paperForPosition+" "+questionsInPaper+" "+newQuestionScore);
    //alert(jsonObjQuestion);
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