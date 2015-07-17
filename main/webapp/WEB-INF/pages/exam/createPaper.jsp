<%--
  Created by IntelliJ IDEA.
  User: PeeMz
  Date: 13/7/2558
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container row">
  <h3>สร้างชุดข้อสอบ</h3>
  <hr>
</div>
<div class="row">
  <div class="col-md-4" align="right">
    <label><h4 style="margin-top: 5px">ชื่อชุดข้อสอบ :</h4></label>
  </div>
  <div class="col-md-4">
    <input class="form-control" type="text" name="ppName"/>
  </div>
</div>
<div class="row">
  <div class="col-md-4" align="right">
    <label><h4 style="margin-top: 5px">คะแนนเต็มรวม :</h4></label>
  </div>
  <div class="col-md-4">
    <input class="form-control" type="text" name="ppScore"/>
  </div>
  <div class="col-md-4">
    <input class="check-box" type="checkbox" name="check"/>
    <label><h5>คะแนนตามสัดส่วน</h5></label>
  </div>
</div>
<div class="row">
  <div class="col-md-4" align="right">
    <label><h4 style="margin-top: 5px">ตำแหน่ง :</h4></label>
  </div>
  <div class="col-md-4">
    <select class="form-control">
      <option>Dev</option>
      <option>ABA</option>
    </select>
  </div>
</div>
<br>

<%--<div class="row">--%>
<%--<div class="col-md-2 col-md-offset-1" align="right">--%>
<%--<label><h4 style="margin-top: 5px">Category :</h4></label>--%>
<%--</div>--%>
<%--<div class="col-md-2">--%>
<%--<div class="input-group">--%>
<%--<input class="form-control" type="text" name="cat"/>--%>
<%--<span class="input-group-addon glyphicon glyphicon-search" style="position: static"></span>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="col-md-3" align="right">--%>
<%--<label><h4 style="margin-top: 5px">Sub-Category :</h4></label>--%>
<%--</div>--%>
<%--<div class="col-md-2">--%>
<%--<div class="input-group">--%>
<%--<input class="form-control" type="text" name="subcat"/>--%>
<%--<span class="input-group-addon glyphicon glyphicon-search" style="position: static"></span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="row">--%>
<%--<div class="col-md-2 col-md-offset-1" align="right">--%>
<%--<label><h4 style="margin-top: 5px">Create Date :</h4></label>--%>
<%--</div>--%>
<%--<div class="col-md-2">--%>
<%--<div class="input-group">--%>
<%--<input class="form-control" type="date" id="date"/>--%>
<%--<span class="input-group-addon glyphicon glyphicon-calendar" style="position: static"></span>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="col-md-3" align="right">--%>
<%--<label><h4 style="margin-top: 5px">Question Create By :</h4></label>--%>
<%--</div>--%>
<%--<div class="col-md-2">--%>
<%--<div class="input-group">--%>
<%--<input class="form-control" type="text" name="questcreate"/>--%>
<%--<span class="input-group-addon glyphicon glyphicon-search" style="position: static"></span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<div class="row">
  <div class="col-md-2 col-md-offset-5">
    <h4 align="center">ช้อสอบ</h4>
  </div>
  <div class="col-md-5" align="right" style="padding: 0px">
    <button  data-toggle="modal" data-target="#createQuest" class="btn btn-gray">เพิ่มคำถามใหม่</button>
    <button data-toggle="modal" data-target="#selectQuest" class="btn btn-gray">เลือกคำถาม </button>
    <button class="btn btn-gray">สุ่มข้อสอบ</button>
  </div>
</div>

<div class="row">
  <table class="table">
    <thead style="background-color: lightgreen">
    <tr>
      <th style="text-align: center ; border: 1px solid white">ประเภท</th>
      <th style="text-align: center ; border: 1px solid white">หมวดหมู่</th>
      <th style="text-align: center ; border: 1px solid white">หัวข้อเรื่อง</th>
      <th style="text-align: center ; border: 1px solid white">ข้อสอบ</th>
      <th style="text-align: center ; border: 1px solid white">ระดับ</th>
      <th style="text-align: center ; border: 1px solid white">คะแนน</th>
      <th style="text-align: center ; border: 1px solid white">สร้างโดย</th>
      <th style="text-align: center ; border: 1px solid white">วันที่สร้าง</th>
      <th style="text-align: center ; border: 1px solid white">ลบ</th>
    </tr>
    </thead>

    <tbody>
    <tr>
      <td style="text-align: center">ปรนัย</td>
      <td style="text-align: center">Java</td>
      <td style="text-align: center">OOP</td>
      <td style="text-align: center">What color do you like?</td>
      <td style="text-align: center">ยาก</td>
      <td style="text-align: center">2</td>
      <td style="text-align: center">PEEM</td>
      <td style="text-align: center">13/07/2015</td>
      <td style="text-align: center">
        <button class="btn glyphicon glyphicon-trash"></button>
      </td>
    </tr>

    <tr>
      <td style="text-align: center">อัตนัย</td>
      <td style="text-align: center">Java</td>
      <td style="text-align: center">Hibernate</td>
      <td style="text-align: center">What color do you like?</td>
      <td style="text-align: center">ยากเหี้ยๆ</td>
      <td style="text-align: center">100000000</td>
      <td style="text-align: center">PEEM</td>
      <td style="text-align: center">13/07/2015</td>
      <td style="text-align: center">
        <button class="btn glyphicon glyphicon-trash"></button>
      </td>
    </tr>
    </tbody>
  </table>
</div>


<div class="row">
  <div class="col-md-2 col-md-offset-9">
    <h4 align="right">คะแนนรวม = </h4>
  </div>
  <div class="col-md-1">
    <input class="form-control" readonly="true" name="score" id="score" value="5"
           style="text-align: center">
  </div>
</div>


<div class="row">
  <div class="col-md-4 col-md-offset-4" align="center">
    <button class="btn btn-gray">ยืนยัน</button>
    <button class="btn btn-gray">ล้าง</button>
    <button class="btn btn-gray">ยกเลิก</button>
  </div>
</div>



<script>
  $("#date").datepicker();
  function select(){
    $('#obj').click(function(){
      $('#objective').show();
      $('#objective2').show();
      $('#subjective').hide();
      $('#subjective2').hide();
    })

    $('#sub').click(function(){
      $('#subjective').show();
      $('#subjective2').show();
      $('#objective').hide();
      $('#objective2').hide();
    })

  }
</script>
<%@include file="modal/creatQuestionModal.jsp"%>
<%@include file="modal/selectQuestionModal.jsp"%>