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

</style>
<script type="text/javascript">

$(document).ready(function() {
	
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
						<li onclick="location.href='/exam/admin/list.action'">공지사항관리</li>
                  <li class="side_select" onclick="location.href='/exam/admin/testnewslist.action'">시험뉴스</li>
                  <li onclick="location.href='/exam/admin/surveylist.action'">설문조사</li>
                  <li onclick="location.href='/exam/admin/listcalendar.action'">일정관리</li>
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>시험뉴스보기</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="게시판관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="시험뉴스보기" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
				
				<table id="tbl" class="table table-striped">
					
					<tr>
						<th>분류명</th>
						<td>${dto.testnewsDIV}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${dto.subject}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${dto.content}</td>
					</tr>
				</table>	
				
				<div id="btnList">
					<c:if test="${empty searchColum && empty searchWord}">
					<img src="/resources/images/back.png" onclick="location.href='/exam/admin/testnewslist.action';"/>
					</c:if>
					
					<c:if test="${!empty searchColum && !empty searchWord}">
					<img src="/resources/images/back.png" onclick="location.href='/exam/admin/testnewslist.action?searchColum=${searchColum}&searchWord=${searchWord}';"/>
					</c:if>
					<input type="button" value="삭제" class="btn btn-default" style="width:45px;" onclick="location.href='/exam/admin/testnewsdelok.action?seq=${dto.seq}';">
					<img src="/resources/images/modify.png" onclick="location.href='/exam/admin/testnewsedit.action?seq=${dto.seq}';"/>
					<img src="/resources/images/delete.png" onclick="location.href='/exam/admin/testnewsdelok.action?seq=${dto.seq}';"/>
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