<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 8/18/2015
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="questionDetailModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3>ข้อมูลข้อสอบ</h3>

            </div>
            <div class="modal-body">
                <%--<div class="row">--%>
                    <%--<div class="col-md-2 text-right">ID :</div>--%>
                    <%--<span class="col-md-6" id="idDetail"></span>--%>

                <%--</div>--%>
                <%--<br>--%>

                <div class="row">
                    <div class="col-md-2 text-right">วิชา :</div>
                    <span class="col-md-2" id="categoryDetail"></span>

                    <div class="col-md-2 text-right">หัวข้อเรื่อง :</div>
                    <span class="col-md-2" id="subCategoryDetail"></span>

                </div>
                <br>

                <div class="row">
                    <div class="col-md-2 text-right">สร้างโดย :</div>
                    <span class="col-md-2" id="createByDetail"></span>

                    <div class="col-md-2 text-right">วันที่สร้าง :</div>
                    <span class="col-md-2" id="createDateDetail"></span>

                    <div class="col-md-2 text-right">อัพเดทล่าสุด :</div>
                    <span class="col-md-2" id="updateDetail"></span>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-2 text-right">ประเภท :</div>
                    <span class="col-md-2" id="questionTypeDetail"></span>

                    <div class="col-md-2 text-right">ความยาก :</div>
                    <span class="col-md-2" id="difficultyDetail"></span>

                    <div class="col-md-2 text-right">คะแนน :</div>
                    <span class="col-md-2" id="scoreDetail"></span>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-2 text-right">คำถาม :</div>
                    <span class="col-md-8" id="questionDescDetail"></span>
                </div>

            </div>
            <div class="modal-footer">
                <div class="row">
                    <div class="col-md-1 col-md-offset-1">A :</div>
                    <div class="col-md-8 text-left" id="choiceDetail1"></div>
                    <div class="col-md-1 " id="correctDetail1"><span class="glyphicon glyphicon-ok "
                                                                     style="color:rgb(92, 184, 92)"></span></div>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-1 col-md-offset-1">B :</div>
                    <div class="col-md-8 text-left" id="choiceDetail2"></div>
                    <div class="col-md-1 " id="correctDetail2"><span class="glyphicon glyphicon-ok "
                                                                     style="color:rgb(92, 184, 92)"></span></div>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-1 col-md-offset-1">C :</div>
                    <div class="col-md-8 text-left" id="choiceDetail3"></div>
                    <div class="col-md-1 " id="correctDetail3"><span class="glyphicon glyphicon-ok "
                                                                     style="color:rgb(92, 184, 92)"></span></div>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-1 col-md-offset-1">D :</div>
                    <div class="col-md-8 text-left" id="choiceDetail4"></div>
                    <div class="col-md-1 " id="correctDetail4"><span class="glyphicon glyphicon-ok "
                                                                     style="color:rgb(92, 184, 92)"></span></div>
                </div>
            </div>
        </div>
    </div>

    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->

<!-- /.modal -->
<!-- End Modal Check Score -->

<%--<div class="modal fade" id="questionDetailModal2">--%>
    <%--<div class="modal-dialog modal-lg">--%>
        <%--<div class="modal-content">--%>
            <%--<div class="modal-header">--%>
                <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span--%>
                        <%--aria-hidden="true">&times;</span></button>--%>
                <%--&lt;%&ndash;<button type="button" class="glyphicon glyphicon-pencil btn btn-warning" id="editThisQuestion" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>&ndash;%&gt;--%>
                <%--<h4>ข้อมูลข้อสอบ</h4>--%>

                <%--&lt;%&ndash;<div class="row">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="col-md-2 text-right">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;ID&nbsp;:&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="col-md-3" id="qDetailId"></div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<br>&ndash;%&gt;--%>

                <%--<div class="row">--%>
                    <%--<div class="col-md-2 text-right">--%>
                        <%--สร้างโดย&nbsp;:--%>
                    <%--</div>--%>
                    <%--<div class="col-md-3" id="qDetailCreateBy"></div>--%>
                    <%--<div class="col-md-2 col-md-offset-1 text-right">--%>
                        <%--วันที่สร้าง&nbsp;:--%>
                    <%--</div>--%>
                    <%--<div class="col-md-3" id="qDetailCreateDate"></div>--%>
                <%--</div>--%>
                <%--<br class="qUpdateDetail" hidden>--%>

                <%--<div class="row" class="qUpdateDetail" hidden>--%>
                    <%--<div class="col-md-2 text-right">--%>
                        <%--อัพเดทโดย&nbsp;:--%>
                    <%--</div>--%>
                    <%--<div class="col-md-3" id="qDetailUpdateBy"></div>--%>
                    <%--<div class="col-md-2 col-md-offset-1 text-right">--%>
                        <%--วันที่อัพเดท&nbsp;:--%>
                    <%--</div>--%>
                    <%--<div class="col-md-3" id="qDetailUpdateDate"></div>--%>

                <%--</div>--%>
                <%--&lt;%&ndash;<br class="qUpdateDetail" hidden>&ndash;%&gt;--%>

            <%--</div>--%>

            <%--<div class="modal-body">--%>
                <%--<div id="showDetail" hidden>--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-md-2 text-right">--%>
                            <%--หมวดหมู่&nbsp;:--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3" id="qDetailCategory"></div>--%>
                        <%--<div class="col-md-2 col-md-offset-1 text-right">--%>
                            <%--หัวข้อเรื่อง&nbsp;:--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3" id="qDetailSubCategory"></div>--%>
                    <%--</div>--%>
                    <%--<br>--%>

                    <%--<div class="row">--%>
                        <%--<div class="col-md-2 text-right">--%>
                            <%--ประเภทข้อสอบ&nbsp;:--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3" id="qDetailQuestionType"></div>--%>
                    <%--</div>--%>
                    <%--<br>--%>

                    <%--<div class="row">--%>
                        <%--<div class="col-md-2 text-right">--%>
                            <%--ระดับความยาก&nbsp;:--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3" id="qDetailDifficultyLevel"></div>--%>
                        <%--<div class="col-md-offset-1 col-md-2 text-right">--%>
                            <%--คะแนนเริ่มต้น&nbsp;:--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3" id="qDetailScore"></div>--%>
                    <%--</div>--%>
                    <%--<br>--%>

                    <%--<div class="row">--%>
                        <%--<div class="col-md-2 text-right">--%>
                            <%--คำถาม&nbsp;:--%>
                        <%--</div>--%>
                        <%--<div class="col-md-8" id="qDetailDesc"></div>--%>
                    <%--</div>--%>
                    <%--<br>--%>

                    <%--<div id="qChoiceContainer">--%>
                        <%--<div class="row" id="qDetailChoice1">--%>
                            <%--<div class="col-md-1 text-right" id="qChoiceCorrectness1">--%>
                                <%--<span class="glyphicon glyphicon-ok" style="color:rgb(92, 184, 92)"></span>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-1 text-right">ก.</div>--%>
                            <%--<div class="col-md-9" id="qChioceDesc1"></div>--%>
                        <%--</div>--%>
                        <%--<br>--%>

                        <%--<div class="row" id="qDetailChoice2">--%>
                            <%--<div class="col-md-1 text-right" id="qChoiceCorrectness2">--%>
                                <%--<span class="glyphicon glyphicon-ok" style="color:rgb(92, 184, 92)"></span>--%>
                            <%--</div>--%>
                            <%--<div class=" col-md-1 text-right">ข.</div>--%>
                            <%--<div class="col-md-9" id="qChioceDesc2"></div>--%>
                        <%--</div>--%>
                        <%--<br>--%>

                        <%--<div class="row" id="qDetailChoice3">--%>
                            <%--<div class="col-md-1 text-right" id="qChoiceCorrectness3">--%>
                                <%--<span class="glyphicon glyphicon-ok" style="color:rgb(92, 184, 92)"></span>--%>
                            <%--</div>--%>
                            <%--<div class=" col-md-1 text-right">ค.</div>--%>
                            <%--<div class="col-md-9" id="qChioceDesc3"></div>--%>
                        <%--</div>--%>
                        <%--<br>--%>

                        <%--<div class="row" id="qDetailChoice4">--%>
                            <%--<div class="col-md-1 text-right" id="qChoiceCorrectness4">--%>
                                <%--<span class="glyphicon glyphicon-ok" style="color:rgb(92, 184, 92)"></span>--%>
                            <%--</div>--%>
                            <%--<div class=" col-md-1 text-right">ง.</div>--%>
                            <%--<div class="col-md-9" id="qChioceDesc4"></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<br>--%>
                <%--</div>--%>

                <%--<div id="showDetailEditable">--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-md-2 text-right">--%>
                            <%--<h5>หมวดหมู่&nbsp;:</h5>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3">--%>
                            <%--<input class="form-control" id="qDetailCategoryEdit">--%>
                        <%--</div>--%>
                        <%--<div class="col-md-2 col-md-offset-1 text-right">--%>
                            <%--<h5>หัวข้อเรื่อง&nbsp;:</h5>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3">--%>
                            <%--<input class="form-control" id="qDetailSubCategoryEdit">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<br>--%>

                    <%--<div class="row">--%>
                        <%--<div class="col-md-2 text-right">--%>
                            <%--<h5>ประเภทข้อสอบ&nbsp;:</h5>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3">--%>
                            <%--<input class="form-control" id="qDetailQuestionTypeEdit">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<br>--%>

                    <%--<div class="row">--%>
                        <%--<div class="col-md-2 text-right">--%>
                            <%--<h5>ระดับความยาก&nbsp;:</h5>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-3">--%>
                            <%--<input class="form-control" id="qDetailDifficultyLevelEdit">--%>
                        <%--</div>--%>
                        <%--<div class="col-md-offset-1 col-md-2 text-right">--%>
                            <%--<h5> คะแนนเริ่มต้น&nbsp;:</h5></div>--%>
                        <%--<div class="col-md-3">--%>
                            <%--<input class="form-control" id="qDetailScoreEdit">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<br>--%>

                    <%--<div class="row">--%>
                        <%--<div class="col-md-2 text-right">--%>
                            <%--<h5>คำถาม&nbsp;:</h5>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-9">--%>
                            <%--<textarea class="form-control" rows="3" id="qDetailDescEdit"--%>
                                      <%--style="resize: none;"></textarea>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<br>--%>

                    <%--<div id="qChoiceContainerEdit">--%>
                        <%--<div class="row">--%>
                            <%--<div class="col-md-1 col-md-offset-1 text-right"><h5>ก.</h5></div>--%>
                            <%--<div class="col-md-9">--%>
                                <%--&lt;%&ndash;<input class="form-control" id="qChioceDesc1Edit">&ndash;%&gt;--%>
                                    <%--<div class="input-group">--%>
                                        <%--<input class="form-control choiceDesc" type="text" id=""/>--%>
                                        <%--<span class="input-group-addon choiceRadioAddon">--%>
                                            <%--<input class="correctRadio" type="radio" name="choiceRadio" value="3"/>--%>
                                            <%--<div class=" glyphicon glyphicon-ok"></div>--%>
                                    <%--</span>--%>
                                    <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<br>--%>

                        <%--<div class="row">--%>
                            <%--<div class="col-md-1 col-md-offset-1 text-right"><h5>ก.</h5></div>--%>
                            <%--<div class="col-md-9">--%>
                                <%--&lt;%&ndash;<input class="form-control" id="qChioceDesc1Edit">&ndash;%&gt;--%>
                                <%--<div class="input-group">--%>
                                    <%--<input class="form-control choiceDesc" type="text" id=""/>--%>
                                        <%--<span class="input-group-addon choiceRadioAddon">--%>
                                            <%--<input class="correctRadio" type="radio" name="choiceRadio" value="3"/>--%>
                                            <%--<div class=" glyphicon glyphicon-ok"></div>--%>
                                    <%--</span>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<br>--%>

                        <%--<div class="row">--%>
                            <%--<div class="col-md-1 col-md-offset-1 text-right"><h5>ก.</h5></div>--%>
                            <%--<div class="col-md-9">--%>
                                <%--&lt;%&ndash;<input class="form-control" id="qChioceDesc1Edit">&ndash;%&gt;--%>
                                <%--<div class="input-group">--%>
                                    <%--<input class="form-control choiceDesc" type="text" id=""/>--%>
                                        <%--<span class="input-group-addon choiceRadioAddon">--%>
                                            <%--<input class="correctRadio" type="radio" name="choiceRadio" value="3"/>--%>
                                            <%--<div class=" glyphicon glyphicon-ok"></div>--%>
                                    <%--</span>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<br>--%>

                        <%--<div class="row">--%>
                            <%--<div class="col-md-1 col-md-offset-1 text-right"><h5>ก.</h5></div>--%>
                            <%--<div class="col-md-9">--%>
                                <%--&lt;%&ndash;<input class="form-control" id="qChioceDesc1Edit">&ndash;%&gt;--%>
                                <%--<div class="input-group">--%>
                                    <%--<input class="form-control choiceDesc" type="text" id=""/>--%>
                                        <%--<span class="input-group-addon choiceRadioAddon">--%>
                                            <%--<input class="correctRadio" type="radio" name="choiceRadio" value="3"/>--%>
                                            <%--<div class=" glyphicon glyphicon-ok"></div>--%>
                                    <%--</span>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<br>--%>



                        <%--&lt;%&ndash;<div class="row" id="qDetailChoice2">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="col-md-1 text-right" id="qChoiceCorrectness2">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span class="glyphicon glyphicon-ok" style="color:rgb(92, 184, 92)"></span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class=" col-md-1 text-right">ข.</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="col-md-9" id="qChioceDesc2"></div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<br>&ndash;%&gt;--%>

                        <%--&lt;%&ndash;<div class="row" id="qDetailChoice3">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="col-md-1 text-right" id="qChoiceCorrectness3">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span class="glyphicon glyphicon-ok" style="color:rgb(92, 184, 92)"></span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class=" col-md-1 text-right">ค.</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="col-md-9" id="qChioceDesc3"></div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<br>&ndash;%&gt;--%>

                        <%--&lt;%&ndash;<div class="row" id="qDetailChoice4">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="col-md-1 text-right" id="qChoiceCorrectness4">&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<span class="glyphicon glyphicon-ok" style="color:rgb(92, 184, 92)"></span>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class=" col-md-1 text-right">ง.</div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<div class="col-md-9" id="qChioceDesc4"></div>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                    <%--</div>--%>
                    <%--<br>--%>
                <%--</div>--%>

                <%--<div class="row">--%>
                    <%--<div class="col-md-2 col-md-offset-4">--%>
                        <%--<button class="btn btn-warning btn-block">แก้ไข</button>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-2">--%>
                        <%--<button class="btn btn-default btn-block" data-dismiss="modal">ย้อนกลับ</button>--%>
                    <%--</div>--%>
                <%--</div>--%>


            <%--</div>--%>


        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>


<script src="../../../resources/js/pageScript/exam/questionDetailModal.js" charset="UTF-8"></script>
