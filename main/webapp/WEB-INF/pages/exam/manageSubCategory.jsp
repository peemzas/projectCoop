<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: JOKIZZ
  Date: 13/8/2558
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="container row">
    <h3>หัวข้อเรื่อง</h3>
    <hr>
</div>


<div class="container">
    <div class="row">
        <div class="panel-collapse" id="searchCollapse">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>ค้นหา...</h4>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-2 col-lg-offset-3 text-right">
                            <label>รหัสวิชา :</label>
                        </div>
                        <div class="col-md-1" style="width: 10%">
                            <input id="categoryId" class="form-control" type="text" maxlength="5"/>
                        </div>
                    </div>

                    <div style="margin-bottom: 5px"></div>
                    <div class="row">
                        <div class="col-md-1 col-lg-offset-3 text-right">
                            <label>วิชา :</label>
                        </div>
                        <%--<div class="col-md-4">--%>
                        <%--<select id="sCat" class="form-control" data-width="100%">--%>
                        <%--<option value="">โปรดเลือกวิชา</option>--%>
                        <%--<c:forEach var="category" items="${listCat}">--%>
                        <%--<option value="${category.id}">${category.id}  ${category.name}</option>--%>
                        <%--</c:forEach>--%>
                        <%--</select>--%>
                        <%--</div>--%>
                        <div class="col-md-4">
                            <input  id="categoryName" class="form-control" type="text"/>
                        </div>


                    </div>

                    <div style="margin-bottom: 5px"></div>

                    <div class="row">
                        <div class="col-md-2 col-lg-offset-2 text-right">
                            <label>หัวข้อเรื่อง :</label>
                        </div>
                        <%--<div class="col-md-4" >--%>
                        <%--<select id="sSubCat" class="form-control" data-width="100%">--%>
                        <%--<option value="">โปรดเลือกหัวข้อเรื่อง</option>--%>
                        <%--<c:forEach var="category" items="${listCat}">--%>
                        <%--<option value="${category.id}">${category.name}</option>--%>
                        <%--</c:forEach>--%>
                        <%--</select>--%>
                        <%--</div>--%>
                        <div class="col-md-4">
                            <input id="subcategoryName" class="form-control" type="text"/>
                        </div>
                    </div>

                    <div style="margin-bottom: 5px"></div>

                    <div class="row">
                        <%--<div class="col-md-2 text-right">--%>
                        <%--<label>ชื่อวิชา</label>--%>
                        <%--</div>--%>
                        <%--<div class="col-md-6">--%>
                        <%--<div class="input-group">--%>
                        <%--<input class="form-control" type="text"/>--%>

                        <%--</div>--%>
                        <%--</div>--%>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row" id="btnSearch">
                        <div class="col-md-12 text-center">
                            <button id="searchSubCategory" class="btn btn-primary" type="button">ค้นหา</button>
                            <button id="clearsearchinput" class="btn" type="button"
                                    style="background-color: rgba(193, 193, 198, 0.83); color: #000000;">ล้างข้อมูล
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <%--<tr>--%>
        <%--<td>JAVA</td>--%>
        <%--<td style="text-align: center;">--%>
        <%--<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-search"></span>--%>
        <%--</button>--%>
        <%--<button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span>--%>
        <%--</button>--%>
        <%--<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span>--%>
        <%--</button>--%>
        <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
        <%--<td>English</td>--%>
        <%--<td style="text-align: center;">--%>
        <%--<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-search"></span>--%>
        <%--</button>--%>
        <%--<button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span>--%>
        <%--</button>--%>
        <%--<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span>--%>
        <%--</button>--%>
        <%--</td>--%>
        <%--</tr>--%>


        <button data-toggle="modal" data-target="#createSub" class="btn btn-success" align="center"
                style="width:50px;height:35px"><span class="glyphicon glyphicon-plus"></span>
        </button>


        </tbody>
        </table>

        <table class="table table-bordered" id="tblSubCategory">
            <col width="10%"/>
            <col width="20%"/>
            <col width="50%"/>
            <col width="10%"/>
            <col width="10%"/>
            <thead class="bg-primary">
            <tr>
                <th style="text-align: center; color: white;">รหัสวิชา</th>
                <th style="text-align: center; color: white;">วิชา</th>
                <%--<th style="text-align: center; color: white;">รหัสหัวข้อเริ่อง</th>--%>
                <th style="text-align: center; color: white;">หัวข้อเริ่อง</th>
                <th style="text-align: center; color: white">แก้ไข</th>
                <th style="text-align: center; color: white">ลบ</th>
            </tr>
            </thead>
            <tbody id="tbodySubCategory">

            <%--<c:forEach var="subcategory" items="${LIST_OF_SUBCATEOGRIES}">--%>
            <%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td>${subcategory.id}</td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td>${subcategory.name}</td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<td style="text-align: center">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<button type="button" class="btn btn-gray"><span&ndash;%&gt;--%>
            <%--&lt;%&ndash;class="glyphicon glyphicon-pencil"></span>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</button>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<button type="button" class="btn btn-danger"><span&ndash;%&gt;--%>
            <%--&lt;%&ndash;class="glyphicon glyphicon-trash"></span>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</button>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</tr>&ndash;%&gt;--%>
            <%--</c:forEach>--%>

            </tbody>
        </table>
    </div>
</div>


<%--<script>--%>

<%--$("#tblSubCategory").hide();--%>

<%--$('#viewControlSelector').on('change',function(){--%>
<%--if(this.value == 'Category'){--%>
<%--$("#tblCategory").show();--%>
<%--$("#tblSubCategory").hide();--%>
<%--}else if(this.value == 'SubCategory'){--%>
<%--$("#tblCategory").hide();--%>
<%--$("#tblSubCategory").show();--%>
<%--}else{alert('No God Please No');}--%>
<%--})--%>
<%--</script>--%>
<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/manageSubCategory.js" />"></script>
<%@include file="modal/createSubCategoryModal.jsp" %>
