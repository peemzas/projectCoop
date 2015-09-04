//$("document").ready(function(){
//    saveSubCategory();
//    //alert(subcategoryName);
//});

//$(document).ready(function () {
//    $('#subcatform').validate({
//        rules: {
//            subcategoryNameadd: {
//                minlength: 1,
//                required: true
//            }
//        },
//        highlight: function (element) {
//            $(element).closest('.row').removeClass('success').addClass('error');
//        },
//        success: function (element) {
//            element.text('OK!').addClass('valid')
//                .closest('.control-group').removeClass('error').addClass('success');
//        }
//    });
//
//});





//
//    jQuery.validator.setDefaults({
//        debug: true,
//        success: "valid"
//    });
//$( "#subcatform" ).validate({
//    rules: {
//        subcategoryNameadd: {
//            minlength: 1,
//            required: true
//        }
//    }
//});




//(function($) {
//    var categoryName = $("#sCat").children(":selected").attr("categoryName");
//    var subcategoryNameadd = $("#subcategoryNameadd").val();
//
//    $(subcategoryNameadd).bind('blur', function(e) {
//        var $this = $(this);
//        if (subcategoryNameadd.length < 1 || subcategoryNameadd ==null || categoryName=="") {
//            alert('คุณกรอกข้อมูลไม่ครบ');
//
////                $("#Amount").focus();
////            $this.attr('style','border:solid 1px red');
//            return false;
//        }
//        else{
//            $this.attr('style','');
//            //$('#subcategoryNameadd').attr('style','');
//
//            alert('คุณกรอกข้อมูลไม่ครบ2');
//
//        }
//    });
//})(jQuery);

function checkEmpty(){

    var countError = 0;
    var elementFirst;
    var element = [ $("#subcategoryNameadd")];
    //if($("#password").val()!=$("#cpassword").val()){
    //    $("#password").val("");
    //    $("#cpassword").val("");
    //}
    for(var i=0;i<element.length;i++){
        if(element[i].val()==""){
//            alert(element[i].val()+"~~~"+element[i].selector);
            countError++;
            if(countError==0){
                elementFirst = element[i].selector;
            }
            element[i].attr('style','border:solid 1px red');
        }else{
            element[i].attr('style','');
        }
    }
    if(countError>0){
//        alert(elementFirst);
//        $("#btnSubmit").click();
        alert("คุณกรอกข้อมูลไม่ครบ");
        return false;
    }
//    if( $("#startTime").val()==""||$("#endTime").val()==""|| $("#birthday").val()==""){
//        alert("คุณกรอกข้อมูลไม่ครบ");
//        return false;
//    }
//
//    if($("#stuid").val().length<6){
//        $("#stuid").change();
//        setTimeout(function(){$("#stuid").focus()}, 1);
//        return false;
//    }
//
//    if($("#password").val().length<6){
//        $("#password").blur();
//        setTimeout(function(){$("#password").focus()}, 1);
//        return false;
//    }
//
//    if($("#telHome").val().length<10&&$("#telHome").val().length>0){
//        $("#telHome").blur();
//        setTimeout(function(){$("#telHome").focus()}, 1);
//        return false;
//    }

    if($("#subcategoryNameadd").val().length<10){
        $("#subcategoryNameadd").blur();
        setTimeout(function(){$("#subcategoryNameadd").focus()}, 1);
        return false;
    }

    if (confirm('====== ยืนยันการเพิ่มข้อมูล ? ======')) {
        saveData();
        alert("บันทึกข้อมูลสำเร็จ");
    }
}

function saveSubCategory() {
    var countError = 0;
    var elementFirst;
    var element = [ $("#subcategoryNameadd"), $("#sCat")];
    //if($("#password").val()!=$("#cpassword").val()){
    //    $("#password").val("");
    //    $("#cpassword").val("");
    //}
    for(var i=0;i<element.length;i++){
        if(element[i].val()==""){
//            alert(element[i].val()+"~~~"+element[i].selector);
            countError++;
            if(countError==0){
                elementFirst = element[i].selector;
            }
            element[i].attr('style','border:solid 1px red');
        }else{
            element[i].attr('style','');
        }
    }
    if(countError>0){
//        alert(elementFirst);
//        $("#btnSubmit").click();
        alert("คุณกรอกข้อมูลไม่ครบ");
        return false;
    }


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

            if ($("#subcategoryNameadd").val().length < 1 || categoryName ==null || categoryId =="") {
                alert("คุณกรอกข้อมูลไม่ครบ");
            }
            if (Number($("#categoryId").val()) == Number(value.id) && $("#categoryName").val() == value.name) {
                alert("รหัสวิชา " + $("#categoryId").val() + ", รายวิชา " + $("#categoryName").val() + " มีอยู่แล้วในระบบ");
            }
            if (Number($("#categoryId").val()) == Number(value.id)) {
                //alert("รหัสวิชา "+$("#categoryId").val()+" ซ่ำ");
                alert("รหัสวิชา " + $("#categoryId").val() + " มีอยู่แล้วในระบบ");
            }
            if ($("#subcategoryNameadd").val() == value.subName) {
                alert(" หัวข้อเรื่อง " + $("#subcategoryNameadd").val() + " มีอยู่แล้วในระบบ");
            }

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