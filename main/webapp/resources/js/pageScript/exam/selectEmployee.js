function searchEmpName(){
    $('.modalSearchByEmployeeNameSubmitBtn').unbind('click').click(function(){
        $("#modalSearchByEmployeeName").modal("hide");
    });

    $('.modalSearchByEmployeeNameCloseBtn').unbind('click').click(function(){
        $("#modalSearchByEmployeeName").modal("hide");
    });

    $('#searchBtnFromModalSearchEmployee').unbind('click').click(function(){
        searchEmpName();
    });

    $("#addEmployeeBtn").unbind('click').click(function(){
        $("#modalSearchByEmployeeName").modal("hide");
        addEmployee();
    });

    $("#tbodySelectEmployeeName").empty();
    $("#selectAllEmployeeName").hide();
    var userNameRequest = $("#searchEmployeeNameText").val();

    if($("#modalSearchByEmployeeName").hasClass('in') && $("#showEmployeeSelected").children().length == 0){
        //alert('1');
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
                            '<tr style="text-align: center;">'+
                            '<td><input type="checkbox" class="userSelectCheckbox" checkId="'+value.userId+'"></td>'+
                            '<td style="display: none;"><label>'+value.userId+'<label></td>'+
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
        //alert('2');
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

        var dataResponse = $.ajax({
            type: "POST",
            url: "/TDCS/exam/selectEmployeeNotInSelected",
            dataType: "json",
            contentType: 'application/json',
            mimeType: 'application/json',
            data: jsonObj,
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
                            '<td style="text-align: center;"><input type="checkbox" class="userSelectCheckbox" checkId="'+value.userId+'"></td>'+
                            '<td style="display: none;"><label>'+value.userId+'<label></td>'+
                            '<td style="text-align: center;"><label id="label1'+value.userId+'">'+value.empId+'<label></td>'+
                            '<td style="text-align: center;"><label id="label2'+value.userId+'">'+value.thFname+' '+value.thLname+'<label></td>'+
                            '<td style="text-align: center;"><label id="label3'+value.userId+'">'+value.sectionPosition.position.posiName+'<label></td>'+
                            '<td style="text-align: center;"><label id="label4'+value.userId+'">'+value.team.teamName+'<label></td>'+
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
    $("#searchEmployeeNameText").val('');
    $("#selectAllEmployeeName").prop("checked", false);
}

function addEmployee(){

    $("#tbodySelectEmployeeName input:checkbox:checked").each(function(){
        var uId= $(this).parent().siblings().map(function(){
            return $(this).text().trim();
        }).get(0);
        var arrayEmployeeName = $(this).parent().siblings().map(function(){
            return $(this).text().trim();
        }).get();

        $("#showEmployeeSelected").append(

            '<button class="btn btn-sm" type="button" style="background-color: #cbff9e; border: 1px solid #f4ffdb;">'+arrayEmployeeName[2]+
                '<label style="display: none;">'+"_"+uId+"z"+'</label>'+
            '<span class="glyphicon glyphicon-remove"/></button>&nbsp;'
        );
        $("#showEmployeeSelected").cleanWhitespace();
    });

    $("#showEmployeeSelected button").on("click", function(){
        $(this).remove();
        $("#showEmployeeSelected").cleanWhitespace();
    });
}

function getEmployee(){
    var dataResponse = $.ajax({
        type: "POST",
        url: "/TDCS/exam/selectEmployee",
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
                        '<tr style="text-align: center;">'+
                        '<td><input type="checkbox" class="userSelectCheckbox" checkId="'+value.userId+'"></td>'+
                        '<td style="display: none;"><label>'+value.userId+'<label></td>'+
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

jQuery.fn.cleanWhitespace = function() {
    textNodes = this.contents().filter(
        function() {
            return (this.nodeType == 3 && !/\S/.test(this.nodeValue));
        }).remove();
    return this;
};