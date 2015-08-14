$("document").ready(function(){
    alert('hey');
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
                    '<td><label id="id'+value.id+'">'+value.id+'</label>'+
                    '<input id="id'+value.id+'" class="form-control" type="text" value="'+value.id+'" style="display: none;">'+
                    '<td><label id="labelFor'+value.id+'">'+value.name+'</label>'+
                    '<input id="dataFor'+value.id+'" class="form-control" type="text" value="'+value.name+'" style="display: none;">'+
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