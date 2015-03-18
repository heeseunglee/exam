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

function send() {
	$("#btnSubmit").click();		
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
						<li class="side_select" onclick="location.href='/exam/admin/addrm.action'">정회원금액설정</li>
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>정회원금액설정</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='/exam/admin/home.action'" />  
						<input type="button" value="결재관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='/exam/admin/accountlist.action'" />  
						<input type="button" value="정회원금액설정" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
					<form method="POST" action="/exam/admin/addokrm.action?seq=${seq}">
					
						<table id="tbl" class="table table-striped">
							<tr>
								<th>서비스 기간</th>
								<td>
								<select name="servicedate" id="servicedate" class="simpleform">
			                          <option value="1" selected="selected">1일</option>
			                          <option value="2">2일</option>
			                          <option value="3">3일</option>
			                          <option value="4">4일</option>
			                          <option value="5">5일</option>
			                          <option value="6">6일</option>
			                          <option value="7">1주일</option>
			                          <option value="14">2주일</option>
			                          <option value="21">3주일</option>
			                          <option value="30">1개월</option>
			                          <option value="60">2개월</option>
			                          <option value="90">3개월</option>
			                          <option value="120">4개월</option>
			                          <option value="150">5개월</option>
			                          <option value="180">6개월</option>
			                          <option value="210">7개월</option>
			                          <option value="240">8개월</option>
			                          <option value="270">9개월</option>
			                          <option value="300">10개월</option>
			                          <option value="330">11개월</option>
			                          <option value="360">12개월</option>
			                        </select>
								</td>
							</tr>
							<tr>
								<th>서비스 가격</th>
								<td>
									<input type="text" name="serviceprice" id="serviceprice" class="form-control" required placeholder="가격"/>
								</td>
							</tr>
						</table>
				
						<div id="btnList">
							<input type="button" value="등록" onclick="send();" />
							<input type="submit" id="btnSubmit" style="display: none;"/>
						</div>
				
					</form>
				
					<!--리스트  -->
					<div id="RegularMemberlist">
	
						<table id="tbl" class="table table-striped">
							<tr>
								<th id="col1">서비스기간</th>
								<th id="col2">서비스가격</th>
							</tr>
							
							<c:forEach items="${list}" var="dto">
							<tr>
								<td class="cell1">${dto.servicedate}</td>
								<td class="cell2">${dto.serviceprice}</td>
								<td><input type="button" value="삭제"   onclick="location.href='/exam/admin/delokrm.action?seq=${dto.seq}';" />
								</td>
							</tr>
							</c:forEach>
							
							<c:if test="${list.size() == 0}">
							<tr>
								<td colspan="5" style="text-align: center">게시물이 존재하지 않습니다.</td>
							</tr>
							</c:if>
						</table>
					
					
						<div id="btnList">
						
							<!-- <input type="button" value="삭제"   onclick="location.href='/exam/admin/delrm.action';" /> -->
			
						</div>		
				
					</div><!-- //RegularMemberlist -->	
				
				</div><!-- //article-body -->
				
			</div>
			<!-- 본문 끝 -->
		
		</div>
	
	</div>
	<!-- 컨테이너 끝 -->
	
	
	<div id="footer"><div id="footer_child"><%@include file="/resources/inc/Copyright.jsp" %></div></div>
	
</body>
</html>