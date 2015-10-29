<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 7/16/2015
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/resources/js/callculatetime.js" />"></script>
<script src="<c:url value="/resources/js/callutaeAge.js" />"></script>
<script src="<c:url value="/resources/js/checkKeybord.js" />"></script>
<script src="<c:url value="/resources/js/setInputUserdata.js" />"></script>


<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
<style>
    #aa {
        border-right: solid black 1px;
    }
</style>

<h3>ตรวจข้อสอบ</h3>
<hr>


<div>
    <div class="panel panel-primary">
        <div class="panel-heading"><h5 class="panel-title">ค้นหา</h5></div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <div class="form-inline">
                                <label class="col-sm-2 control-label ">ชุดข้อสอบ :</label>

                                <div class="col-sm-3 input-group">
                                    <input id="searchPaperInput" class="form-control">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-search" style="cursor: pointer; height: 20px;"
                                           onclick="listSearchPaper()"></i>
                                    </span>
                                </div>
                                <label class="control-label col-sm-offset-1">ตำแหน่ง :</label>

                                <div class="col-md-3 input-group ">
                                    <select id="forPosition" class="form-control" style="width: 100%">
                                        <option value="0">ทั้งหมด</option>
                                        <option value="1">Software Developer Trainee</option>
                                        <option value="2">Assistant Business Analyst</option>
                                    </select>
                                </div>

                            </div>
                        </div>
                        <div class="form-group" style="margin-left: 0px">
                            <%@include file="template/selectCreateByInput.jsp" %>
                        </div>
                        <div class="col-md-offset-1" id="showEmployeeSelected" width="100%; ">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <div class="row">
                <div class="row" id="btnSearch">
                    <div class="col-md-12 text-center">
                        <button id="btnExamRecordSearch" class="btn btn-primary btn btn-sm" type="button">ค้นหา</button>
                        <button id="btnExamRecordSearchClearInput" class="btn btn-default btn btn-sm" type="button"
                                style="background-color: rgba(193, 193, 198, 0.83); color: #000000;">ล้างข้อมูล
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered table-responsive table-hover">
                <thead class="bg-primary small">
                <tr>
                    <th class="text-center">รหัสชุดข้อสอบ</th>
                    <th class="text-center">ชื่อชุดข้อสอบ</th>
                    <th class="text-center">ชื่อผู้สอบ</th>
                    <th class="text-center">ตำแหน่ง</th>
                    <th class="text-center">คะแนนPre-Test</th>
                    <th class="text-center">คะแนนPost-Test</th>
                    <th class="text-center">คะเเนนเต็ม</th>
                    <th class="text-center">สร้างโดย</th>
                    <th class="text-center">สถานะ</th>
                </tr>
                </thead>

                <!---------------------------------------------------- Generate Table --------------------------------------------------------------------------------->
                <tbody id="tbodyExamRecord">

                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</div>
<%-----------------------------------------------confirm modal------------------------------------------- --%>
<!-- alertModal-->
<div id="alertModalChangPage" class="modal fade">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <center>
                    <label><h4>ตรวจข้อสอบ</h4></label>
                </center>
            </div>
            <div class="modal-footer border">
                <center>
                    <button id="okBtnChangPage" class="btn btn-sm btn-primary" data-dismiss="modal">ตกลง
                    </button>
                    <button id="cancleBtnChangPage" class="btn btn-sm btn-danger"
                            data-dismiss="modal">ยกเลิก
                    </button>
                </center>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<%-----------------------------------------------confirm modal------------------------------------------- --%>
<!-- alertModal-->
<div id="alertModalRemark" class="modal fade">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <center>
                    <label><h4>ตรวจข้อสอบซ้ำ</h4></label>
                </center>
            </div>
            <div class="modal-footer border">
                <center>
                    <button id="pretestBtn" class="btn btn-sm btn-primary" data-dismiss="modal" >Pre-test
                    </button>
                    <button id="posttestBtn" class="btn btn-sm btn-primary" data-dismiss="modal" >Post-test
                    </button>
                    <button id="cancleBtn" class="btn btn-sm btn-danger"
                            data-dismiss="modal">ยกเลิก
                    </button>
                </center>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<%@include file="modal/addEmployeeToInputModal.jsp" %>
<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/examRecordSearch.js" />"></script>
<%--end class row--%>