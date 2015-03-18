<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석 | 관리자</title>
<%@include file="/resources/inc/Extend_Admin.jsp" %>
<style type="text/css">
th { text-align: center;}
</style>
<script type="text/javascript">
$(document).ready(function() {
	<c:if test="${isSearch}">
	$("#searchColumn").val("${searchColumn}");
	$("#searchWord").val("${searchWord}");
	</c:if>
});
</script>
</head>
<body>
	
	<div id="header"><%@include file="/resources/inc/Admin-Menu.jsp" %></div>
	
	<!-- 컨테이너 시작 -->
	<div id="container">
	
		<div id="container_child">
		
			<!-- 사이드바 시작 -->	
			<div id="aside">
		
				<div id="side_menu">
					<ul>						
						<li onclick="location.href='/exam/admin/questionlist.action'">문제관리</li>
						<li onclick="location.href='/exam/admin/categoryadd.action'">카테고리관리</li>
						<li class="side_select" onclick="location.href='/exam/admin/testpaperlist.action'">시험지관리</li>
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>시험지목록</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='/exam/admin/home.action'" />  
						<input type="button" value="시험관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='/exam/admin/questionlist.action'" />  
						<input type="button" value="시험지관리" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
				<table class="table">
				<tr>
					<th style="width: 10%">번호</th>
					<th style="width: 40%">카테고리문제지정보</th>
					<th style="width: 10%">문제수</th>
					<th style="width: 10%">응시</th>
					<th style="width: 10%">조회</th>
					<th style="width: 30%">수정삭제</th>
				</tr>
				<c:forEach var="dto" items="${tpmlist}" > 
				<tr>
 					<td style="text-align: center;">${dto.alltestseq}</td>
 					<td>${dto.tpmSubject}</td>
					<td style="text-align: center;">${dto.questioncnt}</td>
					<td style="text-align: center;">${dto.alltestcnt}</td>
					<td style="text-align: center;">${dto.receiptcnt}</td>
					<td style="text-align: center;">
						<input type="button" value="수정" class="btn btn-sm btn-success" style="width:50px;" onclick="location.href='/exam/admin/testpaperedit.action?seq=${dto.alltestseq}&tpmSubject=${dto.tpmSubject}';">
						<input type="button" value="삭제" class="btn btn-sm btn-warning" style="width:50px;" onclick="location.href='/exam/admin/testpaperdel.action?seq=${dto.alltestseq}';">
					</td>

				</c:forEach>
				<c:if test="${tpmlist.size() == 0}">
				<tr>
					<td colspan="5" style="text-align: center;">문제가 존재하지 않습니다.</td>
				</tr>
				</c:if>
				</table>
			 
				 <!-- 페이징 -->
				<div style="text-align: center;">${pageBar}</div>
				
				<div id="btnList" style="padding-left:25px;">
					<input type="button" value="시험지등록"  class="btn btn-primary" onclick="location.href='/exam/admin/testpaperadd.action';" />
					<input type="button" value="전체삭제"  class="btn btn-warning" onclick="location.href='/exam/admin/testpaperalldel.action';" />
				</div>
				
				
				
				
				
				
					
				
				</div>
				
			</div>
			<!-- 본문 끝 -->
		
		</div>
	
	</div>
	<!-- 컨테이너 끝 -->
	
	
	<div id="footer"><div id="footer_child"><%@include file="/resources/inc/Copyright.jsp" %></div></div>
	
</body>
</html>