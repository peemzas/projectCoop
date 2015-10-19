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
            <div class="row" style="margin-bottom: 5px;">
                <div class="col-md-12">
                    <button class="btn btn-success btn-sm createQuestionBtn"
                            data-toggle="modal" data-target="#createQuest">
                        <span class="glyphicon glyphicon-plus"></span>
                    </button>
                    <button class="btn btn-danger btn-sm deleteSelectedBtn "><span
                            class="glyphicon glyphicon-trash"></span>
                    </button>
                </div>
            </div>
            <table class="table">
                <thead class="bg-primary label-primary small">
                <tr>
                    <%--<th style="text-align: center">หมายเลขข้อสอบ</th>--%>
                    <th><input type="checkbox" id="selectAllItem"/></th>
                    <th style="text-align: center">ชนิดข้อสอบ</th>
                    <th style="text-align: center">หมวดหมู่</th>
                    <th style="text-align: center">หัวข้อเรื่อง</th>

                    <th style="text-align: center" width="35%">คำถาม</th>
                    <%--<th style="text-align: center">ระดับความยาก</th>--%>
                    <th style="text-align: center">คะแนน</th>
                    <th style="text-align: center">ผู้สร้าง</th>
                    <th style="text-align: center">วันที่สร้าง</th>

                    <%--<th style="text-align: center">Action</th>--%>
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

<script src="../../../resources/js/pageScript/exam/manageQuestion.js" charset="UTF-8"></script>

<style>
    th {
        border: solid 1px white;
    }
</style>

