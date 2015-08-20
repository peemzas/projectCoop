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
            <div class="modal-body">
                <div class="row">
                    <form data-toggle="validator" role="form">
                        <div class="form-group">
                            <label for="categoryNameText" class="control-label">Name</label>
                            <input type="text" class="form-control" id="categoryNameText" required>
                        </div>
                        <div class="form-group">
                            <label for="categoryNameText" class="control-label">Name</label>
                            <input type="text" class="form-control" id="categoryNameText" required>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <%--<script src="../../../resources/js/pageScript/exam/addCategory.js" charset="UTF-8"></script>--%>
    <spring:url value="../../../resources/js/pageScript/exam/addCategory.js" var="addCategory"> </spring:url>
    <script src="${addCategory}" type="text/javascript"><!--Not Empty --></script>
    <script>

        $('#submitCreateCategoryBtn').on('click', function () {
            saveCategory();
        });
    </script>