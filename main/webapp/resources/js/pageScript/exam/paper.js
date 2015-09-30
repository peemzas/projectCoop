$(document).ready(function(){
    $.ajax({
        type : "POST",
        url : "/TDCS/exam/getAllPapers",
        contentType: "application/json",
        async : true,
        success : function(data){
            $("#tbManagePaper tbody").empty();
            data.forEach(function(value){
                $("#tbManagePaper tbody").append(
                    '<tr>'+
                        '<td><input type="checkbox" class="form-control"/></td>'+
                        '<td><label id="lpaperCode'+value.code+'" class="label-control">'+value.code+'</label></td>'+
                        '<td><label id="lpaperName'+value.name+'" class="label-control">'+value.name+'</label></td>'+
                        //'<td><label id="lpaperCreateBy'+value.createBy.empId+'" class="label-control"></label></td>'+
                        '<td><label id="lpaperScore'+value.maxScore+'" class="label-control">'+value.maxScore+'</label></td>'+
                    '</tr>'
                )
            });
        }
    });
});