<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal SelectQuestion-->
<div class="modal fade" id="selectQuest">
    <div class="modal-dialog modal-lg" style="width: 80%">
        <div class="modal-content">
            <div class="modal-header">

                <div class="modal-body">
                    <button type="button" class="close"aria-label="Close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span></button>
                    <%--<h3 class="modal-title" align="center">เลือกคำถาม</h3>--%>

                    <div class="container row">
                        <h3>ค้นหาข้อสอบ</h3>
                        <hr>
                    </div>
                    <%@include file="../template/searchQuestionTemplateNew.jsp" %>



                    <%--<div class="row form-group">--%>
                    <%--<div class="col-md-4" align="right">--%>
                    <%--<h4><label class="label label-success"--%>
                    <%--style="background-color: lightgreen ; color: black ; font-weight: 100">หมวดหมู่ :</label></h4>--%>
                    <%--</div>--%>
                    <%--<div class="input-group col-md-5">--%>
                    <%--<input type="text" class="form-control" name="cat"/>--%>
                    <%--<span class="input-group-addon" id="selectCat"><i class="glyphicon glyphicon-search"></i></span>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <%--<div class="row form-group">--%>
                    <%--<div class="col-md-4" align="right">--%>
                    <%--<h4><label class="label label-success"--%>
                    <%--style="background-color: lightgreen ; color: black ; font-weight: 100">ชื่อหัวข้อเรื่อง :</label>--%>
                    <%--</h4>--%>
                    <%--</div>--%>
                    <%--<div class="input-group col-md-5">--%>
                    <%--<input type="text" class="form-control" name="subcat"/>--%>
                    <%--<span class="input-group-addon" id="selectSubCat"><i class="glyphicon glyphicon-search"></i></span>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <table class="table table-bordered" id="">
                        <thead>
                        <tr>
                            <th>เลือก</th>
                            <th>หมายเลขคำถาม</th>
                            <th>คำถาม</th>
                            <th>ประเภท</th>
                            <th>ความยาก</th>
                            <th>คะแนน</th>
                            <th>หมวดหมู่หลัก</th>
                            <th>หัวข้อเรื่อง</th>
                            <th>สร้างโดย</th>
                            <th>วันที่สร้าง</th>
                            <th>ดูรายละเอียด</th>
                        </tr>
                        </thead>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>AAAA</td>
                            <td>AAAAAAAAAAAAAAAA</td>
                            <td>AAAA</td>
                            <td>AAAA</td>
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
                            <td>AAAAAAAAAAAAAAAA</td>
                            <td>AAAA</td>
                            <td>AAAA</td>
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
                            <td>AAAAAAAAAAAAAAAA</td>
                            <td>AAAA</td>
                            <td>AAAA</td>
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
                        <div class="col-md-1"><input class="form-control" align="center" disabled id="totalRandomQuestionScore" value="5/60"  >
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
                    <div class = "row" >
                        <div class = "col-md-12 text-center">
                            <button class = "btn btn-default" type = "button">เพิ่มคำถาม</button>
                            <button class = "btn btn-default" type = "button">แสดงข้อมูล</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- End Modal Select Question -->