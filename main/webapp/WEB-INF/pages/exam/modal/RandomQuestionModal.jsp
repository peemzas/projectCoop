<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 7/17/2015
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal SelectQuestion-->
<div class="modal fade" id="randomQuestionModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">

                <h2>เพิ่มข้อสอบแบบสุ่ม</h2>

                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>

                    <%@include file="../template/selectCategoryInput.jsp" %>
                    <br>

                    <%--<%@include file="../template/selectCreateByInput.jsp"%>--%>  <!--select CreateBy-->
                    <br>

                    <div class="row">
                        <div class="col-md-3" align="right"><h5>จำนวนข้อต่อระดับความยาก : </h5></div>
                        <div class="col-md-3">
                            <h5>ยาก</h5> <input class="form-control" type="number" id="numberOfHard">
                        </div>
                        <div class="col-md-3">
                            <h5>ปานกลาง</h5> <input class="form-control" type="number" id="numberOfNormal">
                        </div>
                        <div class="col-md-3">
                            <h5>ง่าย</h5> <input class="form-control" type="number" id="numberOfEasy">
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-2">
                            <h5>คะแนนรวม</h5> <input class="form-control" type="number" id="randomSummaryScore">
                        </div>
                    </div>

                    <br>

                    <div class="row ">
                        <div class="col-md-1 col-md-offset-11">
                            <button class="btn btn-primary" id="randomStartBtn">สุ่มผลลัพธ์</button>
                        </div>

                    </div>

                    <br>
                    <hr>

                    <h2 align="center">ผลลัพธ์การสุ่ม</h2>

                    <table class="table table-bordered" id="">
                        <thead>
                        <tr>
                            <th>เลือก</th>
                            <th>หัวข้อเรื่อง</th>
                            <th>คำถาม</th>
                            <th>สร้างโดย</th>
                            <th>ความยาก</th>
                            <th>คะแนน</th>
                            <th>ดูรายละเอียด</th>
                        </tr>
                        </thead>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>AAAA</td>
                            <td>AAAA</td>
                            <td>AAAA</td>
                            <td>AAAA</td>
                            <td>AAAA</td>
                            <td><button class="btn btn-info"><div class="glyphicon glyphicon-search"></div> </button> </td>
                        </tr>
                    </table>

                    <div class="row">
                        <div class="col-md-offset-6 col-md-2">
                            <button class="btn btn-primary" id="addToPaperBtn">เพิ่มลงในข้อสอบ</button>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-warning" id="clearRandomResultBtn">ล้างผลลัพธ์</button>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-default" id="backFromRandomBtn">ย้อนกลับ</button>
                        </div>
                    </div>

                </div>

                <br>

            </div>
        </div>
    </div>
    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Modal Select Question -->


