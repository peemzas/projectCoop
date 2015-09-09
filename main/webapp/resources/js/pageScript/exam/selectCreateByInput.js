var getSearchCreateByInput = function(){
    return $('#selectCreateBySearchInput').val();
}

$("#addEmpCreateByBtn").on('click', function(){
    searchEmpName();
});