<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 7/17/2015
  Time: 3:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    #randomQuestionModal{
        overflow-y: auto;
    }
</style>

<!-- Modal -->
<div class="modal fade" id="randomQuestionModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close"aria-label="Close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                <div class="container row">
                    <h4>สุ่มข้อสอบ</h4>
                    <hr>
                </div>
                <div class="row">
                    <div class="form-group col-sm-4">
                        <label class="col-sm-2 col-sm-offset-3 text-right control-label">ง่าย</label>
                        <div class="col-sm-6">
                            <input id="randEasy" class="form-control input-sm" type="text"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label class="col-sm-4 control-label">ปานกลาง&nbsp;&nbsp;&nbsp;</label>
                        <div class="col-sm-6">
                            <input id="randNormal" class="form-control input-sm" type="text"/>
                        </div>
                    </div>
                    <div class="form-group col-sm-4">
                        <label class="col-sm-2 text-right control-label">ง่าย</label>
                        <div class="col-sm-6">
                            <input id="randHard" class="form-control input-sm" type="text"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <hr/>
                        <button id="randBtn" class="btn btn-primary btn-sm" type="button" data-dismiss = "modal">สุ่มผลลัพธ์</button>
                        <button id="randResetBtn" class="btn btn-gray btn-sm searchInputClearBtn" type="button">ล้างข้อมูล</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
