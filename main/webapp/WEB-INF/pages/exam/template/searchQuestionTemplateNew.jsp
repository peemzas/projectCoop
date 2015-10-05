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
                    <h5 class="panel-title">ค้นหา</h5>
                </div>
                <div class="panel-body">
                    <%@include file="selectCategoryInput.jsp" %>
                    <%@include file="selectCreateByInput.jsp" %>
                    <div class="row">
                        <div class="col-sm-9 col-sm-offset-2">
                            <div id="showEmployeeSelected" width="100%;">

                            </div>
                        </div>
                    </div>
                    <br/>
                    <div class="row" id="btnSearch">
                        <div class="col-md-12 text-center">
                            <%--<button id="generalSearchButtonInModalSelectionQuestion" class="btn btn-primary btn-sm searchInputSubmitBtn" type="button">ค้นหา</button>--%>
                                <button id="generalSearchButtonInModalSelectionQuestion" class="btn btn-primary btn-sm" type="button">ค้นหา</button>
                            <button class="btn btn-gray btn-sm searchInputClearBtn" type="button">ล้างข้อมูล</button>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-md-3">
                            <button class="btn btn-primary btn-sm" id="advanceBtn"><span class="glyphicon glyphicon-chevron-down"> ค้นหาขั้นสูง</span></button>
                        </div>
                    </div>
                    <div id="advanceBody" class="collapse">
                        <br/>
                        <div class="row form-group">
                            <div class="col-sm-10">
                                <div class="col-sm-2 col-sm-offset-1" align="right">
                                    <label>คำถาม</label>
                                </div>
                                <div class="col-md-6">
                                    <input id="searchQuestionDescInput" type="text" class="form-control input-sm"/>
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-sm-10">
                                <div class="col-sm-2 col-sm-offset-1" align="right">
                                    <label>วันที่สร้าง</label>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <input id="searchCreateDateFromInput" type="text" class="form-control input-sm datepicker" data-date-format="dd/mm/yyyy"/>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" href="#"></span></span>
                                    </div>
                                </div>
                                <div class="col-sm-1" align="right">
                                    <label>ถึง</label>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <input id="searchCreateDateToInput" type="text" class="form-control input-sm datepicker" data-date-format="dd/mm/yyyy"/>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar" href="#"></span></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-sm-10">
                                <div class="col-sm-2 col-sm-offset-1" align="right">
                                    <label>คะแนน</label>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <input id="searchScoreFromInput" type="text" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="col-sm-1" align="right">
                                    <label>ถึง</label>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <input id="searchScoreToInput" type="text" class="form-control input-sm"/>
                                    </div>
                                </div>
                            </div>
                        <div>
                        <div class="row" id="btnAdvanceSearch">
                            <div class="col-md-12 text-center">
                                <hr/>
                                <button id="advSearchBtn" class="btn btn-primary btn-sm" type="button">ค้นหา</button>
                                <button id="advResetBtn" class="btn btn-gray btn-sm searchInputClearBtn" type="button">ล้างข้อมูล</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<input type="checkbox" class="hidden" id="searchCompleteTrigger"/>--%>
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
