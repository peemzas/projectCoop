<%--
  Created by IntelliJ IDEA.
  User: wanchana
  Date: 15/7/2558
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="modal/addEmployeeToInputModal.jsp" %>

<div class="container row">
    <h3 class="h3">จัดการชุดข้อสอบ</h3>
</div>
<hr/>
<div class="container">
    <%@include file="template/searchPaperTemplateNew.jsp" %>
    <br/>
    <br/>

    <!-- Example table information, it will remove soon ^^ -->
    <div class="row">
        <div class="col-md-12" align="center">
            <table class="table">
                <thead class="bg-primary">
                <tr>
                    <th style="text-align: center">หมายเลขชุดข้อสอบ</th>
                    <th style="text-align: center">ชื่อชุดข้อสอบ</th>
                    <th style="text-align: center">วันที่สร้าง</th>
                    <th style="text-align: center">ตำแหน่ง</th>
                    <th style="text-align: center">คะแนนเต็ม</th>
                    <th style="text-align: center">สร้างโดย</th>
                    <th style="text-align: center">สถานะ</th>
                    <th style="text-align: center">Action</th>
                    <%--<th style="text-align: center"></th>--%>
                </tr>
                </thead>
                <tbody align="center">
                <tr>
                    <td>11111</td>
                    <td>แบบทดสอบวัดความรู้ก่อนการอบรม</td>
                    <td>19/1/2558</td>
                    <td>Developer Trainee</td>
                    <td>50</td>
                    <td>EmployeeA</td>
                    <td>เปิด</td>
                    <%--<td><a href="/TDCS/editButtonOnPageManagePapers">--%>
                        <%--<button class="btn btn-warning" type="button" data-toggle="modal"--%>
                                <%--data-target="#editQuestionModal"><span class="glyphicon glyphicon-pencil"></span>--%>
                        <%--</button>--%>
                    <%--</a></td>--%>
                    <%--<td>--%>
                        <%--<button class="btn btn-info" type="button"><span class="glyphicon glyphicon-book"></span>--%>
                        <%--</button>--%>
                    <%--</td>--%>
                  <td>
                    <%--<select class="form-control">--%>
                      <%--<option selected></option>--%>
                      <%--<option value="view">ดู</option>--%>
                      <%--<option value="edit"><a href="/TDCS/editButtonOnPageManagePapers">แก้ไข</a></option>--%>
                      <%--<option value="delete">ลบ</option>--%>
                    <%--</select>--%>
                    <div class="btn-group">
                      <button class="btn dropdown-toggle" data-toggle="dropdown">
                        เลือก<span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a href="/TDCS/exam/paperPreview">ดู</a></li>
                          <li><a href="/TDCS/exam/marking">ตรวจ</a> </li>
                          <li><a href="/TDCS/exam/editButtonOnPageManagePapers">แก้ไข</a></li>
                        <li><a href="#">ลบ</a></li>
                      </ul>
                    </div>
                  </td>
                </tr>
                <tr>
                    <td><h5>11112</h5></td>
                    <td><h5>แบบทดสอบวัดความรู้หลังการอบรม</h5></td>
                    <td><h5>19/1/2558</h5></td>
                    <td><h5>Developer Trainee</h5></td>
                    <td><h5>50</h5></td>
                    <td><h5>EmployeeB</h5></td>
                    <td><h5>เปิด</h5></td>
                    <%--<td><button class = "btn btn-warning" type = "button"><span class = "glyphicon glyphicon-pencil"></span></button></td>--%>
                    <td>
                      <div class="btn-group">
                        <button class="btn dropdown-toggle" data-toggle="dropdown">
                          เลือก<span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                          <li><a href="#">ดู</a></li>
                            <li><a href="#">ตรวจ</a> </li>
                          <li><a href="/TDCS/exam/editButtonOnPageManagePapers">แก้ไข</a></li>
                          <li><a href="#">ลบ</a></li>
                        </ul>
                      </div>
                    </td>
                    <%--<td>--%>
                        <%--<button class="btn btn-info" type="button"><span class="glyphicon glyphicon-book"></span>--%>
                        <%--</button>--%>
                    <%--</td>--%>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <br/><br/>

    <div class="row">
        <div class="col-md-12" align="center">
            <ul class="pagination">
                <li class="disabled"><a href="#">&laquo;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a>2</a></li>
                <li><a>3</a></li>
                <li><a>4</a></li>
                <li><a>5</a></li>
                <li class="disabled"><a href="#">&raquo;</a></li>
            </ul>
        </div>
    </div>
</div>

<style>
    th {
        border:solid 1px white;
    }
</style>

