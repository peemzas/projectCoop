var pId;
$(document).ready(function(){
    getAllPapers();

    $("td > button").unbind('click').click(function(){
        toUrl($(this).attr('id'));
    });

    $("select[name='paperStatus']").on('change', function(){
        var paperId = $(this).attr('id');
        paperId = paperId.substr(10);
        updatePaperStatus(paperId);
        $(".checkPaper").each(function(){
            this.checked = false;
        });
        $("#checkPaperAll").removeAttr('checked');
    });

    $(".checkPaper").click(function(){
        pId = $(this).parent().siblings().map(function(){
            return $(this).text();
        }).get(0);
        if($("#dropdownId"+pId).val() == 1){
            alert('ไม่สามารถลบชุดข้อสอบนี้ได้');
            this.checked = false;
        }
    });

    $("#checkPaperAll").on('click', function(){
        if(this.checked){
            $(".checkPaper").each(function(){
                pId = $(this).parent().siblings().map(function(){
                    return $(this).text();
                }).get(0);
                if($("#dropdownId"+pId).val() == 1){
                    this.checked = false;
                }
                else{
                    this.checked = true;
                }
            });
        }
        else{
            $(".checkPaper").each(function(){
                this.checked = false;
            });
        }
    });

    $("#deletePapers").on('click', function(){
        $("#tbodyManagePaper tr input[type='checkbox']:checked").each(function(){
            pId = $(this).parent().siblings().map(function(){
                return $(this).text();
            }).get(0);
            //alert(pId);
            deletePapers(pId);
        });
    });
});

function getAllPapers(){
    $.ajax({
        type : "POST",
        url : "/TDCS/exam/getAllPapers",
        contentType: "application/json",
        async: false,
        success : function(data){
            $("#tbodyManagePaper").empty();
            data.forEach(function(value){
                $("#tbodyManagePaper").append(
                    '<tr>'+
                    '<td style="display: none;"><label id="'+value.id+'">'+value.id+'</label></td>'+
                    '<td><input class="checkPaper" type="checkbox"/></td>'+
                    '<td><label id="lpaperCode'+value.code+'">'+value.code+'</label></td>'+
                    '<td style="text-align: left;"><label id="lpaperName'+value.name+'">'+value.name+'</label></td>'+
                    '<td><label id="lpaperCreateBy'+value.createBy.empId+'">'+value.createBy.thFname+' '+value.createBy.thLname+'</label></td>'+
                    '<td><label id="lpaperScore'+value.maxScore+'" class="label-control">'+value.maxScore+'</label></td>'+
                    '<td><label id="lpaperForPosition'+value.position.posiId+'" class="label-control">'+value.position.posiName+'</label></td>'+
                    '<td>'+
                        '<select id="dropdownId'+value.id+'" name="paperStatus" class="btn btn-success btn-sm" style="text-align: left;">'+
                            '<option value="3">ยังไม่เผยแพร่</option>'+
                            '<option value="1">เผยแพร่</option>'+
                            '<option value="2">ปิดการเผยแพร่</option>'+
                        '</select>'+
                    '</td>'+
                    '<td><button id="'+value.id+'" class="btn btn-gray btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></td>'+
                '</tr>'
                );
                presentStatus(value.id, value.paperStatus.id);
            });
        }
    });
}

function updatePaperStatus(paperId) {
    var paperStatus = $("#dropdownId" + paperId).val();
    $.ajax({
        type: "POST",
        url: "/TDCS/exam/updatePaperStatus",
        data: {
            paperId: paperId,
            paperStatus: paperStatus
        },
        success: function () {
            alert('อัพเดทสถานะเรียบร้อยแล้ว');
        },
        error: function () {
            alert('error');
        }
    });
    setColorDropdown(paperId, paperStatus);
}

function presentStatus(paperId, presentStatus){
    $("#dropdownId"+paperId).val(presentStatus);
    setColorDropdown(paperId, presentStatus);
}

function setColorDropdown(paperId, paperStatus){
    if(paperStatus == 1) {
        $("#dropdownId"+paperId).css('background-color', '#33CC33');
        $("#dropdownId"+paperId).css('border-color', '#33CC33');
    }
    if(paperStatus == 2) {
        $("#dropdownId"+paperId).css('background-color', '#669999');
        $("#dropdownId"+paperId).css('border-color', '#669999');
    }
    if(paperStatus == 3) {
        $("#dropdownId"+paperId).css('background-color', '#33CCFF');
        $("#dropdownId"+paperId).css('border-color', '#33CCFF');
    }
}

function deletePapers(paperId){
    $.ajax({
        type: "POST",
        url: "/TDCS/exam/deletePaper",
        data: {
            paperId: paperId
        },
        success: function () {
            alert('ลบชุดข้อสอบเรียบร้อยแล้ว');
            window.location.reload();
        },
        error: function () {
            alert('ลบชุดข้อสอบผิดพลาด');
        }
    });
}