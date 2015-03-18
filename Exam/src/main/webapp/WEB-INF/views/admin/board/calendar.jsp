<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석 | 관리자</title>
<%@include file="/resources/inc/Extend_Admin.jsp" %>
<link rel="stylesheet" href="/exam/resources/fullcalendar-2.3.0/fullcalendar.css" />
<script type="text/javascript" src="/exam/resources/fullcalendar-2.3.0/lib/jquery.min.js"></script>
<script type="text/javascript" src="/exam/resources/fullcalendar-2.3.0/lib/moment.min.js"></script>
<script type="text/javascript" src="/exam/resources/fullcalendar-2.3.0/fullcalendar.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	/* 관리자 */
	$("#calendar").fullCalendar({
		
	})
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
						<li class="side_select" onclick="location.href='#'">서브메뉴1</li>
						<li onclick="location.href='#'">서브메뉴2</li>
						<li onclick="location.href='#'">서브메뉴3</li>
						<li onclick="location.href='#'">서브메뉴4</li>
						<li onclick="location.href='#'">서브메뉴5</li>
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>서브메뉴제목</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="회원관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="서브메뉴" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
				
				<div id="calendar"></div>
				
				
				
				
				
					
				
				</div>
				
			</div>
			<!-- 본문 끝 -->
		
		</div>
	
	</div>
	<!-- 컨테이너 끝 -->
	
	
	<div id="footer"><div id="footer_child"><%@include file="/resources/inc/Copyright.jsp" %></div></div>
	
</body>
</html>