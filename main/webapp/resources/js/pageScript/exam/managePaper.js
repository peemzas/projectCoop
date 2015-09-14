var questionIdString = new Array;
$("document").ready(function(){
    $("#questionNotFound").show();
    $("#selectionQuestionBtnInpagePaper").on("click", function(){
        viewQuestions();
    });
});

$("#addQuestionBtn").on('click', function(){
    selectQuestion();

    //if($("#tbodySelectedQuestionToPaper tr").length > 0){
    //    $("#questionNotFound").show();
    //}
    //else{
    //    $("#questionNotFound").hide();
    //}
});

function viewQuestions(){
    if($("#tbodySelectedQuestionToPaper tr").length == 0){
        var dataResponse = $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/TDCS/exam/getAllQuestionDetail",
            async: false,
            success: function(dataResponse){
                dataResponse.forEach(function(value){
                    $("#tbodySelectQuestion").append(
                        '<tr>'+
                        '<td style="display: none;"><label id="labelQuestionId'+value.id+'">'+value.id+'</td>'+
                        '<td><input type="checkbox"/></td>'+
                        '<td><label id="labelCategoryName'+value.id+'">'+value.subCategory.category.name+'<label></td>'+
                        '<td><label id="labelSubCategoryName'+value.id+'">'+value.subCategory.name+'</td>'+
                        '<td style="text-align: left;"><label id="labelQuestionDesc'+value.id+'">'+value.description+'</td>'+
                        '<td><label id="labelQuestionTypeDesc'+value.id+'">'+value.questionType.description+'</td>'+
                        '<td><label id="labelDiffDesc'+value.id+'">'+value.difficultyLevel.description+'</td>'+
                        '<td><label id="labelScore'+value.id+'">'+value.score+'</td>'+

                        '<td style="display: none;"><label id="labelQuestionCreateBy'+value.id+'">'+value.createBy.thFname+" "+value.createBy.thLname+'</td>'+
                        '<td style="display: none;"><label id="labelQuestionCreateDate'+value.id+'">'+value.createDate+'</td>'+

                        '<td style="text-align: center"><button id="btnQuestionInfo'+value.id+'" data-toggle="modal" data-target="#showQuestionInfoModal" class="btn btn-info" type="button" onclick="showInfo('+value.id+')"><span class="glyphicon glyphicon-book"></span></button></td>'+
                        '</tr>'
                    );
                });
            },
            error: function(){
                alert("เกิดข้อผิดพลาดขณะร้องขอข้อมูล...");
            }
        });
    }
    else{
        //alert("else" + questionIdString);
        var index;
        var arrayQuestionId;
        // converse array to json.
        var toJsonObject = {};
        var tempz = new Array();
        for(var i = 0; i < questionIdString.length; i++){
            var item = {
                "id" : questionIdString[i]
            };
            tempz.push(item);
        }
        toJsonObject = JSON.stringify(tempz);
        alert(toJsonObject);

        var dataResponse = $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/TDCS/exam/getAllQuestionDetail",
            async: false,
            success: function(dataResponse){
                dataResponse.forEach(function(value){
                    $("#tbodySelectQuestion").append(
                        '<tr>'+
                        '<td style="display: none;"><label id="labelQuestionId'+value.id+'">'+value.id+'</td>'+
                        '<td><input type="checkbox"/></td>'+
                        '<td><label id="labelCategoryName'+value.id+'">'+value.subCategory.category.name+'<label></td>'+
                        '<td><label id="labelSubCategoryName'+value.id+'">'+value.subCategory.name+'</td>'+
                        '<td style="text-align: left;"><label id="labelQuestionDesc'+value.id+'">'+value.description+'</td>'+
                        '<td><label id="labelQuestionTypeDesc'+value.id+'">'+value.questionType.description+'</td>'+
                        '<td><label id="labelDiffDesc'+value.id+'">'+value.difficultyLevel.description+'</td>'+
                        '<td><label id="labelScore'+value.id+'">'+value.score+'</td>'+

                        '<td style="display: none;"><label id="labelQuestionCreateBy'+value.id+'">'+value.createBy.thFname+" "+value.createBy.thLname+'</td>'+
                        '<td style="display: none;"><label id="labelQuestionCreateDate'+value.id+'">'+value.createDate+'</td>'+

                        '<td style="text-align: center"><button id="btnQuestionInfo'+value.id+'" data-toggle="modal" data-target="#showQuestionInfoModal" class="btn btn-info" type="button" onclick="showInfo('+value.id+')"><span class="glyphicon glyphicon-book"></span></button></td>'+
                        '</tr>'
                    );
                });
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
function selectQuestion(){
    $("#tbSelectQuestion input:checkbox:checked").each(function(){
        var qId = $(this).parent().siblings().map(function(){
            return $(this).text();
        }).get(0);
        addQuestionToPaper(qId);
    });
}

function addQuestionToPaper(qId){
    questionIdString.push(qId);
    $("#tbodySelectedQuestionToPaper").append(
        '<tr>'+
            '<td style="display: none;">'+$("#labelQuestionId").text()+'</td>'+
            '<td><input type="checkbox" class="selectedQuestion"/></td>'+
            '<td>'+$("#labelQuestionTypeDesc"+qId).text()+'</td>'+
            '<td>'+$("#labelCategoryName"+qId).text()+'</td>'+
            '<td>'+$("#labelSubCategoryName"+qId).text()+'</td>'+
            '<td style="text-align: left;">'+$("#labelQuestionDesc"+qId).text()+'</td>'+
            '<td>'+$("#labelDiffDesc"+qId).text()+'</td>'+
            '<td>'+$("#labelScore"+qId).text()+'</td>'+
            '<td>'+$("#labelQuestionCreateBy"+qId).text()+'</td>'+
        '</tr>'
    );
}