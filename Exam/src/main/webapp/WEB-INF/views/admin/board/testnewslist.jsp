<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석 | 관리자</title>
<%@include file="/resources/inc/Extend_Admin.jsp" %>
<style type="text/css">

</style>
<script type="text/javascript">

$(document).ready(function() {
	<c:if test="${isSearch}">
	$("#searchColumn").val("${searchColumn}");
	$("#searchWord").val("${searchWord}");
	</c:if>
	
});

</script>
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
						<li onclick="location.href='/exam/admin/list.action'">공지사항관리</li>
                  		<li class="side_select" onclick="location.href='/exam/admin/testnewslist.action'">시험뉴스</li>
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
					
					<h3>시험뉴스목록</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="게시판관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="시험뉴스목록" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
				<table id="tbl" class="table table-striped">
				<tr>
					<th id="col1"><input type="checkbox" id="allcheck"></th>
					<th id="col2">번호</th>
					<th id="col3">분류명</th>
					<th id="col4">제목</th>
					<th id="col5">작성일자</th>
					<th id="col6">조회수</th>
					<th id="col7">수정</th>
					<th id="col8">삭제</th>					
				</tr>
				
				<c:forEach items="${list}" var="dto">
				<tr>
					<td> <input type="checkbox" class="cell1" value="${dto.seq}"></td>
					<td class="cell1" >${dto.seq}</td>
					<td class="cell2" >${dto.testnewsDIV}</td>
					<td class="cell3" >${dto.subject}</td>
					<td class="cell4" >${dto.regdate}</td>
					<td class="cell5" >${dto.count}</td>
					<td class="cell6"><input type="button" value=" 수정 " class="btn btn-default" onclick="location.href='/exam/admin/testnewsedit.action?seq=${dto.seq}';"></td>
					<td class="cell7"><input type="button" value=" 삭제 " class="btn btn-default" onclick="location.href='/exam/admin/testnewsdelok.action?seq=${dto.seq}';"></td>
				</tr>
				</c:forEach>
				
				<c:if test="${list.size() == 0}">
				<tr>
					<td colspan="8" style="text-align: center">게시물이 존재하지 않습니다.</td>
				</tr>
				</c:if>
				</table>	
				<!-- 페이징 -->
				<div style="width: 600px; margin:20px auto; text-align: center">${pageBar}</div>
				
				<!-- 검색부분 추가 -->
				<form method="GET" action="/exam/admin/testnewslist.action">
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
				<div id="btnList">
					<input type="button" value="새글쓰기"  class="btn btn-default" onclick="location.href='/exam/admin/testnewsadd.action';" />
				
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