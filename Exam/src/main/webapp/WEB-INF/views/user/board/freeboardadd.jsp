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
			
			<a href="/exam/user/freeboardlist.action">자유게시판</a>  <!-- 해당페이지 제목(서브메뉴 제목) 과 해당 링크 수정 -->
		</div>	
		
	</div>
	
	
	<!-- 본문블럭 시작--> 
	<div id="mainBlock">
		
		<!-- 2. 사이드바 -->
		<div id="aside">
		
			<div id="side_title">커뮤니티</div><!-- 제작 페이지의 카테고리 제목 -->
		
			<div id="side_menu">
				<ul>
					<li class="side_select" onclick="location.href='/exam/user/freeboardlist.action'">자유게시판</li>
					
					<li onclick="location.href='/exam/community/qna/list.action'">질문과 답변, QnA</li>
					
					<li onclick="location.href='/exam/user/examboardlist.action'">시험후기</li>
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
			
			<div id="content_title">자유게시판</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	
				
				
				
				<form method="post" action="/exam/user/freeboardaddok.action?mode=${mode}&thread=${thread}&depth=${depth}">
			 <table class="table">
			     <tr>
			       <th>제목</th>
			       <td><input type="text" name="subject" id="subject" class="form-control" required placeholder="제목"/></td>
			     </tr>
			     <tr>
			       <th>내용</th>
			       <td>
			       	<textarea name="content" id="content1" class="form-control" required placeholder="내용" style="height:350px;"></textarea>
			       </td>
			     </tr>
			     <tr>
			     	<td colspan="2">
			     		<input type="button" value= "취소" class="btn btn-default" onclick="location.href='/exam/user/freeboardlist.action';"/>
			     		<input type="submit"  id= "btnSubmit" class="btn btn-default" value= "글쓰기"/>
			     		
			     	</td>
			     </tr>
			 </table>  
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