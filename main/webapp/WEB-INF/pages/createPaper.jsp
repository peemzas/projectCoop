<%--
  Created by IntelliJ IDEA.
  User: PeeMz
  Date: 13/7/2558
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
  <h2 align="center">Create Paper</h2>
</div>
<div class="row">
  <div class="col-md-4" align="right">
    <label><h4 style="margin-top: 5px">Paper Name :</h4></label>
  </div>
  <div class="col-md-4">
    <input class="form-control" type="text" name="ppName"/>
  </div>
</div>
<div class="row">
  <div class="col-md-4" align="right">
    <label><h4 style="margin-top: 5px">Paper Max Score :</h4></label>
  </div>
  <div class="col-md-4">
    <input class="form-control" type="text" name="ppScore"/>
  </div>
  <div class="col-md-4">
    <input class="check-box" type="checkbox" name="check"/>
    <label><h5>Proportional Score</h5></label>
  </div>
</div>
<div class="row">
  <div class="col-md-4" align="right">
    <label><h4 style="margin-top: 5px">Position :</h4></label>
  </div>
  <div class="col-md-4">
    <select class="form-control">
      <option>Dev</option>
      <option>ABA</option>
    </select>
  </div>
</div>
<br>

<%--<div class="row">--%>
  <%--<div class="col-md-2 col-md-offset-1" align="right">--%>
    <%--<label><h4 style="margin-top: 5px">Category :</h4></label>--%>
  <%--</div>--%>
  <%--<div class="col-md-2">--%>
    <%--<div class="input-group">--%>
      <%--<input class="form-control" type="text" name="cat"/>--%>
      <%--<span class="input-group-addon glyphicon glyphicon-search" style="position: static"></span>--%>
    <%--</div>--%>
  <%--</div>--%>
  <%--<div class="col-md-3" align="right">--%>
    <%--<label><h4 style="margin-top: 5px">Sub-Category :</h4></label>--%>
  <%--</div>--%>
  <%--<div class="col-md-2">--%>
    <%--<div class="input-group">--%>
      <%--<input class="form-control" type="text" name="subcat"/>--%>
      <%--<span class="input-group-addon glyphicon glyphicon-search" style="position: static"></span>--%>
    <%--</div>--%>
  <%--</div>--%>
<%--</div>--%>
<%--<div class="row">--%>
  <%--<div class="col-md-2 col-md-offset-1" align="right">--%>
    <%--<label><h4 style="margin-top: 5px">Create Date :</h4></label>--%>
  <%--</div>--%>
  <%--<div class="col-md-2">--%>
    <%--<div class="input-group">--%>
      <%--<input class="form-control" type="date" id="date"/>--%>
      <%--<span class="input-group-addon glyphicon glyphicon-calendar" style="position: static"></span>--%>
    <%--</div>--%>
  <%--</div>--%>
  <%--<div class="col-md-3" align="right">--%>
    <%--<label><h4 style="margin-top: 5px">Question Create By :</h4></label>--%>
  <%--</div>--%>
  <%--<div class="col-md-2">--%>
    <%--<div class="input-group">--%>
      <%--<input class="form-control" type="text" name="questcreate"/>--%>
      <%--<span class="input-group-addon glyphicon glyphicon-search" style="position: static"></span>--%>
    <%--</div>--%>
  <%--</div>--%>
<%--</div>--%>

<div class="row">
  <div class="col-md-2 col-md-offset-5">
    <h4 align="center">Question</h4>
  </div>
  <div class="col-md-5" align="right" style="padding: 0px">
    <button class="btn btn-gray">ADD</button>
    <button class="btn btn-gray">Random Question</button>
  </div>
</div>
<div class="row">
    <table class="table">
      <thead style="background-color: lightgreen">
        <tr>
          <th style="text-align: center ; border: 1px solid white">Type</th>
          <th style="text-align: center ; border: 1px solid white">Category</th>
          <th style="text-align: center ; border: 1px solid white">Sub-Category</th>
          <th style="text-align: center ; border: 1px solid white">Question Description</th>
          <th style="text-align: center ; border: 1px solid white">Difficulity</th>
          <th style="text-align: center ; border: 1px solid white">Score</th>
          <th style="text-align: center ; border: 1px solid white">Create by</th>
          <th style="text-align: center ; border: 1px solid white">Create date</th>
          <th style="text-align: center ; border: 1px solid white">Remove</th>
        </tr>
      </thead>

      <tbody>
        <tr>
          <td style="text-align: center">Objective</td>
          <td style="text-align: center">Java</td>
          <td style="text-align: center">OOP</td>
          <td style="text-align: center">What color do you like?</td>
          <td style="text-align: center">Hard</td>
          <td style="text-align: center">2</td>
          <td style="text-align: center">PEEM"</td>
          <td style="text-align: center">13/07/2015</td>
          <td style="text-align: center"><button class="btn glyphicon glyphicon-trash"></button></td>
        </tr>

        <tr>
          <td style="text-align: center">Subjective</td>
          <td style="text-align: center">Java</td>
          <td style="text-align: center">Hibernate</td>
          <td style="text-align: center">What color do you like?</td>
          <td style="text-align: center">Very Fucking Hard</td>
          <td style="text-align: center">100000000</td>
          <td style="text-align: center">PEEM"</td>
          <td style="text-align: center">13/07/2015</td>
          <td style="text-align: center"><button class="btn glyphicon glyphicon-trash"></button></td>
        </tr>
      </tbody>
    </table>
</div>
<div class="row">
  <div class="col-md-4 col-md-offset-4" align="center">
    <button class="btn btn-gray">Confirm</button>
    <button class="btn btn-gray">Clear</button>
    <button class="btn btn-gray">Cancle</button>
  </div>
</div>

<script>
  $("#date").datepicker();
</script>