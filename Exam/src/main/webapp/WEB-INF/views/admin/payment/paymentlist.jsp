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
	
});

function chagePayment(seq) {
	/* var button = event.srcElement;
	$(button).val('입금완료');
	$(button).attr("disabled", true); */
	location.href="/exam/admin/authpayment.action?seq="+seq;
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
						<li onclick="location.href='/exam/admin/accountlist.action'">입금계좌관리</li>
						<li class="side_select" onclick="location.href='/exam/admin/listpayment.action'">결제요청목록</li>
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>결제요청목록</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="회원관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="결제요청목록" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
				
				<table class="table">
					<tr>
						<th>번호</th>
						<th>구분</th>
						<th>금액</th>
						<th>신청인</th>
						<th>신청일</th>
						<th>결제구분</th>
					</tr>
					<c:if test="${list.size()==0}">
					<tr>
						<td colspan="6" style="text-align: center;">신청중인 결제요청이 없습니다.</td>
					</tr>
					</c:if>
					<c:if test="${list.size()>0}">
					<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.rnum}</td>
						<td>${dto.paymentList}</td>
						<td>${dto.payment}원</td>
						<td>${dto.name}(${dto.userId})</td>
						<td>${dto.paymentDate}</td>
						<td>
							<input type="button" value="입금대기" class="btn btn-default" onclick="chagePayment('${dto.seq}');" />
						</td>
					</tr>
					</c:forEach>
					</c:if>
				</table>
				
				
				
				
				
					
				
				</div>
				
			</div>
			<!-- 본문 끝 -->
		
		</div>
	
	</div>
	<!-- 컨테이너 끝 -->
	
	
	<div id="footer"><div id="footer_child"><%@include file="/resources/inc/Copyright.jsp" %></div></div>
	
</body>
</html>