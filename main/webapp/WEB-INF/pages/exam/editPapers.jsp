<%--
  Created by IntelliJ IDEA.
  User: wanchana
  Date: 16/7/2558
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class = "container">
  <div class = "row">
    <div class = "col-md-12">
      <div class = "panel panel-default">
        <div class = "panel panel-heading">
          ค้นหาชุดข้อสอบ
        </div>
        <div class = "panel panel-body">
          <div class = "row">
            <div class = "col-md-2" align = "right">
              <label>ชื่อหมวดหมู่หลัก</label>
            </div>
            <div class = "col-md-4">
              <input class = "form-control" type = "text">
            </div>
          </div>
          <br/>
          <div class = "row">
            <div class = "col-md-2" align = "right">
              <label>ชื่อหมวดหมู่ย่อย</label>
            </div>
            <div class = "col-md-4">
              <input class = "form-control" type = "text">
            </div>
          </div>
          <br/>
          <div class = "row">
            <div class = "col-md-2" align = "right">
              <label>ชื่อผู้สร้างชุดข้อสอบ</label>
            </div>
            <div class = "col-md-4">
              <div class = "input-group">
                <input class = "form-control" type = "text">
                <div class = "input-group-btn">
                  <button class = "btn btn-default" type = "button" data-toggle = "modal" data-target = "#modalSearchByEmployeeName">+</button>
                </div>
              </div>
            </div>
          </div>
          <br/>
          <div class = "row">
            <div class = "col-md-2" align = "right">
              <button class = "btn btn-info" type = "button" data-toggle = "collapse" data-target = "#advanceSearch">ค้นหาขั้นสูง</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <br/>
    <br/>

    <!-- Collapse for Advance search button -->
    <div class = "collapse" id = "advanceSearch">
      <div class = "container">
        <div class = "row">
          <div class = "col-md-12">
            <div class = "panel panel-default">
              <div class = "panel panel-body" align="center">
                <div class = "row">
                  <div class = "col-md-2" align = "right">
                    <label>หมายเลขชุดข้อสอบ</label>
                  </div>
                  <div class = "col-md-6">
                    <input class = "form-control" type = "text"/>
                  </div>
                </div>
                <br/>
                <div class = "row">
                  <div class = "col-md-2" align = "right">
                    <label>ชื่อชุดข้อสอบ</label>
                  </div>
                  <div class = "col-md-6">
                    <textarea class="form-control" rows="2"></textarea>
                  </div>
                </div>
                <br/>
                <div class = "row">
                  <div class = "col-md-2" align = "right">
                    <label>วันที่สร้าง</label>
                  </div>
                  <div class = "col-md-4">
                    <input class = "form-control" type = "text"/>
                  </div>
                </div>
                <br/>
                <div class = "row">
                  <div class = "col-md-2" align = "right">
                    <label>คะแนนเต็ม</label>
                  </div>
                  <div class = "col-md-2">
                    <input class = "form-control" type = "text"/>
                  </div>
                  <div class = "col-md-1">
                    <label>-</label>
                  </div>
                  <div class = "col-md-2">
                    <input class = "form-control" type = "text"/>
                  </div>
                </div>
                <div class = "row">
                  <div class = "col-md-2" align = "right">
                    <label>สถานะ</label>
                  </div>
                  <div class = "col-md-6">
                    <select class = "form-control">
                      <option></option>
                      <option></option>
                    </select>
                  </div>
                </div>
                <br/>
                <div class = "row">
                  <div class = "col-md-12" align = "center">
                    <form class = "form-group">
                      <button class = "btn btn-primary" type = "button">ค้นหา</button>
                      <button class = "btn btn-default" type = "button">ล้างข้อมูล</button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Example table information, it will remove soon ^^ -->
    <div class = "row">
      <div class = "col-md-12" align = "center">
        <table class = "table table-striped">
          <thead>
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
            <th style = "text-align: center">แก้ไข</th>
            <th style = "text-align: center">ดู</th>
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
            <td><button class = "btn btn-warning" type = "button"><span class = "glyphicon glyphicon-pencil"></span></button></td>
            <td><button class = "btn btn-info" type = "button"><span class = "glyphicon glyphicon-book"></span></button></td>
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
            <td><button class = "btn btn-warning" type = "button"><span class = "glyphicon glyphicon-pencil"></span></button></td>
            <td><button class = "btn btn-info" type = "button"><span class = "glyphicon glyphicon-book"></span></button></td>
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
            <td><button class = "btn btn-warning" type = "button"><span class = "glyphicon glyphicon-pencil"></span></button></td>
            <td><button class = "btn btn-info" type = "button"><span class = "glyphicon glyphicon-book"></span></button></td>
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
            <td><button class = "btn btn-warning" type = "button"><span class = "glyphicon glyphicon-pencil"></span></button></td>
            <td><button class = "btn btn-info" type = "button"><span class = "glyphicon glyphicon-book"></span></button></td>
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
            <td><button class = "btn btn-warning" type = "button"><span class = "glyphicon glyphicon-pencil"></span></button></td>
            <td><button class = "btn btn-info" type = "button"><span class = "glyphicon glyphicon-book"></span></button></td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
