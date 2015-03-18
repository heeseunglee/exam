<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

[
<c:set var ="i" value="1" />
<c:forEach var="testListdto" items="${userAnswerlist}">
{
"answerSeq" : "${testListdto.answerSeq}",
"userAnswer" : "${testListdto.userAnswer}",
"testNumber" : "${testListdto.testNumber}",
"oxCheck" : "${testListdto.oxCheck}",
"tpmSubject" : "${testListdto.tpmSubject}",
"answer" : "${testListdto.answer}",
"answerCnt" : "${testListdto.answerCnt}"
}
<c:if test="${i<userAnswerlist.size()}">,</c:if>
<c:set var ="i" value="${i+1}" />
</c:forEach>]