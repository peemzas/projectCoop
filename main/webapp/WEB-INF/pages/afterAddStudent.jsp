<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value="/resources/js/callutaeAge.js" />"></script>
<script src="<c:url value="/resources/js/callculatetime.js" />"></script>

<div class="container row">
    <h3 class="h3">ประวัติของนักศึกษา</h3>
    <hr/>
</div>
<div class="row">
<div class="col-md-offset-1 col-md-2">
    <input type="hidden" id="userId" value="${user.userId}" />
    <input type="hidden" id="piority" value="${user.piority}" />
    <div class="form-group">
        <div class="row">
            <div class="col-md-12 text-center">
                <%--<iframe id="profile" src="/TDCS/picture" width="100%">--%>
                <%--<%--<img class="img-circle" src="../../resources/images/Untitled.png" width="120px" />--%>
                <%--</iframe>--%>
                <input type='file' id="image" name="image" style="display: none" autocomplete="off"/>
                <%--<div id="divImg" style="width: 100%;height: 200px;background-image: url(<c:url value="/resources/images/blank.jpg" />);">--%>
                <%--<object  />--%>
                |${user.imange}|
                <c:choose>
                    <c:when test="${user.imange == null}">
                        <img id="myImg" src="<c:url value="/resources/images/blank.jpg" />" alt="your image" width="100%" height="190px"/>
                    </c:when>
                    <c:otherwise>
                        <img id="myImg" src="<c:url value="/resources/pictureUpload/${user.imange}" />" alt="your image" width="100%" height="190px"/>
                    </c:otherwise>
                </c:choose>
                <%--</div>--%>
                <label for="image">แก้ไข</label>
            </div>

        </div>
    </div>
</div>
<div class="col-md-8">
<div class="form-horizontal">

<div class="form-group">
    <div class="row col-md-12">
        <label for="userId" class="col-md-3 control-label" style="padding-right: 0px">
            <small>รหัสนักศึกษาฝึกงาน</small>
        </label>
        <div class="col-md-4">
            <input id="empid" class="form-control" value="${user.empId}" readonly="true" />
        </div>
        <label for="username" class="col-md-1 control-label" style="padding: 7px 0px 7px 0px;">
            <small>ชื่อผู้ใช้</small>
        </label>
        <div class="col-md-4">
            <input id="username" class="form-control" value="${user.userName}" readonly="true" />
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label for="thFname" class="col-md-3 control-label" style="padding-left: 0px;padding-right: 0px">
            <small>ชื่อ(ไทย)</small>
        </label>
        <div class="col-md-4">
            <input id="thFname" class="form-control" value="${user.thFname}" readonly="true" />
        </div>

        <label for="thLname" class="col-md-1 control-label" style="padding: 7px 0px 7px 0px;">
            <small>นามสกุล</small>
        </label>
        <div class="col-md-4">
            <input id="thLname" class="form-control" value="${user.thLname}" readonly="true" />
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label for="enFname" class="col-md-3 control-label" style="padding-left: 0px;padding-right: 0px">
            <small>ชื่อ(อังกฤษ)</small>
        </label>
        <div class="col-md-4">
            <input id="enFname" class="form-control" value="${user.enFname}" readonly="true" />
        </div>

        <label for="enLname" class="col-md-1 control-label" style="padding: 7px 0px 7px 0px;">
            <small>นามสกุล</small>
        </label>
        <div class="col-md-4">
            <input id="enLname" class="form-control" value="${user.enLname}" readonly="true" />
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label for="nickName" class="col-md-3 control-label" style="padding-left: 0px;padding-right: 0px">
            <small>ชื่อเล่น</small>
        </label>
        <div class="col-md-2">
            <input id="nickName" class="form-control" value="${user.nickName}" readonly="true" />
        </div>
    </div>
</div>
<div class="form-group">
    <div class="row col-md-12">
        <label for="birthDay" class="col-md-3 control-label" style="padding-left: 0px;padding-right: 0px">
            <small>วันเกิด</small>
        </label>
        <div class="col-md-4">
            <input id="birthDay" class="form-control" value="${user.birthDate}" readonly="true" />
        </div>

        <label for="age" class="col-md-1 control-label" style="padding: 7px 0px 7px 0px;">
            <small>อายุ</small>
        </label>
        <div class="col-md-2">
            <input id="age" class="form-control" value="" readonly="true" />
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label for="university" class="col-md-3 control-label" style="padding-right: 0px">
            <small>สถาบันการศึกษา</small>
        </label>
        <div class="col-md-9">
            <input id="university" class="form-control" value="${user.universityFacultyMajor.universityFaculty.university.university_name}"
                   readonly="true" />
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label for="faculty" class="col-md-3 control-label" style="padding-left: 0px;padding-right: 0px">
            <small>คณะ</small>
        </label>
        <div class="col-md-4">
            <input id="faculty" class="form-control" value="${user.universityFacultyMajor.universityFaculty.faculty.facName}" readonly="true" />
        </div>

        <label for="major" class="col-md-1 control-label" style="padding: 7px 0px 7px 0px;">
            <small>สาขา</small>
        </label>
        <div class="col-md-4">
            <input id="major" class="form-control" value="${user.universityFacultyMajor.major.majName}" readonly="true" />
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label for="address" class="col-md-3 control-label" style="padding-left: 0px;padding-right: 0px">
            <small>ที่อยู่</small>
        </label>
        <div class="col-md-9">
            <textarea class="form-control" id="address" readonly="readonly">${user.address}</textarea>
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label for="tel1" class="col-md-3 control-label" style="padding-left: 0px;padding-right: 0px">
            <small>โทร</small>
        </label>
        <div class="col-md-4">
            <input id="tel1" class="form-control" value="${user.tell1}" readonly="true" />
        </div>

        <label for="tel2" class="col-md-1 control-label" style="padding: 7px 0px 7px 0px;">
            <small>มือถือ</small>
        </label>
        <div class="col-md-4">
            <input id="tel2" class="form-control" value="${user.tell2}" readonly="true" />
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label class="col-md-3 control-label" style="padding-right: 0px">
            <small>อีเมล</small>
        </label>
        <div class="col-md-9">
            <div class="col-md-5" style="padding-left: 0px;padding-right: 0px;">
                <input id="ssgMail" class="form-control" readonly="readonly" value="${user.eMail1}"/>
            </div>
            <label class="col-md-3 control-label" style="text-align: left;"><small>@internal.ssg</small></label>
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label class="col-md-3 control-label" style="padding-left: 0px;padding-right: 0px;">
            <small>อีเมลสำรอง</small>
        </label>
        <div class="col-md-9">
            <div class="col-md-5" style="padding-left: 0px;padding-right: 0px;">
                <input id="mail" class="form-control" readonly="readonly" value="${user.eMail2}"/>
            </div>
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label class="col-md-3 control-label" style="padding-right: 0px">
            <small>Skype Account</small>
        </label>
        <div class="col-md-9">
            <div class="col-md-5" style="padding-left: 0px;padding-right: 0px;">
                <input id="skype" class="form-control" readonly="readonly" value="${user.skype}"/>
            </div>
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label for="stime" class="col-md-3 control-label" style="padding-left: 0px;padding-right: 0px">
            <small>เริ่มฝึกงาน</small>
        </label>
        <div class="col-md-4">
            <input id="stime" class="form-control" value="${user.startWork}" readonly="true" />
        </div>

        <label for="etime" class="col-md-1 control-label" style="padding: 7px 0px 7px 0px;">
            <small>ถึง</small>
        </label>
        <div class="col-md-4">
            <input id="etime" class="form-control" value="${user.endWork}" readonly="true" />
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label for="sum" class="col-md-3 control-label" style="padding-left: 0px;padding-right: 0px">
            <small>รวม</small>
        </label>
        <div class="col-md-4">
            <input id="sum" class="form-control" value="" readonly="true" />
        </div>

    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label for="type" class="col-md-3 control-label" style="padding: 7px 0px 7px 0px;">
            <small>ประเภทการฝึก</small>
        </label>
        <div class="col-md-9">
            <input id="type" class="form-control" value="${user.apprentice.aptName}" readonly="true" />
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label class="col-md-3 control-label" style="padding-right: 0px">
            <small>เข้าฝึกตำแหน่ง</small>
        </label>
        <div class="col-md-9">
            <%--<div class="col-md-12" style="padding-left: 0px;">--%>
                <input id="position" class="form-control" readonly="readonly" value="${user.position.posiName}"/>
            <%--</div>--%>
        </div>
    </div>
</div>

<div class="form-group">
    <div class="row col-md-12">
        <label class="col-md-3 control-label" style="padding-right: 0px">
            <small>พนักงานที่ปรึกษา</small>
        </label>
        <div class="col-md-9">
            <%--<div class="col-md-8" style="padding-left: 0px;">--%>
                <input id="staffName" class="form-control" readonly="readonly" value="${user.staffId}"/>
            <%--</div>--%>
        </div>
    </div>
</div>
<br/>
<div class="form-group">
    <div class="col-md-12">
        <div class="col-md-3"></div>
        <div class="col-md-5" style="padding-left: 0px">
            <a class="btn btn-primary" href="/TDCS/addStudent">เพิ่มนักศึกษา</a>
        </div>

    </div>

</div>

</div>
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel">ระบุเหตุผลที่ไม่อนุมัติ</h3>
            </div>
            <div class="modal-body">
                <textarea id="message" style="width: 100%;height: 150px;"></textarea>
            </div>
            <div class="modal-footer">
                <button id="sendEmail" type="button" class="btn btn-primary" onclick="rejectUser()">ส่งอีเมล</button>
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>--%>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
//        calculate age
        var birthDay = '${user.birthDate}'.split("/");
        $("#age").val(_calculateAge(birthDay[2]+","+birthDay[1]+","+birthDay[0]));
//

//        calculate date of work
        var startWork = '${user.startWork}'.split("/");
        var endWork = '${user.endWork}'.split("/");
        var d1 = new Date(startWork[2]+","+startWork[1]+","+startWork[0]);
        var d2 = new Date(endWork[2]+","+endWork[1]+","+endWork[0]);
        var y = DateDiff.inYears(d1, d2),m = DateDiff.inMonths(d1,d2),d = DateDiff.inDays(d1,d2);
        var rerultShow = "";
        if(d>0) {
            if (m >= 12) {
                y = m / 12;
                rerultShow += parseInt(y + "") + " ปี";
                if (m % 12 > 0) {
                    m %= 12;
                    m + " เดือน"
                }
            } else {
                rerultShow += m + " เดือน";
            }
        }
        $("#sum").val(rerultShow);

//        var day = DateDiff.inDays(d1,d2)%7;
//        var week = DateDiff.inWeeks(d1,d2);
//        $("#sum").val(week+" สัปดาห์ "+day+" วัน");
//

//        find staff name
        var myPiority = '${user.piority}';
        var staffPiority = "";
        for(var i=0;i<myPiority.length-3;i++){
            staffPiority += myPiority.charAt(i)+"";
        }
//        alert(staffPiority);
//        alert(myPiority);
        var data = $.ajax({
            type: "POST",
            url: '/TDCS/findStaffName',
            data: {
                piority: staffPiority.trim()
            },
            async: false
        }).responseText;
        var data2 = JSON.parse(data);
        $("#staffName").val(data2[0].thFname+" "+data2[0].thLname+" ("+data2[0].nickName+")");
//
    });

    //        accept user
    function acceptUser() {
        var data = $.ajax({
            type: "POST",
            url: '/TDCS/setValidate',
            data: {
                id: '${user.userId}'
            },
            async: false
        }).responseText;
        var data = $.ajax({
            type: "POST",
            url: '/TDCS/sendmailForValidate',
            data: {
                uId: '${user.userId}'
            },
            async: false
        }).responseText;
        window.location.href = "/TDCS/validate.html";
    }
    //

    //        rejected user
    function rejectUser() {
        if ($("#message").val() != "") {
            var data = $.ajax({
                type: "POST",
                url: '/TDCS/sendmailForNotValidate',
                data: {
                    uId: '${user.userId}',
                    message: $("#message").val()
                },
                async: false
            }).responseText;
            window.location.href = "/TDCS/validate.html";
        }else {
            alert('กรุณากรอกเหตผลที่ไม่อนุมัติ');
            $("#message").focus();
        }
    }
    //
</script>
