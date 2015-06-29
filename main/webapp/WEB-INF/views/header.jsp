<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Brand and toggle get grouped for better mobile display -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">TDCS</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-inverse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li id="userData"><a id="linkhome" href="/TDCS/home.html">ข้อมูลผู้ใช้</a></li>
                <c:if test="${status == 'admin' || status == 'staff'}">
                    <c:if test="${status == 'admin'}">
                        <li id="addData" class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-expanded="false">เพิ่มข้อมูล <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="/TDCS/addStudent.html">เพิ่มข้อมูลนักศึกษา</a></li>
                                <li><a href="/TDCS/addStaff.html">เพิ่มข้อมูลพนักงาน</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${status == 'staff'}">
                        <li id="validate">
                            <a href="/TDCS/validate.html">อนุมัตินักศึกษา
                                <c:if test="${countUserValidate != 0}">
                                    <span class="badge">
                                            ${countUserValidate}
                                    </span>
                                </c:if>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${status == 'admin'}">
                        <li id="addSearch" class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-expanded="false">ค้นหาข้อมูล <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="/TDCS/searchStudent.html">ค้นหาข้อมูลนักศึกษา</a></li>
                                <li><a href="/TDCS/searchStaff.html">ค้นหาข้อมูลพนักงาน</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${status == 'staff'}">
                        <li id="addSearch"><a href="/TDCS/searchStudent.html">ค้นหาข้อมูลนักศึกษา</a></li>
                    </c:if>
                </c:if>
                <c:if test="${status == 'admin'}">
                    <li id="evaluation"><a href="/TDCS/evaluation.html">เพิ่มแบบประเมิน</a></li>
                </c:if>
                <c:if test="${status == 'user' || status == 'staff'}">
                    <li id="evaluation" class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            การประเมิน
                            <c:if test="${viewEva != 0 && status == 'user'}">
                                    <span class="badge">
                                            ${viewEva}
                                    </span>
                            </c:if>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="/TDCS/evaluation.html">
                                    <c:if test="${status == 'staff'}">ประเมินนักศึกษา</c:if>
                                    <c:if test="${status == 'user'}">ประเมินผล</c:if>
                                </a>
                            </li>
                            <li>
                                <a href="/TDCS/viewevaluate.html">
                                    ดูผลการประเมิน
                                    <c:if test="${viewEva != 0 && status == 'user'}">
                                    <span class="badge">
                                            ${viewEva}
                                    </span>
                                    </c:if>
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:if>
                <%--<c:if test="${status == 'staff'}">--%>
                <%--<li id="evaluation">--%>
                <%--<a href="/TDCS/evaluation.html">ประเมินนักศึกษา</a>--%>
                <%--</li>--%>
                <%--</c:if>--%>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a id="signOut" href="javascript:void(0);">ออกจากระบบ</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
</nav>

<script>
    $(document).ready(function () {
        $("#signOut").click(function () {
            if (confirm("คุณต้องการออกจากระบบใช่หรือไม่")) {
                window.location.href = "/TDCS/logout.html";
            }
        });
    });
</script>