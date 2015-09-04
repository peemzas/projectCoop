var getSearchCategoryInput = function () {
    return $('#selectCategoryInput-category').val();
}

var getSearchSubCategoryInput = function () {
    return $('#selectCategoryInput-subCategory').val();
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
    var ajaxDat = $.ajax({
        type: "POST",
        url: "/TDCS/exam/getAllSubCategoryInCategory",
        date:{
            categoryId: $('#selectCategoryInput-category').children('.category:selected').attr('categoryId')
        },
        success: function (item) {
            alert("success")
            item.forEach(function (item) {
                $('#selectCategoryInput-subCategory').append('<option class="subCategory" subCategoryId="'+item.subId+'"' +
                ' subCategoryName="'+item.subName+'" categoryId="'+item.id+'"' +
                'value = "'+item.subId+'"> '+item.subName+'')
            })
        },
        error: function(){
            alert("error in updateSubCategoryList()")
        }
    })
}

$(document).ready(function(){
    updateCategoryList()

    $('#selectCategoryInput-category').on('change',function(){
        $('#selectCategoryInput-subCategory').children('.subCategory').remove()
        updateSubCategoryList()
    })
})