/**
 * Created by JOKIZZ on 7/8/2558.
 */



//$(document).ready(function(){
//    alert('เทสไทย')
//})
function saveCategory(){

    var categoryName = $("#categoryName").val();
    var categoryId = $("#categoryId").val();

    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllCategory",
        async: false,
        success: function(data){
            data.forEach(function(value){
                if(Number($("#categoryId").val()) == Number(value.id) && $("#categoryName").val() == value.name){
                    alert("รหัสวิชา "+$("#categoryId").val()+", รายวิชา "+$("#categoryName").val()+" มีอยู่แล้วในระบบ");
                }
                if(Number($("#categoryId").val()) == Number(value.id)){
                    //alert("รหัสวิชา "+$("#categoryId").val()+" ซ่ำ");
                    alert("รหัสวิชา "+$("#categoryId").val()+" มีอยู่แล้วในระบบ");
                }
                if($("#categoryName").val() == value.name){
                    alert("รายวิชา "+$("#categoryName").val()+" มีอยู่แล้วในระบบ");
                }
            });

            var dat = $.ajax({
                type:"POST",
                url: "/TDCS/exam/addCategory",
                data: 'id='+categoryId +'&name='+categoryName,
                success:function(){
                    alert('เพิ่มวิชา ' +categoryId+'  '+categoryName+' สำเร็จ ');
                },
                error:function(){
                    alert('เพิ่มวิชาไม่สำเร็จ');
                }
            }).responseText;

        },
        error: function(data){
            alert('error while request...');
        }
}

