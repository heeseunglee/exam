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
		$("#addquestiontbl").hide();
		$("#addtpm").hide();
		$("#back").hide();
	});
	
	// 문제 선택하기
	function viewquestion() {
		$("#addquestiontbl").show();
		$("#addtpm").show();
		$("#back").show();
		$("#testpapermake").hide();
		
		var tpsdiv = $("#tpsdiv").val();
		var testpapersubject = $("#testpapersubject").val();
		var testprice = $("#testprice").val();
		var testtime = $("#testtime").val();
		
		 $.ajax({
				type: "GET",
				url : "/exam/admin/testpapermake.action",
				data : "tpsdiv="+ tpsdiv+"&testpapersubject="+ testpapersubject+"&testprice="+ testprice+"&testtime="+ testtime,
				
			});
	}
	
	function move(fbox, tbox) {
		  for(i=0; i<fbox.options.length; i++)
		  {
		    if(fbox.options[i].selected)     {
		     tbox.options[tbox.options.length] = new Option(fbox.options[i].text, fbox.options[i].value );
		      fbox.options[i] = null;
		     i=i-1;
		    }
		    
		  }
		  for(i=0; i<tbox.options.length; i++){
		  $("#sendquiz").children("option").attr("selected",true);
			}
		}
	
	
	
	
	
	// 시험종류 선택 
	 function tpbdivsel(){
		
		var tpbdiv = $("#tpbdiv").val();	
	
		 $.ajax({
			type: "GET",
			url : "/exam/admin/testpapertpbsel.action",
			data : "tpbdiv="+ tpbdiv,
	 		success : function(data){
				var list = $.parseJSON(data);
				$("#tpbdiv").val(tpbdiv);
				$("#tpmdiv").html("");	
	 			$("#tpmdiv").append("<option >시험과목선택</option>")
				 for (var i=0; i<list.length; i++) {
						var tpmdiv = list[i];
						$("#tpmdiv").append("<option value='"+tpmdiv.tpmdivSeq+"'>" + tpmdiv.tpmdiv + "</option>");
					}
			} 
		});
		
	}
	
	//시험과목 선택
	 function tpmdivsel(){
	 	var tpmdiv = $("#tpmdiv").val();	
	 	
	 	 $.ajax({
	 		type: "GET",
	 		url : "/exam/admin/testpapertpmsel.action",
	 		data : "tpmdiv="+ tpmdiv,
	 		success : function(data){
	 			var list = $.parseJSON(data);
	  			$("#tpmdiv").val(tpmdiv);
	 			$("#tpsdiv").html("");	
	 			$("#tpsdiv").append("<option >시험회차선택</option>")
	 			 for (var i=0; i<list.length; i++) {
	 					var tpsdiv = list[i];
	 					$("#tpsdiv").append("<option value='"+tpsdiv.tpsdivSeq+"'>" + tpsdiv.tpsdiv + "</option>");
	 				}
	 		}
	 	});	
	 }
	
	
	// 시험중분류로 문제 추가
	function tpsdivsel() {
		var tpmdiv = $("#tpmdiv").val();
		$.ajax({
			type : "GET",
			url : "/exam/admin/testpapertpssel.action",
			data : "tpmdiv="+ tpmdiv,
	 		success : function(data){
	 			var list = $.parseJSON(data);
	 			$("#selquiz").html("");
	 			  for (var i=0; i<list.length; i++) {
	 					var question = list[i];
	 					$("#selquiz").append("<option value='"+question.questionSeq+"'>" + question.questionCode + "</option>");
	 				} 
	 		}
	 	});	
	}
	
	
	function addtpm1() {
	 	
		var questionaddlist = $("#sendquiz").val(); // 선택된 selectbox option 배열
	 	var tpmdiv = $("#tpmdiv").val(); // 검색어
	 	
	 	var tempdata = "";
	 	for (var i=0; i<questionaddlist.length; i++) {
	 		tempdata += "s" + i + "=" + questionaddlist[i]+"&";
	 	}
	 	tempdata += "tpmdiv=" + tpmdiv + "&cnt=" + questionaddlist	.length;
	 	
	 	location.href="/exam/admin/testpaperquestionadd.action?"+tempdata;
	 	
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
						<li onclick="location.href='/exam/admin/categoryadd.action'">카테고리관리</li>
						<li class="side_select" onclick="location.href='/exam/admin/testpaperlist.action'">시험지관리</li>
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>시험지등록</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='/exam/admin/home.action'" />  
						<input type="button" value="시험관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='/exam/admin/questionlist.action'" />  
						<input type="button" value="시험지관리" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
				
				<table class="table">
						<tr>
							<th style="width: 15%; padding-left:25px;">카테고리</th>
							<td style="width: 75%;"><select id="tpbdiv" name="tpbdiv"
								onchange="tpbdivsel();" class="form-control"
								style="width: 30%; display: inline-block;">
									<option selected="selected">시험종류선택</option>
									<c:forEach items="${tpbdivlist}" var="tpbdivdto">
										<option value="${tpbdivdto.tpbdivSeq}">${tpbdivdto.tpbdiv}</option>
									</c:forEach>
							</select> <select id="tpmdiv" name="tpmdiv" onchange="tpmdivsel();"
								class="form-control" style="width: 30%; display: inline-block;">
									<option selected="selected">시험과목선택</option>
							</select> <select id="tpsdiv" name="tpsdiv" onchange="tpsdivsel();"
								class="form-control" style="width: 30%; display: inline-block;">
									<option selected="selected">시험회차선택</option>
							</select></td>
						</tr>
						<tr>
							<th style="width: 15%; padding-left:25px;">문제지제목</th>
							<td><input type="text" class="form-control"
								id="testpapersubject" name="testpapersubject"
								class="form-control" style="width: 90%;"></td>
						</tr>
						<tr>
							<th style="width: 15%; padding-left:25px;">금액</th>
							<td><input type="number" id="testprice" name="testprice"
								class="form-control" style="width: 50%; display: inline-block;">원
							</td>
						</tr>
						<tr>
							<th style="width: 15%; padding-left:25px;">시간설정</th>
							<td style=""><input type="number" id="testtime"
								name="testtime" class="form-control"
								style="width: 50%; display: inline-block;">분</td>
						</tr>

					</table>
					<input type="button" value="문제추가하기" id="testpapermake"
						name="testpapermake" class="btn btn-default"
						onclick="viewquestion();"  style="margin-left: 25px;">


					<!-- 문제 추가 -->
					<form method=get name=FORM>

						<table id="addquestiontbl" name="addquestiontbl"
							class="table table-striped">

							<tr>
								<td id="seltestpaper" name="seltestpaper" style="width:90%">문제추가하기</td>
							</tr>
							<tr>
								<td style="min-width: 40%; display: inline-block;">전체문제목록</td>
								<td style="min-width: 10%; display: inline-block;"></td>							
								<td style="min-width: 40%; display: inline-block;">현재문제목록</td>
							</tr>
							<tr>
								<td >
									<div style="min-width: 40%; display: inline-block;">
										<select multiple="multiple" size="10" id="selquiz"
											name="selquiz" class="form-control">
										</select>
									</div> 
									<div style="min-width: 10%; display: inline-block; text-align: center; vertical-align: middle; margin-top: -200px;" >
										<a href="javascript:move(document.FORM.elements['selquiz'],document.FORM.elements['sendquiz'])">▶</a>
										<a href="javascript:move(document.FORM.elements['sendquiz'],document.FORM.elements['selquiz'])">◀</a>
									</div>
									<div style="min-width: 40%; display: inline-block;"">
										<select multiple="multiple" size="10" id="sendquiz"
											name="sendquiz" class="form-control"">
										</select>
									</div>

								</td>
							</tr>
						</table>
						<div style="padding-left: 25px;">
						<input type="button" value="등록하기" id="addtpm" name="addtpm" class="btn btn-default" onclick="addtpm1();" />
						<input type="button" value="뒤로가기" id="back" name="addtpm" class="btn btn-default" onclick="location.href='/exam/admin/testpaperlist.action';" />
						</div>
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