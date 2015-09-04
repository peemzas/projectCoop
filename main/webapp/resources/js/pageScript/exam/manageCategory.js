$("document").ready(function(){
    viewCategory();
});
function viewCategory(){
    $("#tbodyCategory").empty();
    $("#thEdit").text("แก้ไข");
    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllCategory",
        async: false,
        success: function(data){
            data.forEach(function(value){
                $("#tbodyCategory").append(
                    '<tr>'+
                    '<td style="text-align: center;"><label id="id'+value.id+'">'+value.id+'</label>'+
                    '<input id="editId'+value.id+'" class="form-control" type="text" value="'+value.id+'" style="display: none;">'+
                    '<td><label id="data'+value.id+'">'+value.name+'</label>'+
                    '<input id="editData'+value.id+'" class="form-control" type="text" value="'+value.name+'" style="display: none;">'+
                    '</td>'+
                    '<td style="text-align: center;"><button id="editBtn'+value.id+'" class="btn btn-gray" onclick="editCategory(' + "'" + value.id + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button>'+
                    '&nbsp;<button id="updateBtn'+value.id+'" class="btn btn-primary" style="display: none;" onclick="updateCategory(' + "'" + value.id + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button></td>'+
                    '<td style="text-align: center;"><button class="btn btn-danger" id="deleteBtn'+value.id+'" type="button" onclick="deleteCategory('+ "'" +value.id+ "'"+')"><span class="glyphicon glyphicon-trash"></span></button></td>'+
                    '</tr>'
                )
            });
        },
        error: function(data){
            alert('error while request...');
        }
    });
}


function deleteCategory(categoryId){

    if(!confirm("ลบรายวิชา "+$("#data"+categoryId).text())){
        return false;
    }
    $.ajax({
        type: "POST",
        url: "/TDCS/exam/deleteCategory",
        data:{
            id: categoryId
        },
        async: false,
        success:function(){
            alert(' ลบวิชาสำเร็จ ');
            window.location.reload();
        },
        error:function(){
            alert(' ลบวิชาไม่สำเร็จ ')
        }
    });
}
function editCategory(categoryId){

    $("#editBtn"+categoryId).hide();
    $("#id"+categoryId).hide();
    $("#data"+categoryId).hide();

    //alert($("#thEdit").text("บันทึก"));
    $("#thEdit").text("บันทึก");
    //$("#deleteBtn"+categoryId).attr("disabled", "disabled");
    $("#editId"+categoryId).show();
    $("#editData"+categoryId).show();
    $("#updateBtn"+categoryId).show();
}

function updateCategory(categoryId){

    if($("#editId"+categoryId).length > 5){
        alert("คุณกรอกรหัสวิชาไม่ถูกต้อง");
    }
    else if($("#editData"+categoryId).val() == "" && $("#editId"+categoryId).val() == ""){
        alert("รหัสวิชาและชื่อวิชาต้องไม่เป็นค่าว่าง")
    }
    else if($("#editData"+categoryId).val() == ""){
        alert("ชื่อวิชาต้องไม่เป็นค่าว่าง")
    }
    else if( $("#editId"+categoryId).val() == ""){
        alert("รหัสวิชาต้องไม่เป็นค่าว่าง")
    }
    else{
        var id = $("#editId"+categoryId).val();
        var name = $("#editData"+categoryId).val();
        var oldId = $("#id"+categoryId).text();
        var oldName = $("#data"+categoryId).text();
        alert(id+" "+oldId+" "+name+" "+oldName);
        var dataResponse = $.ajax({
            type: "POST",
            url: "/TDCS/exam/editCategory",
            //data: "id="+id+"&name="+name,
            data: {
              categoryId: id,
              categoryName: name,
              oldId: oldId,
              oldName: oldName
            },
            complete: function (xhr) {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        viewCategory();
                    }
                    else {
                        alert("การอัพเดทข้อมูลผิดพลาด"+"\n\n"+"1. กรุณาตรวจสอบรหัสวิชาห้ามซ้ำกัน หรือ"+"\n"+"2. กรุณาตรวจสอบชื่อรายวิชาห้ามซ้ำกัน");
                    }
                } else {
                    alert("การอัพเดทข้อมูลผิดพลาด");
                }
            }
        });
    }
}