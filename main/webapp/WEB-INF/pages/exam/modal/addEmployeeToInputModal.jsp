<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wanchana
  Date: 16/7/2558
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal Search Advance -->

<div id = "modalSearchByEmployeeName" class = "modal fade" role = "dialog">
  <div class = "modal-dialog">
    <div class = "modal-content">
      <div class = "modal-header">
        <button class = "close modalSearchByEmployeeNameCloseBtn" type = "close">&times;</button>
        <h4 class = "modal-title">ค้นหาพนักงาน</h4>
      </div>
      <div class = "modal-body" align = "center">
        <div class = "row">
          <div class = "col-md-8 col-md-offset-2">
            <%--<form class = "form-inline" role = "form">--%>
              <div class = "row">
                <div class="col-md-offset-1 col-md-1" align="right"><h5>ชื่อ</h5></div>
                <%--<label>ชื่อ</label>--%>
                <div class="col-md-6">
                  <input id="searchEmployeeNameText" class = "form-control" type = "text"/>
                </div>
                <div class="col-md-1">
                  <button id="searchBtnFromModalSearchEmployee" class = "btn btn-gray" type="submit">ค้นหา</button>
                </div>
              </div>
            <%--</form>--%>
          </div>
        </div>
        <br/>
        <div class = "row">
          <div class = "col-md-12" align = "center">
            <table class = "table table-bordered">
              <thead align = "center">
              <tr>
                <th>เลือก</th>
                <th>รหัสพนักงาน</th>
                <th>ชื่อพนักงาน</th>
                <th>ตำแหน่ง</th>
                <th>ทีม</th>
              </tr>
              </thead>
              <tbody id="tbodySelectEmployeeName">

              </tbody>
            </table>

          </div>
        </div>
        <div class = "row">
          <div class = "col-md-12" align="right">
            <div class = "form-group">
              <button id="addEmployeeBtn" class = "btn btn-default modalSearchByEmployeeNameSubmitBtn">เพิ่ม</button>
              <button class = "btn btn-gray modalSearchByEmployeeNameCloseBtn ">ยกเลิก</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/selectEmployee.js" />"></script>
<script>

  $('.modalSearchByEmployeeNameSubmitBtn').on('click',function(){
    // DO SOMETHING//

    // FINISH //
    $("#modalSearchByEmployeeName").modal("hide");
  });

  $('.modalSearchByEmployeeNameCloseBtn').on('click',function(){
    $("#modalSearchByEmployeeName").modal("hide");
  });

  $('#searchBtnFromModalSearchEmployee').on('click', function () {
    searchEmpName();
  });

  $("#addEmployeeBtn").on('click', function(){
    addEmployee();
  });

</script>