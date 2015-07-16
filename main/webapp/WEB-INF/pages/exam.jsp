<%--
  Created by IntelliJ IDEA.
  User: PeeMz
  Date: 9/7/2558
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
  <div class=" col-md-4">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color: #003366;border: 1px solid #003366;"><font color = "white">สร้าง</font></div>
      <div class="panel-body">
        <div class="btn-group-vertical col-md-6 col-md-offset-3" align="center">
          <button data-toggle="modal" data-target="#createCat" class="btn btn-default" style="background-color:lightgreen ;color: black">Category</button>
          <button data-toggle="modal" data-target="#createSub" class="btn btn-default" class="btn btn-default" style="background-color:lightgreen ;color: black">Sub-category</button>
          <button data-toggle="modal" data-target="#createQuest" class="btn btn-default" style="background-color:lightgreen ;color: black">Question</button>
          <a href="/TDCS/createPaper" class="btn btn-default" style="background-color:lightgreen ;color: black">Paper</a>
        </div>
      </div>
    </div>
  </div>

  <div class=" col-md-4">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color: lightpink">แก้ไข</div>
      <div class="panel-body">
        <div class="btn-group-vertical col-md-6 col-md-offset-3" align="center">
          <a href = "/TDCS/editCategories" class = "btn btn-primary">แก้ไขหมวดหมู่</a>
          <a href = "/TDCS/editQuestions" class = "btn btn-primary">แก้ไขข้อสอบ</a>
          <button class="btn btn-default" style="background-color:lightpink ;color: black">Paper</button>
        </div>
      </div>
    </div>
  </div>

  <div class=" col-md-4">
    <div class="panel panel-default">
      <div class="panel-heading" style="background-color: lightblue">Manage</div>
      <div class="panel-body">
        <div class="btn-group-vertical col-md-6 col-md-offset-3" align="center">
          <a href="/TDCS/examrecordsearch"><button class="btn btn-default" style="background-color:lightblue ;color: black">Marking</button></a>
          <button class="btn btn-default" style="background-color:lightblue ;color: black">Open Exam</button>
          <button class="btn btn-default" style="background-color:lightblue ;color: black">Search</button>
        </div>
      </div>
    </div>
  </div>
</div>

<%--Modal--%>
<div class="modal fade" id="createCat">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" align="center">Create category</h3>
      </div>
      <div class="modal-body" style="height: 80px">
        <div class="row">
          <div class="col-md-3">
            <h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">Category Name :</label></h4>
          </div>
          <div class="col-md-6">
            <input type="text" class="form-control" name="cat"/>
          </div>
          <button class="btn btn-primary" type="submit">Submit</button>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="createSub">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" align="center">Create Sub category</h3>
      </div>
      <div class="modal-body">
        <div class="row form-group">
          <div class="col-md-4">
            <h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">Select Catagory :</label></h4>
          </div>
          <div class="input-group col-md-5">
            <input type="text" class="form-control" name="cat" style="width: 245px"/>
            <span class="input-group-addon" id="search"><a class="glyphicon glyphicon-search" href="#"></a></span>
          </div>
        </div>
        <div class="row form-group">
          <div class="col-md-4">
            <h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">Sub-Category Name :</label></h4>
          </div>
          <div class="col-md-6"  style="padding-left: 0px">
            <input type="text" class="form-control" name="subcat"/>
          </div>
          <button class="btn btn-primary" type="submit">Submit</button>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="createQuest">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" align="center">Create Question</h3>
      </div>
      <div class="modal-body">
        <div class="row form-group">
          <div class="col-md-4" align="right">
            <h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">Catagory :</label></h4>
          </div>
          <div class="input-group col-md-5">
            <input type="text" class="form-control" name="cat"/>
            <span class="input-group-addon" id="selectCat"><i class="glyphicon glyphicon-search"></i></span>
          </div>
        </div>
        <div class="row form-group">
          <div class="col-md-4" align="right">
            <h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">Sub-Category :</label></h4>
          </div>
          <div class="input-group col-md-5">
            <input type="text" class="form-control" name="subcat" />
            <span class="input-group-addon" id="selectSubCat"><i class="glyphicon glyphicon-search"></i></span>
          </div>
        </div>
        <div class="row form-group">
          <div class="col-md-4" align="right">
            <h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">Question Type :</label></h4>
          </div>
          <div class="input-group col-md-5">
            <select class="form-control" onclick="select()">
              <option id="obj" value="Objective">Objective</option>
              <option id="sub" value="Subjective">Subjective</option>
            </select>
          </div>
          <br>
          <div class="modal-footer" id="question">
            <%-- Start Objective--%>
            <div class="row form-group" id="objective" style="display: none">
              <div class="col-md-4">
                <h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">Question :</label></h4>
              </div>
              <div class="col-md-5" style="padding: 0px">
                <textarea class="form-control" style="resize: none"></textarea>
              </div>
              <div class="col-md-3" align="left">
                <div class="radio">
                  <label><input type="radio" name="level" value="hard">Hard</label>
                </div>
                <div class="radio">
                  <label><input type="radio" name="level" value="normal">Normal</label>
                </div>
                <div class="radio">
                  <label><input type="radio" name="level" value="easy">Easy</label>
                </div>
              </div>
            </div>
            <div class="row form-group" id="objective2" style="display: none">
              <div class="col-md-5 col-md-offset-4" style="padding: 0px" align="left">
                <div class="radio">
                  <input type="radio" name="level"/>
                  <input class="form-control" type="text" id="choiceA"/>
                </div>
                <div class="radio">
                  <input type="radio" name="level"/>
                  <input class="form-control" type="text" id="choiceB"/>
                </div>
                <div class="radio">
                  <input type="radio" name="level"/>
                  <input class="form-control" type="text" id="choiceC"/>
                </div>
                <div class="radio">
                  <input type="radio" name="level"/>
                  <input class="form-control" type="text" id="choiceD"/>
                </div>
                <div class="btn col-md-offset-1">
                  <button class="btn btn-primary">Create</button>
                  <button class="btn btn-danger" data-dismiss="modal">Cancle</button>
                </div>
              </div>

              <div class="col-md-1 col-md-offset-1">
                <div class="row form-group">
                  <div>
                    <h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">Score</label></h4>
                    <input type="text" class="form-control" name="score"/>
                  </div>
                </div>
              </div>
            </div>
            <%--End Objective--%>

            <%--Start Subjective--%>
            <div class="row form-group" id="subjective" style="display: none">
              <div class="col-md-4">
                <h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">Question :</label></h4>
              </div>
              <div class="col-md-5" style="padding: 0px">
                <textarea class="form-control" style="resize: none"></textarea>
              </div>
              <div class="col-md-3" align="left">
                <div class="radio">
                  <label><input type="radio" name="level" value="hard">Hard</label>
                </div>
                <div class="radio">
                  <label><input type="radio" name="level" value="normal">Normal</label>
                </div>
                <div class="radio">
                  <label><input type="radio" name="level" value="easy">Easy</label>
                </div>
              </div>
            </div>
            <div class="row form-group" id="subjective2" style="display: none">
              <div class="col-md-5 col-md-offset-4" align="left">
                <div class="row">
                  <textarea class="form-control" style="resize: none"></textarea>
                </div>
                <br>
                <div class="btn col-md-offset-1">
                  <button class="btn btn-primary">Create</button>
                  <button class="btn btn-danger" data-dismiss="modal">Cancle</button>
                </div>
              </div>
              <div class="col-md-1 col-md-offset-1">
                <div class="row form-group">
                  <div>
                    <h4><label class="label label-success" style="background-color: lightgreen ; color: black ; font-weight: 100">Score</label></h4>
                    <input type="text" class="form-control" name="score"/>
                  </div>
                </div>
              </div>
            </div>
            <%--End Subjective--%>

          </div><!--Modal footer-->
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script>
  function select(){
    $('#obj').click(function(){
      $('#objective').show();
      $('#objective2').show();
      $('#subjective').hide();
      $('#subjective2').hide();
    })

    $('#sub').click(function(){
      $('#subjective').show();
      $('#subjective2').show();
      $('#objective').hide();
      $('#objective2').hide();
    })

  }
</script>