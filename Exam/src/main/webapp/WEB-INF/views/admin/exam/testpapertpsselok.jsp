<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
[
<c:set var ="i" value="1" />
<c:forEach var="questiondto" items="${questionlist}">
{
"questionSeq" : "${questiondto.seq}",
"questionCode":"${questiondto.questionCode}"
}
<c:if test="${i<questionlist.size()}">,</c:if>
<c:set var ="i" value="${i+1}" />
</c:forEach>

]