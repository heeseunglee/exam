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
			
			<a href="/exam/user/noticeuserlist.action">고객센터</a> &gt;  <!-- 상단메뉴(카테고리) 제목과 해당 링크 수정 -->
			
			<a href="#">설문조사</a>  <!-- 해당페이지 제목(서브메뉴 제목) 과 해당 링크 수정 -->
		</div>	
		
	</div>
	
	
	<!-- 본문블럭 시작--> 
	<div id="mainBlock">
		
		<!-- 2. 사이드바 -->
		<div id="aside">
		
			<div id="side_title">CS CENTER <br />고객센터</div><!-- 제작 페이지의 카테고리 제목 -->
		
			<div id="side_menu">
				<ul>
					<li onclick="location.href='/exam/user/noticeuserlist.action'">공지사항</li>
					<li onclick="location.href='/exam/center/faq.action'">자주묻는 질문, FAQ</li>
					<li class="side_select"  onclick="location.href='/exam/user/surveyresult.action'">설문조사</li>				
					<li onclick="location.href='/exam/user/organization.action'">팀 소개</li>
				
				</ul>
			</div>
		</div>
		<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
		
		
		<!-- 3. 본문 -->
		<div id="content">
			
			<div id="content_title">설문조사결과</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	

				<table class="table">
					<tr>
						<th colspan="3" ><h3>${subjectList.subject }</h3></th>
					</tr>
					<tr>
						<td colspan="3">
							설문기간 : ${subjectList.startDate}~${subjectList.endDate} | 득표수 : ${subjectList.voteCount}표
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>응답수</td>
					</tr>
					<c:set var="i" value="1" />
					<c:forEach items="${contentList}" var="content">
					<tr>
						<td style="width: 20%;">${content.rnum}. ${content.content}</td>
						<td style="width: 60%;">
						
							<c:if test="${subjectList.voteCount != 0}">
							<%-- <div id="result" style="width : ${content.percent}%; background-color: #22B500; display: inline-block; font-weight: bold;"> --%>
							<div class="progress">
							<div id="bar${i}" class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="${content.percent}" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
								${content.percent}%
							</div>
							</div>
							<script type="text/javascript">
								$("#bar"+${i}).animate({
									width: "${content.percent}%"
								},100);	
							</script>
							</c:if>
							
							<c:if test="${subjectList.voteCount == 0}">
							<div style="width : 0%; background-color: blue; display: inline-block;">
								&nbsp;
							</div> 
							</c:if>
						</td>
						<td style="width: 20%;">
							${content.answerCount}명 
						</td>
					</tr>
					<c:set var="i" value="${i+1}" />
					</c:forEach>
				</table>
				
				<input type="button" value="홈으로" class="btn btn-default" onclick="location.href='/exam/home.action';" />
				
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