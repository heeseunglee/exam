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
	$(document).ready(function(){
		var paymentList = $("#paymentList").val();
		if (paymentList == '-1') {
			$("#btnSubmit").attr("disabled", true);
		}
	});
	function getpayment() {
		var paymentList = $("#paymentList").val();
		if (paymentList == '-1') {
			$("#btnSubmit").attr("disabled", true);
		} else {
			$("#btnSubmit").attr("disabled", false);
		}
		if (paymentList == '정회원 1일' || paymentList == '마일리지 5000원')
			$("#payment").val('5000');
		else if (paymentList == '정회원 7일' || paymentList == '마일리지 10000원')
			$("#payment").val('10000');
		else
			$("#payment").val('30000');
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
					
					<li onclick="location.href='/exam/mypage/myinfo.action'">회원정보보기</li>
						<li onclick="location.href='/exam/mypage/edit.action'">회원정보수정</li>
						<li onclick="location.href='/exam/admin/addms.action'">쪽지보내기</li>
						<li onclick="location.href='/exam/admin/getms.action'">받은 쪽지함</li>
						<li onclick="location.href='/exam/admin/setms.action'">보낸 쪽지함</li>
						<li class="side_select" onclick="location.href='/exam/user/listpayment.action'">결제하기</li>
						<li onclick="location.href='/exam/mypage/unregister.action'">회원 탈퇴</li>
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
			
			<div id="content_title">서브메뉴 제목</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	
				
				<form method="GET" action="/exam/user/requestpaymentok.action">
				<table class="table">
					<tr>
						<th>결제구분</th>
						<td>
							<select id="paymentList" name="paymentList" class="form-control" onchange="getpayment();">
								<option value="-1">결제종류를 선택해주세요.</option>
								<option value="정회원 1일">정회원 1일(5000원)</option>
								<option value="정회원 7일">정회원 7일(10000원)</option>
								<option value="정회원 1달">정회원 1달(30000원)</option>
								<option value="마일리지 5000원">마일리지 5000원</option>
								<option value="마일리지 10000원">마일리지 10000원</option>
								<option value="마일리지 30000원">마일리지 30000원</option>
							</select>
							<input type="hidden" id="payment" class="form-control" name="payment"/>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
							<input type="submit" value="결제요청" id="btnSubmit" class="btn btn-default"/>
							<input type="button" value="뒤로가기" class="btn btn-default" onclick="history.back();" />
						</td>
					</tr>
				</table>
				</form>
				
				
				
				
				
				
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