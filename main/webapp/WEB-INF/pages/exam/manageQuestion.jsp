<%--
  Created by IntelliJ IDEA.
  User: wanchana
  Date: 15/7/2558
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="modal/addEmployeeToInputModal.jsp"%>
<%@include file="modal/createQuestionModal.jsp"%>
<div class="container row">
  <h3 class="h3">จัดการข้อสอบ</h3>
</div>
<hr/>
<div class = "container">
  <%@include file="template/searchQuestionTemplateNew.jsp"%>
  <br/>
  <br/>

<!-- Example table information, it will remove soon ^^ -->
    <div class = "row">
      <div class = "col-md-12" align = "center">
        <table class = "table">
          <thead class="bg-primary">
            <tr>
              <th style = "text-align: center">หมายเลขข้อสอบ</th>
              <th style = "text-align: center">ข้อสอบ</th>
              <th style = "text-align: center">ชนิดข้อสอบ</th>
              <th style = "text-align: center">ระดับความยาก</th>
              <th style = "text-align: center">คะแนน</th>
              <th style = "text-align: center">หมวดหมู่หลัก</th>
              <th style = "text-align: center">หมวดหมู่ย่อย</th>
              <th style = "text-align: center">ผู้สร้าง</th>
              <th style = "text-align: center">วันที่สร้าง</th>
              <th style = "text-align: center">Action</th>
            </tr>
          </thead>
          <tbody align="center">
            <tr>
              <td>1111</td>
              <td>อะไรเอ่ยน่ากลัวที่สุด (แฮ่)</td>
              <td>อัตนัย</td>
              <td>ยากมาก</td>
              <td>100</td>
              <td>หมวดหมู่หลัก</td>
              <td>หมวดหมู่ย่อย</td>
              <td>เคโรโระ</td>
              <td>19/01/2015</td>
              <%--<td><button class = "btn btn-warning" type = "button" data-toggle = "modal" data-target = "#createQuest"><span class = "glyphicon glyphicon-pencil"></span></button></td>--%>
              <%--<td><button class = "btn btn-info" type = "button"><span class = "glyphicon glyphicon-book"></span></button></td>--%>
              <td>
                <div class="btn-group">
                  <button class="btn dropdown-toggle" data-toggle="dropdown">
                    เลือก<span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu">
                    <li><a href="#">ดู</a></li>
                    <li><a data-toggle = "modal" data-target = "#createQuest">แก้ไข</a></li>
                    <li><a href="#">ลบ</a></li>
                  </ul>
                </div>
              </td>
            </tr>
            <tr>
              <td>1111</td>
              <td>อะไรเอ่ยน่ากลัวที่สุด (แฮ่)</td>
              <td>อัตนัย</td>
              <td>ยากมาก</td>
              <td>100</td>
              <td>หมวดหมู่หลัก</td>
              <td>หมวดหมู่ย่อย</td>
              <td>เคโรโระ</td>
              <td>19/01/2015</td>
              <td>
                <div class="btn-group">
                  <button class="btn dropdown-toggle" data-toggle="dropdown">
                    เลือก<span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu">
                    <li><a href="#">ดู</a></li>
                    <li><a data-toggle = "modal" data-target = "#createQuest">แก้ไข</a></li>
                    <li><a href="#">ลบ</a></li>
                  </ul>
                </div>
              </td>
            </tr>
            <tr>
              <td>1111</td>
              <td>อะไรเอ่ยน่ากลัวที่สุด (แฮ่)</td>
              <td>อัตนัย</td>
              <td>ยากมาก</td>
              <td>100</td>
              <td>หมวดหมู่หลัก</td>
              <td>หมวดหมู่ย่อย</td>
              <td>เคโรโระ</td>
              <td>19/01/2015</td>
              <td>
                <div class="btn-group">
                  <button class="btn dropdown-toggle" data-toggle="dropdown">
                    เลือก<span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu">
                    <li><a href="#">ดู</a></li>
                    <li><a data-toggle = "modal" data-target = "#createQuest">แก้ไข</a></li>
                    <li><a href="#">ลบ</a></li>
                  </ul>
                </div>
              </td>
            </tr>
            <tr>
              <td>1111</td>
              <td>อะไรเอ่ยน่ากลัวที่สุด (แฮ่)</td>
              <td>อัตนัย</td>
              <td>ยากมาก</td>
              <td>100</td>
              <td>หมวดหมู่หลัก</td>
              <td>หมวดหมู่ย่อย</td>
              <td>เคโรโระ</td>
              <td>19/01/2015</td>
              <td>
                <div class="btn-group">
                  <button class="btn dropdown-toggle" data-toggle="dropdown">
                    เลือก<span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu">
                    <li><a href="#">ดู</a></li>
                    <li><a data-toggle = "modal" data-target = "#createQuest">แก้ไข</a></li>
                    <li><a href="#">ลบ</a></li>
                  </ul>
                </div>
              </td>
            </tr>
            <tr>
              <td>1111</td>
              <td>อะไรเอ่ยน่ากลัวที่สุด (แฮ่)</td>
              <td>อัตนัย</td>
              <td>ยากมาก</td>
              <td>100</td>
              <td>หมวดหมู่หลัก</td>
              <td>หมวดหมู่ย่อย</td>
              <td>เคโรโระ</td>
              <td>19/01/2015</td>
              <td>
                <div class="btn-group">
                  <button class="btn dropdown-toggle" data-toggle="dropdown">
                    เลือก<span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu">
                    <li><a data-toggle = "modal" data-target = "#createQuest">ดู</a></li>
                    <li><a data-toggle = "modal" data-target = "#createQuest">แก้ไข</a></li>
                    <li><a href="#">ลบ</a></li>
                  </ul>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <br/><br/>
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
  </div>
</div>


<script src="../../../resources/js/pageScript/exam/manageQuestion.js" charset="UTF-8"></script>

<style>
  th{
    border : solid 1px white;
  }
</style>

