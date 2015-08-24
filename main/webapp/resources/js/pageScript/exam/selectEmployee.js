function searchEmpName(){

    //alert("hi" + $("#searchEmployeeNameText").val());
    var userNameRequest = $("#searchEmployeeNameText").val();

    var dataResponse = $.ajax({
        type: "POST",
        url: "/TDCS/exam/selectEmployee",
        data: {
            userName: userNameRequest
        },
        async: false,
        success: function(data){
            //alert(data);
            $("#tbodySelectEmployeeName").empty();
            data.forEach(function(value){
                //alert(value.userName);
                $("#tbodySelectEmployeeName").append(
                    '<tr>'+
                        '<td><input type="checkbox" class="userSelectCheckbox" checkId="'+value.userId+'"></td>'+
                        '<td><label id="label1'+value.userId+'">'+value.empId+'<label></td>'+
                        '<td><label id="label2'+value.userId+'">'+value.thFname+' '+value.thLname+'<label></td>'+
                        '<td><label id="label3'+value.userId+'">'+value.sectionPosition.position.posiName+'<label></td>'+
                        '<td><label id="label4'+value.userId+'">'+value.team.teamName+'<label></td>'+
                    '</tr>'
                )

            });
        },
        error: function(){
            alert("เกิดข้อผิดพลาด");
        }
    });
}

function addEmployee(){

    $("#tbodySelectEmployeeName input:checkbox:checked").each(function(){

        var arrayEmployeeName = $(this).parent().siblings().map(function(){
            return $(this).text().trim();
        }).get();

        //$("#show").append(JSON.stringify(arrayEmployeeName));
        //alert(JSON.stringify(arrayEmployeeName));
        //alert(arrayEmployeeName[1]);
        $("#showEmployeeSelected").append(
            '<button class="btn btn-sm" type="button" style="background-color: #e7fff5; border: 1px solid gray;">'+arrayEmployeeName[1]+'&nbsp;' +
            '<span class="glyphicon glyphicon-remove"/></button>&nbsp;'
        );
    });

    $("#showEmployeeSelected button").on("click", function(){
        //alert("hi");
        $(this).remove();
        //return false;
    });
//this is an object that contain many value checked.
    //$('input:checkbox[name=checkme]').is(':checked');
}
