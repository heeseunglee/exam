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
						<li class="side_select" onclick="location.href='/exam/admin/member_list.action'">회원목록</li>
						<li onclick="location.href='/exam/admin/membership_list.action'">유료회원목록</li>
						<li onclick="location.href='/exam/admin/unregister_list.action'">탈퇴회원목록</li>
						<li onclick="location.href='#'">쪽지관리</li>
						<li onclick="location.href='#'">SMS관리</li>
						<li onclick="location.href='#'">이메일발송</li>
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>회원목록</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='/exam/admin/home.action'" />  
						<input type="button" value="회원관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='/exam/admin/member_list.action'" />  
						<input type="button" value="회원목록" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='/exam/admin/member_list.action'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
				<div id="notice">

			
					<!-- 검색중문구 -->
					${searchLabel}
					
					<table id="tbl" class="table">
						<tr>
							<th id="col1">번호</th>
							<th id="col2"><input type="checkbox" name="chbAll" id="chbAll" ></th>
							<th id="col3">회원정보</th>
							<th id="col4">캐쉬</th>
							<th id="col5">가입일</th>
							<th id="col6">&nbsp;</th>
						</tr> 
						
						<c:forEach items="${list}" var="dto">
						<tr>
							<td class="cell1">${dto.seq}</td>
							<td class="cell2"><input type="checkbox" name="chb" id="chb" /></td>
							<td class="cell3"><a href="/exam/admin/member_edit.action?seq=${dto.seq}&searchColum=${searchColum}&searchWord=${searchWord}">${dto.name}(${dto.userID})</a> / ${dto.email} / ${dto.tel1}.${dto.tel2}.${dto.tel3}</td>
							<td class="cell4">${dto.mileagePoint}</td>
							<td class="cell5">${dto.enterDate}</td>
							<td class="cell6"><input type="button" value="수정" class="btn btn-xs btn-warning" onclick="location.href='/exam/admin/member_edit.action?seq=${dto.seq}';"/></td>
						</tr>
						</c:forEach>
						
						<c:if test="${list.size() == 0}">
						<tr>
							<td colspan="6" style="text-align: center;padding: 100px 0px;">회원이 존재하지 않습니다.</td>
						</tr>
						</c:if>
					</table>
		
				
					<!-- 페이징 -->
					<div style="width: 600px; margin:20px auto; text-align: center">${pageBar}</div>
					
					<!-- 검색부분 추가 -->
					<form method="GET" action="/exam/admin/member_list.action">
						<table style="width: 500px; margin: 20px auto;">
							<tr>
								<td>
									<select name="searchColum" id="searchColum" class="form-control" >
										<option value="name">이름</option>
										<option value="email">이메일</option>
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