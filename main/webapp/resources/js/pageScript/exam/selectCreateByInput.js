var getSearchCreateByInput = function(){
    return $('#selectCreateBySearchInput').val();
}

var clearCreateByInput = function(){
    $('#selectCreateBySearchInput').val("");
}

$("#addEmpCreateByBtn").on('click', function(){
    searchEmpName();
});