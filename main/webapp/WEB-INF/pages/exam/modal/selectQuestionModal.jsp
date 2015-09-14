<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal eSelectQuestion-->
<style>
    #selectQuest{
        overflow-y: auto;
    }
</style>
<div class="modal fade" id="selectQuest">
    <div class="modal-dialog modal-lg" style="width: 80%">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-body">
                    <button type="button" class="close"aria-label="Close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span></button>
                    <%--<h3 class="modal-title" align="center">เลือกคำถาม</h3>--%>

                    <div class="container row">
                        <h3>เลือกข้อสอบ</h3>
                        <hr>
                    </div>

                    <%@include file="../template/searchQuestionTemplateNew.jsp"%>

                    <table id="tbSelectQuestion" class="table table-view">
                        <thead class="bg-primary">
                            <tr>
                                <th>เลือก</th>
                                <%--<th>หมายเลขข้อสอบ</th>--%>
                                <th>วิชา</th>
                                <th>หัวข้อเรื่อง</th>
                                <th>คำถาม</th>
                                <th>ประเภท</th>
                                <th>ความยาก</th>
                                <th>คะแนน</th>
                                <%--<th>สร้างโดย</th>--%>
                                <%--<th>วันที่สร้าง</th>--%>
                                <th>ดูรายละเอียด</th>
                            </tr>
                        </thead>
                        <tbody id="tbodySelectQuestion">


                            <%--<td>--%>
                                <%--<button class="btn btn-info">--%>
                                    <%--<div class="glyphicon glyphicon-search"></div>--%>
                                <%--</button>--%>
                            <%--</td>--%>

                        </tbody>
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
                            <button id="addQuestionBtn" class = "btn btn-default" type = "button">เพิ่มคำถาม</button>
                            <button class = "btn btn-default" type = "button">แสดงข้อมูล</button>
                        </div>
                    </div>

                    <div id="show"></div>

                </div>
            </div>
        </div>

        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- End Modal Select Question -->
<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/managePaper.js" />"></script>
<%--Add By Mr.Wanchana--%>
<!-- Modal show Quertion Information -->
<div id="showQuestionInfoModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">รายละเอียดข้อสอบ</h4>
            </div>
            <div class="modal-body" id="questionInfoBody">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    $("#addQuestionBtn").on('click', function(){
        $("#selectQuest").hide();
    });
</script>