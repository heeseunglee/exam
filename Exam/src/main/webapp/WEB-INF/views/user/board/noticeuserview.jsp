<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석</title>
<%@include file="/resources/inc/Extend.jsp" %>
<style type="text/css">

</style>
<script type="text/javascript">

$(document).ready(function() {
	
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
			<a href="/exam/home.ex"><img src="/exam/resources/images/icons/1424745333_home.png" /> 홈</a> &gt; 
			
			<a href="/exam/user/noticeuserlist.action">고객센터</a> &gt;  <!-- 상단메뉴(카테고리) 제목과 해당 링크 수정 -->
			
			<a href="/exam/user/noticeuserlist.action">공지사항</a>  <!-- 해당페이지 제목(서브메뉴 제목) 과 해당 링크 수정 -->
		</div>	
		
	</div>
	
	
	<!-- 본문블럭 시작--> 
	<div id="mainBlock">
		
		<!-- 2. 사이드바 -->
		<div id="aside">
		
			<div id="side_title">CS CENTER <br />고객센터</div><!-- 제작 페이지의 카테고리 제목 -->
			
			<div id="side_menu">
				<ul>
				
					<li class="side_select" onclick="location.href='/exam/user/noticeuserlist.action'">공지사항</li>
					<li onclick="location.href='/exam/center/faq.action'">자주묻는 질문, FAQ</li>
					<li onclick="location.href='/exam/user/surveyresult.action'">설문조사</li>				
					<li onclick="location.href='/exam/user/organization.action'">팀 소개</li>
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
			
			<div id="content_title">공지사항</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	
				
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
				<img src="/resources/images/back.png" onclick="location.href='/exam/user/noticeuserlist.action';"/>
				</c:if>
				
				<c:if test="${!empty searchColum && !empty searchWord}">
				<img src="/resources/images/back.png" onclick="location.href='/exam/user/noticeuserlist.action?searchColum=${searchColum}&searchWord=${searchWord}';"/>
				</c:if>		
		
			</div>
			
		</div>
	</div>
				
	
			</div>
		</div>
	
	</div><!-- 본문블럭 끝-->
	
<!-- Container 끝 -->


<!-- Footer 시작 -->
<div id="footer"><%@include file="/resources/inc/Copyright.jsp" %></div>
<!-- Footer 끝 -->
</body>
</html>