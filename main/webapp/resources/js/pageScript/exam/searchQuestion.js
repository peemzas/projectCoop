$(document).ready(function(){

});
function generalSearchQuestion(){
    var i;
    var arrayEmpNameToQuery = new Array();
    var itemLenght = ($("#showEmployeeSelected").children("button")).length;
    for(i = 0; i < itemLenght; i++){
        var temp = $("#showEmployeeSelected").children("button")[i].innerHTML;
        temp = temp.substr(0, temp.indexOf(' '));
        temp.toString();
        arrayEmpNameToQuery.push(temp);
    }

    //converse array to JSON
    var jsonObj = {};
    var tempArray = new Array();
    for(var idx = 0; idx < arrayEmpNameToQuery.length; idx ++){
        var item = {
          "thFname" : arrayEmpNameToQuery[idx]
        };
        tempArray.push(item);
    }
    jsonObj = JSON.stringify(tempArray);
    //alert(jQuery.type(arrayEmpNameToQuery));
    alert(jsonObj + jQuery.type(jsonObj));

    var dataResponse = $.ajax({
        type: "POST",
        url: "/TDCS/exam/generalQuestionSearch",
        dataType: "json",
        contentType: 'application/json',
        mimeType: 'application/json',
        data: jsonObj,
        success: function(){
            //alert('Hi');
        },
        error: function(){
            alert('error');
        }
    });
}