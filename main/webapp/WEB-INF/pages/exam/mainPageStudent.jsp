<%--
  Created by IntelliJ IDEA.
  User: JOKIZZ
  Date: 29/7/2558
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container row">
  <div class="row">
    <h3 class="h3">เลือกชุดข้อสอบ</h3>
  </div>
</div>
<hr/>

<div class="container">
  <div class="row">
    <table class="table table-bordered">
      <thead style="background-color: #006dcc; color: white;">
      <tr>
        <th style="text-align: center">ชื่อชุดข้อสอบ</th>
        <th style="text-align: center">ชื่อผู้สร้าง</th>
        <th style="text-align: center">ตำแหน่ง</th>
        <th style="text-align: center">คะแนนเต็ม</th>
        <th style="text-align: center">เวลา</th>
        <th style="text-align: center">Action</th>
      </tr>
      </thead>
      <tbody>
      <tr>
        <td>แบบทดสอบก่อนการอบรม</td>
        <td>EmployeeA</td>
        <td>Developer Trainee</td>
        <td align="center">50</td>
        <td>60 นาที</td>
        <td style="text-align: center;">
         <a href="/TDCS/exam/doExam"> <button class = "btn btn-block" type = "button">เริ่มทำข้อสอบ</button> </a>


        </td>
      </tr>
      <tr>
        <td>แบบทดสอบก่อนหลังอบรม</td>
        <td>EmployeeA</td>
        <td>Developer Trainee</td>
        <td align="center">50</td>
        <td>60 นาที</td>
        <td style="text-align: center;">
          <button class = "btn btn-block" type = "button">เริ่มทำข้อสอบ</button>
        </td>
      </tr>
      <tr>
        <td>แบบทดสอบความรู้พื้นฐานภาษาอังกฤษ</td>
        <td>EmployeeB</td>
        <td>Developer Trainee</td>
        <td align="center">50</td>
        <td>45 นาที</td>
        <td style="text-align: center;">
          <button class = "btn btn-block" type = "button">เริ่มทำข้อสอบ</button>
        </td>
      </tr>
      <tr>
        <td>แบบทดสอบความรู้พื้นฐานภาษาทางธุรกิจ</td>
        <td>EmployeeC</td>
        <td>Developer Trainee</td>
        <td align="center">60</td>
        <td>30 นาที</td>
        <td style="text-align: center;">
          <button class = "btn btn-block" type = "button">เริ่มทำข้อสอบ</button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
</div>

<div class = "row">
  <div class = "col-md-12" align = "center">
    <ul class = "pagination">
      <li class = "disabled"><a href = "#">&laquo;</a></li>
      <li class = "active"><a href = "#">1</a></li>
      <li><a>2</a></li>
      <li><a>3</a></li>
      <li><a>4</a></li>
      <li><a>5</a></li>
      <li class = "disabled"><a href = "#">&raquo;</a></li>
    </ul>
  </div>
</div>