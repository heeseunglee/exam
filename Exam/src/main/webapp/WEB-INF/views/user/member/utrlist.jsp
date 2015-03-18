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
var AnswerClose = false;
 $(document).ready(function() {
	 AnswerClose = false;	 
}); 
	

function result(tnSeq) {
	
 	 if (AnswerClose) {
 		close(tnSeq);
 	} else {
 		
	 	$.ajax({
			type : "GET",
			url : "/exam/user/utrtotal.action",
			data : "tnSeq=" + tnSeq,
			success : function(data) {
				
				var list = $.parseJSON(data);
				$("#A-"+tnSeq).html("");
				$("#A-"+tnSeq).append("<table class='table table-striped'>");
				
				var linecnt = Math.ceil((list.length)/10);
	
				for (var i = 0; i < linecnt; i++) {
					
					$("#A-"+tnSeq).append("<tr>");
					$("#A-"+tnSeq).append("<th style='width:100px;'>문제번호</th>");
					var cnt = list.length;
					for (var j = 0; j < 10; j++) {
						var list = $.parseJSON(data);
						var number = (j + 1 + i * 10);
						var num = (number-1);
						var list = list[num];
						$("#A-"+tnSeq).append("<td style='width:70px;'>"+number+"</td>");
					
					}
					$("#A-"+tnSeq).append("</tr>");
					
					$("#A-"+tnSeq).append("<tr>");
					$("#A-"+tnSeq).append("<th style='color: blue;width:100px;'>작성답안</th>");
					for (var j = 0; j < 10; j++) {
						
						var list = $.parseJSON(data);
						var list = list[j + i * 10];
						if(list == null  || list == "undefined"){
							$("#A-"+tnSeq).append("<td style='width:70px;'>ㆍ</td>");	
						}else
						$("#A-"+tnSeq).append("<td style='width:70px;'>"+list.userAnswer+"</td>");
						
					}
					$("#A-"+tnSeq).append("</tr>"); 
					
					$("#A-"+tnSeq).append("<tr>");
					$("#A-"+tnSeq).append("<th style='color: blue;width:100px;'>정답답안</th>");
					for (var j = 0; j < 10; j++) {
						var list = $.parseJSON(data);
						var list = list[j + i * 10];
						if(list == null || list == "undefined" ){
							$("#A-"+tnSeq).append("<td style='width:70px;'>ㆍ</td>");
						}else
						$("#A-"+tnSeq).append("<td style='width:70px;'>"+list.answer+"</td>");
						
					}
					$("#A-"+tnSeq).append("</tr>");
					
					$("#A-"+tnSeq).append("<tr>");
					$("#A-"+tnSeq).append("<th style='color: red;width:100px;'>결과</th>");
					for (var j = 0; j < 10; j++) {
						var list = $.parseJSON(data);
						var list = list[j + i * 10];
						if(list == null || list == "undefined" ){
						$("#A-"+tnSeq).append("<td style='width:70px;'>ㆍ</td>");
						}else
						$("#A-"+tnSeq).append("<td style='width:70px;'>"+list.oxCheck+"</td>");	
					}
					$("#A-"+tnSeq).append("</tr>");
					$("#A-"+tnSeq).append("<tr>");
					
					if(i==(linecnt-1)){
					$("#A-"+tnSeq).append("<th style='color: blue;width:100px;'>풀이결과</th>");
					var list = $.parseJSON(data);
					var totalAnswer = list.length;
					var rCount = 0;
					var nCount = 0;
					for (var int = 0; int < list.length; int++) {
						if( list[i].oxCheck == "o" ){
							rCount++;
	
						} else if( list[i].oxCheck == "x" ){
							nCount++;
						}
					} //for
					
	
					$("#A-"+tnSeq).append("<th style='color: blue;width:100px;' colspan='10'>총문제수:"+totalAnswer+" 정답수 : "+rCount+" 오답수 : "+ nCount+"</th>");	
					$("#A-"+tnSeq).append("</tr>");
					} //if
					
				} //for
					$("#A-"+tnSeq).append("</table>"); 
			} //success
			
	 	  

	 	}); //ajax
	 	AnswerClose = true;

 	 }  //else  
	
} //result()

function close(tnSeq){
	$("#A-"+tnSeq).remove();
	AnswerClose = false;
} 

function examView(examSeq) {
	//alert(examSeq);
	var userSeq = '${userSeq}';
	
	if (userSeq == null || userSeq == '') {
		alert("로그인 후 이용하시기 바랍니다.");
	} else { 		
		window.open("/exam/user/exam/take.action?examSeq=" + examSeq, '시험의 정석', "width=810, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );  
		//location.href="/exam/user/exam/take.action?examSeq=" + examSeq;
	}
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
			
			<a href="#">오답노트</a>
		</div>	
		
	</div>
	
	
	<!-- 본문블럭 시작--> 
	<div id="mainBlock">
		
		<!-- 2. 사이드바 -->
		<div id="aside">
		
			<div id="side_title">오답노트</div><!-- 제작 페이지의 카테고리 제목 -->
		
			<div id="side_menu">
				<ul>
				
					<li class="side_select" onclick="location.href='#'">오답노트</li>
					
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
			
			<div id="content_title">오답노트</div><!-- 본문 상단의 타이틀(해당페이지 제목) -->
			
			<div id="content_body">
			<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->	
			
			<table class="table table-striped">
				<tr>
					<th>문제지명</th>
					<th>결과보기</th>
					<th>문제보기</th>
					<th>등록일/풀이시간</th>
				</tr>
				<c:forEach items="${testList}" var="dto">
				<tr id='Q-${dto.tnSeq}'>
					<td>${dto.tpmSubject}</td>
					<td>
						<input type="button"  value="결과보기"  onclick="result(${dto.tnSeq});" class="btn btn-default" id="result" name="result"/>					
					</td>
					<td><input type="button" value="다시풀기" onclick="examView(${dto.testPaperManage});" class="btn btn-default"></td>
					<td>${dto.userTestDate}</td>
				</tr>
				<!-- 답안지 추가 -->
				<tr>
					<td colspan="6">
					<div id='A-${dto.tnSeq}' name="A-${dto.tnSeq}">
					
					</div>		
					</td>
				</tr>
				</c:forEach>
				
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