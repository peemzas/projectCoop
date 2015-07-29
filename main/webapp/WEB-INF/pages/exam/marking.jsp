<%--
  Created by IntelliJ IDEA.
  User: PTang_000
  Date: 7/29/2015
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    textarea {
        resize: vertical;
    }

    span {
        word-wrap: break-word;
    }
</style>

<h3>ตรวจข้อสอบ</h3>
<hr>
<h4>ข้อมูลนักศึกษา</h4>

<div class="row">
    <div class="col-md-2 text-right">ชื่อ :</div>
    <div class="col-md-4">
        <span id="firstName">ชชช</span>
        <span id="lastName">สสส</span>
    </div>
    <div class="col-md-2 text-right">รหัสพนักงาน :</div>
    <div class="col-md-4">
        <span id="empId">รรรรร</span>
    </div>
</div>
<br>

<div class="row">
    <div class="col-md-2 text-right">ทีม :</div>
    <div class="col-md-4">
        <span id="team">ททท</span>
    </div>
    <div class="col-md-2 text-right">
        ตำแหน่ง :
    </div>
    <div class="col-md-4">
        <span id="position">ตตตตต</span>
    </div>
</div>
<hr>
<h4>ข้อมูลชุดข้อสอบ</h4>

<div class="row">
    <div class="col-md-2 text-right">ชื่อชุดข้อสอบ :</div>
    <div class="col-md-4">
        <span id="paperName"></span>
    </div>
    <div class="col-md-2 text-right">รหัสชุดข้อสอบ :</div>
    <div class="col-md-4">
        <span id="paperId"></span>
    </div>
</div>
<br>

<div class="row">
    <div class="col-md-2 text-right">หมวดหมู่ :</div>
    <div class="col-md-4">
        <span id="category"></span>
    </div>
    <div class="col-md-2 text-right">หัวข้อเรื่อง :</div>
    <div class="col-md-4">
        <span id="sub-category"></span>
    </div>
</div>
<br>

<div class="row">
    <div class="col-md-2 text-right">คะแนนเต็ม :</div>
    <div class="col-md-4 paperMaxScore"></div>

</div>

<div class="row">
    <div class="col-md-3 col-md-offset-5 text-right"><h5>คะแนนปรนัยที่ได้ :</h5></div>
    <div class="col-md-1">
        <input class="form-control text-right" value="55" disabled/>
    </div>
</div>
<hr>

<h4>คำตอบ</h4>

<div id="marking-body">

    <!---------------------------------------------->
    <div class="row question-row">
        <div class="col-md-1 text-right">1 :</div>
        <div class="col-md-10"><span style="font-weight:bold ">คำถาม :</span>
            <span>
                อะไรเอ่ยน่ากลัวที่สุดในโลก
            </span>
        </div>
    </div>
    <br>

    <div class="row answer-row">
        <div class="col-md-9 col-md-offset-2">
            <span style="font-weight:bold ">คำตอบ : </span>
            <span>เหน่ง</span>
        </div>
    </div>
    <div class="row ">
        <div class="col-md-offset-8 col-md-2 text-right"><h5>คะแนน :</h5></div>
        <div class="col-md-1">
            <input class="form-control scoreInput">
        </div>
        <div class="col-md-1"><h5>/ <span class="maxScore">10</span></h5></div>

    </div>
    <hr>

    <%--<div class="col-md-2">--%>
    <%--<div class="col-md-7">--%>
    <%--<input class="form-control">--%>
    <%--</div>--%>
    <%--<div class="col-md-5">--%>
    <%--<h5>/ <span>10</span></h5>--%>
    <%--</div>--%>
    <%--</div>--%>
    <!---------------------------------------------->

</div>
<div class="comment-body">
    <h4>แสดงความคิดเห็น</h4>
    <textarea class="form-control" rows="5" id="comment" style="resize: vertical"
              placeholder="แสดงความคิดเห็น..."></textarea>
</div>
<br>

<div class="row">
    <div class="col-md-2 text-right"><h5>คะแนนรวม :</h5></div>
    <div class="col-md-1"><input id="sumScore" class="form-control" disabled></div>
    <div class="col-md-1"><h5><div class="maxScore">/ 100</div></h5></div>
    <div class="col-md-offset-4 col-md-2">
        <button class="btn btn-primary" style="width: 100%;">ส่งผลตรวจ</button>
    </div>
    <div class="col-md-2">
        <button class="btn btn-default" style="width: 100%;">ยกเลิก</button>
    </div>
</div>

<script>

    $('.scoreInput').on('blur', function () {
        var maxScore = parseFloat($(this).parent().parent().children().children('h5').children('span').text());
        if (!isNaN(($(this).val()))) {
            if ($(this).val() > maxScore) {
                alert('คะแนนที่ให้มากกว่าคะแนนเต็ม');
                $(this).val('');
            }
        }else{
            alert('กรุณากรอกคะแนนเป็นตัวเลข');
            $(this).val('');
        }

    })
</script>