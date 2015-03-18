<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/resources/inc/Extend.jsp" %>
<style type="text/css">
	body {
		background-color: white;
	}
	#tbl th, #tbl td {
		background-color: white;
	}
</style>
</head>
<body>
	<table id="tbl" class="table">
		<tr>
			<th>시험일정명</th>
			<td>${dto.subjectExamDate}</td>
		</tr>
		<tr>
			<th>시험일정</th>
			<td>${dto.examDate}(${dto.remainDate})</td>
		</tr>
		<tr>
			<th>입실시간</th>
			<td>${dto.startTime}</td>
		</tr>
		<tr>
			<th>시험시간</th>
			<td>${dto.examTime}</td>
		</tr>
		<tr>
			<th>준비물</th>
			<td>${dto.examSupplies}</td>
		</tr>
		<tr>
			<th>공식사이트</th>
			<td>${dto.siteURL}</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;">
				<input type="button" value="닫기" class="btn btn-default" onclick="window.close();" />
			</td>
		</tr>
	</table>
</body>
</html>