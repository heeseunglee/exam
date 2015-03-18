<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석 | 관리자</title>
<%@include file="/resources/inc/Extend_Admin.jsp" %>
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
	
	<div id="header"><%@include file="/resources/inc/Admin-Menu.jsp" %></div>
	
	<!-- 컨테이너 시작 -->
	<div id="container">
	
		<div id="container_child">
		
			<!-- 사이드바 시작 -->	
			<div id="aside">
		
				<div id="side_menu">
					<ul>						
						<li class="side_select" onclick="location.href='/exam/admin/list.action'">공지사항관리</li>
                  <li onclick="location.href='/exam/admin/testnewslist.action'">시험뉴스</li>
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
					
					<h3>공지사항목록</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='/exam/admin/home.action'" />  
						<input type="button" value="게시판관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='/exam/admin/list.action'" />  
						<input type="button" value="공지사항목록" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
			
					<div id="notice">
						<div id="content">
							
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
									<td class="cell2">${dto.detail}</td>
									<td class="cell3"><a href="/exam/admin/view.action?seq=${dto.seq}&searchColum=${searchColum}&searchWord=${searchWord}">${dto.subject}</a>
									${dto.newImg}</td>
									<td class="cell4">${dto.regDate}</td>
									<td class="cell5">${dto.readCount}회</td>
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
							<form method="GET" action="/exam/admin/list.action">
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
							<div id="btnList">
								<input type="button" value="리스트" class="btn btn-default" onclick="location.href='/exam/admin/list.action';" />
								<input type="button" value="글쓰기" class="btn btn-default" onclick="location.href='/exam/admin/add.action';" />
							</div>		
						</div>
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