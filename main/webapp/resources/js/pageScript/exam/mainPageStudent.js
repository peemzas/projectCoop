/**
 * Created by Phuthikorn_T on 21/10/2558.
 */

$('.doExamBtn').on('click',function(){
    var confirmation = confirm('เริ่มทำข้อสอบ')
    if(confirmation){
        location.href = $(this).attr("location");
    }
})