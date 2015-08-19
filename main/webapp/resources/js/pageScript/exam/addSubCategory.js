//$("document").ready(function(){
//    saveSubCategory();
//    alert(subcategoryName);
//});


function saveSubCategory(){

    var categoryId = $("#sCat").val();
    var categoryName = $("#sCat").children(":selected").attr("categoryName");
    var subcategoryName = $("#subcategoryName").val();
    alert(categoryId+' '+categoryName+' '+subcategoryName);

    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllSubCategory",
        async: false,
        success: function (data) {
            //data.forEach(function (value) {

                //if (Number($("#categoryId").val()) == Number(value.id) && $("#categoryName").val() == value.name) {
                //    alert("รหัสวิชา " + $("#categoryId").val() + ", รายวิชา " + $("#categoryName").val() + " มีอยู่แล้วในระบบ");
                //}
                //if (Number($("#categoryId").val()) == Number(value.id)) {
                //    //alert("รหัสวิชา "+$("#categoryId").val()+" ซ่ำ");
                //    alert("รหัสวิชา " + $("#categoryId").val() + " มีอยู่แล้วในระบบ");
                //}
                //if ($("#categoryName").val() == value.name) {
                //    alert("รายวิชา " + $("#categoryName").val() + " มีอยู่แล้วในระบบ");
                //}
            //});

            var dat = $.ajax({
                type: "POST",
                url: "/TDCS/exam/addSubCategory",
                data: 'id=' + categoryId + '&name=' + subcategoryName,
                success: function () {
                    alert('เพิ่มหัวข้อเรื่อง ' + subcategoryName);
                },
                error: function () {
                    alert('เพิ่มหัวข้อเรื่องไม่สำเร็จ');
                }

            }).responseText;


        }
        //,
        //error: function (data) {
        //    alert('error while request...');
        //}
    });
}