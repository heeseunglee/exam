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
					
					<h3>일정관리목록</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="게시판관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="일정관리목록" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
				<table id="tbl2" class="table">
					<tr>
						<th>번호</th>
						<th>시험명</th>
						<th>시험일정</th>
						<th></th>					
					</tr>
					
					<c:if test="${list.size()==0}">
					<tr>
						<td colspan="4" style="text-align: center;">시험일정이 존재하지 않습니다.</td>
					</tr>
					</c:if>
					
					<c:if test="${list.size()>0}">
					<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.rnum}</td>
						<td>
							<a href="/exam/admin/calendarview.action?seq=${dto.seq}">
							${dto.subjectExamDate}
							</a>
						</td>
						<td>${dto.examDate}</td>
						<td>
							<input type="button" value="삭제" class="btn btn-default" onclick="location.href='/exam/admin/delcalendar.action?seq=${dto.seq}';" />
						</td>
					</tr>
					</c:forEach>
					</c:if>
					<tr>
						<td colspan="4">
							<input type="button" value="일정삽입" class="btn btn-default" onclick="location.href='/exam/admin/setcalendar.action';" />
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