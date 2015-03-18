<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석 | 관리자</title>
<%@include file="/resources/inc/Extend_Admin.jsp" %>
<script type="text/javascript">
	//대분류 select
	function gettpbdiv() {
		var tpbdivSeq = $("#tpbdiv").val();
		//var tpbdivVal = $("#tpbdiv option:selected").text();
		$.ajax({
			type: "GET",
			url : "/exam/admin/questiontpm.action",
			data : "tpbdivseq="+ tpbdivSeq,
			success : function(data){
				var list = $.parseJSON(data);
				
				$("#tpbdiv").val(tpbdivSeq);
				
				$("#tpmdiv").html("");
				$("#tpmdiv").append("<option value='-1'>리스트를 선택해 주세요</option>");
				for (var i=0; i<list.length; i++) {
					var tpmdiv = list[i];
					$("#tpmdiv").append("<option value='"+tpmdiv.seq+"'>" + tpmdiv.tpmdiv + "</option>");
				}
					
			}
		}); 
	}
	
	//중분류 select
	function gettmbdiv() {
		var tpmdivSeq = $("#tpmdiv").val();
		
		$.ajax({
			type: "GET",
			url : "/exam/admin/questiontps.action",
			data : "tpmdivseq="+ tpmdivSeq,
			success : function(data){
				var list = $.parseJSON(data);
				
				$("#tpsdiv").html("");
				$("#tpsdiv").append("<option value='-1'>리스트를 선택해 주세요</option>");
				for (var i=0; i<list.length; i++) {
					var tpsdiv = list[i];
					$("#tpsdiv").append("<option value='"+tpsdiv.seq+"'>" + tpsdiv.tpsdiv + "</option>");
				}
				
			}
		});
	}
	
	//소분류 select
	function gettsbdiv() {
		var tpbdivVal = $("#tpbdiv option:selected").text();
		var tpmdivVal = $("#tpmdiv option:selected").text();
		var tpsdivVal = $("#tpsdiv option:selected").text();
		$("#questionCode").val(tpbdivVal+"_"+tpmdivVal+"_"+tpsdivVal);
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
						<li class="side_select" onclick="location.href='/exam/admin/questionlist.action'">문제관리</li>
						<li onclick="location.href='/exam/admin/categoryadd.action'">카테고리관리</li>
						<li onclick="location.href='/exam/admin/testpaperadd.action'">시험지관리</li>

					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>문제등록</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='/exam/admin/home.action'" />  
						<input type="button" value="시험관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='/exam/admin/questionlist.action'" />  
						<input type="button" value="문제관리" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='/exam/admin/questionlist.action'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
					<form method="POST" action="/exam/admin/questionok.action">
					<table class="table">
						<tr>
							<th style="width:30%;padding-left:25px;">문제코드(관리)</th>
							<td>
								<select name="tpbdiv" id="tpbdiv" class="form-control" onchange="gettpbdiv();">
									<c:if test="${tpblist.size() == 0}">
										<option value="-1">리스트가 없습니다.</option>
									</c:if>
									<c:if test="${tpblist.size() > 0}">
										<option value="-1">리스트를 선택해 주세요</option>
									<c:forEach items="${tpblist}" var="dto">
										<option value="${dto.tpbdivSeq}">${dto.tpbdiv}</option>
									</c:forEach>
									</c:if>
								</select>
								<select name="tpmdiv" id="tpmdiv" class="form-control" onchange="gettmbdiv();">
									<option value="-1">리스트가 없습니다.</option>
								</select>
								<select name="tpsdiv" id="tpsdiv" class="form-control" onchange="gettsbdiv();">
									<option value="-1">리스트가 없습니다.</option>
								</select>
								<input type="text" name="questionCode" id="questionCode" class="form-control"  required placeholder="관리를 목적으로 생성" readonly="readonly"/>
							</td>
						</tr>
						
						<!-- 추가기능 -->
						<!-- <tr>
							<th>문제난이도/유형</th>
							<td>
								<input type="text" name="" id="" class=""/>
							</td>
						</tr> -->
						
						<tr>
							<th style="width:30%;padding-left:25px;">문제점수</th>
							<td>
								<input type="number" name="score" id="score" class="form-control" required/>
							</td>
						</tr>
						<tr>
							<th style="width:30%;padding-left:25px;">지문</th>
							<td>
								<textarea name="description" id="description" class="form-control" required ></textarea>
							</td>
						</tr>
						<tr>
							<th style="width:30%;padding-left:25px;">문제</th>
							<td>
								<textarea name="question" id="question" class="form-control" required ></textarea>
							</td>
						</tr>
						<tr>
							<th style="width:30%;padding-left:25px;">보기</th>
							<td>
								1번 : <input type="text" name="question1" id="question1" class="form-control" required/>
								2번 : <input type="text" name="question2" id="question2" class="form-control" required/>
								3번 : <input type="text" name="question3" id="question3" class="form-control" required/>
								4번 : <input type="text" name="question4" id="question4" class="form-control" required/>
							</td>
						</tr>
						<tr>
							<th style="width:30%;padding-left:25px;">해답</th>
							<td>
								<input type="radio" name="answer" value="1" checked/> <label for="answer">1번</label>
								<input type="radio" name="answer" value="2"/> <label for="answer">2번</label>
								<input type="radio" name="answer" value="3"/> <label for="answer">3번</label>
								<input type="radio" name="answer" value="4"/> <label for="answer">4번</label>
							</td>
						</tr>
						<tr>
							<th style="width:30%;padding-left:25px;">해답설명</th>
							<td>
								<textarea name="explanation" id="explanation" class="form-control" required ></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="padding-left:25px;padding-top:20px;">
								<input type="submit" class="btn btn-primary" value=" 등록하기 "/>
								<input type="button" class="btn btn-default" value=" 취소하기 " onclick="history.back();" />
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