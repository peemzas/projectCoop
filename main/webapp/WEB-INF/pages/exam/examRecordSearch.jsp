<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 7/16/2015
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/resources/js/callculatetime.js" />"></script>
<script src="<c:url value="/resources/js/callutaeAge.js" />"></script>
<script src="<c:url value="/resources/js/checkKeybord.js" />"></script>
<script src="<c:url value="/resources/js/setInputUserdata.js" />"></script>


<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

<h3>ตรวจข้อสอบ</h3>
<hr>


<div >
    <div class="panel panel-primary">
        <div class="panel-heading"><h4>ค้นหาข้อสอบที่</h4></div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-2" align="right"><h5>ชื่อชุดข้อสอบ :</h5></div>
                <div class="col-md-6 input-group">
                    <input class="form-control" id="paperName" data-toggle="tooltip"
                           title="SQL LIKE FORMAT เช่น %example%" data-placement="right">
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-md-2" align="right"><h5>ตำแหน่ง :</h5></div>
                <div class="col-md-2 input-group ">
                    <select id="forPosition" class="form-control">
                        <option value="" selected="selected">All</option>
                        <option value="dev">Dev</option>
                        <option value="ba">BA</option>
                    </select>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-md-2" align="right"><h5>รหัสพนักงาน :</h5></div>
                <div class="col-md-6 input-group">
                    <input class="form-control" name="empId" disabled="disabled">

                    <div class="input-group-btn">
                        <button class="btn btn-primary " id="addEmpIdBtn"> +</button>
                    </div>
                </div>

            </div>
            <br>

            <div class="row">
                <div class="col-md-2" align="right"><h5>ตรวจโดย :</h5></div>
                <div class="col-md-6 input-group">
                    <input class="form-control" name="empId" disabled="disabled">

                    <div class="input-group-btn">
                        <button class="btn btn-primary " id="addMarkerEmpIdBtn"> +</button>
                    </div>
                </div>

            </div>
            <br>

            <div class="row">
                <%--<div class="col-md-1 col-lg-offset-5">--%>
                    <%--<button class="btn btn-default">ค้นหา</button>--%>
                <%--</div>--%>
                <%--<div class="col-md-1">--%>
                    <%--<button class="btn btn-default">ล้างข้อมูล</button>--%>
                <%--</div>--%>

                <div class = "row" id = "btnSearch">
                    <div class = "col-md-12 text-center">
                        <button class = "btn btn-default" type = "button">ค้นหา</button>
                        <button class = "btn btn-default" type = "button">ล้างข้อมูล</button>
                    </div>
                </div>


            </div>


        </div>
    </div>
    <div>
<br>
<hr>
        <div class="row">
            <div class="col-md-3 col-md-offset-4">
                <h3 align="center">ผลลัพธ์</h3>

            </div>


            <table class="table table-bordered">
                <thead class="bg-primary">
                <tr>
                    <th align="center">รหัสพนักงาน</th>
                    <th align="center">ชื่อ</th>
                    <ss></ss>
                    <th align="center">ตำแหน่ง</th>
                    <th align="center">ชื่อชุดข้อสอบ</th>
                    <th align="center">ตรวจโดย</th>
                    <th align="center">คะแนนปรนัย</th>
                    <th align="center">คะแนนอัตนัย</th>
                    <th align="center">รายละเอียดและควาคิดเห็น</th>
                </tr>
                </thead>

                <!---------------------------------------------------- Generate Table --------------------------------------------------------------------------------->
                <tr class="btn-default">
                    <td>aaa</td>
                    <td>aaa</td>
                    <td>aaa</td>
                    <td>aaa</td>
                    <td>aaa</td>
                    <td>aaa</td>
                    <td>aaa</td>
                    <td>aaa</td>
                </tr>
            </table>
        </div>
    </div>
</div>

<%--end class row--%>