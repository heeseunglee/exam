<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석</title>
<%@include file="/resources/inc/Extend.jsp" %>
<link rel="stylesheet" href="/exam/resources/fullcalendar-2.3.0/fullcalendar.css" />
<script type="text/javascript" src="/exam/resources/fullcalendar-2.3.0/lib/jquery.min.js"></script>
<script type="text/javascript" src="/exam/resources/fullcalendar-2.3.0/lib/moment.min.js"></script>
<script type="text/javascript" src="/exam/resources/fullcalendar-2.3.0/fullcalendar.js"></script>

<style type="text/css">

</style>
<script type="text/javascript">
	
	$(document).ready(function() {
		/* 사용자 */
		$("#calendar").fullCalendar({
			defaultDate: '${nowDate}',
			height: 550,
			eventSources: [
			            	  {
			            	   
								events: [
											
								        <c:set var="i" value="1"/>
								        <c:forEach items="${list}" var="dto">
										{
											title: '${dto.subjectExamDate}',
											start: '${dto.examDate}',
											url: '/exam/user/calendarinfo.action?seq=${dto.seq}'
										}
										<c:if test="${i<list.size()}">
										,
										</c:if>
										<c:set var="i" value="${i+1}"/>
								        </c:forEach>
						        ],
						        color: '#6897F7',
							
								}
			],
			eventClick: function(event) {
		        if (event.url) {
		            window.open(event.url, "시험정보", "width=800, height=300,  menubar=no, status=no, toolbar=no, left=500, top=200, location=no, resizable=no");
		            return false;
		        }
		    }
		})
	});
</script>
</head>
<body>

<!-- Header 시작 -->
<div id="header"><%@include file="/resources/inc/Menu.jsp" %></div>
<!-- Header 끝 -->


<!-- Container 시작 -->
<div id="container">
	<!-- 1. 현재 작업 위치 -->
	<div id="locationBar">
		
		<div id="locationBar_child">
			<a href="/exam/home.action"><img src="/exam/resources/images/icons/1424745333_home.png" /> 홈</a> &gt; 
			
			<a href="#">시험일정</a>
			
		</div>	
		
	</div>
	
	
	<!-- 본문블럭 시작--> 
	<div id="mainBlock">
		
		<!-- 2. 사이드바 -->
		<div id="aside">
		
			<div id="side_title">시험일정</div><!-- 제작 페이지의 카테고리 제목 -->
		
			<div id="side_menu">
				<ul>
					
					<li class="side_select" onclick="location.href='#'">시험일정</li>
					
				</ul>
				
				<div id="customer-center-banner">
					<p id="customer-center-banner-tel">1588-0000</p>
					<p id="customer-center-banner-content">
						고객센터 상담시간<br />
						월~금요일 : 09:00~18:00<br />
						점심시간 : 12:00~13:00<br />
						<span>주말,공휴일 휴무</span>
					</p>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
		
		
		<!-- 3. 본문 -->
		<div id="content">
			
			<div id="content_title" style="border-bottom: 1px dotted #DEDEDE;padding-bottom:25px;">시험일정</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	
				
				
				<div id="calendar"></div>
				
				
				
				
				
				
				
			</div>
		</div>
	
	</div><!-- 본문블럭 끝-->
	
</div>
<!-- Container 끝 -->


<!-- Footer 시작 -->
<div id="footer"><%@include file="/resources/inc/Copyright.jsp" %></div>
<!-- Footer 끝 -->
</body>
</html>