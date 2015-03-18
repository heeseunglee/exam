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
	$("#searchColum").val("${searchColum}");
	$("#searchWord").val("${searchWord}");
	</c:if>
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
		<div id="content1">
			
			<!-- 검색중문구 -->
			${searchLabel}
			
			<table id="tbl" class="table">
				<tr>
					<th id="col1">번호</th>
					<th id="col2">분류</th>
					<th id="col3">제목</th>
					<th id="col4">작성일</th>
					<th id="col5">조회수</th>
				</tr>
				
				<c:forEach items="${list}" var="dto">
				<tr>
					<td class="cell1">${dto.seq}</td>
					<td class="cell2">${dto.detail }</td>
					<td class="cell3"><a href="/exam/user/noticeuserview.action?seq=${dto.seq}&searchColum=${searchColum}&searchWord=${searchWord}">${dto.subject}</a>
						${dto.newImg}</td>
					<td class="cell4">${dto.regDate}</td>
					<td class="cell5">${dto.readCount}</td>
				</tr>
				</c:forEach>
				
				<c:if test="${list.size() == 0}">
				<tr>
					<td colspan="5" style="text-align: center;padding:100px 0px;">게시물이 존재하지 않습니다.</td>
				</tr>
				</c:if>
			</table>
			
			<!-- 페이징 -->
			<div style="width: 600px; margin:20px auto; text-align: center">${pageBar}</div>
			
			<!-- 검색부분 추가 -->
			<form method="GET" action="/exam/user/noticeuserlist.action">
				<table style="width: 500px; margin: 20px auto;">
					<tr>
						<td>
							<select name="searchColum" id="searchColum" class="form-control">
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

			</div>		
		</div>
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