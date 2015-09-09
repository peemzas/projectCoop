<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 7/17/2015
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>

<!-- Slect Category and Sub Category (หมวดหมู่ และ หัวข้อเรื่อง)-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-md-2" align="right">
    <h5>วิชา : </h5>
</div>
<div class="col-md-3">
    <%--<select type="text" class="form-control" id="selectCategoryInput-category">--%>
        <%--<option selected disabled></option>--%>
    <%--</select>--%>
    <%--Add By Wanchana.K--%>
    <select type="text" class="form-control" id="selectCategoryToSelection">
        <option value="" selected></option>
    </select>
</div>
<div class="col-md-2" align="right">
    <h5>หัวข้อเรื่อง : </h5>
</div>
<div class="col-md-3">
    <%--<select type="text" class="form-control" id="selectCategoryInput-subCategory">--%>
        <%--<option selected disabled>sdsdsds</option>--%>
    <%--</select>--%>
    <select type="text" class="form-control" id="selectSubCategoryToSelection">
        <option value="" disabled selected></option>
    </select>
</div>
<script src="../../../resources/js/pageScript/exam/selectCategoryInput.js"></script>