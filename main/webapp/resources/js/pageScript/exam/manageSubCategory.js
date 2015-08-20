/**
 * Created by JOKIZZ on 17/8/2558.
 */
$("document").ready(function(){
    //alert('hi')
    viewSubCategory();
});
function viewSubCategory(){
    $("#tbodySubCategory").empty();

    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllSubCategory",
        async: false,
        success: function(data){
            data.forEach(function(value){
                $("#tbodySubCategory").append(
                    '<tr>'+

                    '<td style="text-align: center;"><label id="id'+value.id+'"><b>'+value.id+'</b></label>'+

                    //'<input id="id'+value.id+'" class="form-control" type="text" value="'+value.id+'" style="display: none;">'+
                    '<td style="text-align: center;"><label id="labelFor'+value.id+'">'+value.name+'</label>'+
                    '<input id="dataFor'+value.id+'" class="form-control" type="text" value="'+value.name+'" style="display: none;">'+
                    '</td>'+

                    //'<td style="text-align: center;"><label id="subId'+value.subId+'"><b>'+value.subId+'</b></label>'+

                    '<td style="text-align: center;"><label id="subName'+value.subId+'">'+value.subName+'</label>'+
                    '<input id="editsubName'+value.subId+'" class="form-control" type="text" value="'+value.subName+'" style="display: none;">'+


                    '<td style="text-align: center">'+
                    '<button id="editBtn'+value.subId+'" type="button" class="btn btn-gray" onclick="editSubCategory(' + "'" + value.subId + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button>'+
                    '&nbsp;<button id="updateBtn'+value.subId+'" class="btn btn-primary" style="display: none;" onclick="updateSubCategory(' + "'" + value.subId + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button></td>'+

                    '</td>'+

                    '<td style="text-align: center">'+
                    '<button class="btn btn-danger" type="button" onclick="deleteSubCategory('+ "'" +value.subId+ "'"+')"> <span class="glyphicon glyphicon-trash"></span></button>'+
                    '</td>'+
                    '</tr>'
                )
            });
        },
        error: function(data){
            alert('error while request...');
        }
    });
}


function deleteSubCategory(subCategoryId){

    if(!confirm(" แน่ใจนะว่าคุณจะลบ ")){ 

        return false;
    }
    $.ajax({
        type: "POST",
        url: "/TDCS/exam/deleteSubCategory",
        data:{
            id: subCategoryId
        },
        async: false,
        success:function(){
            alert(' ลบวิชาสำเร็จ ');
            //$("#tbodySubCategory").empty();
            //viewSubCategory();
            window.location.reload();
        },
        error: function(deleteSubCategory){
            alert('error Delete...');
        }
    });
}

function editSubCategory(subcategoryId){

    $("#editBtn"+subcategoryId).hide();
    $("#subName"+subcategoryId).hide();
    //$("#data"+subcategoryId).hide();

    //alert($("#thEdit").text("บันทึก"));
    //$("#thEdit").text("บันทึก");
    //$("#deleteBtn"+categoryId).attr("disabled", "disabled");

    $("#editsubName"+subcategoryId).show();
    //$("#editData"+subcategoryId).show();
    $("#updateBtn"+subcategoryId).show();
}


function updateSubCategory(subcategoryId) {

    //if ($("#editsubName" + subcategoryId).length > 5) {
    //    alert("คุณกรอกรหัสวิชาไม่ถูกต้อง");
    //}
    //else if ($("#editData" + categoryId).val() == "") {
    //    alert("ชื่อวิชาต้องไม่เป็นค่าว่าง")
    //}
    //else {
    //    var id = $("#editId" + categoryId).val();


        //var cname =$("#category"+subcategoryId).value();
        var id = $("#subId"+subcategoryId).val();
        var name = $("#editsubName" + subcategoryId).val();

        alert(name+subcategoryId);

        var dataResponse = $.ajax({
            type: "POST",
            url: "/TDCS/exam/editSubCategory",
            data: {
                id:id,
                name:name

                //categoryId:categoryId,
                //subcategoryName:subcategoryName

            },
            complete: function (xhr) {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        viewSubCategory();
                    }
                    else {
                        alert("fail1");
                    }
                } else {
                    alert("fail2");
                }
            }
        });
    //}
}


