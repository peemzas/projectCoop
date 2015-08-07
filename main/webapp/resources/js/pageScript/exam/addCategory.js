/**
 * Created by PTang_000 on 8/5/2015.
 */

function saveCategory(){

    var categoryName = $("#categoryName").val()

    var dat = $.ajax({
        type:"POST",
        url: "addCategory",
        data: 'name='+categoryName,
        success:function(){
            alert('เพิ่มวิชาสำเร็จ ชื่อวิชา : '+ categoryName);
        },
        fail:function(){
            alert('Fail to add Category');
        }
    }).responseText;
    alert('Finish!!!'+dat);
}