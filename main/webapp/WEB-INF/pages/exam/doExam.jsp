<%--
  Created by IntelliJ IDEA.
  User: wanchana
  Date: 29/7/2558
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class = "container row">
  <div class = "row text-center">
    <h3>ข้อสอบออนไลน์</h3>
    <hr/>
  </div>
</div>
<div class="container">
  <div class="row text-left">
    <h4>ชุดข้อสอบ:</h4>แบบทดสอบก่อนการอบรม : เวลาในการทำข้อสอบ 60 นาที
  </div><br/>
  <div class="row text-left">
    <div class="col-md-2">
      <label style="position: fixed; left:0; bottom:0;"><h1 class="bg-danger" id="timing" style="color: red; font-family: Palatino Linotype;">00:59:59</h1></label>
    </div>
  </div>
  <br/><br/>
  <%--Make Question Example It's will remove soon.^^--%>
  <div class="row">
   <div class="panel panel-default">
     <div class="panel-body">
       <div class="row">
         <div class="col-md-10 col-md-offset-1">
           ข้อที่ 1.&nbsp;<h5>จงอธิบายทฤษฎีกำเนิดชนชาติไทยมา 1 ทฤษฎี</h5>
         </div>
       </div>
       <div class="row">
         <div class="col-md-10 col-md-offset-1">
           <textarea class="form-control" cols="100%" rows="5" placeholder=""></textarea>
         </div>
       </div>
     </div>
   </div>
  </div>
  <div class="row">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="row">
          <div class="col-md-10 col-md-offset-1">
            ข้อที่ 2.&nbsp;<h5>คำสั่งบันทึกใช้ปุ่มใดในแผงแป้นอักขระ</h5>
          </div>
        </div>
        <div class="row">
          <div class="col-md-10 col-md-offset-1">
            <form role="form">
              <div class="radio">
                <label><input type="radio">ก.</label><label class="radio-inline">Ctrl + V</label>
              </div>
              <div class="radio">
                <label><input type="radio">ข.</label><label class="radio-inline">Ctrl + N</label>
              </div>
              <div class="radio">
                <label><input type="radio">ค.</label><label class="radio-inline">Ctrl + S</label>
              </div>
              <div class="radio">
                <label><input type="radio">ง.</label><label class="radio-inline">Ctrl + C</label>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="row">
          <div class="col-md-10 col-md-offset-1">
            ข้อที่ 3.&nbsp;<h5>คำสั่งบันทึกใช้ปุ่มใดในแผงแป้นอักขระ</h5>
          </div>
        </div>
        <div class="row">
          <div class="col-md-10 col-md-offset-1">
            <form role="form">
              <div class="radio">
                <label><input type="radio">ก.</label><label class="radio-inline">Ctrl + V</label>
              </div>
              <div class="radio">
                <label><input type="radio">ข.</label><label class="radio-inline">Ctrl + N</label>
              </div>
              <div class="radio">
                <label><input type="radio">ค.</label><label class="radio-inline">Ctrl + S</label>
              </div>
              <div class="radio">
                <label><input type="radio">ง.</label><label class="radio-inline">Ctrl + C</label>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="row">
          <div class="col-md-10 col-md-offset-1">
            ข้อที่ 4.&nbsp;<h5>จงอธิบายทฤษฎีกำเนิดชนชาติไทยมา 1 ทฤษฎี</h5>
          </div>
        </div>
        <div class="row">
          <div class="col-md-10 col-md-offset-1">
            <textarea class="form-control" cols="100%" rows="5" placeholder=""></textarea>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="row">
          <div class="col-md-10 col-md-offset-1">
            ข้อที่ 5.&nbsp;<h5>จงอธิบายทฤษฎีกำเนิดชนชาติไทยมา 1 ทฤษฎี</h5>
          </div>
        </div>
        <div class="row">
          <div class="col-md-10 col-md-offset-1">
            <textarea class="form-control" cols="100%" rows="5" placeholder=""></textarea>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12 text-right">
      <button class="btn btn-file" id="SendPaper" >ส่งชุดข้อสอบ</button>
    </div>
  </div>
  <br/><br/>
  <div class = "row">
    <div class = "col-md-12" align = "center">
      <ul class = "pagination">
        <li class = "disabled"><a href = "#">&laquo;</a></li>
        <li class = "active"><a href = "#">1</a></li>
        <li><a>2</a></li>
        <li><a>3</a></li>
        <li><a>4</a></li>
        <li><a>5</a></li>
        <li class = "disabled"><a href = "#">&raquo;</a></li>
      </ul>
    </div>
  </div>
</div>

<script>
  $('#SendPaper').on('click',function(){
    alert('ส่งชุดข้อสอบเรียบร้อบแล้ว')
  })

</script>

