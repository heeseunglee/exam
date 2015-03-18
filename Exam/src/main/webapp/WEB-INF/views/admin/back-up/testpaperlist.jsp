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
/* $(document).ready(function() {
	<c:if test="${isSearch}">
	$("#searchColumn").val("${searchColumn}");
	$("#searchWord").val("${searchWord}");
	</c:if>
});
 */

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
			
			<div id="content_title">문제지관리</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			
				<table class="table table-striped">
					<tr>
						<th>카테고리문제지정보</th>
						<th>문제수</th>
						<th>응시</th>
						<th>조회</th>
						<th>수정삭제</th>
					</tr>
					<c:forEach var="dto" items="${tpmlist}" > 
					<tr>
	 					<td><a href="#">${dto.tpmSubject}</a></td>
						<td>${dto.questioncnt}</td>
						<td>${dto.alltestcnt}</td>
						<td>${dto.receiptcnt}</td>
						<td>
							<input type="button" value="수정" class="btn btn-default" style="width:45px;" onclick="location.href='/exam/admin/testpaperedit.action?seq=${dto.seq}';">
							<input type="button" value="삭제" class="btn btn-default" style="width:45px;" onclick="location.href='/exam/admin/testpaperdelok.action?seq=${dto.seq}';">
						</td>
	
					</c:forEach>
					
				</table>
				
				<div id="btnList">
					<input type="button" value="새글쓰기"  class="btn btn-default" onclick="location.href='/exam/admin/testnewsadd.action';" />
					<input type="button" value="전체삭제"  class="btn btn-default" onclick="location.href='/exam/admin/testnewsalldel.action';" />
				</div>
					
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