<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석 | 관리자</title>
<%@include file="/resources/inc/Extend_Admin.jsp" %>
<script type="text/javascript">
	function surveydel(seq) {
		if(confirm("정말로 삭제하시겠습니까?"))
			location.href="/exam/admin/surveydel.action?seq="+seq;
	}
	
	function main(seq) {
		if(confirm("메인등록하시겠습니까?"))
			location.href="/exam/admin/surveymain.action?seq="+seq;
	}
</script>
<style type="text/css">
	#tbl1 {
		border: 0px;
	}
</style>
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
					
					<h3>설문조사리스트</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="게시판관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="설문조사리스트" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
					<div style="width: 100px;">
						<input type="button" value=" 삽입하기 " class="form-control" onclick="location.href='/exam/admin/surveyadd.action';" />
					</div>
					
					<table id="tbl" class="table">
						<tr>
							<th>메인사용</th>
							<th>설문내용</th>
							<th>설문기간</th>
							<th>득표수</th>
							<th>진행/마감</th>
							<th></th>
						</tr>
						<c:if test="${subjectList.size() == 0}">
						<tr>
							<td colspan="5" style="text-align: center;"> 설문조사 항목이 존재하지 않습니다.</td>
						</tr>
						</c:if>
						<c:if test="${subjectList.size() > 0}">
						<c:forEach items="${subjectList}" var="subject">
						<tr>
							<td>
								<input type="button" value="메인" class="btn btn-default" onclick="main('${subject.seq}');" />
							</td>
							<td>
								<table id="tbl1">
									<tr>
										<th colspan="2">
											[설문번호 : ${subject.rnum}] <span style="font-weight: bold">${subject.subject}</span>		
										</th>
									</tr>
									<c:forEach items="${contentList}" var="content">
									<c:if test="${subject.seq == content.surveySeq}">
									<tr>
										<td>
											${content.content}
										</td>
										
										<td>
											
											<c:if test="${subject.voteCount != 0}">
											<div style="width: 100px; display: inline-block;">
											
											<div style="width : ${content.answerCount / subject.voteCount * 100}%; background-color: blue; display: inline-block;">&nbsp;</div> 
											
											</div>
											${content.answerCount / subject.voteCount * 100}% (${content.answerCount}표)
											</c:if>
											<c:if test="${subject.voteCount == 0}">
											<div style="width: 100px; display: inline-block;">
											
											<div style="width : 0%; background-color: blue; display: inline-block;">&nbsp;</div> 
											
											</div>
											0% (${content.answerCount}표)
											</c:if>
											
										</td>
									</tr>
									</c:if>
									</c:forEach>
								</table>
							</td>
							<td>
								${subject.startDate} <br />
								~ <br />
								${subject.endDate}
							</td>
							<td>
								${subject.voteCount}표
							</td>
							<td>
								<c:if test="${subject.main=='y'}">
								[<a href="/exam/home.action"><span style="color: green;">진행중...</span></a>]
								</c:if>
								<c:if test="${subject.main=='n'}">
								[<span>마감!!</span>]
								</c:if>
							</td>
							<td>
								<input type="button" value=" 수정 " class="btn btn-default" onclick="location.href='/exam/admin/surveyedit.action?seq=${subject.seq}';" />
								<input type="button" value=" 삭제 " class="btn btn-default" onclick="surveydel('${subject.seq}');" />
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