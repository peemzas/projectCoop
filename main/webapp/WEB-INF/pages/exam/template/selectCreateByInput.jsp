<%--
  Created by IntelliJ IDEA.
  User: PeeMz
  Date: 17/7/2558
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%--Add By Mr.Wanchana--%>
    <div class="col-sm-5">
        <div class="col-sm-4 col-sm-offset-2" align="right">
            <label for="addEmpCreateByBtn" class="label-control"><h5 style="margin-top: 5px">สร้างโดย</h5></label>
        </div>
        <div class="col-sm-6">
            <button data-toggle="modal" data-target="#modalSearchByEmployeeName" class="btn btn-success btn-sm" id="addEmpCreateByBtn">เพิ่ม</button>
        </div>
    </div>

<%@include file="../modal/addEmployeeToInputModal.jsp" %>
<script src="../../../resources/js/pageScript/exam/selectEmployee.js" ></script>
<script src="../../../resources/js/pageScript/exam/selectCreateByInput.js"></script>
<script>
    $(document).ready(function () {
        $("#selectAllEmployeeName").click(function (event) {
            if (this.checked) {
                $(".userSelectCheckbox").each(function () {
                    this.checked = true;
                });
            }
            else {
                $(".userSelectCheckbox").each(function () {
                    this.checked = false;
                });
            }
        })
    });
</script>

