<%--
  Created by IntelliJ IDEA.
  User: JOKIZZ
  Date: 29/7/2558
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container row">
    <div class="row">
        <h3 class="h3">ผลคะแนนการสอบ</h3>
    </div>
</div>
<hr/>

<div class="container">
    <div class="row">
        <table class="table table-bordered">
            <thead style="background-color: #006dcc; color: white;">
            <tr>
                <th style="text-align: center">ชื่อชุดข้อสอบ</th>
                <th style="text-align: center">วันที่ส่งข้อสอบ</th>
                <th style="text-align: center">วันที่ตรวจ</th>
                <th style="text-align: center">ตรวจโดย</th>
                <th style="text-align: center">คะแนนPreTest</th>
                <th style="text-align: center">คะแนนPostTest</th>
                <th style="text-align: center">คะแนนเต็ม</th>
                <th style="text-align: center">สถานะ</th>


            </tr>
            </thead>
            <tbody>

            <tr>
                <td>
                    <button class="btn btn-link btn-info btn-sm" type="button"><span class="glyphicon glyphicon-info-sign" href="#"></span></button>
                    แบบทดสอบภาษาอังกฤษพื้นฐาน
                </td>
                <td align="center">10/7/2558</td>
                <td align="center">13/7/2558</td>
                <td align="center">นายA</td>
                <td align="center">30</td>
                <td align="center">35</td>
                <td align="center">40</td>
                <td align="center">ตรวจแล้ว</td>
            </tr>

            <tr>
                <td>
                    <button class="btn btn-link btn-info btn-sm" type="button"><span class="glyphicon glyphicon-info-sign" href="#"></span></button>
                    แบบทดสอบJAVA
                </td>
                <td align="center">5/10/2558</td>
                <td align="center">4/11/2558</td>
                <td align="center">นายB</td>
                <td align="center">20</td>
                <td align="center">21</td>
                <td align="center">80</td>
                <td align="center">ยังไม่ตรวจแล้ว</td>
            </tr>


            </tbody>
        </table>
    </div>
</div>

<%--paging--%>
<%--<div class="row">--%>
    <%--<div class="col-md-12" align="center">--%>
        <%--<ul class="pagination">--%>
            <%--<li class="disabled"><a href="#">&laquo;</a></li>--%>
            <%--<li class="active"><a href="#">1</a></li>--%>
            <%--<li><a>2</a></li>--%>
            <%--<li><a>3</a></li>--%>
            <%--<li><a>4</a></li>--%>
            <%--<li><a>5</a></li>--%>
            <%--<li class="disabled"><a href="#">&raquo;</a></li>--%>
        <%--</ul>--%>
    <%--</div>--%>
<%--</div>--%>

<%@include file="modal/showScoreModal.jsp"%>
