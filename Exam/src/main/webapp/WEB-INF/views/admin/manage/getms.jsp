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
	function allcheck() {
		//alert($("#checkall").prop("checked"));
		if ($("#checkall").prop("checked"))
			$(":checkbox").prop("checked", true);
		else
			$(":checkbox").prop("checked", false);
	}

	function checkdel() {
		
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
			
			<div id="content_title">보낸쪽지함</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	
			
			<table id="tbl" class="table table-striped">
				<tr>
					<th>
						<input type="checkbox" id="checkall" onclick="allcheck();" value="y"/>
					</th>
					<th>제목</th>
					<th>보낸이</th>
					<th>등록일시</th>
					<th>읽음</th>
				</tr>
				<c:if test="${list.size()==0}">
				<tr>
					<td colspan="5" style="text-align: center;"> 보낸 쪽지 목록이 없습니다. </td>
				</tr>
				</c:if>
				<c:if test="${list.size()>0}">
				<c:forEach items="${list}" var="dto">
				<tr>
					<td>
						<input type="checkbox" id="seq" name="seq" value="${dto.seq}"/>
					</td>
					<td>
						<a href="/exam/admin/viewms.action?seq=${dto.seq}">
							${dto.rnum}. ${dto.subject}
						</a>
					</td>
					<td>${dto.name}</td>
					<td>${dto.regDate}</td>
					<td>${dto.read}</td>
				</tr>
				</c:forEach>
				</c:if>
			</table>
			<div>
				<input type="button" value=" 선택삭제 " class="form-control" onclick="checkdel();" />
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