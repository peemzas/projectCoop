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
            alert('�����Ԫ������ �����Ԫ� : '+ categoryName);
        },
        fail:function(){
            alert('Fail to add Category');
        }
    }).responseText;
    alert('Finish!!!'+dat);
}