<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h3 class="h3">เลือกทำข้อสอบ</h3>
  </div>
</div>
<hr/>

<div class="container">
  <div class="row">
    <table class="table">
      <thead class="label-primary small bg-primary">
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
      <c:forEach var="paper" items="${openPaperList}">



        <tr>
          <td>${paper.name}</td>
          <td>${paper.createBy.thFname}&nbsp;${paper.createBy.thLname}</td>
          <td>${paper.position.posiName}</td>
          <td align="center">${paper.maxScore}</td>
          <td align="center">${paper.timeLimit} นาที</td>
          <td style="text-align: center;">
            <a class="doExamBtn" location="/TDCS/exam/doExam?paperId=${paper.id}"> <button class = "btn btn-block" type = "button">เริ่มทำข้อสอบ</button> </a>
          </td>
        </tr>

      </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<script src="../../../resources/js/pageScript/exam/mainPageStudent.js"></script>
