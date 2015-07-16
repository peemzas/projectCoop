<%--
  Created by IntelliJ IDEA.
  User: wanchana
  Date: 16/7/2558
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class = "row">
  <div class = "col-md-12">
    <div class = "panel panel-default">
      <div class = "panel panel-heading">
        ค้นหาข้อสอบ
      </div>
      <div class = "panel panel-body">
        <div class = "row">
          <div class = "col-md-12">
            <form class = "form-inline">
              <form class = "form-group">
                <div class = "col-md-2" align="right">
                  <label>ชื่อหมวดหมู่หลัก</label>
                </div>
                <div class = "col-md-3">
                  <input class = "form-control" type = "text">
                </div>
                <div class = "col-md-2">
                  <label>ชื่อหมวดหมู่ย่อย</label>
                </div>
                <div class = "col-md-3">
                  <input class = "form-control" type = "text">
                </div>
              </form>
            </form>
          </div>
        </div>
        <br/>
        <div class = "row">
          <div class = "col-md-12">
            <form class = "form-inline">
              <form class = "form-group">
                <div class = "col-md-2" align="right">
                  <label>ชื่อผู้สร้างข้อสอบ</label>
                </div>
                <div class = "col-md-5 input-group">
                  <input class = "form-control" type = "text">
                  <div class = "input-group-btn">
                    <button class = "btn btn-default" type = "button" data-toggle = "modal" data-target = "#modalSearchByEmployeeName">+</button>
                  </div>
                </div>
              </form>
            </form>
          </div>
        </div>
        <br/>
        <div class = "row">
          <div class = "col-md-4 col-md-offset-3">
            <button class = "btn btn-info" type = "button" data-toggle = "collapse" data-target = "#advanceSearch">ค้นหาขั้นสูง</button>
          </div>
        </div>
      </div>
    </div>
  </div>
