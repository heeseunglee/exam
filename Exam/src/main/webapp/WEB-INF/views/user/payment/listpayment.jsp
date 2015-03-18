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
				
				<table class="table">
					<tr>
						<th>은행명</th>
						<th>계좌번호</th>
						<th>받는사람</th>
					</tr>
					<c:if test="${bank==null}">
					<tr>
						<td colspan="3" style="text-align: center;">등록된 은행이 없습니다.</td>
					</tr>
					</c:if>
					<c:if test="${bank != null}">
					<tr>
						<td>${bank.bankName}</td>
						<td>${bank.bankNumber}</td>
						<td>${bank.bankRep}</td>
					</tr>
					</c:if>
				</table>
				
				
				<hr />
				
				<table class="table">
					<tr>
						<th>결제일</th>
						<th>결제구분</th>
						<th>결제금액</th>
						<th>결제승인</th>
					</tr>
					<c:if test="${list.size()==0}">
					<tr>
						<td colspan="4" style="text-align: center;">결제신청내역이 없습니다.</td>
					</tr>
					</c:if>
					<c:if test="${list.size()>0}">
					<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.paymentDate}</td>
						<td>${dto.paymentList}</td>
						<td>${dto.payment}</td>
						<td>[${dto.paymentAuth}]</td>
					</tr>
					</c:forEach>
					</c:if>
					<tr>
						<td colspan="4">
							<input type="button" value="결제요청" class="btn btn-default" onclick="location.href='/exam/user/requestpayment.action';" />
						</td>
					</tr>
				</table>
				
				
				
				
				
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