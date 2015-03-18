<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석</title>
<%@include file="/resources/inc/Extend.jsp"%>
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

	<!-- Header 시작 -->
	<div id="header"><%@include file="/resources/inc/Menu.jsp"%></div>
	<!-- Header 끝 -->


	<!-- Container 시작 -->
	<div id="container">

		<!-- 1. 현재 작업 위치 -->
		<div id="locationBar">

			<div id="locationBar_child">
				<a href="/exam/home.action"><img
					src="/exam/resources/images/icons/1424745333_home.png" /> 홈</a> &gt; <a
					href="#">카테고리 제목</a> &gt;
				<!-- 상단메뉴(카테고리) 제목과 해당 링크 수정 -->

				<a href="#">서브메뉴1</a>
				<!-- 해당페이지 제목(서브메뉴 제목) 과 해당 링크 수정 -->
			</div>

		</div>


		<!-- 본문블럭 시작-->
		<div id="mainBlock">

			<!-- 2. 사이드바 -->
			<div id="aside">

				<div id="side_title">카테고리 제목</div>
				<!-- 제작 페이지의 카테고리 제목 -->

				<div id="side_menu">
					<ul>

						<!-- 
					 아래 리스트는 사이드바의 메뉴 리스트 해당 링크 걸고, 메뉴 제목고치고, 
					 필요없는 리스트는 지우면 됩니다. 
					
					 ** 현재페이지에 해당하는 <li>태그에 side_select 클래스를 적용하세요!	
				-->

						<li class="side_select" onclick="location.href='#'">서브메뉴1</li>
						<li onclick="location.href='#'">서브메뉴2</li>
						<li onclick="location.href='#'">서브메뉴3</li>
						<li onclick="location.href='#'">서브메뉴4</li>
						<li onclick="location.href='#'">서브메뉴5</li>
						<li onclick="location.href='#'">서브메뉴6</li>
						<li onclick="location.href='#'">서브메뉴7</li>
						<li onclick="location.href='#'">서브메뉴8</li>
						<li onclick="location.href='#'">서브메뉴9</li>
						<li onclick="location.href='#'">서브메뉴10</li>
					</ul>
				</div>
			</div>
			<script type="text/javascript"
				src="/exam/resources/dist/js/sidebar.js"></script>


			<!-- 3. 본문 -->
			<div id="content">

				<div id="content_title">카테고리관리</div>
				<!-- 본문 상단의 타이틀(해당페이지 제목) -->

				<div id="content_body">
					<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->

					<form method="GET" action="/exam/admin/tpsdivaddok.action">
						<table class="table table-striped">
							<tr>

								<td>시험종류</td>
								<td>
									<select id="tpbdiv" name="tpbdiv" onchange="tpbdivsel();"  >
											<option selected="selected">시험종류선택</option>
											<c:forEach items="${tpbdivlist}" var="dto">
												<option value="${dto.tpbdiv}">${dto.tpbdiv}</option>
											</c:forEach>
									</select>
								</td>

								<td>
									<input type="checkbox" id="tpbdivcheck" name="tpbdivcheck" /> 
									<input type="text" placeholder="직접입력" id="tpbdivadd" name="tpbdivadd">
								</td>
							</tr>
							<tr>
								<td>시험연도</td>
								<td>
									<select id="tpmdiv" name="tpmdiv"  onchange="tpmdivsel();">
											<option selected="selected">시험과목선택</option>
									</select>
								</td>

								<td>
									<input type="checkbox" id="tpmdivcheck" name="tpmdivcheck" /> 
									<input type="text" placeholder="직접입력" id="tpmdivadd" name="tpmdivadd">
								</td>
							</tr>
							<tr>
								<td>시험회차</td>
								<td>
									<select id="tpsdiv" name="tpsdiv"  >
										<option selected="selected">시험회차선택</option>
									</select>
								</td>
								<td>
									<input type="checkbox" id="tpsdivcheck" name="tpsdivcheck" /> 
									<input type="text" placeholder="직접입력" id="tpsdivadd" name="tpsdivadd">
								</td>
							</tr>
							<tr><td><input type="button" onclick="tpsdivsend();"
									value="생성하기" class="btn btn-default"></td>
							</tr>
						</table>
					</form>

				</div>
			</div>

		</div>
		<!-- 본문블럭 끝-->

	</div>
	<!-- Container 끝 -->


	<!-- Footer 시작 -->
	<div id="footer"><%@include file="/resources/inc/Copyright.jsp"%></div>
	<!-- Footer 끝 -->
</body>
</html>