$(document).ready(function(){
    getAllPapers();

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
                    '<td><input type="checkbox"/></td>'+
                    '<td><label id="lpaperCode'+value.code+'">'+value.code+'</label></td>'+
                    '<td><label id="lpaperName'+value.name+'">'+value.name+'</label></td>'+
                        //'<td><label id="lpaperCreateBy'+value.createBy.empId+'">'+value.createBy.thFname+' '+value.createBy.thLname+'</label></td>'+
                    '<td><label>Create By</label></td>'+
                    '<td><label id="lpaperScore'+value.maxScore+'" class="label-control">'+value.maxScore+'</label></td>'+
                    '<td><label id="lpaperForPosition'+value.position+'" class="label-control">'+value.position+'</label></td>'+
                    '<td>'+
                        '<select id="dropdownId'+value.id+'" class="dropdown" onchange="updatePaperStatus('+value.id+')">'+
                            '<option value="3" style="background-color: #ffab20; ">ยังไม่เผยแพร่</option>'+
                            '<option value="1">เผยแพร่</option>'+
                            '<option value="2">ปิดการเผยแพร่</option>'+
                        '</select>'+
                    '</td>'+
                    '<td><button class="btn btn-gray btn-sm"><span class="glyphicon glyphicon-pencil"></span></button></td>'+
                '</tr>'
                )
            });
        }
    });
}

function updatePaperStatus(paperId){
    var paperStatus = $("#dropdownId"+paperId).val();
    alert(paperStatus+" "+paperId);
    $.ajax({
        type : "POST",
        url : "/TDCS/exam/updatePaperStatus",
        data : {
            paperId : paperId,
            paperStatus : paperStatus
        },
        success : function(){
        alert('อัพเดทสถานะเรียบร้อยแล้ว');
    },
    error : function(){
        alert('error');
    }
    });
}