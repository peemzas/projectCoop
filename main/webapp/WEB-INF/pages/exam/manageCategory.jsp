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
    <h3>จัดการหมวดหมู่</h3>
    <hr>
</div>


<div class="container">
    <div class="row">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h5 class="panel-title">ค้นหา</h5>
            </div>
            <div class="panel-body ">
                <div style="margin-bottom: 5px"></div>
                    <div class="row">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-md-1 col-lg-offset-3 text-right" style="padding-right: 0px;">
                                    <label for="categoryName" class="control-label">หมวดหมู่ :</label>
                                </div>
                                <div class="col-md-4" >
                                    <div class="input-group">
                                        <input id="categoryName" class="form-control input-sm" type="text"placeholder="ค้นหาหมวดหมู่">
                                        <span class="input-group-btn" >
                                            <button class="btn btn-default btn-group-sm" type="button"><span class="glyphicon glyphicon-search"></span></button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <button id="searchCategory" class="btn btn-primary btn-sm" type="button">ค้นหา</button>
                            <button id="resetBtnSearchCategory" type="button" class="btn btn-sm" style="background-color: rgba(193, 193, 198, 0.83); color: #000000;">ล้างข้อมูล</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <button data-toggle="modal" data-target="#createCat" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus"></span></button>
    <button id="deleteCategory" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></button>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered table-responsive table-hover" id="tblCategory">
                <thead class="label-primary small">
                    <tr>
                        <th style="text-align: center; color: white;"><input type="checkbox" style="display: none;">เลือก</th>
                        <th style="text-align: center; color: white;">รหัสหมวดหมู่</th>
                        <th style="text-align: center; color: white;">หมวดหมู่</th>
                        <th id="thEdit" style="text-align: center; color: white;">แก้ไข</th>
                        <%--<th id="thDelete" style="text-align: center; color: white;">ลบ</th>--%>
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
            <div class="bg-info" id="searchNotFound">
                <p class="bg-info">
                    <h3 style="text-align: center;">ไม่พบข้อมูลที่ค้นหา</h3>
                </p>
            </div>
        </div>
    </div>
</div>

<%@include file="modal/createCategoryModal.jsp"%>

<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/manageCategory.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/pageScript/exam/searchCategory.js" />"></script>
