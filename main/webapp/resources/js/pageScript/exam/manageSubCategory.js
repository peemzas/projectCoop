/**
 * Created by JOKIZZ on 17/8/2558.
 */
$("document").ready(function(){
    //alert('hi')
    viewSubCategory();
});
function viewSubCategory(){
    $("#tbodySubCategory").empty();

    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllSubCategory",
        async: false,
        success: function(data){
            data.forEach(function(value){
                $("#tbodySubCategory").append(
                    '<tr>'+

                    '<td style="text-align: center;"><label id="id'+value.id+'"><b>'+value.id+'</b></label>'+

                    //'<input id="id'+value.id+'" class="form-control" type="text" value="'+value.id+'" style="display: none;">'+
                    '<td style="text-align: center;"><label id="labelFor'+value.id+'">'+value.name+'</label>'+
                    '<input id="dataFor'+value.id+'" class="form-control" type="text" value="'+value.name+'" style="display: none;">'+
                    '</td>'+

                    '<td style="text-align: center;"><label id="subId'+value.subId+'"><b>'+value.subId+'</b></label>'+

                    '<td style="text-align: center;"><label id="labelFor'+value.id+'">'+value.subName+'</label>'+
                    '<input subId="dataFor'+value.subId+'" class="form-control" type="text" value="'+value.subName+'" style="display: none;">'+

                    '<td style="text-align: center">'+
                    '<button type="button" class="btn btn-gray"><span class="glyphicon glyphicon-pencil"></span></button>'+' '+



                    '<button class="btn btn-danger" type="button" onclick="deleteSubCategory('+ "'" +value.subId+ "'"+')"> <span class="glyphicon glyphicon-trash"></span></button>'+
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


function deleteSubCategory(subCategoryId){

    if(!confirm("แน่ใจนะว่าคุณจะลบ " +subCategoryId)){

        return false;
    }
    $.ajax({
        type: "POST",
        url: "/TDCS/exam/deleteSubCategory",
        data:{
            id: subCategoryId
        },
        async: false,
        success:function(){
            alert(' ลบวิชาสำเร็จ ');
            window.location.reload();
        },
        error: function(deleteSubCategory){
            alert('error Delete...');
        }
    });
}


