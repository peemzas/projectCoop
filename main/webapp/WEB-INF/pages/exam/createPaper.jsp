<%--
  Created by IntelliJ IDEA.
  User: PeeMz
  Date: 13/7/2558
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="context" value="${pageContext.request.contextPath}"/>
<script>
    var context = '${context}';
</script>
<style>
    #questionNotFound {
        background-color: #b2e0ff;
        height: 100px;
        display: none;
        top: 40px;
        vertical-align: middle;
        border-radius: 5px;
        margin-top: -15px;
    }

    #questionNotFoundDesc {
        text-align: center;
        vertical-align: middle;
        line-height: 100px;
        color: #00647f;
    }

    #tbSelectedQuestionToPaper td , #tbSelectedQuestionToPaper input, #tbPaperInfo td{
        font-size: 13px;
    }

    #tbSelectedQuestionToPaper , #tbPaperInfo{
        margin-top: 5px;
    }

    #tbodySelectedQuestionToPaper input[type=number]{
        width: 75px;;
    }

    #tbSelectedQuestionToEditPaper {
        top: -50px;
    }
</style>

<div class="container">
    <h3>สร้างชุดข้อสอบ</h3>
    <hr>
    <div class="row">
        <button id="createPaperBtn" class="btn btn-success btn-sm" type="button">บันทึก</button>
        <button id="updatePaperBtn" class="btn btn-success btn-sm" type="button" style="display: none;">บันทึก</button>
        <button id="saveCopyPaperBtn" class="btn btn-success btn-sm" type="button" style="display: none;">บันทึก</button>
        <button id="cancelBtn" class="btn btn-danger btn-sm" type="button" style="display: none;">ยกเลิก</button>
        <button id="copyPaperBtn" class="btn btn-default btn-sm" type="button" style="display: none;">คัดลอกชุดข้อสอบ</button>
        <a href="/TDCS/exam/managePapers">
            <button id="cancelCreatePaperBtn" class="btn btn-warning btn-sm" type="button">
                ย้อนกลับ
            </button>
        </a>
    </div><br/><br/>
    <form class="form-horizontal" role="form">
        <div class="row">
            <div class="col-sm-5">
                <div class="col-sm-4 col-sm-offset-2" align="right">
                    <span style="color:red;">*</span><label for="newPaperId" class="label-control"><h5
                        style="margin-top: 5px">รหัสชุดข้อสอบ :</h5></label>
                </div>
                <div class="col-sm-6 form-group" align="right">
                    <input id="newPaperId" class="form-control input-sm" type="text" maxlength="5" placeholder="โปรดกรอกรหัสชุดข้อสอบ"
                           required/>
                </div>
            </div>
            <div class="col-sm-7">
                <div class="col-sm-3" align="right">
                    <label for="newPaperName" class="label-control"><h5 style="margin-top: 5px">ชื่อชุดข้อสอบ :</h5>
                    </label>
                </div>
                <div class="col-sm-8 form-group">
                    <input id="newPaperName" class="form-control input-sm" type="text" placeholder="โปรดกรอกชื่อชุดข้อสอบ"/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-5">
                <div class="col-sm-4 col-sm-offset-2" align="right">
                    <span style="color:red;">*</span><label for="newPaperScore" class="label-control"><h5
                        style="margin-top: 5px">คะแนน :</h5></label>
                </div>
                <div class="col-sm-6 form-group">
                    <input id="newPaperScore" class="form-control input-sm" type="text" placeholder="โปรดกรอกคะแนน" required/>
                </div>
            </div>
            <div class="col-sm-7">
                <div class="col-sm-3" align="right">
                    <span style="color:red;">*</span><label for="newPaperForPosition" class="label-control"><h5
                        style="margin-top: 5px">ตำแหน่ง :</h5></label>
                </div>
                <div class="col-sm-5 form-group">
                    <select id="newPaperForPosition" class="form-control input-sm">
                        <option active>เลือกตำแหน่ง</option>
                        <option value="0">ทั้งหมด</option>
                        <option value="1">Software Developer Trainee</option>
                        <option value="2">Assistant Business Analyst</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-5">
                <div class="col-sm-4 col-sm-offset-2" align="right">
                    <span style="color:red;">*</span><label class="label-control"><h5 style="margin-top: 5px">เวลา :</h5>
                </label>
                </div>
                <div class="col-sm-3 form-group">
                    <input id="hours" class="form-control input-sm" type="number" max="60" min="0" placeholder="ชม." required/>
                </div>
                <div class="col-sm-3">
                    <input id="minutes" class="form-control input-sm" type="number" max="60" min="0" placeholder="น." required/>
                </div>
            </div>
            <div id="divCreateDate" class="col-sm-7" style="display: none;">
                <div class="col-sm-3" align="right">
                    <label for="questionCreatedDate" class="label-control"><h5 style="margin-top: 5px">วันที่สร้าง :</h5></label>
                </div>
                <div class="col-sm-5 form-group">
                    <input id="questionCreatedDate" class="form-control input-sm" disabled/>
                </div>
            </div>
        </div>
    </form>

    <div class="row">
        <div class="col-sm-12" style="text-align: center">
            <button id="selectionQuestionBtnInpagePaper" data-toggle="modal" data-backdrop="static" class="btn btn-gray btn-sm">เลือกข้อสอบ
            </button>
            <button id="randomQuestionBtn" data-toggle="modal" data-target="#randomQuestionModal" class="btn btn-gray btn-sm">สุ่มข้อสอบ
            </button>
        </div>
    </div>

    <div class="row">
        <hr/>
        <button id="removeRowQuestionSelect" class="btn btn-danger btn-sm" type="button" style="height: 30px;"><span
                class="glyphicon glyphicon-minus"></span></button>
        <%--<button id="createPaperBtn" class="btn btn-success btn-sm" type="button">บันทึก</button>--%>
        <%--<button id="updatePaperBtn" class="btn btn-success btn-sm" type="button" style="display: none;">บันทึก</button>--%>
        <%--<a href="/TDCS/exam/managePapers">--%>
            <%--<button id="cancelCreatePaperBtn" class="btn btn-warning btn-sm" type="button">--%>
                <%--ยกเลิก--%>
            <%--</button>--%>
        <%--</a>--%>
        <table id="tbSelectedQuestionToPaper" class="table table-bordered table-hover" style="display: none;">
            <thead class="bg-primary small">
                <tr>
                    <th style="text-align: center ;"><input class="checkAllQuestionFromCreatePaperPage" type="checkbox"></th>
                    <th style="text-align: center ;">ประเภท</th>
                    <th style="text-align: center ;">หมวดหมู่</th>
                    <th style="text-align: center ;">หัวข้อเรื่อง</th>
                    <th style="text-align: center ;">ข้อสอบ</th>
                    <th style="text-align: center ;">ระดับ</th>
                    <th style="text-align: center ;" width="8%">คะแนน</th>
                    <th style="text-align: center ;">ผู้สร้าง</th>
                </tr>
            </thead>
            <tbody id="tbodySelectedQuestionToPaper">

            </tbody>
        </table>
        <table id="tbPaperInfo" class="table table-bordered table-hover" style="display:  none;">
            <thead class="bg-primary small">
                <tr>
                    <th style="text-align: center ;">ประเภท</th>
                    <th style="text-align: center ;">หมวดหมู่</th>
                    <th style="text-align: center ;">หัวข้อเรื่อง</th>
                    <th style="text-align: center ;">ข้อสอบ</th>
                    <th style="text-align: center ;">ระดับ</th>
                    <th style="text-align: center ;">คะแนน</th>
                    <th style="text-align: center ;">ผู้สร้าง</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
        <div id="questionNotFound" width="100%">
            <h3 id="questionNotFoundDesc">ยังไม่มีข้อสอบในชุดข้อสอบ</h3>
        </div>
    </div>

    <br/>

    <div class="row">
        <div class="col-sm-5 col-sm-offset-8">
            <label align="right" class="col-sm-2"><h5>คะแนน</h5></label>
            <div class="col-sm-3">
                <input class="form-control input-sm" readonly="true" name="score" id="score" style="text-align: center">
            </div>
            <label align="right" class="col-sm-1"><h5>เต็ม</h5></label>
            <div class="col-sm-3">
                <input class="form-control input-sm" readonly="true" name="score" id="maxScore" style="text-align: center">
            </div>
        </div>
    </div>
</div>

    <%--<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/categoryDropdown.js" />"></script>--%>
    <script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/managePaper.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/paper.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/checkKeybord.js" />"></script>
    <%--<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/searchQuestion.js" />"></script>--%>

    <%@include file="modal/createQuestionModal.jsp" %>
    <%@include file="modal/RandomQuestionModal.jsp" %>
    <%@include file="modal/selectQuestionModal.jsp" %>

    <script>
        if ('${status}' != 'staff') {
            window.location.href = "/TDCS/index.html";
        }
//        $("#selectionQuestionBtnInpagePaper").unbind('click').click(function(){
//            alert('hi');
//            $('#selectQuest').modal({
//                backdrop: 'static'
//            });
//        });
    </script>

