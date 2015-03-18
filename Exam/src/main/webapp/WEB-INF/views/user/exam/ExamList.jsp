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
		

		var list = ${examList};
		var side = ${sideList};
		var category = ${isCategory};
		
		//console.log(list);

		
		//console.log(list);
		
		// 1. 시험 목록
		if (list.length == 0) {
			
			var tag = "<div class='empty-list'><h5>등록된 시험이 없습니다.</h5></div>";
			$("#content_body").append(tag);
			
		} else {
			
			for ( var i=0; i < list.length; i++ ) {
				
				var tag = "<table class='examlist table table-striped table-bordered'>";
				tag += "<tr>";
				tag += "<th rowspan='2' style='width:50px; color:#3399FF; font-size:16px;'>"+ list[i].seq +"</th>";
				tag += "<th><strong>"+ list[i].testSubject +"</strong></th>";
				tag += "</tr>";
				tag += "<tr><td>" + list[i].headline + " - " + list[i].midline + " - " + list[i].footline + " | 제한시간 <span style='color:#ff8000;'>" + list[i].timeLimit + "분</span> | 소모 마일리지  <span style='color:#ff8000;'>" +  list[i].testPrice + "</span>";
				tag += "<span style='float:right;'>";
				tag += "<input id='btn-answers' class='btn btn-sm btn-default' type='button' value='해답풀이' onclick='examView(" + list[i].seq + ", " + list[i].testSubject + ")' /> ";
				tag += "<input id='btn-take-exam' class='btn btn-sm btn-success' type='button' value='시험보기' onclick='examView(" + list[i].seq +")' /></span></td></tr></table>";
				
				$("#content_body").append(tag);
				
				
			}
			
			var pageBar = "${pageBar}";
			$("#content_body").append("<div id='pageBar'>" + pageBar + "</div>");
		}
		
		
		
		
		// 2. 사이드바 대분류 목록
		for ( var i=0; i < side.length; i++ ) {
			
			var sidemenu = side[i].headline;
			
			//console.log(side[i].seq);
			
			var tag = "<li class='' id='side" + side[i].seq + "'onclick='";
			tag += "categoryView(" + side[i].seq + ")'";
			tag += "'>" + sidemenu + "</li>";
		
			$("#side_menu ul").append(tag);
		}
		
		if ( category ) {
			
			$("${selector}").addClass("side_select");
			$("#alltest").removeClass("side_select");
			$("#locationBar_child").append("<a href='/exam/user/exam/list.action?sideSeq=" + '${categorySeq}' + "'>" + "${categoryName}" + "</a>");
			
		} else {
			
			$("#locationBar_child").append("<a href='/exam/user/exam/list.action'>전체시험목록</a>");
					
		}
		
		
	});
	
	function examView(examSeq, subject) {
		//alert(examSeq);
		var userSeq = '${userSeq}';
		
		if (userSeq == null || userSeq == '') {
			alert("로그인 후 이용하시기 바랍니다.");
		} else { 		
			window.open("/exam/user/exam/take.action?examSeq=" + examSeq, subject, "width=810, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );  
			//location.href="/exam/user/exam/take.action?examSeq=" + examSeq;
		}
	}
	
	function categoryView(sideSeq) {
		//alert(sideSeq);
		location.href="/exam/user/exam/list.action?sideSeq=" + sideSeq;
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
			
			<a href="/exam/user/exam/list.action">시험보기</a> &gt;  <!-- 상단메뉴(카테고리) 제목과 해당 링크 수정 -->
	
		</div>	
		
	</div>
	
	
	<!-- 본문블럭 시작--> 
	<div id="mainBlock">
		
		<!-- 2. 사이드바 -->
		<div id="aside">
		
			<div id="side_title">시험보기</div><!-- 제작 페이지의 카테고리 제목 -->
		
			<div id="side_menu">
				<ul>
				
				<!-- 
					 아래 리스트는 사이드바의 메뉴 리스트 해당 링크 걸고, 메뉴 제목고치고, 
					 필요없는 리스트는 지우면 됩니다. 
					
					 ** 현재페이지에 해당하는 <li>태그에 side_select 클래스를 적용하세요!	
				-->
					
					<li id="alltest" class="side_select" onclick="location.href='/exam/user/exam/list.action'">전체 시험 목록</li>
					

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
			
			<div id="content_title">전체 시험 목록</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	

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