<%--
  Created by IntelliJ IDEA.
  User: wanchana
  Date: 27/7/2558
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <div class="row">
        <div class="panel-collapse" id="searchCollapse">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>ค้นหา...</h4>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <%@include file="selectCategoryInput.jsp" %>
                    </div>
                    <div style="margin-bottom: 5px"></div>

                    <div class="row">
                        <%@include file="selectCreateByInput.jsp" %>
                    </div>

                    <%--Add By Mr.Wanchana--%>
                    <br/>

                    <div class="row">
                        <div class="col-sm-8 col-md-offset-2">
                            <div id="showEmployeeSelected" width="100%;">

                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row" id="btnSearch">
                        <div class="col-md-12 text-center">
                            <button id="generalSearchButtonInModalSelectionQuestion" onclick="generalSearchQuestion()"
                                    class="btn btn-default" type="button">ค้นหา
                            </button>
                            <button class="btn btn-default" type="button">ล้างข้อมูล</button>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-md-3">
                            <button class="btn btn-primary" id="advanceBtn"><span
                                    class="glyphicon glyphicon-chevron-down">ค้นหาขั้นสูง</span></button>
                        </div>
                    </div>
                    <div id="advanceBody" class="collapse">
                        <div class="row">
                            <br/><br/>

                            <div class="col-md-2 text-right">
                                <label>หมายเลขข้อสอบ</label>
                            </div>
                            <div class="col-md-3">
                                <input id="searchQuestionIdInput" class="form-control" type="text"/>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-md-2 text-right">
                                <label>คำถาม</label>
                            </div>
                            <div class="col-md-8">
                                <input id="searchQuestionDescInput" type="text" class="form-control"/>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-md-2 text-right">
                                <h5>วันที่สร้าง : </h5>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <input id="searchCreateDateFromInput" type="text" class="form-control datepicker"/>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                          href="#"></span></span>
                                </div>
                            </div>
                            <div class="col-md-2" align="right">
                                <h5>ถึง : </h5>
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <input id="searchCreateDateToInput" type="text" class="form-control datepicker"/>
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"
                                                                          href="#"></span></span>
                                </div>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-md-2 text-right">
                                <h5>คะแนน : </h5>
                            </div>
                            <div class="col-md-3">
                                <input id="searchScoreFromInput" type="text" class="form-control"/>
                            </div>
                            <div class="col-md-2" align="right">
                                <h5>ถึง : </h5>
                            </div>
                            <div class="col-md-3">
                                <input id="searchScoreToInput" type="text" class="form-control"/>
                            </div>
                        </div>
                        <br/>

                        <div class="row">
                            <div class="col-md-2 text-right">
                                <h5>สถานะ : </h5>
                            </div>
                            <div class="col-md-3">
                                <select id="searchStatusInput" class="form-control">
                                    <option selected value=""></option>
                                    <option>ถูกลบ --เท่านั้น</option>
                                    <option>ถูกลบ --และยังไม่ถูกลบ</option>
                                </select>
                            </div>
                        </div>
                        <br/>
                        <hr/>
                        <div class="row" id="btnAdvanceSearch">
                            <div class="col-md-12 text-center">
                                <button class="btn btn-default searchInputSubmitBtn" type="button">ค้นหา</button>
                                <button class="btn btn-default searchInputClearBtn" type="button">ล้างข้อมูล</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../../../resources/js/pageScript/exam/searchQuestionTemplate.js" charset="UTF-8"></script>
<script>
    $(document).ready(function () {
        $("#selectAllEmployeeName").click(function (event) {
            if (this.checked) {
                $(".userSelectCheckbox").each(function () {
                    this.checked = true;
                });
            }
            else {
                $(".userSelectCheckbox").each(function () {
                    this.checked = false;
                });
            }
        })
    });
</script>
