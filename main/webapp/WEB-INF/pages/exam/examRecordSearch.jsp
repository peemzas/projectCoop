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
        <div class="panel-heading"><h5 class="panel-title">ค้นหาข้อสอบที่</h5></div>
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

                                <div class="col-md-2 input-group ">
                                    <select id="forPosition" class="form-control">
                                        <option value="0">All</option>
                                        <option value="1">Dev</option>
                                        <option value="5">BA</option>
                                    </select>
                                </div>

                            </div>
                        </div>
                        <div class="form-group">
                            <%@include file="template/selectCreateByInput.jsp" %>
                        </div>
                        <div id="showEmployeeSelected" width="100%;">

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
                    <th align="center">รหัสชุดข้อสอบ</th>
                    <th align="center">ชื่อชุดข้อสอบ</th>
                    <th align="center">ชื่อผู้สอบ</th>
                    <th align="center">ตำแหน่ง</th>
                    <th align="center">คะแนนPre-Test</th>
                    <th align="center">คะแนนPost-Test</th>
                    <th align="center">คะเเนเต็ม</th>
                    <th align="center">สร้างโดย</th>
                    <th align="center">สถานะ</th>
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
<div class="form-horizontal" role="form">
    <div id="modalMarkingPaper" class="modal fade" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>รายละเอียดการตรวจ</h4>

                    <div class="row">
                        <div id="aa" class="col-sm-3">
                            <label class="col-sm-12 control-label"
                                   style="text-align: left"><b>ข้อมูลนักศึกษา</b></label>
                            <label class="col-sm-12 control-label" style="text-align: left">ชื่อ :</label>
                            <label class="col-sm-12 control-label" style="text-align: left">ตำแหน่ง :</label>
                            <label class="col-sm-12 control-label" style="text-align: left">ทีม :</label>
                        </div>
                        <div class="col-sm-3">
                            <label class="col-sm-12 control-label"
                                   style="text-align: left"><b>ข้อมูลชุดข้อสอบ</b></label>
                            <label class="col-sm-12 control-label" style="text-align: left">หมายเลขชุดข้อสอบ :</label>
                            <label class="col-sm-12 control-label" style="text-align: left">ผู้สร้าง :</label>
                        </div>
                        <div class="col-sm-4">
                            <label class="col-sm-9 control-label" style="text-align: left">คะแนนเต็ม :</label>
                            <label class="col-sm-12 control-label" style="text-align: left">ชื่อชุดข้อสอบ :</label>
                            <label class="col-sm-12 control-label" style="text-align: left">วันที่สร้าง :</label>
                        </div>
                        <div class="col-sm-2">
                            <label class="col-sm2 control-label">คะแนนรวม :</label>
                            <input type="text" class="form-control input-sm" readonly="true"
                                   style="height: 75px ;width: 75px"/>
                        </div>

                    </div>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="text-align: match-parent"><b>คะแนนปรนัย
                            :</b></label>

                        <div class="col-sm-1">
                            <input type="text" class="form-control input-sm" readonly="true"/>
                        </div>
                        <div class="col-sm-1 col-sm-offset-7">
                            <%--<input id="" type="text" class="form-control input-sm" readonly="true" style="height: 75px ;width: 75px"/>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" style="text-align: match-parent"><b>อัตนัย :</b></label>

                        <div class="col-sm-1">
                            <input type="text" class="form-control input-sm" readonly="true"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-9">
                            55
                        </div>
                        <div class="col-sm-3">
                            66
                        </div>
                    </div>
                    <div class="form-group">

                    </div>

                    <div class="form-group">

                    </div>

                    <div class="form-group">

                    </div>

                </div>

                <div class="modal-footer">

                    <div class="row">
                        <label class="col-sm-2 control-label" style="text-align: left">แสดงความคิกเห็น</label>
                        <div class="col-sm-5">
                            <textarea class="form-control" style="width: 98%"></textarea>
                        </div>
                        <div class="col-sm-1">
                            <label class="col-sm-12 control-label" style="text-align: left">สถานะ</label>
                        </div>
                            <div class="col-sm-2">
                                <select class="form-control">
                                    <option >All</option>
                                    <option >Dev</option>
                                    <option >BA</option>
                                </select>
                            </div>
                    </div>
                   <div class="row" style="margin-top: 30px">
                       <div class="col-sm-6">
                           <div class="col-sm-1"></div>
                           <button id="modalEditBtnSaveHospitalGroup" type="button"
                                   class="btn btn-primary">ยืนยัน
                           </button>
                           </div>
                       <div class="col-sm-1">
                           <button type="button" data-dismiss="modal" aria-hidden="true"
                                   class="btn btn-danger">ยกเลิก
                           </button>
                       </div>
                   </div>
                </div>
            </div>
        </div>
    </div>

</div>
<%@include file="modal/addEmployeeToInputModal.jsp" %>
<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/examRecordSearch.js" />"></script>
<%--end class row--%>