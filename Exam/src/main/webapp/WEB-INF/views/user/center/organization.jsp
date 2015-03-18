<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석</title>
<%@include file="/resources/inc/Extend.jsp" %>
<style type="text/css">

#org_photo, #team_people { margin: 15px 0px;}


.photo_resize { width: 100px; height:100px; 
				float: left; 
				margin-right: 15px;
				margin-bottom: 10px; }

.resume { float: left;
		  width: 255px;
		  height: 110px;}


#tp {display: inline-block;}
#tp1 {display: inline;}
#tp2 {display: inline;}
#tp3 {display: inline;}


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
			
			<a href="/exam/center/faq.action">고객센터</a> &gt;  <!-- 상단메뉴(카테고리) 제목과 해당 링크 수정 -->
			
			<a href="/exam/user/organization.action">팀 소개</a>  <!-- 해당페이지 제목(서브메뉴 제목) 과 해당 링크 수정 -->
		</div>	
		
	</div>
	
	
	<!-- 본문블럭 시작--> 
	<div id="mainBlock">
		
		<!-- 2. 사이드바 -->
		<div id="aside">
		
			<div id="side_title">CS CENTER <br />고객센터</div>
		
			<div id="side_menu">
				<ul>

					<li onclick="location.href='/exam/user/noticeuserlist.action'">공지사항</li>
					<li onclick="location.href='/exam/center/faq.action'">자주묻는 질문, FAQ</li>
					<li onclick="location.href='#'">설문조사</li>
					<li class="side_select" onclick="location.href='/exam/user/organization.action'">팀 소개</li>
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
			
			<div id="content_title">Organization</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	
			<div id="org_photo">
				<img src="/exam/resources/images/organization/org.jpg" alt="조직도" />
			</div>	
			
			<hr style="width:760px;" />
			
			<div id="content_title">Very smart people</div>
			
			<div id="team_people">
				<div id="tp">
					<img src="/exam/resources/images/organization/photo1.jpg" alt="안해용" class="photo_resize"/>
					<div class="resume">
						<p class="cont">직급: 팀장</p>
						<p class="cont">이름: 안해용</p>
						<p class="cont">email: steal0320@naver.com</p>
						<p class="cont">담당업무: 문제지등록,오답노트</p>
						<p class="cont">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 시험뉴스게시판</p>
					</div>
				</div>
			
				<div id="tp1">
					<div>
					<img src="/exam/resources/images/organization/photo2.jpg" alt="김준수" class="photo_resize"/>
					<div class="resume">
						<p class="cont">직급: 팀원</p>
						<p class="cont">이름: 김준수</p>
						<p class="cont">email: ohsmd@naver.com</p>
						<p class="cont">담당업무: 검수 및 총괄지휘</p>
					</div>
					</div>
				

				<div>
					<img src="/exam/resources/images/organization/photo3.jpg" alt="박윤정" class="photo_resize"/>
					<div class="resume">
						<p class="cont">직급: 팀원</p>
						<p class="cont">이름: 박윤정</p>
						<p class="cont">email: asahan1@naver.com</p>
						<p class="cont">담당업무: 회원가입,회사소개,카테고리등록</p>
					</div>
				</div>
				</div> <!-- tp1  -->
				
				<div id="tp2">				
				<div>
					<img src="/exam/resources/images/organization/photo4.jpg" alt="이성규" class="photo_resize"/>
					<div class="resume">
						<p class="cont">직급: 팀원</p>
						<p class="cont">이름: 이성규</p>
						<p class="cont">email: leeleeg@naver.com</p>
						<p class="cont">담당업무: 자유게시판,시험후기 게시판</p>
						<p class="cont">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DB입력</p>
					</div>
				</div>				
				<div>
					<img src="/exam/resources/images/organization/photo5.jpg" alt="이상영" class="photo_resize"/>
					<div class="resume">
						<p class="cont">직급: 팀원</p>
						<p class="cont">이름: 이상영</p>
						<p class="cont">email: cluina@naver.com</p>
						<p class="cont">담당업무: 문제풀기,Q&A게시판</p>
						<p class="cont">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 사이트템플릿제작</p>
					</div>
				</div>			
				</div> <!-- tp2 끝 -->
				
				<div id="tp3">			
				<div>
					<img src="/exam/resources/images/organization/photo6.jpg" alt="남경호" class="photo_resize"/>
					<div class="resume">
						<p class="cont">직급: 팀원</p>
						<p class="cont">이름: 남경호</p>
						<p class="cont">email: ngh88888@naver.com</p>
						<p class="cont">담당업무: 문제등록,설문지등록,시험일정</p>
					</div>
				</div>			
			
				<div>
					<img src="/exam/resources/images/organization/photo7.jpg" alt="운진혁" class="photo_resize"/>
					<div class="resume">
						<p class="cont">직급: 팀원</p>
						<p class="cont">이름: 윤진혁</p>
						<p class="cont">email: craken26@naver.com</p>
						<p class="cont">담당업무: 공지게시판,결제관리,쪽지기능</p>
					</div>
				</div>			
				</div> <!-- tp3 -->
			</div>	<!-- 팀원소개 끝 -->
			
			
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