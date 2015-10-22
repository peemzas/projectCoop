<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container row">
    <div class="row">
        <h3 class="h3">ผลคะแนนการสอบ</h3>
    </div>
</div>
<hr/>

<div class="container">
    <div class="row">
        <table class="table">
            <thead class="bg-primary label-primary small">
            <tr>
                <th style="text-align: center">ชื่อชุดข้อสอบ</th>
                <th style="text-align: center">คะแนนเต็ม</th>
                <th style="text-align: center">คะแนนPreTest</th>
                <th style="text-align: center">คะแนนPostTest</th>
                <%--<th style="text-align: center">สถานะ</th>--%>
            </tr>
            </thead>
            <tbody>


            <c:forEach items="${examResults}" var="result">
                <tr resultId="${result.id}">
                    <td>${result.examRecord.paper.name}</td>
                    <td align="center" class="col-max-score">
                            ${result.examRecord.paper.maxScore}
                    </td>

                    <td align="center" class="col-pre-score">
                            ${result.objectiveScore + result.subjectiveScore}
                        <button class="btn btn-link btn-info btn-sm resultDetail" type="button" data-toggle="modal"
                                data-target="#showScore" resultId="${result.id}">
                            <span class="glyphicon glyphicon-info-sign" href="#"></span>
                        </button>
                    </td>

                    <td align="center" class="col-post-score">
                        <c:if test="${result.examRecord.postTestRecord != null}">
                            ${result.examRecord.postTestRecord.examResult.objectiveScore + result.examRecord.postTestRecord.examResult.subjectiveScore}
                            <button class="btn btn-link btn-info btn-sm resultDetail" type="button" data-toggle="modal"
                                    data-target="#showScore" resultId="${result.examRecord.postTestRecord.examResult.id}">
                                <span class="glyphicon glyphicon-info-sign" href="#"></span>
                            </button>
                        </c:if>
                        <c:if test="${result.examRecord.postTestRecord == null}">
                            -
                        </c:if>
                    </td>

                        <%--<td align="center" class="col-status">${result.status.description}</td>--%>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>

<%@include file="modal/showScoreModal.jsp" %>
<script src="../../../resources/js/pageScript/exam/checkScore.js"></script>
