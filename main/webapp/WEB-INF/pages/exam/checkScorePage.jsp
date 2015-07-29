<%--
  Created by IntelliJ IDEA.
  User: JOKIZZ
  Date: 29/7/2558
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container row">
    <div class="row">
        <h3 class="h3">ตรวจคะแนน</h3>
    </div>
</div>
<hr/>

<div class="container">
    <div class="row">
        <table class="table table-bordered">
            <thead style="background-color: #006dcc; color: white;">
            <tr>
                <th style="text-align: center">ชื่อชุดข้อสอบ</th>
                <th style="text-align: center">วันที่ส่ง</th>
                <th style="text-align: center">ตรวจโดย</th>
                <th style="text-align: center">คะแนนเต็ม</th>
                <th style="text-align: center">คะแนนที่ได้</th>
                <th style="text-align: center;width: 10%">ดูรายละเอียด</th>

            </tr>
            </thead>
            <tbody>

            <tr>
                <td>แบบทดสอบก่อนการอบรม</td>
                <td align="center">7/7/2015</td>
                <td align="center">นายB</td>
                <td align="center">50</td>
                <td align="center">25</td>
                <td style="text-align: center; width: 7%">
                    <button class="btn btn-default" data-toggle="modal" data-target="#selectQuest" id="">
                        <a class="glyphicon glyphicon-search" href="#"></a>
                    </button>
                </td>
            </tr>

            <tr>
                <td>แบบทดสอบก่อนหลังอบรม</td>
                <td align="center">7/7/2015</td>
                <td align="center">นายC</td>
                <td align="center">50</td>
                <td align="center">40</td>
                <td style="text-align: center; width: 7%">
                    <button class="btn btn-default" id="">
                        <a class="glyphicon glyphicon-search" href="#"></a>
                    </button>
                </td>
            </tr>

            <tr>
                <td>แบบทดสอบความรู้พื้นฐานภาษาอังกฤษ</td>
                <td align="center">8/7/2015</td>
                <td align="center">นายD</td>
                <td align="center">50</td>
                <td align="center">45</td>
                <td style="text-align: center; width: 7%">
                    <button class="btn btn-default" id="">
                        <a class="glyphicon glyphicon-search" href="#"></a>
                    </button>
                </td>
            </tr>

            <tr>
                <td>แบบทดสอบความรู้พื้นฐานภาษาทางธุรกิจ</td>
                <td align="center">9/7/2015</td>
                <td align="center">นายE</td>
                <td align="center">60</td>
                <td align="center">58</td>
                <td style="text-align: center; width: 7%">
                    <button class="btn btn-default" id="">
                        <a class="glyphicon glyphicon-search" href="#"></a>
                    </button>
                </td>
            </tr>


            </tbody>
        </table>
    </div>
</div>


<div class="row">
    <div class="col-md-12" align="center">
        <ul class="pagination">
            <li class="disabled"><a href="#">&laquo;</a></li>
            <li class="active"><a href="#">1</a></li>
            <li><a>2</a></li>
            <li><a>3</a></li>
            <li><a>4</a></li>
            <li><a>5</a></li>
            <li class="disabled"><a href="#">&raquo;</a></li>
        </ul>
    </div>
</div>


<div class="modal fade" id="selectQuest">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">

                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3">
                            <h3 style="text-align: center">Youre score is 46/50</h3>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-3 col-md-offset-2">
                            <label><h4>Objective</h4></label>
                        </div>

                        <div class="col-md-3 col-md-offset-3">
                            <label><h4>20/22</h4></label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3 col-md-offset-2">
                            <label><h4>Subjective</h4></label>
                        </div>

                        <div class="col-md-3 col-md-offset-3">
                            <label><h4>26/28</h4></label>
                        </div>
                    </div>
                </div>

                <hr>

                <div class="row">
                    <div class="col-md-6 col-md-offset-2">
                        <h5>Comment :</h5>
                        <textarea></textarea>
                    </div>
                </div>>
            </div>
        </div>

        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- End Modal Select Question -->
