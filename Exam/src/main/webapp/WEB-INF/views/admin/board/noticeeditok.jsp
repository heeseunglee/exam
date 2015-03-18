<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/resources/inc/Extend.jsp" %>
<script type="text/javascript">

alert("수정완료");
 location.href="/exam/admin/view.action?seq=${seq}"; 
 

/* if (${result == true}) {
	alert("수정완료!!");
	location.href="exam/admin/view.action?seq=${seq}";
} else {
	alert("수정 실패!!");
	history.back();
} */

</script>