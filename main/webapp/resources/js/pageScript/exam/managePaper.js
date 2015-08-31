$("document").ready(function(){
    $("#selectionQuestionBtnInpagePaper").on("click", function(){
        //alert("hi");
        viewQuestions();
    });
});

function viewQuestions(){
    $("#tbodySelectQuestion").empty();
    var dataResponse = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllQuestionDetail",
        async: false,
        success: function(dataResponse){
            dataResponse.forEach(function(value){
                $("#tbodySelectQuestion").append(
                    '<tr>'+
                        '<td><input type="checkbox"/></td>'+
                        //'<td>'+value.id+'</td>'+
                        '<td><label id="labelCategoryName'+value.id+'">'+value.categoryName+'<label></td>'+
                        '<td><label id="labelSubCategoryName'+value.id+'">'+value.subCategoryName+'</td>'+
                        '<td style="text-align: left;"><label id="labelQestionDesc'+value.id+'">'+value.description+'</td>'+
                        '<td><label id="labelQuestionTypeDesc'+value.id+'">'+value.questionTypeDesc+'</td>'+
                        '<td><label id="labelDiffDesc'+value.id+'">'+value.difficultyDesc+'</td>'+
                        '<td><label id="labelScore'+value.id+'">'+value.score+'</td>'+

                        '<td style="display: none;"><label id="labelQuestionId'+value.id+'">'+value.id+'</td>'+
                        '<td style="display: none;"><label id="labelQuestionCreateBy'+value.id+'">'+value.createByEmpId+'</td>'+
                        '<td style="display: none;"><label id="labelQuestionCreateDate'+value.id+'">'+value.createDate+'</td>'+

                        '<td style="text-align: center"><button id="btnQuestionInfo'+value.id+'" data-toggle="modal" data-target="#showQuestionInfoModal" class="btn btn-info" type="button" onclick="showInfo('+value.id+')"><span class="glyphicon glyphicon-book"></span></button></td>'+
                    '</tr>'
                );
            });
        },
        error: function(){
            alert("เกิดข้อผิดพลาดขณะร้องขอข้อมูล...");
        }
    })
}

function showInfo(showInfoId){
    //alert(showInfoId);
    //alert($("#labelCategoryName"+showInfoId).text());
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
        '<div>'
    )
}
