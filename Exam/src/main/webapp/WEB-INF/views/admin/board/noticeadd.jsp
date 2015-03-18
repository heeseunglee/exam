<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석 | 관리자</title>
<%@include file="/resources/inc/Extend_Admin.jsp" %>
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
						<li class="side_select" onclick="location.href='/exam/admin/list.action'">공지사항관리</li>
                  <li onclick="location.href='/exam/admin/testnewslist.action'">시험뉴스</li>
                  <li onclick="location.href='/exam/admin/surveylist.action'">설문조사</li>
                  <li onclick="location.href='/exam/admin/listcalendar.action'">일정관리</li>
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>공지사항입력</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="게시판관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="공지사항입력" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
					<div id="notice">
					
						<form method="POST" action="/exam/admin/addok.action?seq=${seq}">
							<table id="tbl" class="table table-none-top">
								<tr>
									<th>분류명</th>
									<td>
										<input type="text" name="detail" id="detail" class="form-control" required placeholder="분류명"/>
									</td>
								</tr>
								<tr>
									<th>제목</th>
								<td>
									<input type="text" name="subject" id="subject" class="form-control" required placeholder="제목"/>
								</td>
								</tr>
									<tr>
									<th>내용</th>
									<td>
									<textarea name="content" id="content1" class="form-control" required placeholder="내용" style="height:250px;"></textarea>
									</td>
								</tr>
							</table>
						
						<div id="btnList">
							<input type="button" value="리스트" class="btn btn-default" onclick="location.href='/exam/admin/list.action';" />
							<input type="submit" value="글쓰기" class="btn btn-default" />
						</div>
						
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