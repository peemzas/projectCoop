<%--
  Created by IntelliJ IDEA.
  User: wanchana
  Date: 27/7/2558
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../modal/addEmployeeToInputModal.jsp" %>

<div class = "container">
  <div class = "row">
    <div class = "panel-collapse" id = "searchCollapse">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h5>ค้นหาชุดข้อสอบ</h5>
        </div>
        <div class="panel-body">
          <%--<form class="form-horizontal" role="form">--%>
            <div class="row">
              <div class="col-sm-5">
                <div class="col-sm-4 col-sm-offset-2" align="right">
                  <label for="newPaperId" class="label-control"><h5 style="margin-top: 5px">รหัสชุดข้อสอบ</h5></label>
                </div>
                <div class="col-sm-6">
                  <input id="newPaperId" class="form-control input-sm" type="text" required/>
                </div>
              </div>
              <div class="col-sm-7">
                <div class="col-sm-3 text-right">
                  <label for="newPaperName" class="label-control text-left"><h5 style="margin-top: 5px">ชื่อชุดข้อสอบ</h5></label>
                </div>
                <div class="col-sm-6">
                  <input id="newPaperName" class="form-control input-sm" type="text"/>
                </div>
              </div>
            </div>
            <div class = "row">
              <%@include file="selectCreateByInput.jsp"%>
            </div>
            <hr>
            <div class = "row" id = "btnSearch">
              <div class = "col-md-12 text-center">
                <button class = "btn btn-primary btn-sm" type = "button">ค้นหา</button>
                <button class = "btn btn-gray btn-sm" type = "button">ล้างข้อมูล</button>
              </div>
            </div>
          <%--</form>--%>
        </div>
        <div class = "panel-footer">
          <div class = "row">
            <div class = "col-md-3">
              <button class = "btn btn-primary" id = "advanceBtn"><span class = "glyphicon glyphicon-chevron-down">ค้นหาขั้นสูง</span></button>
          </div>
          </div>
          <div id = "advanceBody"  class = "collapse">
            <div class  = "row">
              <br/><br/>
              <div class = "col-md-2 text-right">
                <label>หมายเลขชุดข้อสอบ</label>
              </div>
              <div class = "col-md-3">
                <input class = "form-control" type = "text"/>
              </div>
            </div>
            <br/>
            <%--<div class="row">--%>
              <%--<div class="col-md-2 text-right">--%>
                <%--<label>คำถาม</label>--%>
              <%--</div>--%>
              <%--<div class="col-md-8">--%>
                <%--<input type="text" class="form-control"/>--%>
              <%--</div>--%>
            <%--</div>--%>
            <%--<br/>--%>
            <div class="row">
              <div class="col-md-2 text-right">
                <h5>วันที่สร้าง : </h5>
              </div>
              <div class="col-md-3">
                <div class="input-group">
                  <input type="text" class="form-control datepicker"/>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" href="#"></span></span>
                </div>
              </div>
              <div class="col-md-2" align="right">
                <h5>ถึง : </h5>
              </div>
              <div class="col-md-3">
                <div class="input-group">
                  <input type="text" class="form-control datepicker"/>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" href="#"></span></span>
                </div>
              </div>
            </div>
            <br/>
            <div class="row">
              <div class="col-md-2 text-right">
                <h5>คะแนน : </h5>
              </div>
              <div class="col-md-3">
                <input type="text" class="form-control"/>
              </div>
              <div class="col-md-2" align="right">
                <h5>ถึง : </h5>
              </div>
              <div class="col-md-3">
                <input type="text" class="form-control"/>
              </div>
            </div>
            <br/>
            <div class="row">
              <div class="col-md-2 text-right">
                <h5>สถานะ : </h5>
              </div>
              <div class="col-md-3">
                <select class="form-control">
                  <option selected value="none"></option>
                  <option>เปิด</option>
                  <option>ปิด</option>
                  <option>ถูกลบ</option>

                </select>
              </div>
            </div>
            <br/>
            <hr/>
            <div class = "row" id = "btnAdvanceSearch">
              <div class = "col-md-12 text-center">
                <button class = "btn btn-default" type = "button">ค้นหา</button>
                <button class = "btn btn-default" type = "button">ล้างข้อมูล</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  $(document).ready(function(){
    $("#advanceBtn").click(function(){
      var str = $("#search").prop('outerHTML') + "&nbsp" + $("#clear").prop('outerHTML');
      $("#advanceBody").collapse('toggle');
      if($("#advanceBtn").children("span").hasClass("glyphicon glyphicon-chevron-down")){
        $("#advanceBtn").children("span").removeClass("glyphicon glyphicon-chevron-down").addClass("glyphicon glyphicon-chevron-up")
        $("#btnSearch").hide();
        $("#btnAdvanceSearch").show();
      }
      else{
        $("#advanceBtn").children("span").removeClass("glyphicon glyphicon-chevron-up").addClass("glyphicon glyphicon-chevron-down");

        $("#btnSearch").show();
        $("#btnAdvanceSearch").hide();
      }
    });
    $(".datepicker").datepicker();
  });
</script>
