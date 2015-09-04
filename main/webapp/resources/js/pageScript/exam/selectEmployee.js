function searchEmpName(){

    $("#tbodySelectEmployeeName").empty();
    $("#selectAllEmployeeName").hide();
    var userNameRequest = $("#searchEmployeeNameText").val();

    if($("#modalSearchByEmployeeName").hasClass('in') && $("#showEmployeeSelected").children().length == 0){
        var dataResponse = $.ajax({
            type: "POST",
            url: "/TDCS/exam/selectEmployee",
            data: {
                userName: userNameRequest
            },
            async: false,
            success: function(data){
                //alert(data.length);
                if(data.length == 0){
                    $("#tbodySelectEmployeeName").empty();
                    $("#dataNotFound").show();
                }
                else{
                    $("#tbodySelectEmployeeName").empty();
                    $("#dataNotFound").hide();
                    $("#selectAllEmployeeName").show();
                    $("#selectAllEmployeeName").prop("checked", false);
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
                }
            },
            error: function(){
                alert("เกิดข้อผิดพลาด");
            }
        });
    }
    if($("#modalSearchByEmployeeName").hasClass('in') && $("#showEmployeeSelected").children().length > 0){
        var i;
        var arrayEmpNameToQuery = new Array();
        var itemLenght = ($("#showEmployeeSelected").children("button")).length;
        for(i = 0; i < itemLenght; i++){
            var temp = $("#showEmployeeSelected").children("button")[i].innerHTML;
            temp = temp.substr(0, temp.indexOf(' '));
            temp.toString();
            arrayEmpNameToQuery.push(temp);
        }
        var jsonObj = {};
        var tempArray = new Array();
        for(var idx = 0; idx < arrayEmpNameToQuery.length; idx ++){
            var item = {
                "thFname" : arrayEmpNameToQuery[idx],
                "empName" : userNameRequest
            };
            tempArray.push(item);
        }
        jsonObj = JSON.stringify(tempArray);
        alert(jsonObj);

        var dataResponse = $.ajax({
            type: "POST",
            url: "/TDCS/exam/selectEmployeeNotInSelected",
            dataType: "json",
            contentType: 'application/json',
            mimeType: 'application/json',
            data: jsonObj,
            //data:{
            //    userName: userNameRequest,
            //    jsonObj
            //},
            async: false,
            success: function(data){
                if(data.length == 0){
                    $("#tbodySelectEmployeeName").empty();
                    $("#dataNotFound").show();
                }
                else{
                    $("#tbodySelectEmployeeName").empty();
                    $("#dataNotFound").hide();
                    $("#selectAllEmployeeName").show();
                    $("#selectAllEmployeeName").prop("checked", false);
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
                }

            },
            error: function(){
                alert('เกิดข้อผิดพลาด');
            }
        });
    }

    //var dataResponse = $.ajax({
    //    type: "POST",
    //    url: "/TDCS/exam/selectEmployee",
    //    data: {
    //        userName: userNameRequest
    //    },
    //    async: false,
    //    success: function(data){
    //        //alert(data);
    //        $("#tbodySelectEmployeeName").empty();
    //        data.forEach(function(value){
    //            //alert(value.userName);
    //            $("#tbodySelectEmployeeName").append(
    //                '<tr>'+
    //                    '<td><input type="checkbox" class="userSelectCheckbox" checkId="'+value.userId+'"></td>'+
    //                    '<td><label id="label1'+value.userId+'">'+value.empId+'<label></td>'+
    //                    '<td><label id="label2'+value.userId+'">'+value.thFname+' '+value.thLname+'<label></td>'+
    //                    '<td><label id="label3'+value.userId+'">'+value.sectionPosition.position.posiName+'<label></td>'+
    //                    '<td><label id="label4'+value.userId+'">'+value.team.teamName+'<label></td>'+
    //                '</tr>'
    //            )
    //
    //        });
    //    },
    //    error: function(){
    //        alert("เกิดข้อผิดพลาด");
    //    }
    //});
    $("#searchEmployeeNameText").val('');
    $("#selectAllEmployeeName").prop("checked", false);
}

function addEmployee(){

    alert('hi');

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
