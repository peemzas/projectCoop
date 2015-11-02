<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="context" value="${pageContext.request.contextPath}"/>
<script>
    var context = '${context}';
</script>
<div class="container row">
    <h3 class="h3">ผลคะแนนการสอบ</h3>
</div>
<hr/>

<div class="container">
    <div class="row">
        <table class="table table-bordered table-hover">
            <thead class="bg-primary label-primary small">
            <tr>
                <th style="text-align: center">ชื่อชุดข้อสอบ</th>
                <th style="text-align: center">คะแนนเต็ม</th>
                <th style="text-align: center">คะแนนPreTest</th>
                <th style="text-align: center">คะแนนPostTest</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${examResults}" var="result">
                <c:if test="${result.status.id == 6}">

                    <c:if test="${fn:indexOf(result.objectiveScore + result.subjectiveScore,',') != 0}">
                        <c:set var="preTestScore"
                               value="${fn:substring(result.objectiveScore + result.subjectiveScore , 0 , (fn:indexOf(result.objectiveScore + result.subjectiveScore, '.')+3))}"/>
                    </c:if>


                    <c:if test="${fn:indexOf(result.examRecord.postTestRecord.examResult.objectiveScore + result.examRecord.postTestRecord.examResult.subjectiveScore, '.') != 0}">
                        <c:set var="postTestScore"
                               value="${fn:substring(result.examRecord.postTestRecord.examResult.objectiveScore + result.examRecord.postTestRecord.examResult.subjectiveScore , 0 , (fn:indexOf(result.examRecord.postTestRecord.examResult.objectiveScore + result.examRecord.postTestRecord.examResult.subjectiveScore, '.')+3))}"/>
                    </c:if>


                    <tr resultId="${result.id}">
                        <td>${result.examRecord.paper.name}</td>
                        <td align="center" class="col-max-score">
                                ${result.examRecord.paper.maxScore}
                        </td>

                        <td align="center" class="col-pre-score">
                                ${preTestScore}
                            <button class="btn btn-link btn-info btn-sm resultDetail" type="button" data-toggle="modal"
                                    data-target="#showScore" resultId="${result.id}">
                                <span class="glyphicon glyphicon-info-sign" href="#"></span>
                            </button>
                        </td>

                        <td align="center" class="col-post-score">
                            <c:if test="${result.examRecord.postTestRecord.examResult.markedBy != null}">
                                ${postTestScore}
                                <button class="btn btn-link btn-info btn-sm resultDetail" type="button"
                                        data-toggle="modal"
                                        data-target="#showScore"
                                        resultId="${result.examRecord.postTestRecord.examResult.id}">
                                    <span class="glyphicon glyphicon-info-sign" href="#"></span>
                                </button>
                            </c:if>
                            <c:if test="${result.examRecord.postTestRecord == null}">
                                -
                            </c:if>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>

        <c:if test="${fn:length(examResults) <= 0}">
            <div class="bg-info" id="b3rd">
                <h3 id="b4th" style="text-align: center;">ไม่พบข้อมูล</h3>
            </div>
        </c:if>
    </div>
</div>


<%@include file="modal/showScoreModal.jsp" %>
<script src="../../../resources/js/pageScript/exam/checkScore.js"></script>

<style>

    #b3rd {
        background-color: #b2e0ff;
        height: 100px;
        top: 40px;
        vertical-align: middle;
        border-radius: 5px;
        margin-top: -15px;
    }

    #b4th {
        text-align: center;
        vertical-align: middle;
        line-height: 100px;
        color: #00647f;
    }

</style>