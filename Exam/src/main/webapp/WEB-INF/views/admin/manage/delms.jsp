<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>

<!-- 기본적으로 사용되는 CSS/Javascript 파일은 외부 페이지에서 가져오기 -->
<%@include file="/resources/inc/Extend.jsp" %>

<style type="text/css">
	#tbl {
		width: 300px;
		margin: 0px auto;
		margin-top: 100px;
		margin-bottom: 30px;
	}
	#tbl th {width: 100px; text-align: center;}
	#tbl td {width: 200px;}
</style>

<script type="text/javascript">

	$(document).ready(function() {
		
	});
	
	function send() {
		$("#btnSubmit").click();
	}
</script>

</head>
<body>
	<div id="notice">
		<div id="content">
			<form action="/exam/admin/delokms.action?seq=${seq}" method="POST">
				<table id="tbl" class="table table-striped">
					
				</table>
				<div id="btnList">
					<img src="/resources/images/back.png" onclick="history.back();" />
					<img src="/board/images/delete.png" onclick="send();" />
					<input type="submit" value=" 글쓰기 " id="btnSubmit" style="display: none;" />
				</div>
				
			</form>
		</div>
	</div>
</body>
</html>