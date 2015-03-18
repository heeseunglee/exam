<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석 | 관리자</title>
<%@include file="/resources/inc/Extend_Admin.jsp" %>
<script type="text/javascript">
	function check(seq) {
		if(confirm("삭제하시겠습니까?"))
			location.href='/exam/admin/questiondel.action?seq=' + seq;
	}
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
						<li class="side_select" onclick="location.href='/exam/admin/questionlist.action'">문제관리</li>
						<li onclick="location.href='/exam/admin/categoryadd.action'">카테고리관리</li>
						<li onclick="location.href='/exam/admin/testpaperlist.action'">시험지관리</li>

					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>문제목록</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='/exam/admin/home.action'" />  
						<input type="button" value="시험관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='/exam/admin/questionlist.action'" />  
						<input type="button" value="문제관리" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='/exam/admin/questionlist.action'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
					<form method="GET" action="/exam/admin/questionlist.action">
					<table class="table table-striped">
						<tr>
							<th style="width:20%;padding-left:25px;">검색</th>
							<td>
								<input type="text" class="form-control" name="searchWord" value="${searchWord}"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="padding-left:25px;">
								<input type="submit" class="btn btn-default" value=" 검색하기 " />
								<input type="button" class="btn btn-default" value=" 목록보기 " onclick="location.href='/exam/admin/questionlist.action';" />
								<input type="button" value="문제만들기" class="btn btn-primary" onclick="location.href='/exam/admin/question.action';" />
							</td>
						</tr>
					</table>
					</form>
					
					<table class="table">
						<tr>
							<th style="width:10%;text-align: center;" >번호</th>
							<th style="width:40%;text-align: center;">문제제목(문제코드)</th>
							<th style="width:15%;text-align: center;">풀이회수</th>
							<th style="width:15%;text-align: center;">정답</th>
							
							<th style="width:20%;text-align: center;">조작</th>
						</tr>
						
						<c:if test="${list.size() == 0}">
						<tr>
							<td colspan="7" style="text-align: center;"> 문제가 존재하지 않습니다. </td>
						</tr>
						</c:if>
						
						<c:if test="${list.size() > 0}">
						<c:forEach items="${list}" var="dto">
						<tr>
							<td style="text-align: center;">${dto.rnum}</td>
							<td style="text-align: left;">${dto.questionCode}</td>
							<td style="text-align: center;">${dto.questionCNT}</td>
							<td style="text-align: center;">${dto.answer}</td>
						
							<td style="text-align: center;">
								<input type="button" value=" 수정 " class="btn btn-xs btn-success" onclick="location.href='/exam/admin/questionedit.action?seq=${dto.seq}&questionCode=${dto.questionCode}&score=${dto.score}&description=${dto.description}&question=${dto.question}&question1=${dto.question1}&question2=${dto.question2}&question3=${dto.question3}&question4=${dto.question4}&answer=${dto.answer}&explanation=${dto.explanation}'"  />
								<input type="button" value=" 삭제 " class="btn btn-xs btn-warning" onclick="check('${dto.seq}');" />
							</td>
						</tr>
						</c:forEach>
						</c:if>
						
					</table>
					
					<div style="text-align: center;">
					${pageBar}				
					</div>
					
				
				</div>
				
			</div>
			<!-- 본문 끝 -->
		
		
	
	</div>
	<!-- 컨테이너 끝 -->
	
	
	<div id="footer"><div id="footer_child"><%@include file="/resources/inc/Copyright.jsp" %></div></div>
	
</body>
</html>