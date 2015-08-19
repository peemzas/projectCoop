<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 8/18/2015
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="questionDetailModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3>ข้อมูลข้อสอบ</h3>

            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-2 text-right">ID :</div>
                    <span class="col-md-6" id="idDetail"></span>

                    <div class="col-md-2 text-right">คะแนน :</div>
                    <span class="col-md-2" id="scoreDetail"></span>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-2 text-right">วิชา : </div>
                    <span class="col-md-2" id="categoryDetail"></span>

                    <div class="col-md-2 text-right">หัวข้อเรื่อง : </div>
                    <span class="col-md-2" id="subCategoryDetail"></span>

                    <div class="col-md-2 text-right">ความยาก : </div>
                    <span class="col-md-2" id="difficultyDetail"></span>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-2 text-right">สร้างโดย : </div>
                    <span class="col-md-2" id="createByDetail"></span>

                    <div class="col-md-2 text-right">วันที่สร้าง : </div>
                    <span class="col-md-2" id="createDateDetail"></span>

                    <div class="col-md-2 text-right">ประเภท : </div>
                    <span class="col-md-2" id="questionTypeDetail"></span>

                </div>
                <br>
                <div class="row">
                    <div class="col-md-2 text-right">คำถาม : </div>
                    <span class="col-md-8" id="questionDescDetail"></span>
                </div>

            </div>
            <div class="modal-footer">
                <div class="row">
                    <div class="col-md-1 col-md-offset-1">A : </div>
                    <div class="col-md-8" id="choiceDetail1"></div>
                    <div class="col-md-1 " id="correctDetail1"><span class="glyphicon glyphicon-ok " style="color:rgb(92, 184, 92)"></span> </div>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-1 col-md-offset-1">B : </div>
                    <div class="col-md-8" id="choiceDetail2"></div>
                    <div class="col-md-1 " id="correctDetail2"><span class="glyphicon glyphicon-ok " style="color:rgb(92, 184, 92)"></span></div>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-1 col-md-offset-1">C : </div>
                    <div class="col-md-8" id="choiceDetail3"></div>
                    <div class="col-md-1 " id="correctDetail3"><span class="glyphicon glyphicon-ok " style="color:rgb(92, 184, 92)"></span></div>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-1 col-md-offset-1">D : </div>
                    <div class="col-md-8" id="choiceDetail4"></div>
                    <div class="col-md-1 " id="correctDetail4"><span class="glyphicon glyphicon-ok " style="color:rgb(92, 184, 92)"></span></div>
                </div>
            </div>
        </div>
    </div>

    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->

<!-- /.modal -->
<!-- End Modal Check Score -->
<script src="../../../resources/js/pageScript/exam/questionDetailModal.js" charset="UTF-8"></script>
