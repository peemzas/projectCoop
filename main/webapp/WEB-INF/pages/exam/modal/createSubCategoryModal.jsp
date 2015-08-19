<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 8/6/2015
  Time: 11:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="modal fade" id="createSub">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" align="center">เพิ่มหัวข้อเรื่อง</h3>
            </div>
            <div class="modal-body">


                <%--<div class="row">--%>
                    <%--<div class="col-md-2 col-lg-offset-3 text-right">--%>
                        <%--<label>รหัสวิชา :</label>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-1" style="width: 16%">--%>
                        <%--<input class="form-control" type="text" maxlength="5"/>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div style="margin-bottom: 5px"></div>--%>


                <div class="row form-group">


                    <div class="col-md-4" align="right">
                        <h4><label class="label" style="color: black ; font-weight: 100">
                            เลือกวิชา :
                        </label></h4>
                    </div>
                    <div class="input-group col-md-5">
                        <%--<input type="text" class="form-control" name="cat" id="categoryName-forAddSubCat" style="width: 245px"/>--%>
                        <select id="sCat" class="form-control" data-width="100%">
                            <option value="">โปรดเลือกวิชา</option>

                            <c:forEach var="category" items="${listCat}">
                                <option categoryName="${category.name} " value="${category.id}">${category.id} : ${category.name}</option>
                            </c:forEach>

                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4" align="right">
                        <h4><label class="label" style="color:black;font-weight: 100">
                            หัวข้อเรื่อง :
                        </label></h4>
                    </div>
                    <div class="col-md-6" style="padding-left: 0px">
                        <input type="text" class="form-control" name="subcat" id="subcategoryName"/>
                    </div>
                </div>

                <div style="margin-bottom: 5px"></div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <button id="submitCreateSubCategoryBtn" class="btn btn-primary" type="submit"
                                data-dismiss="modal">
                            บันทึก
                        </button>

                        <button id="hiddenBtn2" class="btn btn-warning" class="hidden" data-dismiss="modal">
                            ยกเลิก
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>
<!-- /.modal -->




<%--<spring:url value="../../../resources/js/pageScript/exam/addSubCategory.js" var="addSubCategory"> </spring:url>--%>
<%--<script src="${addSubCategory}" type="text/javascript"><!--Not Empty --></script>--%>

<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/addSubCategory.js" />"></script>
<script>

    $('#submitCreateSubCategoryBtn').on('click', function () {
        saveSubCategory();
    })


</script>

<%--<script>--%>

    <%--$('#addSubCatSubmit-Btn').on('click', function () {--%>
        <%--saveSubCategory();--%>
    <%--})--%>
    <%--function saveSubCategory() {--%>

        <%--var subCatName = $('#subCategoryName-forAddSubCat').val();--%>
        <%--var catName = $('#categoryName-forAddSubCat').val();--%>

        <%--alert('CategoryName : ' + catName + ' - SubCategoryName : ' + subCatName);--%>

        <%--var dat = $.ajax({--%>
            <%--type: "POST",--%>
            <%--url: "addSubCategory",--%>
            <%--data: 'name=' + subCatName--%>
            <%--+ '&categoryName=' + catName,--%>
            <%--success: function () {--%>
                <%--alert('เพิ่มหัวข้อเรื่องสำเร็จ ' + catName + ' : ' + subCatName)--%>
            <%--},--%>
            <%--error: function () {--%>
                <%--alert('การเพิ่มหัวข้อเรื่องล้มเหลว');--%>
            <%--}--%>
        <%--}).responseText;--%>
    <%--}--%>


<%--</script>--%>
