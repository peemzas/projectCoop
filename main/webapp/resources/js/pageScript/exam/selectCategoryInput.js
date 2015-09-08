var getSearchCategoryInputValue = function () {
    return $('#selectCategoryInput-category').children('.category:selected').attr('categoryId');
}

var getSearchSubCategoryInputValue = function () {
    return $('#selectCategoryInput-subCategory').children('.category:selected').attr('categoryId');
}

var updateCategoryList = function () {
    $('#selectCategoryInput-category').children('.category').remove()
    var ajaxDat = $.ajax({
        type: "POST",
        url: "/TDCS/exam/getAllCategory",
        success: function (catList) {
            catList.forEach(function (category) {
                $('#selectCategoryInput-category').append('<option class="category" categoryId="'+category.id+'"' +
                ' categoryName="'+category.name+'"> '+category.name+'')

            })
        },
        error: function(){
            alert("error in updateCategoryList()")
        }
    })
}

var updateSubCategoryList = function(){
    var subcatSelect = $('selectCategoryInput-subCategory');
    subcatSelect.empty();
    subcatSelect.append("<option selected disabled></option>");
    console.log($('#selectCategoryInput-category').children('.category:selected').attr('categoryId'));

    var ajaxDat = $.ajax({
        type: "POST",
        url: "/TDCS/exam/getAllSubCategoryInCategory",
        date:{
            categoryId: $('#selectCategoryInput-category').children('.category:selected').attr('categoryId').toString()
        },
        success: function (item) {
            alert("success")
            item.forEach(function (item) {
                subcatSelect.append('<option class="subCategory" subCategoryId="'+item.subId+'"' +
                ' subCategoryName="'+item.subName+'" categoryId="'+item.id+'"' +
                'value = "'+item.subId+'"> '+item.subName+'')
            })
        },
        error: function(){
            alert("error in updateSubCategoryList()")
        }
    })
}
var clearCategoryList = function(){
    $('selectCategoryInput-category').empty();
    $('selectCategoryInput-category').append("<option selected disabled></option>");
}

$(document).ready(function(){
    clearCategoryList()
    updateCategoryList()

    $('#selectCategoryInput-category').on('change',function(){
        $('#selectCategoryInput-subCategory').children('.subCategory').remove()
        updateSubCategoryList()
    })
})