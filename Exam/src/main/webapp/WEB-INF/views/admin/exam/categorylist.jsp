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
		$("#tpbdivsend").hide();
		$("#tpbdivadd").hide();
		$("#tpmdivsend").hide();
		$("#tpmdivadd").hide();
		$("#tpsdivsend").hide();
		$("#tpsdivadd").hide();
	 	
		// 시험종류 체크박스
		$("#tpbdivcheck").bind("change", function() {  	
		var tpbdivcheck = $("#tpbdivcheck").prop("checked")
			if (tpbdivcheck==false) {
				$("#tpbdivsend").hide();
				$("#tpbdivadd").hide();
	
			} else {
				$("#tpbdivsend").show();
				$("#tpbdivadd").show();
			 } 
	 	});
		
		// 시험과목 체크박스
		$("#tpmdivcheck").bind("change", function() {  	
		var tpmdivcheck = $("#tpmdivcheck").prop("checked")
			if (tpmdivcheck==false) {
				$("#tpmdivsend").hide();
				$("#tpmdivadd").hide();
	
			} else {
				$("#tpmdivsend").show();
				$("#tpmdivadd").show();
			 } 
	 	});
		
		// 시험회차 체크박스
		$("#tpsdivcheck").bind("change", function() {  	
		var tpsdivcheck = $("#tpsdivcheck").prop("checked")
			if (tpsdivcheck==false) {
				$("#tpsdivsend").hide();
				$("#tpsdivadd").hide();
	
			} else {
				$("#tpsdivsend").show();
				$("#tpsdivadd").show();
			 } 
	 	});
		
		
		
		
	 
	});
	
	
	// 시험종류 선택 
	function tpbdivsel(){
		$("#tpbdivadd").val($("#tpbdiv").val());
		var tpbdivadd = $("#tpbdivadd").val();	
	
		 $.ajax({
			type: "GET",
			url : "/exam/admin/tpbdivselok.action",
			data : "tpbdivadd="+ tpbdivadd,
			success : function(data){
				var list = $.parseJSON(data);
				$("#tpbdiv").val(tpbdivadd);
				$("#tpmdiv").html("");	
				 for (var i=0; i<list.length; i++) {
						var tpmdiv = list[i];
						$("#tpmdiv").append("<option value='"+tpmdiv.tpmdiv+"'>" + tpmdiv.tpmdiv + "</option>");
					}
			}
		});
		
	}
	
	// 시험과목 선택
	function tpmdivsel(){
		$("#tpmdivadd").val($("#tpmdiv").val());
		var tpmdivadd = $("#tpmdivadd").val();	
		var tpbdivadd = $("#tpbdivadd").val();	
		
		 $.ajax({
			type: "GET",
			url : "/exam/admin/tpmdivselok.action",
			data : "tpmdivadd="+ tpmdivadd+"&tpbdivadd="+tpbdivadd,
			success : function(data){
				var list = $.parseJSON(data);
				$("#tpmdiv").val(tpmdivadd);
				$("#tpsdiv").html("");	
				 for (var i=0; i<list.length; i++) {
						var tpsdiv = list[i];
						$("#tpsdiv").append("<option value='"+tpsdiv.tpsdiv+"'>" + tpsdiv.tpsdiv + "</option>");
					}
			}
		});	
	}
	
	
	function tpsdivsend(){
		var tpmdivadd = $("#tpmdivadd").val();	
		var tpbdivadd = $("#tpbdivadd").val();	
		var tpsdivadd = $("#tpsdivadd").val();	
		$.ajax({
			type: "GET",
			url: "/exam/admin/tpsdivaddok.action",
			data : "tpmdivadd="+ tpmdivadd+"&tpbdivadd="+tpbdivadd+"&tpsdivadd="+tpsdivadd
	
		})
		alert("등록완료");
		
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
						<li onclick="location.href='/exam/admin/questionlist.action'">문제관리</li>
						<li class="side_select" onclick="location.href='/exam/admin/categoryadd.action'">카테고리관리</li>
						<li onclick="location.href='/exam/admin/testpaperlist.action'">시험지관리</li>
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>카테고리관리</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='/exam/admin/home.action'" />  
						<input type="button" value="시험관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='/exam/admin/questionlist.action'" />  
						<input type="button" value="카테고리관리" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
				
				<form method="GET" action="/exam/admin/tpsdivaddok.action">
						<table class="table">
							<tr>

								<th style="width:20%;padding-left:25px;">시험분류</td>
								<td style="width:35%;">
									<select id="tpbdiv" name="tpbdiv" onchange="tpbdivsel();"  style="width:200px;" >
											<option selected="selected">시험종류선택</option>
											<c:forEach items="${tpbdivlist}" var="dto">
												<option value="${dto.tpbdiv}">${dto.tpbdiv}</option>
											</c:forEach>
									</select>
								</td>

								<td>
									<input type="checkbox" id="tpbdivcheck" name="tpbdivcheck" /> 
									<input type="text" placeholder="직접입력" id="tpbdivadd" name="tpbdivadd" style="width:200px;">
								</td>
							</tr>
							<tr>
								<th style="width:20%;padding-left:25px;">과목</td>
								<td>
									<select id="tpmdiv" name="tpmdiv"  onchange="tpmdivsel();" style="width:200px;">
											<option selected="selected">시험과목선택</option>
									</select>
								</td>

								<td>
									<input type="checkbox" id="tpmdivcheck" name="tpmdivcheck" /> 
									<input type="text" placeholder="직접입력" id="tpmdivadd" name="tpmdivadd" style="width:200px;">
								</td>
							</tr>
							<tr>
								<th style="width:20%;padding-left:25px;">회차</td>
								<td>
									<select id="tpsdiv" name="tpsdiv" style="width:200px;" >
										<option selected="selected">시험회차선택</option>
									</select>
								</td>
								<td>
									<input type="checkbox" id="tpsdivcheck" name="tpsdivcheck" /> 
									<input type="text" placeholder="직접입력" id="tpsdivadd" name="tpsdivadd" style="width:200px;">
								</td>
							</tr>
							<tr>
								<td style="padding-left:25px;padding-top:20px;border:0;">
									<input type="button" onclick="tpsdivsend();" value="생성하기" class="btn btn-primary">
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