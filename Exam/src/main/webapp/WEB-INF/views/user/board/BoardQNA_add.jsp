<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석</title>
<%@include file="/resources/inc/Extend.jsp" %>

<link rel="stylesheet" type="text/css" href="/exam/resources/dist/css/qna.css" />

<script type="text/javascript">

	$(document).ready(function() {
		$("#inSubject").focus();
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
			
			<a href="/exam/user/freeboardlist.action">커뮤니티</a> &gt;  <!-- 상단메뉴(카테고리) 제목과 해당 링크 수정 -->
			
			<a href="/exam/community/qna/list.action">질문과 답변, QnA</a>  <!-- 해당페이지 제목(서브메뉴 제목) 과 해당 링크 수정 -->
		</div>	
		
	</div>
	
	
	<!-- 본문블럭 시작--> 
	<div id="mainBlock">
		
		<!-- 2. 사이드바 -->
		<div id="aside">
		
			<div id="side_title">커뮤니티</div><!-- 제작 페이지의 카테고리 제목 -->
		
			<div id="side_menu">
				<ul>
				
				<!-- 
					 아래 리스트는 사이드바의 메뉴 리스트 해당 링크 걸고, 메뉴 제목고치고, 
					 필요없는 리스트는 지우면 됩니다. 
					
					 ** 현재페이지에 해당하는 <li>태그에 side_select 클래스를 적용하세요!	
				-->
				
					<li onclick="location.href='/exam/user/freeboardlist.action'">자유게시판</li>
					
					<li class="side_select" onclick="location.href='/exam/community/qna/list.action'">질문과 답변, QnA</li>
					
					<li onclick="location.href='#'">시험후기</li>
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
			
			<div id="content_title">질문과 답변, QnA</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	

			<form method="POST" action="/exam/community/qna/addok.action">
			
				<input type="text" id="inSubject" name="inSubject" class="form-control" placeholder="제목" required />
				<textarea class="form-control" id="inContent" name="inContent" placeholder="질문 내용을 입력하세요." required ></textarea>	
				<span style='float: right;'>
					<input type="button" class="btn btn-default" value="뒤로가기" onclick="history.back();"/> 
					<input type="submit" class="btn btn-success" value="질문등록" />
				</span>
				<input type="checkbox" id="inSecret" name="inSecret" /><label for="inSecret">&nbsp;비밀글</label>
				
			</form>
				
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