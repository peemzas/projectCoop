/**
 * Created by JOKIZZ on 17/8/2558.
 */


$("#dropdownExamEmp").attr('class', 'dropdown-toggle active');

$(document).ready(function () {

    $("#alertMess").hide();
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

                    '<td style="text-align: left;"><label id="catName' + value.id + '">' + value.name + '</label>' +

                    '</td>' +

                        //'<td style="text-align: center;"><label id="subId'+value.subId+'"><b>'+value.subId+'</b></label>'+

                    '<td style="text-align: left;"><label id="subName' + value.subId + '">' + value.subName + '</label>' +
                    '<input id="editsubName' + value.subId + '" class="form-control" type="text" value="' + value.subName + '" style="display: none;">' +


                    '<td style="text-align: center">' +
                    '<button id="editBtn' + value.subId + '" type="button" class="btn btn-gray btn-sm" onclick="editSubCategory(' + "'" + value.subId + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button>' +
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
    $("#tbodySubCategory input:checkbox:checked").each(function () {
        //categoryIds.push($(this).parent().siblings(":first").text());
        var subCategoryId = ($(this).attr('subCatId'));
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
                alert('ไม่สามารถลบ ' + subCategoryId + ' ได้');
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
    var length = $("#categoryId").val().length;
    categoryId += " ";
    categoryId = categoryId.substr(0, categoryId.indexOf(' '));
    //alert(categoryId);


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

                    '<td style="text-align: center;"><input class="selectSubCategory" type="checkbox" subCatId="' + value.SubCategory.id + '"> </input>' +

                        //'<input id="id'+value.id+'" class="form-control" type="text" value="'+value.id+'" style="display: none;">'+
                    '<td style="text-align: left;"><label id="catName' + value.id + '">' + value.category.name + '</label>' +
                    '</td>' +

                        //'<td style="text-align: center;"><label id="subId'+value.subId+'"><b>'+value.subId+'</b></label>'+

                    '<td style="text-align: left;"><label id="subName' + value.SubCategory.id + '">' + value.SubCategory.name + '</label>' +
                    '<input id="editsubName' + value.SubCategory.id + '" class="form-control" type="text" value="' + value.SubCategory.name + '" style="display: none;">' +


                    '<td style="text-align: center">' +
                    '<button id="editBtn' + value.SubCategory.id + '" type="button" class="btn btn-gray btn-sm" onclick="editSubCategory(' + "'" + value.SubCategory.id + "'" + ')"><span class="glyphicon glyphicon-pencil"></span></button>' +
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


//$("categoryId").keyup(function(e) {
//    if (e.which > 0) {
//        e.preventDefault();
//        listsubcat();
//    }
//
//});
//$(function listsubcat() {
//    var availableTags2 = [];
//
//    var data = $.ajax({
//        type: "POST",
//        contentType: "application/json",
//        url: "/TDCS/exam/getAllCategory",
//        async: false,
//        success: function(data){
//            data.forEach(function(value){
//                    availableTags2.push(value.id);
//            });
//        },
//        error: function(data){
//            alert('error while request...');
//        }
//    });
//    $(".autocomplete").autocomplete({
//        source: availableTags2
//    });
//
//    //var search = $("#categoryId").val();
//    //$("#categoryId").typeahead('destroy').typeahead({
//    //    source: availableTags2,
//    //    minLength: 0,
//    //    items: 20
//    //}).focus().val('').keyup().val(search);
//});


$("#categoryId").keyup(function (e) {
    if (e.which > 0) {
        e.preventDefault();
        listsubcat();
    }
});
function listsubcat() {
    var availableall = [];

    var data = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllCategory",
        async: false,
        success: function (data) {
            data.forEach(function (value) {
                availableall.push(value.id + ' : ' + value.name);
            });
        },
        error: function (data) {
            alert('error while request...');
        }
    });
    //$(".autocomplete").autocomplete({
    //    source: availableTagsall
    //});

    var search = $("#categoryId").val();
    $("#categoryId").typeahead('destroy').typeahead({
        source: availableall,
        minLength: 0,
        items: 20,
        maxLength: 2
    }).focus().val('').keyup().val(search);
};




//$(document).ready(function () {


$("#categoryId").on('change', function () {
        $("#sSubCat").empty();
        var categoryId = $("#categoryId").val();
        //var categoryName = $("#categoryId").val();
        var subcategoryName = $("#sSubCat").val();
        //categoryId += " ";
        //var length = categoryId.length
        //alert(length);

        //categoryId = categoryId.substr(0, categoryId.indexOf(' '));

        if(categoryId !=""){

            if(categoryId.indexOf(':')!=-1){

            categoryId.indexOf(':');
                var categoryId2 =  categoryId.substr(0, categoryId.indexOf(' '));
            console.log(categoryId2+" 2 part");

                //console.log(categoryName);
                // var categoryName =  categoryId.substr(8);
                //var length = categoryName.length;
                //console.log(length+" catNameLength ");
                //console.log(categoryName+" catName");

                categoryId = categoryId2;
                var data = $.ajax({
                    type: "POST",
                    url: "/TDCS/exam/getSubCategoryToDropDown",
                    data: {
                        categoryId: categoryId
                        //subcategoryName: subcategoryName
                    },
                    async: false,

                    success: function (data) {
                        data.forEach(function (value) {
                            $("#sSubCat").append(
                                '<option >' + value.SubCategory.name + '</option>'
                            )
                        });

                    },
                    error: function (data) {
                        alert('error while request...');
                    }

                });
                if (($("#sSubCat").val() == null)) {
                    $("#sSubCat").append(
                        '<option >' + "ไม่มีหัวข้อเรื่องภายใต้หมวดหมู่นี้" + '</option>'
                    )
                }
                else if (($("#sSubCat").val() != null)) {
                    $("#sSubCat").append(
                        '<option value="">' + "ทั้งหมด" + '</option>'
                    )
                }


            }else{
                console.log(categoryId+" 1 part");

                var data2 = $.ajax({
                    type: "POST",
                    url: "/TDCS/exam/getSubCategoryToDropDown",
                    data: {
                        categoryId: categoryId
                        //subcategoryName: subcategoryName
                    },
                    async: false,

                    success: function (data2) {
                        data2.forEach(function (value2) {
                            $("#sSubCat").append(
                                '<option >' + value2.SubCategory.name + '</option>'
                            )
                        });

                    },
                    error: function (data2) {
                        alert('error while request...');
                    }

                });
                if (($("#sSubCat").val() == null)) {
                    $("#sSubCat").append(
                        '<option >' + "ไม่มีหัวข้อเรื่องภายใต้หมวดหมู่นี้" + '</option>'
                    )
                }
                else if (($("#sSubCat").val() != null)) {
                    $("#sSubCat").append(
                        '<option value="">' + "ทั้งหมด" + '</option>'
                    )
                }


            }

        }



        //var data = $.ajax({
        //    type: "POST",
        //    url: "/TDCS/exam/getSubCategoryToDropDown",
        //    data: {
        //        categoryId: categoryId,
        //        categoryName: categoryName
        //        //subcategoryName: subcategoryName
        //    },
        //    async: false,
        //
        //    success: function (data) {
        //        data.forEach(function (value) {
        //            $("#sSubCat").append(
        //                '<option >' + value.name + '</option>'
        //            )
        //        });
        //    },
        //    error: function (data) {
        //        alert('error while request...');
        //    }
        //
        //});
        //if (($("#sSubCat").val() == null)) {
        //    $("#sSubCat").append(
        //        '<option >' + "ไม่มีหัวข้อเรื่องภายใต้หมวดหมู่นี้" + '</option>'
        //    )
        //}
        //else if (($("#sSubCat").val() != null)) {
        //    $("#sSubCat").append(
        //        '<option value="">' + "ทั้งหมด" + '</option>'
        //    )
        //}

    }
)
//});


///////////////////////////////////////////
//$('#search').typeahead({
//    source: function(query, process) {
//        var $url =SITE_URL+ 'api/vehicle_techfield_typeahead/' + query + '.json';
//        var $items = new Array;
//        $items = [""];
//        $.ajax({
//            url: $url,
//            dataType: "json",
//            type: "POST",
//            success: function(data) {
//                console.log(data);
//                $.map(data, function(data){
//                    var group;
//                    group = {
//                        id: data.id,
//                        name: data.name,
//                        toString: function () {
//                            return JSON.stringify(this);
//                            //return this.app;
//                        },
//                        toLowerCase: function () {
//                            return this.name.toLowerCase();
//                        },
//                        indexOf: function (string) {
//                            return String.prototype.indexOf.apply(this.name, arguments);
//                        },
//                        replace: function (string) {
//                            var value = '';
//                            value +=  this.name;
//                            if(typeof(this.level) != 'undefined') {
//                                value += ' <span class="pull-right muted">';
//                                value += this.level;
//                                value += '</span>';
//                            }
//                            return String.prototype.replace.apply('<div style="padding: 10px; font-size: 1.5em;">' + value + '</div>', arguments);
//                        }
//                    };
//                    $items.push(group);
//                });
//
//                process($items);
//            }
//        });
//    },
//    property: 'name',
//    items: 10,
//    minLength: 2,
//    updater: function (item) {
//        var item = JSON.parse(item);
//        console.log(item.name);
//        $('#hiddenID').val(item.id);
//        return item.name;
//    }
//});











