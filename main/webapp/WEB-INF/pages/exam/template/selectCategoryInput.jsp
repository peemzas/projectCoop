<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 7/17/2015
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>

<!-- Slect Category and Sub Category (หมวดหมู่ และ หัวข้อเรื่อง)-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<div class="col-md-2" align="right">--%>
    <%--<h5>วิชา : </h5>--%>
<%--</div>--%>
<%--<div class="col-md-3">--%>
    <%--&lt;%&ndash;<select type="text" class="form-control" id="selectCategoryInput-category">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<option selected disabled></option>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</select>&ndash;%&gt;--%>
    <%--&lt;%&ndash;Add By Wanchana.K&ndash;%&gt;--%>
    <%--<select type="text" class="form-control" id="selectCategoryToSelection">--%>
        <%--<option value="" selected></option>--%>
    <%--</select>--%>
<%--</div>--%>
<%--<div class="col-md-2" align="right">--%>
    <%--<h5>หัวข้อเรื่อง : </h5>--%>
<%--</div>--%>
<%--<div class="col-md-3">--%>
    <%--&lt;%&ndash;<select type="text" class="form-control" id="selectCategoryInput-subCategory">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<option selected disabled>sdsdsds</option>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</select>&ndash;%&gt;--%>
    <%--<select type="text" class="form-control" id="selectSubCategoryToSelection">--%>
        <%--<option value="" disabled selected></option>--%>
    <%--</select>--%>
<%--</div>--%>
<%--Add By Mr.Wanchana--%>







<div class="col-sm-6">
    <div class="col-sm-4  text-right">
        <h5>หมวดหมู่ :</h5>
    </div>
    <div class="col-sm-6 input-group">
        <input type="text" class="form-control" name="cat" id="selectCategoryToSelection"  autocomplete="off"/>
        <span class="input-group-addon" id="selectCat">
        <i class="glyphicon glyphicon-search" onclick="listcatSelectInput()" style="cursor: pointer; height: 20px;"></i>
        </span>
    </div>
</div>
<div class="col-sm-6">
    <div class="col-sm-3 text-right">
        <h5>หัวข้อเรื่อง :</h5>
    </div>
    <div class="col-sm-7">
        <%--<select type="text" class="btn btn-sm col-sm-12"  id="selectSubCategoryToSelection" style="border: solid #a8a8a8 1px; text-align: left;">--%>
            <%--<option value="" selected></option>--%>
        <%--</select>--%>
        <select  id="selectSubCategoryToSelection" class="form-control" data-width="100%">
        </select>
    </div>
</div>





<%--<div class="row form-group">--%>
    <%--<div class="col-md-3" align="right">--%>
        <%--<h5><label style=" font-weight: 100">หมวดหมู่ :</label></h5>--%>
    <%--</div>--%>
    <%--<div class="input-group col-md-3">--%>
        <%--<input type="text" class="form-control" name="cat" id="selectCategoryToSelection"  autocomplete="off"/>--%>
                        <%--<span class="input-group-addon" id="selectCat">--%>
                            <%--<i class="glyphicon glyphicon-search" onclick="listcat()" style="cursor: pointer; height: 20px;"></i>--%>
                        <%--</span>--%>
    <%--</div>--%>
<%--</div>--%>


<%--<div class="row form-group">--%>
    <%--<div class="col-md-3" align="right">--%>
        <%--<h5><label style="font-weight: 100">หัวข้อเรื่อง :</label></h5>--%>
    <%--</div>--%>
<%--<div class="input-group col-md-3">--%>
    <%--<select  id="sSubCat" class="form-control" data-width="100%">--%>
    <%--</select>--%>
<%--</div>--%>

<%--</div>--%>










<script src="../../../resources/js/pageScript/exam/selectCategoryInput.js" charset="utf-8"></script>