/**
 * Created by wanchana on 18/8/2558.
 */

$(document).ready(function(){

   $("#categoryId").val('');
   $("#categoryName").val('');
   $("#searchNotFound").hide();
   $("#searchCategory").click(function(){
       search();
   });
   $("#resetBtnSearchCategory").on('click', function(){
       $("#categoryId").val('');
       $("#categoryName").val('');
   })
});

function search(){

    var categoryIdRequest = $("#categoryId").val();
    var categoryNameRequest = $("#categoryName").val();

    categoryIdRequest =categoryNameRequest.substr(0,categoryNameRequest.indexOf(' '));
    categoryNameRequest = categoryNameRequest.substr(8);
    alert(categoryIdRequest+'--'+categoryNameRequest);

    var dataResponse = $.ajax({
        type: "POST",
        url: "/TDCS/exam/searchCategory",
        data: {
            id: categoryIdRequest,
            name: categoryNameRequest
        },
        async: false,
        success: function(data){
            $("#tbodyCategory").empty();
            if(data.size == null){
                $("#searchNotFound").show();
            }
            data.forEach(function(value){
                $("#searchNotFound").hide();
                $("#tbodyCategory").append(
                    '<tr>'+
                    '<td class="col-sm-1" style="text-align: center;"><input type="checkbox" cateId="'+value.id+'"/></td>'+
                    '<td class="col-sm-2" style="text-align: center;"><label id="id'+value.id+'">'+value.id+'</label>'+
                    '<input id="editId'+value.id+'" class="form-control" type="text" value="'+value.id+'" style="display: none;">'+
                    '<td><label id="data'+value.id+'">'+value.name+'</label>'+
                    '<input id="editData'+value.id+'" class="form-control" type="text" value="'+value.name+'" style="display: none;">'+
                    '</td>'+
                    '<td class="col-sm-1" style="text-align: center;"><button id="editBtn'+value.id+'" class="btn btn-gray btn-sm" onclick="editCategory(' + "'" + value.id + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button>'+
                    '&nbsp;<button id="updateBtn'+value.id+'" class="btn btn-primary btn-sm" style="display: none;" onclick="updateCategory(' + "'" + value.id + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button></td>'+
                    '</tr>'
                )
            });
        },
        error: function(){
            alert("error");
        }
    })
}