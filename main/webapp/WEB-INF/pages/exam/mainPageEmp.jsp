<%--
  Created by IntelliJ IDEA.
  User: PeeMz
  Date: 9/7/2558
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class=" col-md-offset-2 col-md-4">
        <div class="panel panel-primary">
            <%--edit change language ENG to THAI--%>
            <div class="panel-heading" style=" font-size: x-large" id="create">สร้าง</div>
            <div class="panel-body ">
                <div class=" col-md-6 col-md-offset-3" align="center">
                    <div class="row">
                        <button data-toggle="modal" data-target="#createCat" class="btn btn-default" align="center"
                                style="width:125px;height:35px">วิชา
                        </button>
                    </div>
                    <br>

                    <div class="row">
                        <button data-toggle="modal" data-target="#createSub" class="btn btn-default"
                                class="btn btn-default" align="center"
                                style="width:125px;height:35px">หัวข้อเรื่อง
                        </button>
                    </div>
                    <br>

                    <div class="row">
                        <button data-toggle="modal" data-target="#createQuest" class="btn btn-default"
                                style="width:125px;height:35px">ข้อสอบ
                        </button>
                    </div>
                    <br>

                    <div class="row">
                        <a href="/TDCS/exam/createPaper" class="btn btn-default"
                           style="width:125px;height:35px">ชุดข้อสอบ</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--<div class=" col-md-4">--%>
    <%--<div class="panel panel-default">--%>
    <%--<div class="panel-heading" style="background-color: lightpink ;font-size: x-large">แก้ไข</div>--%>
    <%--<div class="panel-body">--%>
    <%--<div class="col-md-6 col-md-offset-3" align="center">--%>


    <%--<div class="row">--%>
    <%--<a href="/TDCS/editQuestions" class="btn btn-default"--%>
    <%--style="background-color:lightpink ;color: black ;width:85px;height:35px">ข้อสอบ--%>
    <%--</a>--%>
    <%--</div>--%>
    <%--<br>--%>

    <%--&lt;%&ndash;<div class="row">--%>
    <%--<button class="btn btn-default"--%>
    <%--style="background-color:lightpink ;color: black ;width:85px;height:35px">ข้อสอบ--%>
    <%--</button>--%>
    <%--</div>--%>
    <%--<br>&ndash;%&gt;--%>

    <%--<div class="row">--%>
    <%--<a href="/TDCS/managePapers" class="btn btn-default"--%>
    <%--style="background-color:lightpink ;color: black ;width:85px;height:35px">ชุดข้อสอบ--%>
    <%--</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>

    <div class=" col-md-4">
        <div class="panel panel-primary">
            <div class="panel-heading" style="font-size: x-large">จัดการ</div>
            <div class="panel-body">
                <div class="col-md-6 col-md-offset-3" align="center">


                    <div class="row">
                        <a href="/TDCS/exam/manageCategory" class="btn btn-default"
                           style="width:125px;height:35px">วิชาและหัวข้อเรื่อง
                        </a>
                    </div>
                    <br>

                    <div class="row">

                        <a href="/TDCS/exam/examRecordSearch" class="btn btn-default"
                           style="width:125px;height:35px">ตรวจข้อสอบ
                        </a>

                    </div>
                    <br>

                    <div class="row">
                        <a href="/TDCS/exam/manageQuestion" class="btn btn-default"
                           style="width:125px;height:35px">ข้อสอบ
                        </a>

                    </div>
                    <br>

                    <div class="row">

                        <a href="/TDCS/exam/managePapers" class="btn btn-default"
                           style="width:125px;height:35px">ชุดข้อสอบ
                        </a>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--Modal--%>
<div class="modal fade" id="createCat">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" align="center">เพิ่มวิชา</h3>
            </div>
            <div class="modal-body" style="height: 80px">
                <div class="row">
                    <div class="col-md-3" align="right">
                        <h4><label class="label"
                                   style="color: black ; font-weight: 100">วิชา
                            :</label></h4>
                    </div>
                    <div class="col-md-6">
                        <input type="text" class="form-control" name="cat" id="categoryName"/>
                    </div>
                    <button class="btn btn-primary" type="submit" data-dismiss="modal">ตกลง</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="createSub">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" align="center">เพิ่มหัวข้อเรื่อง</h3>
            </div>
            <div class="modal-body">
                <div class="row form-group">
                    <div class="col-md-4" align="right">
                        <h4><label class="label"
                                   style="color: black ; font-weight: 100">เลือกวิชา
                            :</label></h4>
                    </div>
                    <div class="input-group col-md-5">
                        <input type="text" class="form-control" name="cat" style="width: 245px"/>
                        <span class="input-group-addon" id="search"><a class="glyphicon glyphicon-search" href="#"></a></span>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4" align="right">
                        <h4><label class="label"
                                   style="color:black;font-weight: 100">หัวข้อเรื่อง
                            :</label></h4>
                    </div>
                    <div class="col-md-6" style="padding-left: 0px">
                        <input type="text" class="form-control" name="subcat"/>
                    </div>
                    <button class="btn btn-primary" type="submit" data-dismiss="modal">ตกลง</button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<%@include file="modal/createQuestionModal.jsp" %>
