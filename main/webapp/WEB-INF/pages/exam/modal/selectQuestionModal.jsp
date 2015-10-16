<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal SelectQuestion-->
<style>
    #selectQuest{
        overflow-y: auto;
    }
    td{
        font-size: 13.85px;
    }
    #questionsAreEmpty{
        background-color: #b2e0ff;
        height: 100px;
        display: none;
        top: 40px;
        vertical-align: middle;
        border-radius: 5px;
        margin-top: -15px;
    }
    #questionsAreEmptyDesc {
        text-align: center;
        vertical-align: middle;
        line-height: 100px;
        color: #00647f;
    }
    #tbSelectQuestion{
        margin-top: 5px;
    }
</style>
<div class="modal fade" id="selectQuest">
    <div class="modal-dialog modal-lg" style="width: 80%">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-body">
                    <button type="button" class="close"aria-label="Close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                    <div class="container row">
                        <h4>เลือกข้อสอบ</h4>
                        <hr>
                    </div>
                    <%@include file="../template/searchQuestionTemplateNew.jsp"%>
                    <%--<button id="removeRowSelected" class="btn btn-danger btn-sm" type="button" style="height: 30px;"><span class="glyphicon glyphicon-trash"></span></button>--%>
                    <button id="addQuestionBtn" class="btn btn-gray btn-sm" type="button">เพิ่มลงในชุดข้อสอบ</button>
                    <table id="tbSelectQuestion" class="table table-responsive table-hover table-bordered">
                        <thead class="bg-primary small">
                            <tr>
                                <th><input id="checkQuestionAll" type="checkbox"></th>
                                <th>หมวดหมู่</th>
                                <th>หัวข้อเรื่อง</th>
                                <th>คำถาม</th>
                                <th>ข้อสอบ</th>
                                <th>ระดับ</th>
                                <th>คะแนน</th>
                                <th>ผู้สร้าง</th>
                            </tr>
                        </thead>
                        <tbody id="tbodySelectQuestion">

                        </tbody>
                        <div id="questionsAreEmpty" width="100%">
                            <h3 id="questionsAreEmptyDesc">ไม่พบข้อสอบ</h3>
                        </div>
                    </table>
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
        $("#selectQuest").modal('hide');
    });
</script>