

$("#dropdownExamEmp").attr('class', 'dropdown-toggle active');

$("document").ready(function(){
    viewCategory();
    $("#deleteCategory").on('click', function(){
        deleteCategory();
    });
    $("#submitCreateCategoryBtn").on('click', function(){
        saveCategory();
    });
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
                    '<td class="col-sm-1" style="text-align: center;"><input type="checkbox" cateId="'+value.id+'"/></td>'+
                    '<td class="col-sm-2" style="text-align: center;"><label id="id'+value.id+'">'+value.id+'</label>'+
                    '<input id="editId'+value.id+'" class="form-control" type="text" value="'+value.id+'" style="display: none;">'+
                    '<td><label id="data'+value.id+'">'+value.name+'</label>'+
                    '<input id="editData'+value.id+'" class="form-control" type="text" value="'+value.name+'" style="display: none;">'+
                    '</td>'+
                    '<td class="col-sm-1" style="text-align: center;"><button id="editBtn'+value.id+'" class="btn btn-gray btn-sm" onclick="editCategory(' + "'" + value.id + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button>'+
                    '&nbsp;<button id="updateBtn'+value.id+'" class="btn btn-primary btn-sm" style="display: none;" onclick="updateCategory(' + "'" + value.id + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button></td>'+
                        //'<td style="text-align: center;"><button class="btn btn-danger" id="deleteBtn'+value.id+'" type="button" onclick="deleteCategory('+ "'" +value.id+ "'"+')"><span class="glyphicon glyphicon-trash"></span></button></td>'+
                    '</tr>'
                )
            });
        },
        error: function(data){
            alert('error while request...');
        }
    });
}

function deleteCategory(){
    if(!confirm("คุณต้องการลบหมวดหมู่ที่เลือกใช่หรือไม่")){
        return false;
    }
    var catId;
    $("#tblCategory input:checkbox:checked").each(function(){
        catId = $(this).parent().siblings(":first").text();
        //if(!confirm("ลบรายวิชา "+$("#data"+catid).text())+"ใช่หรือไม่"){
        //    return false;
        //}
        $.ajax({
            type: "POST",
            url: "/TDCS/exam/deleteCategory",
            data: {
                catId : catId
            },
            success: function(){
                alert("ลบวิชาสำเร็จ");
                window.location.reload();
            },
            error: function(){
                alert("ลบวิชาไม่สำเร็จ");
            }
        });
    });
    //alert(categoryIds+" "+categoryIds.length);
    //var jsonObj = {};
    //var tempArray = new Array();
    //for(var i = 0; i < categoryIds.length; i++){
    //    var item = {
    //        "categoryId" : categoryIds[i]
    //    };
    //    tempArray.push(item);
    //}
    //jsonObj = JSON.stringify(tempArray);
    //$.ajax({
    //    type: "POST",
    //    url: "/TDCS/exam/deleteCategory",
    //    dataType: "json",
    //    contentType: 'application/json',
    //    mimeType: 'application/json',
    //    data: jsonObj,
    //    success: function(){
    //        alert("Success...");
    //        window.location.reload();
    //    },
    //    error: function(){
    //        alert("Error...");
    //    }
    //});
}
function editCategory(categoryId){

    $("#editBtn"+categoryId).hide();
    $("#data"+categoryId).hide();
    $("#thEdit").text("บันทึก");
    $("#editData"+categoryId).show();
    $("#updateBtn"+categoryId).show();
}

function updateCategory(categoryId){

    if($("#editData"+categoryId).val() == ""){
        alert("ชื่อหมวดหมู่ต้องไม่เป็นค่าว่าง")
    }
    else{
        var id = $("#id"+categoryId).text();
        var name = $("#editData"+categoryId).val();
        var dataResponse = $.ajax({
            type: "POST",
            url: "/TDCS/exam/editCategory",
            data: "id="+id+"&name="+name,
            complete: function (xhr) {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        alert("แก้ไขหมวดหมู่เรียบร้อยแล้ว");
                        viewCategory();
                    }
                    else {
                        alert("การอัพเดทข้อมูลผิดพลาด");
                    }
                } else {
                    alert("การอัพเดทข้อมูลผิดพลาด");
                }
            }
        });
    }
}

function saveCategory(){

    var categoryName = $("#categoryNameText").val();
    var categoryId = $("#categoryIdText").val();

    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllCategory",
        async: false,
        success: function (data) {
            data.forEach(function (value) {
                if (Number($("#categoryIdText").val()) == Number(value.id) && $("#categoryNameText").val() == value.name) {
                    alert("รหัสวิชา " + $("#categoryId").val() + ", รายวิชา " + $("#categoryNameText").val() + " มีอยู่แล้วในระบบ");
                }
                if (Number($("#categoryIdText").val()) == Number(value.id)) {
                    //alert("รหัสวิชา "+$("#categoryId").val()+" ซ่ำ");
                    alert("รหัสวิชา " + $("#categoryId").val() + " มีอยู่แล้วในระบบ");
                }
                if ($("#categoryNameText").val() == value.name) {
                    alert("รายวิชา " + $("#categoryName").val() + " มีอยู่แล้วในระบบ");
                }
            });

            if($("#categoryIdText").val() == "" || $("#categoryNameText").val() == ""){

                alert("hi there..");
            }

            var dat = $.ajax({
                type: "POST",
                url: "/TDCS/exam/addCategory",
                data: 'id=' + categoryId + '&name=' + categoryName,
                success: function () {
                    alert('เพิ่มวิชา ' + categoryName + ' สำเร็จ ');
                    window.location.reload();
                },
                error: function () {
                    alert('เพิ่มวิชาไม่สำเร็จ');
                }
                //}).responseText;
            });
        },
        error: function (data) {
            alert('error while request...');
        }
    });

    $("#categoryNameText").val("");
    $("#categoryIdText").val("");
}


