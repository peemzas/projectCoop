<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--Modal--%>

<div class="modal fade" id="createCat">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">เพิ่มหมวดหมู่</h4>
            </div>
            <div class="modal-body" style="height: 120px">
                <div class="row">
                    <form id="addCategoryForm" method="post" action="">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-md-4" align="right">
                                    <label for="categoryIdText" class="label-control" >รหัสหมวดหมู่</label>
                                </div>
                                <div class="col-md-5">
                                    <input type="text" class="form-control input-sm" name="catId" id="categoryIdText" required autofocus/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-4" align="right">
                                    <label for="categoryNameText" class="label-control">หมวดหมู่</label>
                                </div>
                                <div class="col-md-5">
                                    <input type="text" class="form-control input-sm" name="catName" id="categoryNameText" required/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <div class="row">
                    <div class="form-group">
                        <div class="col-md-12 text-center">
                            <input id="submitCreateCategoryBtn" class="btn btn-primary btn-sm" type="submit" data-dismiss="modal" value="บันทึก"/>
                            <button id="hiddenBtn2" class="btn btn-warning btn-sm"  data-dismiss="modal">ยกเลิก</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</div>
    <script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/addCategory.js" />"></script>
    <script>
//        $('#submitCreateCategoryBtn').on('click', function () {
//            saveCategory();
//        });
//
//        $('categoryIdText').on('input', function(){
//            var input = $(this).val();
//            if(input){
//                input.removeClass("invalid").addClass("valid");
//            }
//            else{
//                input.removeClass("valid").addClass("invalid");
//            }
//        });
    </script>