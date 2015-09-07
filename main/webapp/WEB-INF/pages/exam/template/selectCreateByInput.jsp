<%--
  Created by IntelliJ IDEA.
  User: PeeMz
  Date: 17/7/2558
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-2" align="right">
    <h5>สร้างโดย : </h5>
</div>
<div class="col-md-6">
    <div class="input-group">
        <input id="selectCreateBySearchInput" type="text" class="form-control" />
        <div class="input-group-btn">
            <button data-toggle="modal" data-target="#modalSearchByEmployeeName" class="btn btn-primary " id="addEmpCreateByBtn"> เพิ่ม
            </button>
        </div>
    </div>
</div>

<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/selectEmployee.js" />"></script>
<script src="<c:url value="/resources/js/pageScript/exam/searchQuestion.js" />"></script>
<script>
    $("#addEmpCreateByBtn").on('click', function(){
        searchEmpName();
    });
</script>
<%@include file="../modal/addEmployeeToInputModal.jsp" %>
