function saveCategory(){
    //alert("hi");

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


