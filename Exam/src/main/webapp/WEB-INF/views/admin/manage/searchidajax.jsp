<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
[
	<c:set var="i" value="1" />
	<c:forEach var="dto" items="${userList}">
	{
	 	"memSeq":"${dto.memSeq}",
	 	"name":"${dto.name}",
	 	"userId":"${dto.userId}"
	}
	<c:if test="${i < userList.size()}">
 	, 
 	</c:if>
 	<c:set var="i" value="${i+1}" />
  	</c:forEach>
]