/**
 * Created by PTang_000 on 8/5/2015.
 */


//$(document).ready(function(){
//    alert('เทสไทย')
//})
function saveCategory(){

    var categoryName = $("#categoryName").val()

    var dat = $.ajax({
        type:"POST",
        url: "addCategory",
        data: 'name='+categoryName,
        success:function(){
            alert('เพิ่มวิชา ' +categoryName+' สำเร็จ ')
        },
        error:function(){
            alert('เพิ่มวิชาไม่สำเร็จ');
        }
    }).responseText;

}

