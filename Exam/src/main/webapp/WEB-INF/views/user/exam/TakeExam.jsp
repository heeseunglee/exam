<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석</title>
<%@include file="/resources/inc/Extend.jsp" %>
<link rel="stylesheet" type="text/css" href="/exam/resources/dist/css/exam.css" />
<style type="text/css">

</style>
<script type="text/javascript">
	$(document).ready(function() {
		
		//타이머
		var min = 0;
		var sec = 0;
		var timer;
		
		timer = setInterval(function() {
			
			sec++;
						
			if ( sec == 60 ) {
				min++;
				sec = 0;
			} 
						
			if ( min < 10 && sec < 10 ) {
				$("#Qtimer").val('0' + min + ' : ' + '0' + sec);
			} else if ( min < 10 && sec >= 10 ) {
				$("#Qtimer").val('0' + min + ' : ' + sec);
			} else if ( min >= 10 && sec < 10 ) {
				$("#Qtimer").val( min + ' : ' + '0' + sec);
			} else if ( min >= 10 && sec >= 10 ) {
				$("#Qtimer").val( min + ' : ' + sec);
			}
			
			if ( min == ( '${testInfo.timeLimit}' - 1) && sec == 0 ) {
				alert("시험시간이 1분 남았습니다. 1분뒤 자동으로 답안이 전송됩니다.")
			}
			
			if ( min == '${testInfo.timeLimit}' && sec == 0 ) {
				clearInterval(timer);
				alert("제한 시간 초과로 답안이 자동전송되었습니다.")
				send();
				$(document).scrollTop( $(document).height() );
			}
			
			
		}, 1000);
		
		
		$("#sendAnswer").click(function(){
			clearInterval(timer);
		})
		
		
		

	});
	
	function send(){
		
		var list = new Array();
		
		for (i=0; i < '${questionCNT}'; i++) {
			//alert( $(":input:radio[name=Q" + i + "]:checked").val() );
			
			if ( $(":input:radio[name=Q" + (i + 1) + "]:checked").val() == null || $(":input:radio[name=Q" + (i + 1) + "]:checked").val() == 'null' ) {
				
				list[i] = '0';
				
			} else {
			
				list[i] = $(":input:radio[name=Q" + (i + 1) + "]:checked").val();
			}
			
		}
		
		//console.log(list);
		
		jQuery.ajaxSettings.traditional = true;
		
		 
		$.ajax({
		    method: 'POST',
		    url: '/exam/user/exam/answer.action',
		    data: "answers=" + JSON.stringify( list ) + "&examSeq=${testInfo.seq}",
		    dataType: "json",
		    error: function(request, status, error) {
		        //alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		    },
		    success: function(answerCheck) {
		    	
		        console.log(answerCheck);
		        
				$("#sendAnswer").attr("disabled", true);
				$("#sendAnswer").before("<input type='button' value='해답보기' id='explanation' class='btn btn-warning' /> ");
				
				$("#explanation").click(function(){
					
					console.log('${questionCNT}');
					
					$(".explanationPaper").css("display","block");
					
					var right = 0;
					
					for (var i=0; i < '${questionCNT}'; i++) {
						
						$("#exp1-" + ( i + 1 ) + " > span" ).remove();
						$("#liveQ" + (i + 1) + " > .exp4").remove();
						
						$("#Q"+ ( i + 1 ) + "-" + answerCheck[i].rightAnswer ).attr("checked", true);
						$("#Q"+ ( i + 1 ) + "-1").attr("disabled", true);
						$("#Q"+ ( i + 1 ) + "-2").attr("disabled", true);
						$("#Q"+ ( i + 1 ) + "-3").attr("disabled", true);
						$("#Q"+ ( i + 1 ) + "-4").attr("disabled", true);
						$("#Q"+ ( i + 1 ) + "-" + answerCheck[i].rightAnswer ).attr("disabled", false);
						$(".Q"+ ( i + 1 ) + "-" + answerCheck[i].rightAnswer ).css("color","red");
						
						if ( answerCheck[i].userAnswer == 0 ) {
							$("#exp1-" + ( i + 1 ) ).append("<span>제출한 답 : 미응답</span>");
						} else {
							$("#exp1-" + ( i + 1 ) ).append("<span>제출한 답 : " + answerCheck[i].userAnswer + "</span>");
						}
						
						if ( answerCheck[i].oxCheck == 'o' ) {
							
							right++;
							$("#liveQ" + ( i + 1 ) ).append("<div class='exp4'><img src='/exam/resources/images/o.png' /></div>");
						
						} else {
						
							$("#liveQ" + ( i + 1 ) ).append("<div class='exp4'><img src='/exam/resources/images/x.png' /></div>");
						}
					
					}
					
					
					var score = right / ${questionCNT} * 100;
					
					
					$(document).scrollTop( 0 );
					alert("채점결과 :  " + score + "점입니다.");
					
				});
				
		    }
		 
		});

	}

</script>
</head>
<body>

<div id="liveTestPaper">

	<div id="liveTestInfo">
		<table id="liveTestInfoTbl" class="table table-striped table-bordered">
			<tr id="liveTestInfoHead">
				<th colspan="1"><h3>${testInfo.seq}.</h3></th>
				<th colspan="5"><h3>${testInfo.testSubject}</h3></th>
			</tr>
			<tr>
				<th>분류</th>
				<td>${testInfo.headline} | ${testInfo.midline} | ${testInfo.footline}</td>
				<th>문항수</th>
				<td style='color:#ff8000;'>${questionCNT}</td>
				<th>제한시간</th>
				<td style='color:#ff8000;'>${testInfo.timeLimit}분</td>
			</tr>
		</table>
		<span style="float: right;"><input type="text" value="00 : 00" id="Qtimer"class="form-control" disabled="disabled"/></span>
		
	</div>
	
	<div id="liveQuestions">
		
		<c:forEach items="${questions}" var="dto">

			<div class="liveQ" id="liveQ${dto.rnum}">
				<div class="liveQ-question"><b>${dto.rnum}. ${dto.question}</b></div>
				<div class="liveQ-description"><em>${dto.description}</em></div>
				<div class="liveQ-bogi" id='Q${dto.rnum}'>
					<ul>
						<li><input type='radio' name='Q${dto.rnum}' id='Q${dto.rnum}-1' value='1' /><label class='Q${dto.rnum}-1' for='Q${dto.rnum}-1'>&nbsp;&nbsp;${dto.bogi1}</label></li>
						<li><input type='radio' name='Q${dto.rnum}' id='Q${dto.rnum}-2' value='2' /><label class='Q${dto.rnum}-2' for='Q${dto.rnum}-2'>&nbsp;&nbsp;${dto.bogi2}</label></li>
						<li><input type='radio' name='Q${dto.rnum}' id='Q${dto.rnum}-3' value='3' /><label class='Q${dto.rnum}-3' for='Q${dto.rnum}-3'>&nbsp;&nbsp;${dto.bogi3}</label></li>
						<li><input type='radio' name='Q${dto.rnum}' id='Q${dto.rnum}-4' value='4' /><label class='Q${dto.rnum}-4' for='Q${dto.rnum}-4'>&nbsp;&nbsp;${dto.bogi4}</label></li>
					</ul>
					<div class='explanationPaper' style='display: none;'>
							<div id='exp1-${dto.rnum}' class='exp1' ></div>
							<div id='exp2-${dto.rnum}' class='exp2' >정답 : ${dto.rightAnswer}</div>
							<div id='exp3-${dto.rnum}' class='exp3' >${dto.explanation}</div>
					</div>	
				</div>
			</div>
			
		</c:forEach>
		
	</div>
	
	<br />	
	<span><input type="button" value="답안지 제출" id="sendAnswer" class="btn btn-success" onclick="send()" /></span>

</div>

</body>
</html>