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
    <div class=" col-md-4">
        <div class="panel panel-default">
            <%--edit change language ENG to THAI--%>
            <div class="panel-heading" style="background-color: lightgreen; font-size: x-large">สร้าง</div>
            <div class="panel-body ">
                <div class=" col-md-6 col-md-offset-3" align="center">
                    <div class="row">
                        <button data-toggle="modal" data-target="#createCat" class="btn btn-default" align="center"
                                style="background-color:lightgreen ;color: black ;width:85px;height:35px">หมวดหมู่
                        </button>
                    </div>
                    <br>

                    <div class="row">
                        <button data-toggle="modal" data-target="#createSub" class="btn btn-default"
                                class="btn btn-default" align="center"
                                style="background-color:lightgreen ;color: black;width:85px;height:35px">หัวข้อเรื่อง
                        </button>
                    </div>
                    <br>

                    <div class="row">
                        <button data-toggle="modal" data-target="#createQuest" class="btn btn-default"
                                style="background-color:lightgreen ;color: black ;width:85px;height:35px">ข้อสอบ
                        </button>
                    </div>
                    <br>

                    <div class="row">
                        <a href="/TDCS/createPaper" class="btn btn-default"
                           style="background-color:lightgreen  ;color:black ;width:85px;height:35px">ชุดข้อสอบ</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class=" col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color: lightpink">แก้ไข</div>
            <div class="panel-body">
                <div class="col-md-6 col-md-offset-3" align="center">
                    <div class="row">
                        <a href="/TDCS/editCategories" class="btn btn-default"
                                style="background-color:lightpink ;color: black ;width:85px;height:35px">หมวดหมู่
                        </a>
                    </div>
                    <br>

                    <div class="row">
                        <a href="/TDCS/editQuestions" class="btn btn-default"
                                style="background-color:lightpink ;color: black ;width:85px;height:35px">หัวข้อเรื่อง
                        </a>
                    </div>
                    <br>

                    <div class="row">
                        <button class="btn btn-default"
                                style="background-color:lightpink ;color: black ;width:85px;height:35px">ข้อสอบ
                        </button>
                    </div>
                    <br>

                    <div class="row">
                        <button class="btn btn-default"
                                style="background-color:lightpink ;color: black ;width:85px;height:35px">ชุดข้อสอบ
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class=" col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color: lightblue">จัดการ</div>
            <div class="panel-body">
                <div class="col-md-6 col-md-offset-3" align="center">
                    <div class="row">
                        <button class="btn btn-default"
                                style="background-color:lightblue ;color: black ;width:125px;height:35px">ตรวจข้อสอบ
                        </button>
                    </div>
                    <br>

                    <div class="row">
                        <button class="btn btn-default"
                                style="background-color:lightblue ;color: black;width:125px;height:35px"><label
                                style="align-content: center">เปิดให้ทำข้อสอบ</label></button>
                    </div>
                    <br>

                    <div class="row">
                        <button class="btn btn-default"
                                style="background-color:lightblue ;color: black ;width:125px;height:35px">ค้นหาข้อสอบ
                        </button>
                    </div>
                    <br>

                    <div class="row">
                        <a href="/TDCS/searchPaper" class="btn btn-default"
                                style="background-color:lightblue ;color: black ;width:125px;height:35px">ค้นหาชุดข้อสอบ
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
                <h3 class="modal-title" align="center">สร้างหมวดหมู่</h3>
            </div>
            <div class="modal-body" style="height: 80px">
                <div class="row">
                    <div class="col-md-3">
                        <h4><label class="label label-success"
                                   style="background-color: lightgreen ; color: black ; font-weight: 100">ชื่อหมวดหมู่
                            :</label></h4>
                    </div>
                    <div class="col-md-6">
                        <input type="text" class="form-control" name="cat"/>
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
                <h3 class="modal-title" align="center">สร้างหัวข้อเรื่อง</h3>
            </div>
            <div class="modal-body">
                <div class="row form-group">
                    <div class="col-md-4">
                        <h4><label class="label label-success"
                                   style="background-color: lightgreen ; color: black ; font-weight: 100">เลือก หมวดหมู่
                            :</label></h4>
                    </div>
                    <div class="input-group col-md-5">
                        <input type="text" class="form-control" name="cat" style="width: 245px"/>
                        <span class="input-group-addon" id="search"><a class="glyphicon glyphicon-search" href="#"></a></span>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-4">
                        <h4><label class="label label-success"
                                   style="background-color: lightgreen ; color: black ; font-weight: 100">ชื่อหัวข้อเรื่อง
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


<script>
    function select() {
        $('#obj').click(function () {
            $('#objective').show();
            $('#objective2').show();
            $('#subjective').hide();
            $('#subjective2').hide();
        })

        $('#sub').click(function () {
            $('#subjective').show();
            $('#subjective2').show();
            $('#objective').hide();
            $('#objective2').hide();
        })

    }

</script>
<%@include file="modal/creatQuestionModal.jsp" %>
