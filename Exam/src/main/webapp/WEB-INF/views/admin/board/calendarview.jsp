<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석 | 관리자</title>
<%@include file="/resources/inc/Extend_Admin.jsp" %>
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
						<li onclick="location.href='/exam/admin/testnewslist.action'">시험뉴스</li>
						<li onclick="location.href='/exam/admin/surveylist.action'">설문조사</li>
						<li class="side_select" onclick="location.href='/exam/admin/listcalendar.action'">일정관리</li>
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>일정보기</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="게시판관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="일정보기" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
				
				<table id="tbl" class="table">
					<tr>
						<th>제목</th>
						<td>${dto.subjectExamDate}</td>
					</tr>
					<tr>
						<th>시험일정</th>
						<td>${dto.examDate}</td>
					</tr>
					<tr>
						<th>시험시작시간</th>
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
						<td colspan="2">
							<input type="button" value="리스트" class="btn btn-default" onclick="location.href='/exam/admin/listcalendar.action';" />
						</td>
					</tr>
				</table>
				
				</div>
				
			</div>
			<!-- 본문 끝 -->
		
		</div>
	
	</div>
	<!-- 컨테이너 끝 -->
	
	
	<div id="footer"><div id="footer_child"><%@include file="/resources/inc/Copyright.jsp" %></div></div>
	
</body>
</html>