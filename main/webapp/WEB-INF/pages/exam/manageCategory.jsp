<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wanchana
  Date: 15/7/2558
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="container row">
    <h3>รายวิชา</h3>
    <hr>
</div>


<div class="container">
    <div class="row">
        <div class="panel-collapse" id="searchCollapse">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h4>ค้นหา...</h4>
                </div>
                <div class="panel-body ">
                    <div class="row">
                        <div class="col-md-2 col-lg-offset-3 text-right">
                            <label>รหัสวิชา :</label>
                        </div>
                        <div class="col-md-1" style="width: 15%">
                            <input id="categoryId" class="form-control" type="text" maxlength="5"/>
                        </div>
                    </div>
                    <div style="margin-bottom: 5px"></div>
                        <div class="row">
                            <div class="col-md-1 col-lg-offset-3 text-right">
                                <label>วิชา :</label>
                            </div>
                            <div class="col-md-4" >
                                <input id="categoryName" class="form-control" type="text"/>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="row" id="btnSearch">
                        <div class="col-md-12 text-center">
                            <button id="searchCategory" class="btn btn-primary" type="button">ค้นหา</button>
                            <button type="button" class="btn" style="background-color: rgba(193, 193, 198, 0.83); color: #000000;">ล้างข้อมูล</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <button data-toggle="modal" data-target="#createCat" class="btn btn-success" align="center" style="width:50px;height:35px"><span class="glyphicon glyphicon-plus"></span></button>
        <br/>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered" id="tblCategory">
                    <col width="20%"/>
                    <col width="60%"/>
                    <thead class="bg-primary">
                        <tr>
                            <th style="text-align: center; color: white;">รหัสวิชา</th>
                            <th style="text-align: center; color: white;">วิชา</th>
                            <th id="thEdit" style="text-align: center; color: white;">แก้ไข</th>
                            <th id="thDelete" style="text-align: center; color: white;">ลบ</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyCategory">
                        <%--<c:forEach var="category" items="${LIST_OF_CATEOGRIES}">--%>
                            <%--<tr>--%>
                                <%--<td>${category.id}</td>--%>
                                <%--<td>${category.name}</td>--%>
                                <%--<td style="text-align: center">--%>
                                    <%--<button type="button" class="btn btn-warning"><span--%>
                                            <%--class="glyphicon glyphicon-pencil"></span>--%>
                                    <%--</button>--%>
                                    <%--<button type="button" class="btn btn-danger"><span--%>
                                            <%--class="glyphicon glyphicon-trash"></span>--%>
                                    <%--</button>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                        <%--</c:forEach>--%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<%@include file="modal/createCategoryModal.jsp"%>
<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/manageCategory.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/manageCategory.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/searchCategory.js" />"></script>
