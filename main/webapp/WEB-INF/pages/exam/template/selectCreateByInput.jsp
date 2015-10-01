<%--
  Created by IntelliJ IDEA.
  User: PeeMz
  Date: 17/7/2558
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%--<div class="col-sm-5">--%>
        <%--<div class="col-sm-4 col-sm-offset-2" align="right">--%>
            <%--<h5>สร้างโดย</h5>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="col-sm-6">--%>
        <%--<button data-toggle="modal" data-target="#modalSearchByEmployeeName" class="btn btn-primary btn-sm" id="addEmpCreateByBtn">เพิ่ม</button>--%>
    <%--</div>--%>

    <div class="col-sm-5">
        <div class="col-sm-4 col-sm-offset-2" align="right">
            <label for="addEmpCreateByBtn" class="label-control"><h5 style="margin-top: 5px">สร้างโดย</h5></label>
        </div>
        <div class="col-sm-6">
            <button data-toggle="modal" data-target="#modalSearchByEmployeeName" class="btn btn-primary btn-sm" id="addEmpCreateByBtn">เพิ่ม</button>
        </div>
    </div>


<script src="../../../resources/js/pageScript/exam/selectEmployee.js" ></script>
<script src="../../../resources/js/pageScript/exam/searchQuestion.js" ></script>
<script src="../../../resources/js/pageScript/exam/selectCreateByInput.js"></script>
<%@include file="../modal/addEmployeeToInputModal.jsp" %>
