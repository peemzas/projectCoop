$(document).ready(function(){
    var searchSubCategory;
    var category = $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/TDCS/exam/getAllCategory",
        async: false,
        success: function(data){
            data.forEach(function(value){
                $("#selectCategoryToSelection").append(
                    //                  '<option>'+value.id+'</option>'
                    '<option value="'+value.id+'">'+value.id+ " : "+value.name+'</option>'
                )
            });
        }
    });
    $("#selectCategoryToSelection").on('change', function(){
       //alert(this.value);
        searchSubCategory = this.value;
        alert(searchSubCategory);
        var subCategory = $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/TDCS/exam/getSubCategoryByCategoryId",
            async: true,
            data: searchSubCategory,
            success: function(data){
                data.forEach(function(val){
                    $("#selectSubCategoryToSelection").append(
                        '<option value="'+val.subName+'">'+val.subName+'</option>'
                    )
                });
            }
        });
    });
    //subCategoryDropDown(catId);
});

//function subCategoryDropDown(catId){
//    var subCategory = $.ajax({
//        type: "POST",
//        contentType: "application/json",
//        url: "/TDCS/exam/getAllSubCategory",
//        data :{
//            categoryId: catId
//        },
//        success: function(data){
//            data.forEach(function(val){
//                $("#selectSubCategoryToSelection").append(
//                    '<option value="'+val.subName+'">'+val.subName+'</option>'
//                )
//            });
//        }
//    });
//}