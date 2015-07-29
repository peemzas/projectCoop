<%--
  Created by IntelliJ IDEA.
  User: PeeMz
  Date: 13/7/2558
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
  tr{
    align:center;
  }
</style>

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
    <h3 align="center">ข้อสอบ</h3>
  </div>
  <div class="col-md-5" align="right" style="padding: 0px">
    <button  data-toggle="modal" data-target="#createQuest" class="btn btn-gray">เพิ่มคำถามใหม่</button>
    <button data-toggle="modal" data-target="#selectQuest" class="btn btn-gray">เลือกคำถาม </button>
    <button data-toggle="modal" data-target="#randomQuestionModal" class="btn btn-gray">สุ่มข้อสอบ</button>
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
<%--<%@include file="modal/createQuestionModal.jsp"%>--%>
<!--Create Question Modal-->


<%--<div class="modal fade" id="createQuest">--%>
  <%--<div class="modal-dialog">--%>
    <%--<div class="modal-content">--%>
      <%--<div class="modal-header">--%>
        <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
        <%--<h3 class="modal-title" align="center">สร้างคำถาม</h3>--%>
      <%--</div>--%>
      <%--<div class="modal-body">--%>
        <%--<div class="row form-group">--%>
          <%--<div class="col-md-4" align="right">--%>
            <%--<h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">หมวดหมู่ :</label></h4>--%>
          <%--</div>--%>
          <%--<div class="input-group col-md-5">--%>
            <%--<input type="text" class="form-control" name="cat"/>--%>
            <%--<span class="input-group-addon" id="selectCat"><i class="glyphicon glyphicon-search"></i></span>--%>
          <%--</div>--%>
        <%--</div>--%>

        <%--<div class="row form-group">--%>
          <%--<div class="col-md-4" align="right">--%>
            <%--<h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">ชื่อหัวข้อเรื่อง :</label></h4>--%>
          <%--</div>--%>
          <%--<div class="input-group col-md-5">--%>
            <%--<input type="text" class="form-control" name="subcat" />--%>
            <%--<span class="input-group-addon" id="selectSubCat"><i class="glyphicon glyphicon-search"></i></span>--%>
          <%--</div>--%>
        <%--</div>--%>
        <%--<div class="row form-group">--%>
          <%--<div class="col-md-4" align="right">--%>
            <%--<h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">ประเภทข้อสอบ :</label></h4>--%>
          <%--</div>--%>
          <%--<div class="input-group col-md-5">--%>
            <%--<select class="form-control" onclick="select()">--%>
              <%--<option disabled selected></option>--%>
              <%--<option id="obj" value="Objective">ปรนัย</option>--%>
              <%--<option id="sub" value="Subjective">อัตนัย</option>--%>
            <%--</select>--%>
          <%--</div>--%>
          <%--<br>--%>
          <%--<div class="modal-footer" id="question">--%>
            <%--&lt;%&ndash; Start Objective&ndash;%&gt;--%>
            <%--<div class="row form-group" id="objective" style="display: none">--%>
              <%--<div class="col-md-4">--%>
                <%--<h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">ข้อสอบ :</label></h4>--%>
              <%--</div>--%>
              <%--<div class="col-md-5" style="padding: 0px">--%>
                <%--<textarea class="form-control" style="resize: none"></textarea>--%>
              <%--</div>--%>
              <%--<div class="col-md-3" align="left">--%>
                <%--<div class="radio">--%>
                  <%--<label><input type="radio" name="level" value="hard">ยาก</label>--%>
                <%--</div>--%>
                <%--<div class="radio">--%>
                  <%--<label><input type="radio" name="level" value="normal">ปานกลาง</label>--%>
                <%--</div>--%>
                <%--<div class="radio">--%>
                  <%--<label><input type="radio" name="level" value="easy">ง่าย</label>--%>
                <%--</div>--%>
              <%--</div>--%>
            <%--</div>--%>
            <%--<div class="row form-group" id="objective2" style="display: none">--%>
              <%--<div class="col-md-5 col-md-offset-4" style="padding: 0px" align="left">--%>
                <%--<div class="radio">--%>
                  <%--<input type="radio" name="level"/>--%>
                  <%--<input class="form-control" type="text" id="choiceA"/>--%>
                <%--</div>--%>
                <%--<div class="radio">--%>
                  <%--<input type="radio" name="level"/>--%>
                  <%--<input class="form-control" type="text" id="choiceB"/>--%>
                <%--</div>--%>
                <%--<div class="radio">--%>
                  <%--<input type="radio" name="level"/>--%>
                  <%--<input class="form-control" type="text" id="choiceC"/>--%>
                <%--</div>--%>
                <%--<div class="radio">--%>
                  <%--<input type="radio" name="level"/>--%>
                  <%--<input class="form-control" type="text" id="choiceD"/>--%>
                <%--</div>--%>
                <%--<div class="btn col-md-offset-1">--%>
                  <%--<button class="btn btn-primary">ตกลง</button>--%>
                  <%--<button class="btn btn-danger" data-dismiss="modal">ยกเลิก</button>--%>
                <%--</div>--%>
              <%--</div>--%>

              <%--<div class="col-md-1 col-md-offset-1">--%>
                <%--<div class="row form-group">--%>
                  <%--<div>--%>
                    <%--<h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">คะแนน</label></h4>--%>
                    <%--<input type="text" class="form-control" name="score"/>--%>
                  <%--</div>--%>
                <%--</div>--%>
              <%--</div>--%>
            <%--</div>--%>
            <%--&lt;%&ndash;End Objective&ndash;%&gt;--%>

            <%--&lt;%&ndash;Start Subjective&ndash;%&gt;--%>
            <%--<div class="row form-group" id="subjective" style="display: none">--%>
              <%--<div class="col-md-4">--%>
                <%--<h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">ข้อสอบ :</label></h4>--%>
              <%--</div>--%>
              <%--<div class="col-md-5" style="padding: 0px">--%>
                <%--<textarea class="form-control" style="resize: none"></textarea>--%>
              <%--</div>--%>
              <%--<div class="col-md-3" align="left">--%>
                <%--<div class="radio">--%>
                  <%--<label><input type="radio" name="level" value="hard">ยาก</label>--%>
                <%--</div>--%>
                <%--<div class="radio">--%>
                  <%--<label><input type="radio" name="level" value="normal">ปานกลาง</label>--%>
                <%--</div>--%>
                <%--<div class="radio">--%>
                  <%--<label><input type="radio" name="level" value="easy">ง่าย</label>--%>
                <%--</div>--%>
              <%--</div>--%>
            <%--</div>--%>
            <%--<div class="row form-group" id="subjective2" style="display: none">--%>
              <%--<div class="col-md-5 col-md-offset-4" align="left">--%>
                <%--<div class="row">--%>
                  <%--<textarea class="form-control" style="resize: none"></textarea>--%>
                <%--</div>--%>
                <%--<br>--%>
                <%--<div class="btn col-md-offset-1">--%>
                  <%--<button class="btn btn-primary">ตกลง</button>--%>
                  <%--<button class="btn btn-danger" data-dismiss="modal">ยกเลิก</button>--%>
                <%--</div>--%>
              <%--</div>--%>
              <%--<div class="col-md-1 col-md-offset-1">--%>
                <%--<div class="row form-group">--%>
                  <%--<div>--%>
                    <%--<h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">คะแนน</label></h4>--%>
                    <%--<input type="text" class="form-control" name="score"/>--%>
                  <%--</div>--%>
                <%--</div>--%>
              <%--</div>--%>
            <%--</div>--%>
            <%--&lt;%&ndash;End Subjective&ndash;%&gt;--%>

          <%--</div><!--Modal footer-->--%>
        <%--</div>--%>
      <%--</div>--%>
    <%--</div><!-- /.modal-content -->--%>
  <%--</div><!-- /.modal-dialog -->--%>
<%--</div><!-- /.modal -->--%>
<%--<!-- End Modal Create Question -->--%>



<%--<!--End Create Question Modal-->--%>

<%@include file="modal/createQuestionModal.jsp"%>
<%@include file="modal/selectQuestionModal.jsp"%>
<%@include file="modal/RandomQuestionModal.jsp"%>

<style>
  th{
    background-color:lightgreen;
    border:1px solid white;
  }
</style>