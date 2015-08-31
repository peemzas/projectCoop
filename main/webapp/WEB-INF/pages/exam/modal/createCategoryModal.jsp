<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 8/6/2015
  Time: 11:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%--Modal--%>
<div class="modal fade" id="createCat">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" align="center">เพิ่มวิชา</h3>
            </div>
            <div class="modal-body" style="height: 120px">
                <div class="row">

                    <%--Add By Mr. Wanchana Himseft--%>

                    <form id="addCategoryForm">

                        <div class="col-md-3" align="right">
                            <h4><label for="categoryIdText" class="label" style="color: black ; font-weight: 100">รหัสวิชา :</label></h4>
                        </div>
                        <div class="col-md-2">
                            <input  type="text" class="form-control" name="catId" id="categoryIdText" required autofocus/>
                        </div>
                        <div class="col-md-1" align="right">
                            <h4><label for="categoryNameText" class="label" style="color: black ; font-weight: 100">วิชา :</label></h4>
                        </div>
                        <div class="col-md-6">
                            <input style="width: 80%" type="text" class="form-control" name="catName" id="categoryNameText"/>
                        </div>
                        <br/>
                        <div class="form-group">
                            <div class="col-md-9 col-md-offset-3">
                                <div id="messages"></div>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <button id="submitCreateCategoryBtn" class="btn btn-primary" type="submit" data-dismiss="modal">บันทึก</button>
                                <button id="hiddenBtn2" class="btn btn-warning"  class="hidden" data-dismiss="modal">ยกเลิก</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</div>
    <script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/addCategory.js" />"></script>
    <script>
        $('#submitCreateCategoryBtn').on('click', function () {
            saveCategory();
        });

//        $('#addCategoryForm').formValidation
    </script>