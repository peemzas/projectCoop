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
      <div class="modal-body" style="height: 80px">
        <div class="row">
          <div class="col-md-3" align="right">
            <h4><label class="label"
                       style="color: black ; font-weight: 100">วิชา
              :</label></h4>
          </div>
          <div class="col-md-6">
            <input type="text" class="form-control" name="cat" id="categoryName"/>
          </div>
          <button id="submitCreateCategoryBtn" class="btn btn-primary" type="submit" data-dismiss="modal">ตกลง</button>
          <button id="hiddenBtn" data-dismiss="modal" class="hidden">hidden</button>
        </div>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<%--<script src="../../../resources/js/pageScript/exam/addCategory.js" charset="UTF-8"></script>--%>
<spring:url value="../../../resources/js/pageScript/exam/addCategory.js" var="addCategory"></spring:url>
<script src="${addCategory}" type="text/javascript"><!--Not Empty --></script>
<script>

  $('#submitCreateCategoryBtn').on('click',function(){
    saveCategory();
  })


</script>