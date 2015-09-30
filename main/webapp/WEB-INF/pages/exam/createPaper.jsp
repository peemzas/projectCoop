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
  #questionNotFound{
    background-color: #b2e0ff;
    height: 100px;
    display: none;
    top: 40px;
    vertical-align: middle;
    border-radius: 5px;
    margin-top: -15px;
  }
  #questionNotFoundDesc{
    text-align: center;
    vertical-align: middle;
    line-height: 100px;
    color: #00647f;
  }
  td{
    font-size: 13.5px;
  }
  #tbSelectedQuestionToPaper{
    margin-top: 5px;
  }
</style>

<div class="container">
  <h3>สร้างชุดข้อสอบ</h3>
  <hr>
  <form class="form-horizontal" role="form">
     <div class="row">
         <div class="col-sm-5">
           <div class="col-sm-4 col-sm-offset-2" align="right">
             <span style="color:red;">*</span><label for="newPaperId" class="label-control"><h5 style="margin-top: 5px">รหัสชุดข้อสอบ</h5></label>
           </div>
           <div class="col-sm-6" align="right">
             <input id="newPaperId" class="form-control input-sm" type="text" required/>
           </div>
         </div>
         <div class="col-sm-7">
           <div class="col-sm-3" align="right">
             <label for="newPaperName" class="label-control"><h5 style="margin-top: 5px">ชื่อชุดข้อสอบ</h5></label>
           </div>
           <div class="col-sm-8">
             <input id="newPaperName" class="form-control input-sm" type="text"/>
           </div>
         </div>
     </div>
    <div class="row">
      <div class="col-sm-5">
        <div class="col-sm-4 col-sm-offset-2" align="right">
          <span style="color:red;">*</span><label for="newPaperScore" class="label-control"><h5 style="margin-top: 5px">คะแนน</h5></label>
        </div>
        <div class="col-sm-6">
          <input id="newPaperScore" class="form-control input-sm" type="text" required/>
        </div>
      </div>
      <div class="col-sm-7">
        <div class="col-sm-3" align="right">
          <span style="color:red;">*</span><label for="newPaperForPosition" class="label-control"><h5 style="margin-top: 5px">ตำแหน่ง</h5></label>
        </div>
        <div class="col-sm-5">
          <select id="newPaperForPosition" class="form-control input-sm">
            <option active>เลือกตำแหน่ง</option>
            <option value="all">ทั้งหมด</option>
            <option value="1">Developer</option>
            <option value="5">Business Analysis</option>
          </select>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-5">
        <div class="col-sm-4 col-sm-offset-2" align="right">
          <span style="color:red;">*</span><label class="label-control"><h5 style="margin-top: 5px">เวลา</h5></label>
        </div>
        <div class="col-sm-3">
          <input id="hours" class="form-control input-sm" type="number" required/>
        </div>
        <div class="col-sm-3">
          <input id="minutes" class="form-control input-sm" type="number" required/>
        </div>
      </div>
    </div>
  </form>

  <div class="row">
    <div class="col-sm-12" style="text-align: center">
      <button id="selectionQuestionBtnInpagePaper" data-toggle="modal" data-target="#selectQuest" class="btn btn-gray btn-sm">เลือกข้อสอบ</button>
      <button data-toggle="modal" data-target="#randomQuestionModal" class="btn btn-gray btn-sm">สุ่มข้อสอบ</button>
    </div>
  </div>

  <div class="row">
    <a href="/TDCS/exam/managePapers">
      <button class="btn btn-danger" align="center" style="width:50px;height:35px">
        <span class="glyphicon glyphicon-arrow-left"></span>
      </button>
    </a>
    <hr/>
    <button id="removeRowQuestionSelect" class="btn btn-danger btn-sm" type="button" style="height: 30px;"><span class="glyphicon glyphicon-trash"></span></button>
    <button id="createPaperBtn" class="btn btn-success btn-sm" type="button">บันทึก</button>
    <button id="cancelCreatePaperBtn" class="btn btn-warning btn-sm" type="button">ยกเลิก</button>
    <table id="tbSelectedQuestionToPaper" class="table">
      <thead class="bg-primary small">
        <tr>
          <th style="text-align: center ;"><input id="checkAllQuestionFromCreatePaperPage" type="checkbox"></th>
          <th style="text-align: center ;">ประเภท</th>
          <th style="text-align: center ;">หมวดหมู่</th>
          <th style="text-align: center ;">หัวข้อเรื่อง</th>
          <th style="text-align: center ;">ข้อสอบ</th>
          <th style="text-align: center ;">ระดับ</th>
          <th style="text-align: center ;">คะแนน</th>
          <th style="text-align: center ;">ผู้สร้าง</th>
        </tr>
      </thead>
      <tbody id="tbodySelectedQuestionToPaper">

      </tbody>
    </table>
    <div id="questionNotFound" width="100%">
      <h3 id="questionNotFoundDesc">ยังไม่มีข้อสอบในชุดข้อสอบ</h3>
    </div>
  </div>

  <br/>
  <div class="row">
    <div class="col-sm-1 col-sm-offset-9">
      <label align="right"><h5>คะแนน =</h5></label>
    </div>
    <div class="col-md-1">
      <input class="form-control input-sm" readonly="true" name="score" id="maxScore" style="text-align: center">
    </div>
    <div class="col-md-1">
      <input class="form-control input-sm" readonly="true" name="score" id="score" style="text-align: center">
    </div>
  </div>

  <%--<div class = "row">--%>
    <%--<div class = "col-md-12" align = "center">--%>
      <%--<ul class = "pagination">--%>
        <%--<li class = "disabled"><a href = "#">&laquo;</a></li>--%>
        <%--<li class = "active"><a href = "#">1</a></li>--%>
        <%--<li><a>2</a></li>--%>
        <%--<li><a>3</a></li>--%>
        <%--<li><a>4</a></li>--%>
        <%--<li><a>5</a></li>--%>
        <%--<li class = "disabled"><a href = "#">&raquo;</a></li>--%>
      <%--</ul>--%>
    <%--</div>--%>
  <%--</div>--%>
<%--</div>--%>

<%--<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/categoryDropdown.js" />"></script>--%>
<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/managePaper.js" />"></script>

<%@include file="modal/createQuestionModal.jsp"%>
<%@include file="modal/selectQuestionModal.jsp"%>
<%@include file="modal/RandomQuestionModal.jsp"%>
