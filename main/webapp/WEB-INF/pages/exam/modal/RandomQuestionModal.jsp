<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 7/17/2015
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Modal SelectQuestion-->
<div class="modal fade" id="randomQuestionModal">
    <div class="modal-dialog modal-lg" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">

                <%--<h3 class="modal-title" align="center">สุ่มข้อสอบ</h3>--%>


                <div class="modal-body">
                    <button type="button" class="close"aria-label="Close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span></button>

                    <h3>สุ่มข้อสอบ</h3>
                    <hr>

                    <%--<%@include file="../template/selectCategoryInput.jsp" %>--%>
                    <%--<br>--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-md-12"  align="right">--%>
                            <%--<%@include file="../template/selectCategoryInput.jsp" %>--%>

                        <%--</div>--%>

                    <%--</div>--%>
                    <%--<br>--%>
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <div class="panel panel-default">
                                <div class="panel-heading" ><h4>ค้นหา...</h4></div>
                                <div class="panel-body">
                                    <div class="row">
                                        <%@include file="../template/selectCategoryInput.jsp" %>
                                    </div>

                                    <br>

                    <div class="row">
                        <div class="col-md-2" align="right"><h5>จำนวนข้อต่อระดับความยาก : </h5></div>
                        <div class="col-md-1">
                            <h5 align="right">ยาก</h5>
                        </div>
                        <div class="col-md-2 "style="width: 10%" >
                            <input class="form-control" type="number" id="numberOfHard">
                        </div>

                        <div class="col-md-1 " align="right">
                            <h5>ปานกลาง</h5>
                        </div>
                        <div class="col-md-2"style="width: 10%">
                            <input class="form-control" type="number" id="numberOfNormal">
                        </div>

                        <div class="col-md-1 " align="right">
                            <h5>ง่าย</h5>
                        </div>
                        <div class="col-md-2"style="width: 10%">
                            <input class="form-control" type="number" id="numberOfEasy">
                        </div>
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-2" align="right">
                            <h5>คะแนนรวม : </h5>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control" type="number" id="randomSummaryScore">
                        </div>
                        <div class = "row" id = "btnSearch">
                            <div class = "col-md-12 text-center">
                                <button class = "btn btn-default" type = "button">ค้นหา</button>
                                <button class = "btn btn-default" type = "button">ล้างข้อมูล</button>
                            </div>
                        </div>
                    </div>

                                    </div>
                                </div></div></div>


                    <%--<br>--%>



                    </div>


                    <hr>


                <div class="row ">
                    <div class="col-md-3 col-md-offset-4">
                        <h3 align="center">ผลลัพธ์การสุ่ม</h3>

                    </div>
                    <div class="col-md-2 col-md-offset-3">

                        <button class="btn btn-gray" id="randomStartBtn">สุ่มผลลัพธ์</button>
                    </div>
                    </div>


                    <table class="table">
                        <thead class="bg-primary">
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
<style>
    tr, th {
        text-align: center;
        align-content: center;
    }
    th {
        border:1px solid white;
    }

</style>


