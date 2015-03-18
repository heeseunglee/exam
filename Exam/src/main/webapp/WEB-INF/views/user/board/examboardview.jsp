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
			<a href="/exam/home.ex"><img src="/exam/resources/images/icons/1424745333_home.png" /> 홈</a> &gt; 
			
			<a href="/exam/user/freeboardlist.action">커뮤니티</a>
			
			<a href="/exam/user/examboardlist.action">시험후기</a> 
		</div>	
		
	</div>
	
	
	<!-- 본문블럭 시작--> 
	<div id="mainBlock">
		
		<!-- 2. 사이드바 -->
		<div id="aside">
		
			<div id="side_title">커뮤니티</div><!-- 제작 페이지의 카테고리 제목 -->
		
			<div id="side_menu">
				<ul>
					<li onclick="location.href='/exam/user/freeboardlist.action'">자유게시판</li>
					
					<li onclick="location.href='/exam/community/qna/list.action'">질문과 답변, QnA</li>
					
					<li class="side_select" onclick="location.href='/exam/user/examboardlist.action'">시험후기</li>
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
			
			 <table class="table table-striped">
			     <tr>
			       <th>제목</th>
			       <td>${dto.subject}</td>
			     </tr>
			     <tr>
			       <th>내용</th>
			       <td>${dto.content}</td>
			     </tr>
			     <tr>
			     	<td colspan="2">
			     		<input type="button" value= "뒤로가기" onclick="location.href='/exam/user/examboardlist.action?seq=${dto.seq}';"/>
			     		<c:if test="${check}">
			     		<input type="button" value= "삭제" onclick="location.href='/exam/user/examboarddel.action?seq=${dto.seq}';"/>
			     		<input type="button" value= "답글" onclick="location.href='/exam/user/examboardadd.action?mode=reply&thread=${dto.thread}&depth=${dto.depth}';"/>
			     		<input type="button" value= "수정" onclick="location.href='/exam/user/examboardedit.action?seq=${dto.seq}';"/>
			     		</c:if>
			     	</td>
			     </tr>
			 </table>  
			
			  <!--댓글 쓰기  -->
				<form method="POST" action="/exam/user/examboardcomment.action?pSeq=${dto.seq}">
				<table class="table table-striped">
					<tr>
					    <td>
							<input type="text" name="content" id="ccontent" class="form-control" required placeholder="내용 입력" />
						</td>
						<td>
							<input type="submit" value=" 댓글 쓰기 " class="btn btn-default"/>
						</td>
					</tr>
				</table>
			</form>
				
				
		<!-- 목록 -->
			<table class="table table-striped">
				<c:forEach items="${clist}" var="cdto">
				<tr>
					<td>${cdto.name}</td>
					<td>${cdto.content}</td>
					<td>${cdto.regDate}</td>
					<td>
						<c:if test="${cdto.name == name}">
						<input type="button" value="삭제하기" class="form-control" onclick="location.href='/exam/user/examboardcommentdel.action?seq=${cdto.seq}&pSeq=${dto.seq}';" />
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
			<!-- 댓글 끝 --> 
				
				
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