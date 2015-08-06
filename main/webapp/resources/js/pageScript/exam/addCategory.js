/**
 * Created by PTang_000 on 8/5/2015.
 */

function saveData(){
    var datasend = 'categoryName='+$("#categoryName").val()
                    +'createBy='+'Mr.Testy';

    var dat = $.ajax({
        type:"POST",
        url: "TDCS/exam/addCategory",
        data: datasend,
        success:function(){
            alert('การเพิ่มวิชาประสบผลสำเร็จ');
        }
    }).responseText;

}