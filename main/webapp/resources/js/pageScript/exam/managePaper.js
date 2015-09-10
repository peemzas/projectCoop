$("document").ready(function(){
    $("#selectionQuestionBtnInpagePaper").on("click", function(){
        viewQuestions();
    });
    $("#addQuestionBtn").on('click', function(){
        addQuestionToPaper();
        alert("hi there");
    });
    //    Add Pagination

    //$("#tbSelectQuestion").after('<div id="nav"></div>');
    //var rowShown = 5;
    //var rowTotal = $("#tbSelectQuestion #tbodySelectQuestion tr").length;
    ////alert(rowTotal);
    //var numberOfPages = rowTotal/rowShown;
    //alert(numberOfPages);
    //
    //for(var page = 0; page < pageNumber; page ++){
    //    var pageNum = page + 1;
    //    $("#nav").append('<a href="#" rel="'+page+'">'+pageNum+'</a>');
    //}
    //$("#tbSelectQuestion").hide();
    //$("#tbSelectQuestion #tbodySelectQuestion tr").slice(0, rowShown).show();
    //
    //$('#nav a:first').addClass('active');
    //$('#nav a').bind('click', function(){
    //
    //    $('#nav a').removeClass('active');
    //    $(this).addClass('active');
    //    var currPage = $(this).attr('rel');
    //    var startItem = currPage * rowsShown;
    //    var endItem = startItem + rowsShown;
    //    $("#tbSelectQuestion #tbodySelectQuestion tr").css('opacity','0.0').hide().slice(startItem, endItem).
    //        css('display','table-row').animate({opacity:1}, 300);
    //});
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
                        '<td>'+value.id+'</td>'+
                        '<td><label id="labelCategoryName'+value.id+'">'+value.subCategory.category.name+'<label></td>'+
                        '<td><label id="labelSubCategoryName'+value.id+'">'+value.subCategory.name+'</td>'+
                        '<td style="text-align: left;"><label id="labelQuestionDesc'+value.id+'">'+value.description+'</td>'+
                        '<td><label id="labelQuestionTypeDesc'+value.id+'">'+value.questionType.description+'</td>'+
                        '<td><label id="labelDiffDesc'+value.id+'">'+value.difficultyLevel.description+'</td>'+
                        '<td><label id="labelScore'+value.id+'">'+value.score+'</td>'+

                        '<td style="display: none;"><label id="labelQuestionId'+value.id+'">'+value.id+'</td>'+
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
            '<div class="col-sm-12" style="width: 90%; height: 50px; margin: 5%; background-color: #ffffff;border: solid #c3c3c3 1px;">'+
                '<h3>'+$("#labelQuestionDesc"+showInfoId).text()+'</h3>'+
            '</div>'+
        '<div>'
    )
}

function addQuestionToPaper(){

    var qIdArray = new Array;
    $("#tbodySelectQuestion input:checkbox:checked").each(function(){
        var questionId = $(this).parent().siblings().map(function(){
           return $(this).text().trim();
        }).get();
    });

}