<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("userSeq") == null || 
		!session.getAttribute("lv").toString().equals("3")) {
%>		
		<script type="text/javascript">
			alert("관리자만 접근 가능합니다.");
			history.back();
		</script>
<%	
		//out.close(); // 위 구문 이후의 출력 내용은 생산하지 않는다.
	}
	
%>