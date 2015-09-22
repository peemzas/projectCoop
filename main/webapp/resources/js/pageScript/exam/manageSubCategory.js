/**
 * Created by JOKIZZ on 17/8/2558.
 */


$("#dropdownExamEmp").attr('class', 'dropdown active');

$(document).ready(function () {
    $("#selectAllSubCategory").on('click', function () {
        if (this.checked) {
            $(".selectSubCategory").each(function () {
                this.checked = true;
            })
        }
        else {
            $(".selectSubCategory").each(function () {
                this.checked = false;
            })
        }
    });

    //$("#tbodySubCategory").on('click', '.selectSubCategory', function () {
    //    alert($(this).attr('subCatId'));
    //});

});


$("document").ready(function () {
    //alert('hi')
    viewSubCategory();
});
function viewSubCategory() {
    $("#tbodySubCategory").empty();
    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllSubCategory",
        async: false,
        success: function (data) {
            data.forEach(function (value) {

                $("#tbodySubCategory").append(
                    '<tr>' +

                        //'<td style="text-align: center;"><label id="catId'+value.id+'"><b>'+value.id+'</b></label>'+
                    '<td style="text-align: center;"><input class="selectSubCategory" type="checkbox" subCatId="' + value.subId + '"></input>' +

                        //'<input id="id'+value.id+'" class="form-control" type="text" value="'+value.id+'" style="display: none;">'+

                    '<td style="text-align: center;"><label id="catName' + value.id + '">' + value.name + '</label>' +

                    '</td>' +

                        //'<td style="text-align: center;"><label id="subId'+value.subId+'"><b>'+value.subId+'</b></label>'+

                    '<td style="text-align: center;"><label id="subName' + value.subId + '">' + value.subName + '</label>' +
                    '<input id="editsubName' + value.subId + '" class="form-control" type="text" value="' + value.subName + '" style="display: none;">' +


                    '<td style="text-align: center">' +
                    '<button id="editBtn' + value.subId + '" type="button" class="btn btn-gray" onclick="editSubCategory(' + "'" + value.subId + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button>' +
                    '&nbsp;<button id="updateBtn' + value.subId + '" class="btn btn-primary" style="display: none;" onclick="updateSubCategory(' + "'" + value.subId + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button></td>' +

                    '</td>' +

                        //'<td style="text-align: center">'+
                        //'<button class="btn btn-danger" type="button" onclick="deleteSubCategory('+ "'" +value.subId+ "'"+')"> <span class="glyphicon glyphicon-trash"></span></button>'+
                        //'</td>'+
                    '</tr>'
                )
            });
        },
        error: function (data) {
            alert('error while request...');
        }
    });
}




function deleteSubCategory(subCategoryId) {
    if (!confirm(" แน่ใจนะว่าคุณจะลบ ")) {
        return false;
    }
    $("#tbodySubCategory input:checkbox:checked").each(function(){
        //categoryIds.push($(this).parent().siblings(":first").text());
        var subCategoryId=($(this).attr('subCatId'));
        //alert (subCategoryId);
        $.ajax({
            type: "POST",
            url: "/TDCS/exam/deleteSubCategory",
            data: {
                id: subCategoryId
            },
            async: false,
            success: function () {
                //$("#tbodySubCategory").empty();
                //viewSubCategory();
            },
            error: function () {
                alert('error Delete...');
            }
        });
    })
    alert(' ลบวิชาสำเร็จ ');
    window.location.reload();
}

function editSubCategory(subcategoryId) {

    $("#editBtn" + subcategoryId).hide();
    $("#subName" + subcategoryId).hide();
    //$("#data"+subcategoryId).hide();


    $("#editsubName" + subcategoryId).show();
    //$("#editData"+subcategoryId).show();
    $("#updateBtn" + subcategoryId).show();
}


function updateSubCategory(subcategoryId) {

    //if ($("#editsubName" + subName).length > 5) {
    //    alert("คุณกรอกรหัสวิชาไม่ถูกต้อง");
    //}
    //else if ($("#editData" + categoryId).val() == "") {
    //    alert("ชื่อวิชาต้องไม่เป็นค่าว่าง")
    //}
    //else {
    //    var id = $("#editId" + categoryId).val();


    var subName = $("#editsubName" + subcategoryId).val();

    if (subName == "") {
        alert("ไม่สามารถเป็นค่าว่างได้");
    }
    //if (subName==$("#editsubName")){
    //    alert("ชื่อซ้ำ");
    //}
    //alert($("#id"+subcategoryId));


    alert(subcategoryId + ' ' + subName);

    var dataResponse = $.ajax({
        type: "POST",
        url: "/TDCS/exam/editSubCategory",
        data: {

            subcategoryId: subcategoryId,
            subcategoryName: subName


        },

        complete: function (xhr) {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    viewSubCategory();
                    //window.   location.reload();
                }

                else {
                    alert("ชื่อซ้ำ");
                }
            } else {
                alert("fail2");
            }
        }
    });
    //}
}


$(document).ready(function () {
    $("#searchSubCategory").on('click', function () {
        search();
    });

    $("#clearsearchinput").on('click', function () {
        clearsearch();
    });
});

function clearsearch() {
    $("#categoryId").val("");
    $("#sSubCat").val("");
}

function search() {
    var categoryId = $("#categoryId").val();
    var subcategoryName = $("#sSubCat").val();


    categoryId = categoryId.substr(0, categoryId.indexOf(' '));


    var dataResponse = $.ajax({
        type: "POST",
        url: "/TDCS/exam/searchSubCategory",
        data: {
            categoryId: categoryId,
            subcategoryName: subcategoryName

        },
        async: false,

        success: function (data) {

            $("#tbodySubCategory").empty();
            if (data.size == null) {
                $("#alertMess").show();
            }

            data.forEach(function (value) {
                //$("#tbodySubCategory").empty();
                console.log(value.SubCategory.name);
                $("#alertMess").hide();
                $("#tbodySubCategory").append(
                    '<tr>' +

                    '<td style="text-align: center;"><input class="selectSubCategory" type="checkbox" subCatId="' + value.SubCategory.id + '">' + value.SubCategory.id + '</input>' +

                        //'<input id="id'+value.id+'" class="form-control" type="text" value="'+value.id+'" style="display: none;">'+
                    '<td style="text-align: center;"><label id="catName' + value.id + '">' + value.category.name + '</label>' +
                    '</td>' +

                        //'<td style="text-align: center;"><label id="subId'+value.subId+'"><b>'+value.subId+'</b></label>'+

                    '<td style="text-align: center;"><label id="subName' + value.SubCategory.id + '">' + value.SubCategory.name + '</label>' +
                    '<input id="editsubName' + value.SubCategory.id + '" class="form-control" type="text" value="' + value.SubCategory.name + '" style="display: none;">' +


                    '<td style="text-align: center">' +
                    '<button id="editBtn' + value.SubCategory.id + '" type="button" class="btn btn-gray" onclick="editSubCategory(' + "'" + value.SubCategory.id + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button>' +
                    '&nbsp;<button id="updateBtn' + value.SubCategory.id + '" class="btn btn-primary" style="display: none;" onclick="updateSubCategory(' + "'" + value.SubCategory.id + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button></td>' +

                    '</td>' +

                    //'<td style="text-align: center">' +
                        //'<button class="btn btn-danger" type="button" onclick="deleteSubCategory('+ "'" +value.SubCategory.id+ "'"+')"> <span class="glyphicon glyphicon-trash"></span></button>'+
                    //'</td>' +
                    '</tr>'
                )

            });

        },
        error: function () {
            alert("error");
        }
    })
}



$("categoryId").keyup(function(e) {
    if (e.which > 0) {
        e.preventDefault();
        LOVCAT();
    }
});
$(function LOVCAT() {
    var availableTags2 = [];

    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllCategory",
        async: false,
        success: function(data){
            data.forEach(function(value){
                    availableTags2.push(value.id + ' : ' + value.name);
            });
        },
        error: function(data){
            alert('error while request...');
        }
    });
    $(".autocomplete2").autocomplete({
        source: availableTags2
    });
});

function listsubcat() {
    alert('kk');

    var availableTagsall = [];

    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllCategory",
        async: false,
        success: function(data){
            data.forEach(function(value){
                availableTagsall.push(value.id + ' : ' + value.name);
            });
        },
        error: function(data){
            alert('error while request...');
        }
    });
    $(".autocompleteall").autocomplete({
        source: availableTagsall
    });
}

//$(function LOVCAT2() {
//
//    var availableTags2 = [];
//
//
//
//    var data = $.ajax({
//        type: "POST",
//        contentType: "application/json",
//        url: "/TDCS/exam/getAllCategory",
//        async: false,
//        success: function(data){
//            data.forEach(function(value){
//                availableTags2.push(value.id + ' : ' + value.name);
//            });
//        },
//        error: function(data){
//            alert('error while request...');
//        }
//    });
//    $('#scrollable-dropdown-menu .typeahead').typeahead(null, {
//        name: 'availableTags2',
//        limit: 2,
//        source: availableTags2
//    });
//
//
//});


//$("subcategoryName").keyup(function(e) {
//    if (e.which > 0) {
//        e.preventDefault();
//        LOVSUB();
//    }
//});
//$(function LOVSUB() {
//    var availableTags = [
//        //"ActionScript", "AppleScript", "Asp", "BASIC", "C", "C++",
//        //"Clojure", "COBOL", "ColdFusion", "Erlang", "Fortran",
//        //"Groovy", "Haskell", "Java", "JavaScript", "Lisp", "Perl",
//        //"PHP", "Python", "Ruby", "Scala", "Scheme","DD","test","Test"
//    ];
//
//    var data = $.ajax({
//        type: "POST",
//        contentType: "application/json",
//        url: "/TDCS/exam/getAllSubCategory",
//        async: false,
//        success: function(data){
//            data.forEach(function(value){
//                availableTags.push(value.subName);
//            });
//        },
//        error: function(data){
//            alert('error while request...');
//        }
//    });
//    $(".autocomplete").autocomplete({
//        source: availableTags
//    });
//});









