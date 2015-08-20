/**
 * Created by wanchana on 18/8/2558.
 */

$(document).ready(function(){
   $("#searchCategory").click(function(){
       //alert("hi");
       search();
   });
});

function search(){

    var categoryIdRequest = $("#categoryId").val();
    var categoryNameRequest = $("#categoryName").val();

    var dataResponse = $.ajax({
        type: "POST",
        url: "/TDCS/exam/searchCategory",
        data: {
            //id: categoryId,
            id: categoryIdRequest,
            name: categoryNameRequest
        },
        async: false,
        success: function(data){
            //alert(data.id + " "+ data.name);
            //$("#tbodyCategory").hide();
            $("#tbodyCategory").empty();
            data.forEach(function(value){
                //$("#tbodyCategory").empty();

                $("#tbodyCategory").append(
                    '<tr>'+
                    '<td style="text-align: center;"><label id="id'+value.id+'">'+value.id+'</label>'+
                    '<input id="editId'+value.id+'" class="form-control" type="text" value="'+value.id+'" style="display: none;">'+
                    '<td><label id="data'+value.id+'">'+value.name+'</label>'+
                    '<input id="editData'+value.id+'" class="form-control" type="text" value="'+value.name+'" style="display: none;">'+
                    '</td>'+
                    '<td style="text-align: center;"><button id="editBtn'+value.id+'" class="btn btn-gray" onclick="editCategory(' + "'" + value.id + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button>'+
                    '&nbsp;<button id="updateBtn'+value.id+'" class="btn btn-primary" style="display: none;" onclick="updateCategory(' + "'" + value.id + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button></td>'+
                    '<td style="text-align: center;"><button class="btn btn-danger" id="deleteBtn'+value.id+'" type="button" onclick="deleteCategory('+ "'" +value.id+ "'"+')"><span class="glyphicon glyphicon-trash"></span></button></td>'+
                    '</tr>'
                )
            });
        },
        error: function(){
            alert("error");
        }
    })
}