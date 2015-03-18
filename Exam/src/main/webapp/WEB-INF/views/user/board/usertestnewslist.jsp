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
	<c:if test="${isSearch}">
	$("#searchColumn").val("${searchColumn}");
	$("#searchWord").val("${searchWord}");
	</c:if>
	
	$()
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
			
			<div id="content_title">시험뉴스</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	
				
			<table id="tbl" class="table table-striped">
				<tr>
					<th id="col1">번호</th>
					<th id="col2">분류명</th>
					<th id="col3">제목</th>
					<th id="col4">작성일자</th>
					<th id="col5">조회수</th>
				</tr>
				
				<c:forEach items="${list}" var="dto">
				<tr>
					<td class="cell1" >${dto.seq}</td>
					<td class="cell2" >${dto.testnewsDIV}</td>
					<td class="cell3" ><a href="/exam/user/usertestnewsview.action?seq=${dto.seq}">${dto.subject}</a></td>
					<td class="cell4" >${dto.regdate}</td>
					<td class="cell5" >${dto.count}</td>
				</tr>
				</c:forEach>
				
				<c:if test="${list.size() == 0}">
				<tr>
					<td colspan="5" style="text-align: center">게시물이 존재하지 않습니다.</td>
				</tr>
				</c:if>
			</table>	
			<!-- 페이징 -->
			<div style="width: 600px; margin:20px auto; text-align: center">${pageBar}</div>
			
			<!-- 검색부분 추가 -->
			<form method="GET" action="/exam/user/usertestnewslist.action">
				<table style="width: 500px; margin: 20px auto;">
					<tr>
						<td>
							<select name="searchColumn" id="searchColumn" class="form-control">
								<option value="subject">글제목</option>
								<option value="content">글내용</option>
							</select>
						</td>
						<td>
							<input type="text" name="searchWord" class="form-control" id="searchWord" placeholder="검색어를 입력하세요." required />
						</td>
						<td>
							<input type="submit" value=" 검색하기 " class="btn btn-default"/>
						</td>
					</tr>
				</table>
			</form>
			<!-- 검색부분 추가 -->
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