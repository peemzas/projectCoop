function generalSearchQuestion(){

    //$("#showEmployeeSelected").remove();
    //var emp = $("#showEmployeeSelected").children("button")[1].innerHTML;
    //emp.split(' ');
    //var emp = $("#showEmployeeSelected").children("button")[1].text();
    var i;
    var arrayEmpNameToQuery = new Array();
    var itemLenght = ($("#showEmployeeSelected").children("button")).length;
    //alert(emp);
    for(i = 0; i < itemLenght; i++){
        var temp = $("#showEmployeeSelected").children("button")[i].innerHTML;
        temp = temp.substr(0, temp.indexOf(' '));
        temp.toString();
        arrayEmpNameToQuery.push(temp);
        //alert(JSON.stringify(arrayEmpNameToQuery));
    }
    alert(jQuery.type(arrayEmpNameToQuery));
    alert(arrayEmpNameToQuery);
    //jQuery.type(arrayEmpNameToQuery);
    //emp = emp.substr(0, emp.indexOf(' '));
    //alert(emp);

    var dataResponse = $.ajax({
        type: "POST",
        url: "/TDCS/exam/generalQuestionSearch",
        data: {
            arrayEmpNameToQuery: arrayEmpNameToQuery
        },
        success: function(){
            alert('Hi');
        },
        error: function(){
            alert('error');
        }
    });
}