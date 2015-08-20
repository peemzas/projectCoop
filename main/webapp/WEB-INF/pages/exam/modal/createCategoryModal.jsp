<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 8/6/2015
  Time: 11:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%--Modal--%>
<div class="modal fade" id="createCat">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" align="center">เพิ่มวิชา</h3>
            </div>
            <div class="modal-body" style="height: 120px">
                <div class="row">

                    <%--&lt;%&ndash;Add By Mr. Wanchana Himseft&ndash;%&gt;--%>
                    <%--<form id="createCategoryForm" data-bv-icons-valid="glyphicon glyphicon-ok"--%>
                                                  <%--data-bv-icons-invalid="glyphicon glyphicon-remove"--%>
                                                  <%--data-bv-icons-validating="glyphicon glyphicon-refresh">--%>
                        <%--<div class="form-group has-error">--%>
                            <%--<label class="col-md-2"for="categoryId">รหัสวิชา</label>--%>
                            <%--<div class="col-md-4">--%>
                                <%--<input id="categoryId" name="categoryId" width="100%" class="form-control required"--%>
                                       <%--data-bv-notempty data-bv-notempty-message="ididid"/>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="form-group has-error">--%>
                            <%--<label class="col-md-2"for="categoryName">รายวิชา</label>--%>
                            <%--<div class="col-md-4">--%>
                                <%--<input id="categoryName" name="categoryName" width="100%" class="form-control required"--%>
                                       <%--data-bv-notempty data-bv-notempty-message="namename" placeholder="kkkkk"/>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="row-centered">--%>
                            <%--<button id="submitCreateCategoryBtn" class="btn btn-primary" type="submit" data-dismiss="modal">บันทึก</button>--%>
                            <%--<button id="hiddenBtn2" class="btn btn-warning" data-dismiss="modal">ยกเลิก</button>--%>
                        <%--</div>--%>
                    <%--</form>--%>

                    <div class="col-md-3" align="right">
                        <h4><label for="categoryIdText" class="label"
                                   style="color: black ; font-weight: 100">รหัสวิชา :
                        </label></h4>
                    </div>
                    <div class="col-md-2">
                        <input  type="text" class="form-control" name="cat" id="categoryIdText"/>
                    </div>


                    <div class="col-md-1" align="right">
                        <h4><label for="categoryNameText" class="label"
                                   style="color: black ; font-weight: 100">วิชา :
                        </label></h4>
                    </div>
                    <div class="col-md-6">
                        <input style="width: 80%" type="text" class="form-control" name="cat" id="categoryNameText"/>
                    </div>







                    <button id="hiddenBtn" data-dismiss="modal" class="hidden">hidden</button>
                </div>
                <br>

                <div class="row">
                    <div class="col-md-12 text-center">
                        <button id="submitCreateCategoryBtn" class="btn btn-primary" type="submit" data-dismiss="modal">
                            บันทึก
                        </button>

                        <button id="hiddenBtn2" class="btn btn-warning"  class="hidden" data-dismiss="modal">
                            ยกเลิก
                        </button>
                    </div>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/addCategory.js" />"></script>
    <script>

        $('#submitCreateCategoryBtn').on('click', function () {
            saveCategory();
        });

//        Add By Mr. Wanchana

//        $('#createCategoryForm').bootstrapValidator({
//            icons: {
//                valid: 'glyphicon glyphicon-ok',
//                invalid: 'glyphicon glyphicon-remove',
//                validating: 'glyphicon glyphicon-refresh'
//            },
//            fields: {
//                categoryId: {
//                    validators: {
//                        notEmpty: {
//                            message: "ididid"
//                        }
//                    }
//                },
//                categoryName: {
//                    validators: {
//                        notEmpty: {
//                            message: "namename"
//                        }
//                    }
//                }
//            }
//        });
//
//        $('#createCat').on('shown.bs.modal', function() {
//            $('#createCategoryForm').bootstrapValidator('resetForm', true);
//        });

    </script>