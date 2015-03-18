<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석 | 관리자</title>
<%@include file="/resources/inc/Extend_Admin.jsp" %>
<script type="text/javascript">
	var count = 1;
	
	function add() {
		
		$("#surveyContentBox").append("<input type='text' name='content"+count+"' id='content"+count+"' class='form-control' required/>");
		count++;
		
		$("#count").attr("value", count);
		
		
	}
	function del() {
	
		if(count<=1)
			count = 1;
		else
			count--;
		
		$("#surveyContentBox input").remove("#content"+count+"");
		
		$("#count").attr("value", count);
		
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
						<li onclick="location.href='/exam/admin/list.action'">공지사항관리</li>
                  <li onclick="location.href='/exam/admin/testnewslist.action'">시험뉴스</li>
                  <li class="side_select" onclick="location.href='/exam/admin/surveylist.action'">설문조사</li>
                  <li onclick="location.href='/exam/admin/listcalendar.action'">일정관리</li>
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>설문조사입력</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="게시판관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="설문조사입력" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
					<form method="POST" action="/exam/admin/surveyaddok.action">
					<table id="tbl" class="table table-striped">
						<tr>
							<th>설문조사 기간</th>
							<td>
								<input type="date" id="startDate" name="startDate" class="form-control" required placeholder="시작일" />
								~
								<input type="date" id="endDate" name="endDate" class="form-control" required placeholder="마감일" />
							</td>
							<td></td>
						</tr>
						<tr>
							<th>설문조사 주제</th>
							<td>
								<input type="text" id="subject" name="subject" class="form-control" required placeholder="조사주제" />
							</td>
							<td></td>
						</tr>
						<tr>
							<th>설문조사 내용</th>
							<td id="surveyContentBox">
								<input type="text" name="content0" id="content0" class="form-control" required/>
								<input type="hidden" id="count" name="count" value="1"/>
							</td>
							<td>
								<input type="button" value=" 추가 " class="btn btn-default" onclick="add();" />
								<input type="button" value=" 삭제 " class="btn btn-default" onclick="del();" />
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<input type="submit" value=" 등록 " class="btn btn-default" />
								<input type="button" value=" 닫기 " class="btn btn-default" onclick="history.back();" />
							</td>
						</tr>
					</table>
					</form>
				
				</div>
				
			</div>
			<!-- 본문 끝 -->
		
		</div>
	
	</div>
	<!-- 컨테이너 끝 -->
	
	
	<div id="footer"><div id="footer_child"><%@include file="/resources/inc/Copyright.jsp" %></div></div>
	
</body>
</html>