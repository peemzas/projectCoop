var getSearchCategoryInputValue = function () {
    return $('#selectCategoryToSelection').children('.category:selected').attr('categoryId');
}

var getSearchSubCategoryInputValue = function () {
    return $('selectSubCategoryToSelection').children('.category:selected').attr('categoryId');
}

var updateCategoryList = function () {
    clearCategoryList()
    var ajaxDat = $.ajax({
        type: "POST",
        url: "/TDCS/exam/getAllCategory",
        success: function (catList) {
            catList.forEach(function (category) {
                $('#selectCategoryToSelection').append('<option class="category" categoryId="' + category.id + '"' +
                ' categoryName="' + category.name + ' value=' + category.id + '">' + category.id + ' : ' + category.name + '')
            })
        },
        error: function () {
            alert("error in updateCategoryList()")
        }
    })
}

var updateSubCategoryList = function () {
    var catSelect = $('#selectCategoryToSelection');
    var subcatSelect = $('#selectSubCategoryToSelection');
    subcatSelect.empty();
    subcatSelect.append("<option selected value=''></option>");
    var data = null;
    if (catSelect.children('.category:selected').val()) {
        data = catSelect.children('.category:selected').attr('categoryId')
    } else(
        data = ""
    )
    console.log(data.length)

    var ajaxDat = $.ajax({
        type: "POST",
        url: "/TDCS/exam/getAllSubCategoryInCategory",
        data: {
            categoryId: data
        },
        success: function (item) {
            if(jQuery.isEmptyObject(item)){
                subcatSelect.empty();
                subcatSelect.append("<option selected value=''>ไม่มีหัวข้อเรื่องภายใต้หมวดหมู่นี้</option>");
            }
            if (item) {
                item.forEach(function (item) {
                    subcatSelect.append('<option class="subCategory" subCategoryId="' + item.id + '"' +
                    ' subCategoryName="' + item.name + '" subCategoryId="' + item.id + '"' +
                    'value="' + item.name + '""> ' + item.name + ' : ' + item.category.id +
                    '</option>')
                })
            }
        },
        error: function () {
            alert("error in updateSubCategoryList()")
        }
    })
}
var clearCategoryList = function () {
    var categorySelect = $('#selectCategoryToSelection');
    categorySelect.empty();
    categorySelect.append("<option selected value=''></option>");
}

$(document).ready(function () {
    clearCategoryList()
    updateCategoryList()
})
$('#selectCategoryToSelection').on('change', function () {
    console.log("event on category change")
    $('selectSubCategoryToSelection').children('.subCategory').remove()
    updateSubCategoryList()
})