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
						<li class="side_select" onclick="location.href='/exam/admin/list.action'">공지사항관리</li>
                  <li onclick="location.href='/exam/admin/testnewslist.action'">시험뉴스</li>
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
					
					<h3>공지내용보기</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="게시판관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="공지내용보기" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
					<div id="notice">
							
						<table id="tbl" class="table table-striped">
							<tr>
								<td>${dto.detail} ${dto.subject}</td>
							</tr>
							
							<tr>
								<td>작성일 : ${dto.regDate} ${dto.readCount}</td>
							</tr>
							
							<tr>
								<td id="contentTD">${dto.content}</td>
							</tr>
						</table>
						
						<div id="btnList">
							<c:if test="${empty searchColum && empty searchWord}">
							<input type="button" value="리스트" class="btn btn-default" onclick="location.href='/exam/admin/list.action';" />
							</c:if>
						
							<c:if test="${!empty searchColum && !empty searchWord}">
							<input type="button" value="리스트" class="btn btn-default" onclick="location.href='/exam/admin/list.action?searchColum=${searchColum}&searchWord=${searchWord}';"/>
							</c:if>
						
							<input type="button" value="수정하기"  class="btn btn-default" onclick="location.href='/exam/admin/edit.action?seq=${dto.seq}';"/>
							<input type="button" value="삭제하기"  class="btn btn-default" onclick="location.href='/exam/admin/delok.action?seq=${dto.seq}';"/>
						</div>
						
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