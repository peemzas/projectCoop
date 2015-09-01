//$("document").ready(function(){
//    saveSubCategory();
//    //alert(subcategoryName);
//});
(function($) {

    $('#subcategoryNameadd').bind('blur', function(e) {
        var $this = $(this)
        if ($this.val().length < 1 || $("#categoryId").val() ==null) {
            alert('คุณกรอกรหัสผ่านไม่ครบ');
//                $("#Amount").focus();
//            $this.attr('style','border:solid 1px red');
            return false;
        }else{
            //$this.attr('style','');
            //$('#subcategoryNameadd').attr('style','');

            alert('คุณกรอกรหัสผ่านไม่ครบ');
            return false;
        }
    });
})(jQuery);

function saveSubCategory() {

    var categoryId = $("#sCat").val();
    var categoryName = $("#sCat").children(":selected").attr("categoryName");
    var subcategoryNameadd = $("#subcategoryNameadd").val();


    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllSubCategory",
        async: false,
        success: function (data) {
            //alert(subcategoryNameadd);
            data.forEach(function (value) {

            //if (Number($("#categoryId").val()) == Number(value.id) && $("#categoryName").val() == value.name) {
            //    alert("รหัสวิชา " + $("#categoryId").val() + ", รายวิชา " + $("#categoryName").val() + " มีอยู่แล้วในระบบ");
            //}
            //if (Number($("#categoryId").val()) == Number(value.id)) {
            //    //alert("รหัสวิชา "+$("#categoryId").val()+" ซ่ำ");
            //    alert("รหัสวิชา " + $("#categoryId").val() + " มีอยู่แล้วในระบบ");
            //}
            //if ($("#subcategoryNameadd").val() == value.subName) {
            //    alert(" หัวข้อเรื่อง " + $("#subcategoryNameadd").val() + " มีอยู่แล้วในระบบ");
            //}
            //
            //if ($("#subcategoryNameadd").val() == "" || $("#categoryId").val() == "") {
            //    alert(" กรุณากรอกข้อมูลให้ครบ ");
            //    //this.xhr.abort();
            //}
            //alert(" not show ")

            });

            var dat = $.ajax({
                type: "POST",
                url: "/TDCS/exam/addSubCategory",
                data: {
                    categoryId: categoryId,
                    subcategoryNameadd: subcategoryNameadd
                },
                success: function () {
                    alert('เพิ่มหัวข้อเรื่อง ' + subcategoryNameadd);
                    //$("#tbodySubCategory").empty();
                    //viewSubCategory();
                    window.location.reload();

                },
                error: function () {
                    alert('เพิ่มหัวข้อเรื่องไม่สำเร็จ');
                }

            }).responseText;


        }

        ,
        error: function (data) {
            alert('error while request...');
        }


    });
}