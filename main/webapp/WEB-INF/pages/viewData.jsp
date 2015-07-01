<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: PeeMz
  Date: 30/6/2558
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<script type="text/javascript" src="<c:url value="/resources/js/callutaeAge.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/callculatetime.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/checkKeybord.js" />"></script>

<div class="jumbotron" style="background-color: #ffffff;border: solid #c3c3c3 1px;">
  <div class="container row">
    <h3 class="h3">ข้อมูลผู้ใช้</h3>
    <hr/>
  </div>
  <div class="row">
    <div class="col-md-offset-1 col-md-2">
      <div class="form-group">
        <div class="row">
          <div class="col-md-12 text-center">
            <c:choose>
              <c:when test="${users[0].imange == null}">
                <img id="myImg" src="<c:url value="/resources/images/blank.jpg" />" alt="your image" width="100%" height="190px"/>
              </c:when>
              <c:otherwise>
                <img id="myImg" src="<c:url value="/resources/pictureUpload/${users[0].imange}" />" alt="your image" width="100%" height="190px"/>
              </c:otherwise>
            </c:choose>
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
            <div class="col-md-2">
              <input id="userId" class="form-control" value="${user.empId}" readonly="true" />
            </div>
          </div>
        </div>

        <div class="form-group">
          <div class="row col-md-12">
            <label for="username" class="col-md-3 control-label" style="padding-right: 0px">
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

            <label for="birthDay" class="col-md-1 control-label" style="padding: 7px 0px 7px 0px;">
              <small>วันเกิด</small>
            </label>
            <div class="col-md-3">
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
            <div class="col-md-6">
              <input id="university" class="form-control" value="${user.universityFacultyMajor.universityFaculty.university.university_name}" readonly="true" />
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
            <label class="col-md-3 control-label" style="padding-right: 0px">
              <small>อีเมลสำรอง</small>
            </label>
            <div class="col-md-9">
              <div class="col-md-8" style="padding-left: 0px;">
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
              <div class="col-md-8" style="padding-left: 0px;">
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
            <div class="col-md-3">
              <input id="sum" class="form-control" value="" readonly="true" />
            </div>

            <label for="type" class="col-md-2 control-label" style="padding: 7px 0px 7px 0px;">
              <small>ประเภทการฝึก</small>
            </label>
            <div class="col-md-4">
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
              <div class="col-md-8" style="padding-left: 0px;">
                <input id="position" class="form-control" readonly="readonly" value="${user.position.posiName}"/>
              </div>
            </div>
          </div>
        </div>

        <div class="form-group">
          <div class="row col-md-12">
            <label class="col-md-3 control-label" style="padding-right: 0px">
              <small>พนักงานที่ปรึกษา</small>
            </label>
            <div class="col-md-9">
              <div class="col-md-8" style="padding-left: 0px;">
                <input id="staffName" class="form-control" readonly="readonly" value="${user.staffId}"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  function callculateAge(){
    var splitDate = $("#birthday").val().split('/');
    $("#age").val(_calculateAge(splitDate[2]+"/"+splitDate[1]+"/"+splitDate[0]));
  }
  $(doucument).ready(function(){
    callculateAge();
  })
</script>
