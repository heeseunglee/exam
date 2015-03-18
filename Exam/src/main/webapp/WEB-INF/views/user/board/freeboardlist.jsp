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
	$(document).ready(function() {
		<c:if test="${isSearch}">
		$("#searchColumn").val("${searchColumn}");
		$("#searchWord").val("${searchWord}");
		</c:if>
	});
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
			
			<a href="/exam/user/freeboardlist.action">커뮤니티</a> &gt;  <!-- 상단메뉴(카테고리) 제목과 해당 링크 수정 -->
			
			<a href="/exam/user/freeboardlist.action">자유게시판</a>  <!-- 해당페이지 제목(서브메뉴 제목) 과 해당 링크 수정 -->
		</div>	
		
	</div>
	
	
	<!-- 본문블럭 시작--> 
	<div id="mainBlock">
	
		<div id="aside">
		
			<div id="side_title">커뮤니티</div><!-- 제작 페이지의 카테고리 제목 -->
			
			<div id="side_menu">
				<ul>
					<li class="side_select" onclick="location.href='/exam/user/freeboardlist.action'">자유게시판</li>
					
					<li onclick="location.href='/exam/community/qna/list.action'">질문과 답변, QnA</li>
					
					<li onclick="location.href='/exam/user/examboardlist.action'">시험후기</li>
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
			
			<div id="content_title">자유게시판</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	
				
				
		<table id="tbl" class="table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				
				 <!-- 공지글표시 -->
				<c:if test="${noticeList.size() > 0}">
				<c:forEach items="${noticeList}" var="ndto">
				<tr style="background-color: #F7A35C;">
					<td>${ndto.detail}</td>
					<td>
						<a href="/exam/user/noticeuserview.action?seq=${ndto.seq}">
							${ndto.subject}
						</a>
					</td>
					<td>
						<a href="/exam/admin/addms.action?memberId=admin">
						관리자
						</a>
					</td>
					<td>${ndto.regDate}</td>
					<td>${ndto.readCount}회</td>
				</tr> 
				</c:forEach>
				</c:if>
				
				<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.rnum}</td>
					<td>
					${dto.replyImg}
					<a href="/exam/user/freeboardview.action?seq=${dto.seq}&searchColumn=${searchColumn}&searchWord=${searchWord}">${dto.subject}</a>
					<c:if test="${dto.commentCount > 0}">
						<span style="color:#999;">(${dto.commentCount})</span>						
						</c:if>
						${dto.newImg}
					</td>
					<td>
						<a href="/exam/admin/addms.action?memberId=${dto.userId}">
							${dto.name}
						</a>
					</td>
					<td>${dto.regDate}</td>
					<td>${dto.readCount}회</td>
				</tr>
				</c:forEach>
			      
			    <c:if test="${list.size() == 0}">
				<tr>
					<td colspan="5" style="text-align: center;padding:100px 0px;">게시물이 존재하지 않습니다.</td>
				</tr>
				</c:if>
		 </table>  
		 
		 <!--검색부분 추가  -->
		 <div>
		 	<form method="GET" action="/exam/user/freeboardlist.action">
				<table style="width: 500px; margin: 20px auto;">
					<tr>
						<td>
							<select name="searchColumn" id="searchColumn" class="form-control">
								<option value="subject">제목</option>
								<option value="name">이름</option>
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
		 
		 <!-- 페이징 -->
			<div style="text-align: center;">${pageBar}</div>
			
		  <input type="button" value= "글쓰기" class="btn btn-default" onclick="location.href='/exam/user/freeboardadd.action';"/>
				
				
				
				
				
				
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