<%--
  Created by IntelliJ IDEA.
  User: JOKIZZ
  Date: 16/7/2558
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal SelectQuestion-->
<div class="modal fade" id="selectQuest">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">

      <div class="modal-body"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" align="center">เลือกคำถาม</h3>
      </div>

        <%@include file="../searchQuesionTemplate.jsp"%>
        <%--<div class="row form-group">--%>
          <%--<div class="col-md-4" align="right">--%>
            <%--<h4><label class="label label-success"--%>
                       <%--style="background-color: lightgreen ; color: black ; font-weight: 100">หมวดหมู่ :</label></h4>--%>
          <%--</div>--%>
          <%--<div class="input-group col-md-5">--%>
            <%--<input type="text" class="form-control" name="cat"/>--%>
            <%--<span class="input-group-addon" id="selectCat"><i class="glyphicon glyphicon-search"></i></span>--%>
          <%--</div>--%>
        <%--</div>--%>

        <%--<div class="row form-group">--%>
          <%--<div class="col-md-4" align="right">--%>
            <%--<h4><label class="label label-success"--%>
                       <%--style="background-color: lightgreen ; color: black ; font-weight: 100">ชื่อหัวข้อเรื่อง :</label>--%>
            <%--</h4>--%>
          <%--</div>--%>
          <%--<div class="input-group col-md-5">--%>
            <%--<input type="text" class="form-control" name="subcat"/>--%>
            <%--<span class="input-group-addon" id="selectSubCat"><i class="glyphicon glyphicon-search"></i></span>--%>
          <%--</div>--%>
        <%--</div>--%>


          <br>

        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- End Modal Select Question -->


