<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	
	<c:if test="${userSeq == null || userSeq.equals('')}">
		alert("로그인 후 이용하시기 바랍니다.");
		location.href="/Account";
		
		<%	
		//out.close(); // 위 구문 이후의 출력 내용은 생산하지 않는다.
 		%> 
	</c:if>
	
</script>


