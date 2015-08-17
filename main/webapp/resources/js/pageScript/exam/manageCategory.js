$("document").ready(function(){

    viewCategory();
});
function viewCategory(){
    $("#tbodyCategory").empty();

    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllCategory",
        async: false,
        success: function(data){
            data.forEach(function(value){
                $("#tbodyCategory").append(
                    '<tr>'+
                    '<td style="text-align: center;"><label id="id'+value.id+'"><b>'+value.id+'</b></label>'+
                    '<input id="id'+value.id+'" class="form-control" type="text" value="'+value.id+'" style="display: none;">'+
                    '<td style="text-align: center;"><label id="labelFor'+value.id+'">'+value.name+'</label>'+
                    '<input id="dataFor'+value.id+'" class="form-control" type="text" value="'+value.name+'" style="display: none;">'+
                    '</td>'+

                    '<td style="text-align: center">'+
                                '<button type="button" class="btn btn-gray"><span class="glyphicon glyphicon-pencil"></span></button>'+' '+


                    '<button class="btn btn-danger" type="button" onclick="deleteCategory('+ "'" +value.id+ "'"+')"> <span class="glyphicon glyphicon-trash"></span></button>'+
                    '</td>'+
                    '</tr>'
                )
            });
        },
        error: function(data){
            alert('error while request...');
        }
    });
}


function deleteCategory(categoryId){

    if(!confirm("แน่ใจนะว่าคุณจะลบ")){
        return false;
    }
    $.ajax({
       type: "POST",
       url: "/TDCS/exam/deleteCategory",
       data:{
           id: categoryId
       },
       async: false,
       success:function(){
           alert(' ลบวิชาสำเร็จ ');
           window.location.reload();
       }
    });
}


