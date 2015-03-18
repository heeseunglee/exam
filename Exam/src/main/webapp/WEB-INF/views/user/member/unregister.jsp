<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석</title>
<%@include file="/resources/inc/Extend.jsp"%>
<style type="text/css">
h3 {
	font-size: 16px;
	font-weight: bold;
}

#btn {
	text-align: center;
}

#myPhoto { 
	margin: 20px 0px;
	padding: 50px;
	text-align: center;
	border-top: 1px dotted #DEDEDE;
}

#myInfoPaper{
	padding: 0px;
	text-align: center;
	
}

#myId {
	font-size: 33px;
	font-weight: bold;
	color: #565656;
}
#myInfoPaper p {
	font-size: 18px;
}


</style>
<script type="text/javascript">
	

</script>
</head>
<body>

	<!-- Header 시작 -->
	<div id="header"><%@include file="/resources/inc/Menu.jsp"%></div>
	<!-- Header 끝 -->


	<!-- Container 시작 -->
	<div id="container">

		<!-- 1. 현재 작업 위치 -->
		<div id="locationBar">

			<div id="locationBar_child">
				<a href="/exam/home.action"><img
					src="/exam/resources/images/icons/1424745333_home.png" /> 홈</a> &gt; <a
					href="/exam/mypage/myinfo.action">마이페이지</a> &gt;
				<!-- 상단메뉴(카테고리) 제목과 해당 링크 수정 -->

				<a href="/exam/mypage/unregister.action">회원탈퇴</a>
				<!-- 해당페이지 제목(서브메뉴 제목) 과 해당 링크 수정 -->
			</div>

		</div>


		<!-- 본문블럭 시작-->
		<div id="mainBlock">

			<!-- 2. 사이드바 -->
			<div id="aside">

				<div id="side_title">마이페이지</div>
				<!-- 제작 페이지의 카테고리 제목 -->

				<div id="side_menu">
					<ul>
							
						<li onclick="location.href='/exam/mypage/myinfo.action'">회원정보보기</li>
						<li onclick="location.href='/exam/mypage/edit.action'">회원정보수정</li>
						<li onclick="location.href='/exam/admin/addms.action'">쪽지보내기</li>
						<li onclick="location.href='/exam/admin/getms.action'">받은 쪽지함</li>
						<li onclick="location.href='/exam/admin/setms.action'">보낸 쪽지함</li>
						<li onclick="location.href='/exam/user/listpayment.action'">결제하기</li>
						<li class="side_select" onclick="location.href='/exam/mypage/unregister.action'">회원 탈퇴</li>

					</ul>
				</div>
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>


			<!-- 3. 본문 -->
			<div id="content">

				<div id="content_title">회원 탈퇴</div>

				<div id="content_body" style="padding-top:15px;">
				
					<form method="GET" action="/exam/user/user_del.action">	

						<h3 style="color:red"><img src='/exam/resources/images/icons/warning.png' /><em> 정말로 탈퇴하시겠습니까?</em></h3><br />
						<textarea class="form-control" style="height:200px;" placeholder="탈퇴사유를 입력해 주세요" required ></textarea><br />
						
						<span style="float: right;">
							<input type="button" value="아니오." class="btn btn-success" onclick="location.href='/exam/mypage/myinfo.action'" />
							<input type="submit" value="네. 탈퇴하겠습니다." class="btn btn-warning" />
						</span>
						
					</form>
					
				</div>
			
			</div>
			

		</div>
		<!-- 본문블럭 끝-->

	</div>
	<!-- Container 끝 -->


	<!-- Footer 시작 -->
	<div id="footer"><%@include file="/resources/inc/Copyright.jsp"%></div>
	<!-- Footer 끝 -->
</body>
</html>