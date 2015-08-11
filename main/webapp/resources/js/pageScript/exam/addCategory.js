/**
 * Created by JOKIZZ on 7/8/2558.
 */



//$(document).ready(function(){
//    alert('เทสไทย')
//})
function saveCategory(){

    var categoryName = $("#categoryName").val()

    var dat = $.ajax({
        type:"POST",
        url: "/TDCS/exam/addCategory",
        data: 'name='+categoryName,
        success:function(){
            alert('เพิ่มวิชา ' +categoryName+' สำเร็จ ');
        },
        error:function(){
            alert('เพิ่มวิชาไม่สำเร็จ');
        }
    }).responseText;

}

