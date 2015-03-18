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
<div id="home_container">
	<!-- 1. 이벤트 배너 슬라이드 -->
	<div id="eventBlock">
		<!-- 배너 -->
		<div class="eventBlock_list">
			<ul>
				<li id="banner1" style="right: 0%; z-index: 0; background: url(/exam/resources/images/banners/banner_01.jpg) 50% 0px no-repeat;">
					<a href="#" target="_new" title="수험생 이벤트"></a>
				</li>
				<li id="banner2" style="right: -100%; z-index: 0; background: url(/exam/resources/images/banners/banner_02.jpg) 50% 0px no-repeat;">
					<a href="#" target="_new" title="&lt;시험의 정석&gt;활용후기"></a>
				</li>
				<li id="banner3" style="right: -100%; z-index: 0; background: url(/exam/resources/images/banners/banner_03.jpg) 50% 0px no-repeat;">
					<a href="#" target="_new" title="취업 토크 콘서트"></a>
				</li>
			</ul>
		</div>
		<!-- 좌우버튼 -->
		<p id="left_btn_wrap"><a href="javascript:void(0);" title="이전 이벤트" class="main_btn_prev"><img src="/exam/resources/images/icons/slide_left.png" /></a></p>
		<p id="right_btn_wrap"><a href="javascript:void(0);" title="다음 이벤트" class="main_btn_next"><img src="/exam/resources/images/icons/slide_right.png" /></a></p>
		<!-- 하단버튼 -->
		<div id="bannerPage"></div>
	</div>
	<script type="text/javascript" src="/exam/resources/dist/js/eventblock.js"></script>
	<!-- // 1.이벤트 배너 슬라이드 -->
	<!-- 2. 본문 블럭 -->
	<div id="mainBlock">
		<div id="leftBox">
			<div id="left_up">
				<div id="left_up_title">시험일정</div>
				<div id="left_up_content">
					<table class="table">
						<tr>
							<th>일정</th>
							<th>일정명</th>
							<th>남은날짜</th>
						</tr>
						<c:if test="${calendarList.size()==0}">
						<tr>
							<td colspan="3" style="text-align: center;">일정이 존재하지 않습니다.</td>
						</tr>
						</c:if>
						<c:if test="${calendarList.size()>0}">
						<c:forEach items="${calendarList}" var="dto">
						<tr>
							<td>${dto.examDate}</td>
							<td>${dto.subjectExamDate}</td>
							<td>${dto.remainDate}</td>
						</tr>
						</c:forEach>
						</c:if>
						<tr>
							<td colspan="3" style="text-align: right;">
								<a href="/exam/user/calendar.action">더보기</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="left_down">
				<div id="left_down_title">자주 묻는 질문 FAQ</div>
				<div id="left_down_content">
					<img src="/exam/resources/images/faq.png" style="width:100%; cursor: pointer;" onclick="location.href='/exam/center/faq.action';"/>
				</div>
			</div>
		</div>
		<div id="centerBox">
			<div id="centerBox_title">공지사항</div>
			<div id="centerBox_content">
				<table id="NoticeTable" class="table">
					<tr>
						<th>구분</th>
						<th>제목</th>
						<th>날짜</th>					
					</tr>
					<c:if test="${noticeList.size()==0}">
					<tr>
						<td colspan="3" style="text-align: center;">공지사항이 없습니다.</td>
					</tr>
					</c:if>
					<c:if test="${noticeList.size() > 0}">
					<c:forEach items="${noticeList}" var="dto">
					<tr>
						<td>${dto.detail}</td>
						<td>
							<a href="/exam/user/noticeuserview.action?seq=${dto.seq}">
							${dto.subject}
							</a>
						</td>
						<td>${dto.regDate}</td>
					</tr>
					</c:forEach>
					</c:if>
					<tr>
						<td colspan="3" style="text-align: right;">
							<a href="/exam/user/noticeuserlist.action">더보기</a>
						</td>
					</tr>
				</table>
			</div>	
		</div>
		<div id="rightBox">
			<div id="rightBox_title">설문조사</div>
			<div id="rightBox_content">
				<c:if test="${subjectList.subject!=null}">
				<form method="GET" action="/exam/user/survey.action">
				<table id="survey" class="table">
					<tr>
						<td>
							${subjectList.subject}
							<input type="hidden" name="seq" value="${subjectList.seq}"/>
						</td>
					</tr>
					<c:forEach items="${contentList}" var="content">
					<tr>
						<td>
							<input type="radio" name="content" id="surveyContent" value="${content.cSeq}" />
							<label for="surveyContent">${content.content}</label>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td>
							<input type="submit" value=" 투표하기 " class="btn btn-default" style="display: inline-block;" />
							<input type="button" value=" 결과보기 " class="btn btn-default" style="display: inline-block;" onclick="location.href='/exam/user/surveyresult.action';" />
						</td>
					</tr>
				</table>
				</form>
				</c:if>
				<c:if test="${subjectList.subject==null}">
				<div style="text-align: center; min-height: 100px; padding-top: 25%">
					설문조사가 없습니다.
				</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- //2. 본문 블럭 -->
	
	
</div>
<!-- Container 끝 -->


<!-- Footer 시작 -->
<div id="footer"><%@include file="/resources/inc/Copyright.jsp" %></div>
<!-- Footer 끝 -->
</body>
</html>