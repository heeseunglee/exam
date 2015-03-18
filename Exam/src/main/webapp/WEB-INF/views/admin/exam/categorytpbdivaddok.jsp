<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
[
<c:set var ="i" value="1" />
<c:forEach var="tpmdivdto" items="${tpmdivlist}">
{
"tpmdivseq" : "${tpmdivdto.tpmdivseq}",
"tpmdiv":"${tpmdivdto.tpmdiv}"
}
<c:if test="${i<tpmdivlist.size()}">,</c:if>
<c:set var ="i" value="${i+1}" />
</c:forEach>

]