
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

function send() {
	$("#btnSubmit").click();		
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
				<!-- 금액,기간 추가  -->
			<div id="RegularMemberadd">
		
		 	<h2>정회원 비설정</h2>
			<form method="POST" action="/exam/admin/addokrm.action?seq=${seq}">
			<table id="tbl" class="table table-striped">
				<tr>
					<th>서비스 기간</th>
					<td>
					<select name="servicedate" id="servicedate" class="simpleform">
                          <option value="1" selected="selected">1일</option>
                          <option value="2">2일</option>
                          <option value="3">3일</option>
                          <option value="4">4일</option>
                          <option value="5">5일</option>
                          <option value="6">6일</option>
                          <option value="7">1주일</option>
                          <option value="14">2주일</option>
                          <option value="21">3주일</option>
                          <option value="30">1개월</option>
                          <option value="60">2개월</option>
                          <option value="90">3개월</option>
                          <option value="120">4개월</option>
                          <option value="150">5개월</option>
                          <option value="180">6개월</option>
                          <option value="210">7개월</option>
                          <option value="240">8개월</option>
                          <option value="270">9개월</option>
                          <option value="300">10개월</option>
                          <option value="330">11개월</option>
                          <option value="360">12개월</option>
                        </select>
					</td>
				</tr>
				<tr>
					<th>서비스 가격</th>
					<td>
						<input type="text" name="serviceprice" id="serviceprice" class="form-control" required placeholder="가격"/>
					</td>
				</tr>
			</table>
			
			<div id="btnList">
				<img src="/resources/images/write.png" onclick="send();" />
				<input type="submit" id="btnSubmit" style="display: none;"/>
			</div>
			
			</form>
			
			<!--리스트  -->
			<div id="RegularMemberlist">

			<table id="tbl" class="table table-striped">
				<tr>
					<th id="col1">서비스기간</th>
					<th id="col2">서비스가격</th>
				</tr>
				
				<c:forEach items="${list}" var="dto">
				<tr>
					<td class="cell1">${dto.servicedate}</td>
					<td class="cell2">${dto.serviceprice}</td>
					<td><img src="/resources/images/delete.png"  onclick="location.href='/exam/admin/delokrm.action?seq=${dto.seq}';" />
					</td>
				</tr>
				</c:forEach>
				
				<c:if test="${list.size() == 0}">
				<tr>
					<td colspan="5" style="text-align: center">게시물이 존재하지 않습니다.</td>
				</tr>
				</c:if>
			</table>
			
			
			<div id="btnList">
			
				<img src="/resources/images/list.png" onclick="location.href='/exam/admin/delrm.action';" />

			</div>		
		</div>
	</div>
			
		</div>
			
	</div>
				
			</div>
		</div>
	
	<!-- 본문블럭 끝-->
<!-- Container 끝 -->


<!-- Footer 시작 -->
<div id="footer"><%@include file="/resources/inc/Copyright.jsp" %></div>
<!-- Footer 끝 -->
</body>
</html>