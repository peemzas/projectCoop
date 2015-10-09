<%--
  Created by IntelliJ IDEA.
  User: wanchana
  Date: 15/7/2558
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="modal/createQuestionModal.jsp" %>
<%@include file="modal/questionDetailModal.jsp" %>
<div class="container row">
    <h3 class="h3">จัดการข้อสอบ</h3>
</div>
<hr/>

<div class="container">
    <%@include file="template/searchQuestionTemplateNew.jsp" %>

    <!-- Example table information, it will remove soon ^^ -->
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-xs-1 ">
                    <button class="btn btn-success btn-block createQuestionBtn form-control"
                            data-toggle="modal" data-target="#createQuest" style="height: 35px;width: 50px;">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
                    <button class="btn btn-info btn-block form-control" data-toggle="modal" data-target="#questionDetailModal2" style="height: 35px;width: 50px;" >
                        Test
                    </button>
                </div>
            </div>
            <table class="table">
                <thead class="bg-primary">
                <tr>
                    <%--<th style="text-align: center">หมายเลขข้อสอบ</th>--%>
                    <th><input type="checkbox" id="selectAllItem" class="form-control"/></th>
                    <th style="text-align: center">ชนิดข้อสอบ</th>
                    <th style="text-align: center">หมวดหมู่</th>
                    <th style="text-align: center">หัวข้อเรื่อง</th>

                    <th style="text-align: center" width="35%">คำถาม</th>
                    <th style="text-align: center">ระดับความยาก</th>
                    <th style="text-align: center">คะแนน</th>
                    <th style="text-align: center">ผู้สร้าง</th>
                    <th style="text-align: center">วันที่สร้าง</th>

                    <th style="text-align: center">Action</th>
                </tr>
                </thead>
                <tbody align="center" id="tableBody">

                </tbody>
            </table>
        </div>
    </div>
    <br/><br/>

    <div class="row">
        <div class="col-md-12" align="center">
            <ul class="pagination">
                <li class="disabled"><a href="#">&laquo;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a>2</a></li>
                <li><a>3</a></li>
                <li><a>4</a></li>
                <li><a>5</a></li>
                <li class="disabled"><a href="#">&raquo;</a></li>
            </ul>
        </div>
    </div>
</div>
</div>

<div class="modal fade" id="questionDetailModal2">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <%--<button type="button" class="glyphicon glyphicon-pencil btn btn-warning" id="editThisQuestion" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                <h4>ข้อมูลข้อสอบ</h4>
                <div class="row">
                    <div class="col-md-2 text-right">
                        ID&nbsp;:
                    </div>
                    <div class="col-md-3" id="qDetailId"></div>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-2 text-right">
                        หมวดหมู่&nbsp;:
                    </div>
                    <div class="col-md-3" id="qDetailCategory"></div>
                    <div class="col-md-2 col-md-offset-1 text-right">
                        หัวข้อเรื่อง&nbsp;:
                    </div>
                    <div class="col-md-3" id="qDetailSubCategory"></div>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-2 text-right">
                        สร้างโดย&nbsp;:
                    </div>
                    <div class="col-md-3" id="qDetailCreateBy"></div>
                    <div class="col-md-2 col-md-offset-1 text-right">
                        วันที่สร้าง&nbsp;:
                    </div>
                    <div class="col-md-3" id="qDetailCreateDate"></div>
                </div>
                <br>

                <div class="row" class="qUpdateDetail" hidden>
                    <div class="col-md-2 text-right">
                        อัพเดทโดย&nbsp;:
                    </div>
                    <div class="col-md-3" id="qDetailUpdateBy"></div>
                    <div class="col-md-2 col-md-offset-1 text-right">
                        วันที่อัพเดท&nbsp;:
                    </div>
                    <div class="col-md-3" id="qDetailUpdateDate"></div>

                </div>
                <br class="qUpdateDetail" hidden>


                <div class="row">
                    <div class="col-md-2 text-right">
                        ระดับความยาก&nbsp;:
                    </div>
                    <div class="col-md-3" id="qDetailDifficutyLevel"></div>
                    <div class="col-md-2 col-md-offset-1 text-right">
                        คะแนนเริ่มต้น&nbsp;:
                    </div>
                    <div class="col-md-3" id="qDetailDefaultScore"></div>
                </div>

            </div>

            <div class="modal-body">

            </div>

        </div>
    </div>
</div>


<script src="../../../resources/js/pageScript/exam/manageQuestion.js" charset="UTF-8"></script>

<style>
    th {
        border: solid 1px white;
    }
</style>

