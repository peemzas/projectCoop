<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 8/6/2015
  Time: 11:13 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="modal fade" id="createSub">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" align="center">เพิ่มหัวข้อเรื่อง</h3>
            </div>
            <div class="modal-body">


                <%--<div class="row">--%>
                <%--<div class="col-md-2 col-lg-offset-3 text-right">--%>
                <%--<label>รหัสวิชา :</label>--%>
                <%--</div>--%>
                <%--<div class="col-md-1" style="width: 16%">--%>
                <%--<input class="form-control" type="text" maxlength="5"/>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div style="margin-bottom: 5px"></div>--%>


                <div class="row form-group">


                    <div class="col-md-4" align="right">
                        <h4><label class="control-label" style="color: black ; font-weight: 100">
                            <small style="color: red">*</small>
                            เลือกวิชา :
                        </label></h4>
                    </div>
                    <div class="col-md-6">
                        <%--<input type="text" class="form-control" name="cat" id="categoryName-forAddSubCat" style="width: 245px"/>--%>
                        <%--<select class="selectpicker" id="sCat" class="form-control" data-width="100%">--%>
                            <form:select path="listCat" id="sCat" name="advisor" class="form-control" required="true" >
                            <option value="">โปรดเลือกวิชา</option>
                            <c:forEach var="category" items="${listCat}">
                                <option categoryName="${category.name} " value="${category.id}">${category.id}
                                    : ${category.name}</option>
                            </c:forEach>
                            </form:select>

                        <%--</select>--%>
                    </div>
                </div>

                <%--<form class="form-horizontal" id="subcatform" method="post">--%>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-4" align="right">
                            <h4><label for="subcategoryNameadd" class="control-label" style="color:black;font-weight: 100"><small style="color: red">*</small>หัวข้อเรื่อง :</label></h4>
                        </div>
                        <div class="col-md-6 controls">
                            <input type="text" class="form-control" id="subcategoryNameadd" placeholder="กรอกชื่อหัวข้อเรื่อง" name="subcategoryNameadd" required="true" >
                            </input>
                        </div>
                        <%--<div class="help-block with-errors">error+++</div>--%>
                    </div>
                </div>
                <%--</form>--%>


                <div style="margin-bottom: 5px"></div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <button id="submitCreateSubCategoryBtn" class="btn btn-primary" type="submit"  onclick="saveSubCategory()">บันทึก
                        </button>

                        <button id="hiddenBtn2" class="btn btn-warning" class="hidden" data-dismiss="modal">
                            ยกเลิก
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<%--<spring:url value="../../../resources/js/pageScript/exam/addSubCategory.js" var="addSubCategory"> </spring:url>--%>
<%--<script src="${addSubCategory}" type="text/javascript"><!--Not Empty --></script>--%>

<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/addSubCategory.js" />"></script>

<%--<script src="<c:url value="/resources/js/checkKeybord.js" />"></script>--%>
<%--<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>--%>
<%--<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>--%>
<%--<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>--%>









