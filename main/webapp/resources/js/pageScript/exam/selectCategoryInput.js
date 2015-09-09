var getSearchCategoryInputValue = function () {
    return $('#selectCategoryToSelection').children('.category:selected').attr('categoryId');
}

var getSearchSubCategoryInputValue = function () {
    return $('selectSubCategoryToSelection').children('.category:selected').attr('categoryId');
}

var updateCategoryList = function () {
    $('#selectCategoryToSelection').children('.category').remove()
    var ajaxDat = $.ajax({
        type: "POST",
        url: "/TDCS/exam/getAllCategory",
        success: function (catList) {
            catList.forEach(function (category) {
                $('#selectCategoryToSelection').append('<option class="category" categoryId="'+category.id+'"' +
                ' categoryName="'+category.name+' value="'+category.id+'"> '+category.name+'')

            })
        },
        error: function(){
            alert("error in updateCategoryList()")
        }
    })
}

var updateSubCategoryList = function(){
    var catSelect = $('#selectCategoryToSelection');
    var subcatSelect = $('#selectSubCategoryToSelection');
    subcatSelect.empty();
    subcatSelect.append("<option selected value=''></option>");
    console.log(catSelect.children('.category:selected').val());

    var ajaxDat = $.ajax({
        type: "POST",
        url: "/TDCS/exam/getAllSubCategoryInCategory",
        data:{
            categoryId: catSelect.children('.category:selected').attr('categoryId')
        },
        success: function (item) {
            item.forEach(function (item) {
                subcatSelect.append('<option class="subCategory" subCategoryId="'+item.id+'"' +
                ' subCategoryName="'+item.name+'" subCategoryId="'+item.id+'"' +
                'value = "'+item.id+'"> '+item.name+'')
            })
        },
        error: function(){
            alert("error in updateSubCategoryList()")
        }
    })
}
var clearCategoryList = function(){
    var categorySelect = $('#selectCategoryToSelection');
    categorySelect.empty();
    categorySelect.append("<option selected value=''></option>");
}

$(document).ready(function(){
    clearCategoryList()
    updateCategoryList()

    $('#selectCategoryToSelection').on('change',function(){
        $('selectSubCategoryToSelection').children('.subCategory').remove()
        updateSubCategoryList()
    })
})