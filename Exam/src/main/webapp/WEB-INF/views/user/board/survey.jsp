<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	<c:if test="${check==1}">
	alert("이미 투표하셨습니다.");
	location.href="/exam/home.action";
	</c:if>
	<c:if test="${check==0}">
	alert("투표완료");
	location.href="/exam/user/surveyresult.action";
	</c:if>
</script>