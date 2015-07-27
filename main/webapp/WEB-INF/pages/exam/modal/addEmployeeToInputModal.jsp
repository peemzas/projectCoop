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
                  <input class = "form-control" type = "text"/>
                </div>
                <div class="col-md-1">
                  <button class = "btn btn-gray">ค้นหา</button>
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
                <th>ชื่อพนักงาน</th>
                <th>รหัสพนักงาน</th>
                <th>ตำแหน่ง</th>
                <th>ทีม</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td><input class = "form-control" type = "checkbox"/></td>
                <td>ผู้เฒ่าเต่า ผู้เฒ่ามุเท็น โรชิ</td>
                <td>EMP0001</td>
                <td>Developer</td>
                <td>ชาวโลก</td>
              </tr>
              <tr>
                <td><input class = "form-control" type = "checkbox"/></td>
                <td>คาคาชิ</td>
                <td>EMP000/</td>
                <td>ABA</td>
                <td>ทีม 8</td>
              </tr>
              <tr>
                <td><input class = "form-control" type = "checkbox"/></td>
                <td>อะสึมะ คาสึมะ</td>
                <td>EMP0003</td>
                <td>SA</td>
                <td>Pantasia</td>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class = "row">
          <div class = "col-md-12" align="right">
            <div class = "form-group">
              <button class = "btn btn-default modalSearchByEmployeeNameSubmitBtn">เพิ่ม</button>
              <button class = "btn btn-gray modalSearchByEmployeeNameCloseBtn ">ยกเลิก</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>

  $('.modalSearchByEmployeeNameSubmitBtn').on('click',function(){
    // DO SOMETHING//

    // FINISH //
    $("#modalSearchByEmployeeName").modal("hide");
  })

  $('.modalSearchByEmployeeNameCloseBtn').on('click',function(){
    $("#modalSearchByEmployeeName").modal("hide");
  })

</script>