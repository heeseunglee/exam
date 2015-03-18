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
	$(document).ready(function(){
		$("#userId").val("${userId}");
	});
		
	function searchID() {
		window.open("/exam/admin/searchid.action", "아이디찾기", "width=300, height=300, menubar=no, status=no, toolbar=no, left=500, top=200 resizable=no");
	}
	function sendMeData(data) {
		
		document.getElementById("userId").value=data;
	}
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
			
			<a href="#">카테고리 제목</a> &gt;  <!-- 상단메뉴(카테고리) 제목과 해당 링크 수정 -->
			
			<a href="#">서브메뉴1</a>  <!-- 해당페이지 제목(서브메뉴 제목) 과 해당 링크 수정 -->
		</div>	
		
	</div>
	
	
	<!-- 본문블럭 시작--> 
	<div id="mainBlock">
		
		<!-- 2. 사이드바 -->
		<div id="aside">
		
			<div id="side_title">카테고리 제목</div><!-- 제작 페이지의 카테고리 제목 -->
		
			<div id="side_menu">
				<ul>
				
				<!-- 
					 아래 리스트는 사이드바의 메뉴 리스트 해당 링크 걸고, 메뉴 제목고치고, 
					 필요없는 리스트는 지우면 됩니다. 
					
					 ** 현재페이지에 해당하는 <li>태그에 side_select 클래스를 적용하세요!	
				-->
					
					<li class="side_select" onclick="location.href='#'">서브메뉴1</li>
					<li onclick="location.href='#'">서브메뉴2</li>
					<li onclick="location.href='#'">서브메뉴3</li>
					<li onclick="location.href='#'">서브메뉴4</li>
					<li onclick="location.href='#'">서브메뉴5</li>
					<li onclick="location.href='#'">서브메뉴6</li>
					<li onclick="location.href='#'">서브메뉴7</li>
					<li onclick="location.href='#'">서브메뉴8</li>
					<li onclick="location.href='#'">서브메뉴9</li>
					<li onclick="location.href='#'">서브메뉴10</li>
				</ul>
			</div>
		</div>
		<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
		
		
		<!-- 3. 본문 -->
		<div id="content">
			
			<div id="content_title">서브메뉴 제목</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	
				
				
				
				<div>
			
			<h3>쪽지 보내기</h3>
			
			<form method="POST" action="/exam/admin/addokms.action">
				<table id="tbl1" class="table table-bordered">
					<tr>
						<th>받는사람ID</th>
						<td>
							<input type="text" id="userId" name="userId" required class="form-control" placeholder="아이디찾기를 눌려주세요." readonly/>
							<input type="button" value="아이디찾기" class="btn btn-default" onclick="searchID();"/>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" id="subject" name="subject" required class="form-control" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea id="content1" name="content" required class="form-control"></textarea></td>
					</tr>
					
				</table>
				
				<button type="submit" id="btns" class="btn btn-default btn-lg">
	  				<span class="glyphicon glyphicon-envelope"></span> Send
	  			</button>
				
			</form>
			
		</div>
		

	</div> 

	</div>
				
			</div>
		</div>
	
	
<!-- Container 끝 -->


<!-- Footer 시작 -->
<div id="footer"><%@include file="/resources/inc/Copyright.jsp" %></div>
<!-- Footer 끝 -->
</body>
</html>