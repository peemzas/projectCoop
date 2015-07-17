<%--
  Created by IntelliJ IDEA.
  User: wanchana
  Date: 17/7/2558
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Modal for edit Questions -->
<div id = "editQuestionModal" class = "modal container fade" role = "dialog">
  <div class = "modal-dialog">
    <div class = "modal-content">
      <div class = "modal-header">
        <h4 class = "modal-title">แก้ไขข้อสอบ</h4>
        <button class = "close" type = "button" data-dismiss = "close"></button>
      </div>
      <div class = "modal-body">
        <div class = "row">
          <div class = "col-md-4" align = "right">หมวดหมู่หลัก</div>
          <div class = "col-md-5 input-group">
            <input class="form-control" placeholder = "JAVA">
            <div class="input-group-btn">
              <button class="btn btn-default">ค้นหา</button>
            </div>
          </div>
        </div>
        <div class = "row">
          <div class = "col-md-4" align = "right">หมวดหมู่หลัก</div>
          <div class = "col-md-5 input-group">
            <input class="form-control" placeholder = "JAVA">
            <div class="input-group-btn">
              <button class="btn btn-default">ค้นหา</button>
            </div>
          </div>
        </div>
        <hr/>
        <div class = "row">
          <div class = "col-md-12">
            <form class = "form-inline">
              <label>หมายเลขข้อสอบ</label>
              <input class = "form-control" placeholder = "11111"/>
            </form>
          </div>
        </div>
        <div class = "row">
          <div class = "col-md-12">
            <div class = "col-md-2" align = "right">
              <label>คำถาม</label>
            </div>
            <div class = "col-md-10">
              <textarea class = "form-control" row = "2" style = "width: 100%;" placeholder = "อะไรเอ่ยน่ากลัวที่สุด(แฮ่)"></textarea>
            </div>
            <br/>
            <div class = "col-md-12 col-md-offset-1">
              <form class = "form-inline">
                <div class = "form-group">
                  <label>ตัวเลือกคำตอบ1</label>
                  <input type = "radio" class = "form-control"/>
                  <input type = "text"  class = "form-control" placeholder = "โปเกม่อน"/>
                </div>
              </form>
              <form class = "form-inline">
                <div class = "form-group">
                  <label>ตัวเลือกคำตอบ2</label>
                  <input type = "radio" class = "form-control"/>
                  <input type = "text"  class = "form-control" placeholder = "โดเรม่อน"/>
                </div>
              </form>
              <form class = "form-inline">
                <div class = "form-group">
                  <label>ตัวเลือกคำตอบ3</label>
                  <input type = "radio" class = "form-control"/>
                  <input type = "text"  class = "form-control" placeholder = "เคโรโระ"/>
                </div>
              </form>
              <form class = "form-inline">
                <div class = "form-group">
                  <label>ตัวเลือกคำตอบ4</label>
                  <input type = "radio" class = "form-control"/>
                  <input type = "text"  class = "form-control" placeholder = "ซอมบี้"/>
                </div>
              </form>
            </div>
            </div>
          </div>
        </div>
      <div class = "row">
        <div class = "col-md-12">
          <form class = "form-inline">
            <div class = "form-group">
              <label>ระดับความยาก</label>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
