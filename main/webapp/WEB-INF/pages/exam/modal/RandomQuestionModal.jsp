<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 7/17/2015
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!-- Modal SelectQuestion-->

<style>
    tr, th {
        text-align: center;
        align-content: center;
    }
    th {
        border:1px solid white;
    }
</style>


<div class="modal fade" id="randomQuestionModal">
    <div class="modal-dialog modal-lg" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h2>ตั้งค่าการสุ่ม</h2>

                <div class="modal-body">


                    <%--<%@include file="../template/selectCategoryInput.jsp" %>--%>
                    <%--<br>--%>
                    <div class="row">
                        <div class="col-md-2" align="right">
                            <h5>หมวดหมู่ : </h5>
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control"/>
                        </div>
                        <div class="col-md-2 col-md-offset-1" align="right">
                            <h5>ชื่อหัวข้อเรื่อง : </h5>
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control"/>
                        </div>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-md-3" align="right"><h5>จำนวนข้อต่อระดับความยาก : </h5></div>
                        <div class="col-md-1">
                            <h5 align="right">ยาก</h5>
                        </div>
                        <div class="col-md-1">
                            <input class="form-control" type="number" id="numberOfHard">
                        </div>

                        <div class="col-md-1 col-md-offset-1" align="right">
                            <h5>ปานกลาง</h5>
                        </div>
                        <div class="col-md-1">
                            <input class="form-control" type="number" id="numberOfNormal">
                        </div>

                        <div class="col-md-1 col-md-offset-1" align="right">
                            <h5>ง่าย</h5>
                        </div>
                        <div class="col-md-1">
                            <input class="form-control" type="number" id="numberOfEasy">
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-2" align="right">
                            <h5>คะแนนรวม</h5>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control" type="number" id="randomSummaryScore">
                        </div>
                    </div>


                    <%--<br>--%>

                    <div class="row ">
                        <div class="col-md-1 col-md-offset-11">
                            <button class="btn btn-gray" id="randomStartBtn">สุ่มผลลัพธ์</button>
                        </div>

                    </div>

                    <br>
                    <hr>

                    <h2 align="center">ผลลัพธ์การสุ่ม</h2>

                    <table class="table">
                        <thead style="background-color:lightgreen;">
                        <tr>
                            <th>เลือก</th>
                            <th>หัวข้อเรื่อง</th>
                            <th>คำถาม</th>
                            <th>สร้างโดย</th>
                            <th>ความยาก</th>
                            <th>คะแนน</th>
                            <th width="100">ดูรายละเอียด</th>
                        </tr>
                        </thead>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>AAAA</td>
                            <td>AAAA</td>
                            <td>AAAA</td>
                            <td>AAAA</td>
                            <td>AAAA</td>
                            <td>
                                <button class="btn btn-info">
                                    <div class="glyphicon glyphicon-search"></div>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>AAAA</td>
                            <td>AAAA</td>
                            <td>AAAA</td>
                            <td>AAAA</td>
                            <td>AAAA</td>
                            <td>
                                <button class="btn btn-info">
                                    <div class="glyphicon glyphicon-search"></div>
                                </button>
                            </td>
                        </tr>
                    </table>

                    <div class="row">
                        <div class="col-md-offset-8 col-md-2" align="right"><h5>คะแนนรวม =</h5></div>
                        <div class="col-md-1"><input class="form-control" disabled id="totalRandomQuestionScore">
                        </div>

                    </div>
                    <br>

                    <div class="row">
                        <div class="col-md-offset-6 col-md-2">
                            <button class="btn btn-gray" id="addToPaperBtn" style="width: 80%;">เพิ่มลงในข้อสอบ</button>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-gray" id="clearRandomResultBtn" style="width: 80%;">ล้างผลลัพธ์</button>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-gray" id="backFromRandomBtn" style="width: 80%;">ย้อนกลับ</button>
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
</div>
<!-- /.modal -->
<!-- End Modal Select Question -->


