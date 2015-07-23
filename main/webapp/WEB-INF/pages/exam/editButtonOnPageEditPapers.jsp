<%--
  Created by IntelliJ IDEA.
  User: wanchana
  Date: 21/7/2558
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class = "container">
  <div class = "row">
    <div class = "col-md-5 col-md-offset-1">
      <form class = "form-inline">
        <div class = "for-group">
          <label for = "paperName">ชื่อชุดข้อสอบ</label>
          <input id = "paperName" class = "form-control" type = "text" size="40%" placeholder = "แบบทดสอบวัดความรู้ก่อนการอบรม"/>
        </div>
      </form>
    </div>
    <div class = "col-md-6">
      <form class = "form-inline">
        <div class = "form-group">
          <label for = "position">ตำแหน่ง</label>
          <select id = "position" class = "form-control">
            <option>Developer</option>
            <option>ABA</option>
          </select>
        </div>
      </form>
    </div>
  </div>
  <br/>
  <div class = "row">
    <div class = "col-md-5 col-md-offset-1">
      <form class = "form-inline">
        <div class = "for-group">
          <label for = "maxScore">คะแนนเต็ม</label>
          <input id = "maxScore" class = "form-control" type = "text" size="10%" placeholder = "แบบทดสอบวัดความรู้ก่อนการอบรม"/>
        </div>
      </form>
    </div>
    <div class = "col-md-6">
      <form class = "form-inline">
        <div class = "form-group">
          <%--<input id = "propotionalScore" class = "form-control" type = "checkbox"/>--%>
          <label>Propotional Score</label>
        </div>
      </form>
    </div>
  </div>
  <hr/>
  <div class = "row">
    <div class = "col-md-12">
      <h4 align = "center">เลือกข้อสอบ</h4>
    </div>
  </div>
  <div class = "row">
    <div class = "col-md-12">
      <table>
        <thead>
          <tr>
            <th>เลือก</th>
            <th>หมวดหมู่หลัก</th>
            <th>หมวดหมู่ย่อย</th>
            <th>คำถาม</th>
            <th>ระดับความยาก</th>
            <th>คะแนน</th>
            <th>ผู้สร้าง</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input class = "form-control" type = "checkbox"/></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
