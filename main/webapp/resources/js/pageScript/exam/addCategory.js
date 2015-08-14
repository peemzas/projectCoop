/**
 * Created by JOKIZZ on 7/8/2558.
 */



//$(document).ready(function(){
//    alert('เทสไทย')
//})
function saveCategory(){

    var categoryName = $("#categoryName").val()
    var categoryId = $("#categoryId").val()

    var dat = $.ajax({
        type:"POST",
        url: "/TDCS/exam/addCategory",
        data: 'id='+categoryId +'&name='+categoryName,
        success:function(){
            alert('เพิ่มวิชา ' +categoryId+'  '+categoryName+' สำเร็จ ');
            window.location.reload();
        },
        error:function(){
            alert('เพิ่มวิชาไม่สำเร็จ');
        }
    }).responseText;
}

