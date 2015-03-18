<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석</title>
<%@include file="/resources/inc/Extend.jsp" %>
<style type="text/css">
h3{font-size:16px; font-weight:bold;}

body { background-color: #F3F3F4;}
#container { 
	min-height: 600px; 
	background-color: /* #E9EAED; */ #F3F3F4;
	padding: 40px 0px;
}

#joinSheet {
	border: 1px solid #ECECEC;
	background-color: #FFFFFF;
	width: 350px;
	margin: 30px auto;
	
}

#joinSheet #joinTitle {
	padding: 20px;
	border-bottom: 1px solid #ECECEC;

}

#joinSheet #joinBody {
	padding: 20px;
	min-height: 300px;

}

#btn {
	text-align: right;
	border-top: 1px solid #ECECEC;
	padding: 20px;
}

#stepimg{
	/* width:780px;  */
	/* margin-top:-20px; */
	margin-left: 0px;
	margin-bottom: 20px;
	margin-right: 0px;
}

#joinBody #id {
	background-image: url("/exam/resources/images/icons/user.png");
	background-repeat: no-repeat;
	background-position: 10px center;
	margin: 10px 0px;
	height: 40px;
	padding: 10px;
	padding-left: 33px;
}
#joinBody #pw {
	background-image: url("/exam/resources/images/icons/lock.png");
	background-repeat: no-repeat;
	background-position: 10px center;
	margin: 10px 0px;
	height: 40px;
	padding: 10px;
	padding-left: 33px;
}
</style>
<script type="text/javascript">

function Check(form) {
	
	var total = 0;	
	var max = document.member_step2.ckb.length;

	for (var i = 0; i < max; i++) {
		if (eval("document.member_step2.ckb[" + i + "].checked") == true) {
			total += 1;
	   }
	}
	if(total==2){
		document.member_step2.submit();
	}else{
		alert("서비스약관과 개인정보약관에 동의해주세요");
		return false;
	}
	
}
</script>
</head>
<body>

<!-- Container 시작 -->
<div id="container">

	<!-- 1. 현재 작업 위치 -->
	
	<!-- 본문블럭 시작--> 
	<div id="mainBlock">
		<!-- 약관동의 순서 -->
		
		<span style="width:650px; text-align: center; margin:20px auto; display: block; margin-top: -20px;">
			<img src="/exam/resources/images/admin_logo_chacol.png" style="width:200px;" />
		</span>
		
		<!-- 3. 약관동의 -->
		<div id="joinSheet">
			<div id="joinTitle">
				<h2>Member Only</h2>
			</div>
			
			
			<div id="joinBody">
			
				<input type="text" id="id" name="id" class="form-control span3" placeholder="아이디" required />
		       	<input type="password" id="pw" name="pw" class="form-control span3" placeholder="비밀번호" required />
		     	<input type="checkbox" id="rememberMe" name="rememberMe" /><label for="rememberMe">&nbsp;아이디 기억하기</label>
				
				<br /><br />
				<p>
					<span id='loginCaution' style='color:red; font-style: italic;'>
						<img src='/exam/resources/images/icons/warning.png' />
						&nbsp;로그인 후 이용하시기 바랍니다.
					</span>
		     		<br /><br />
		     		<a href="#"><em>아이디, 비밀번호 잊으셨나요?</em></a><br />
		     		<a href="/exam/admin/member_step2.action"><em>아직 회원이 아니신가요?</em></a>
		     	</p>
			
		</div>
		
		<div id="btn"> 
					
			<input type="button" class="btn btn-default" name="cancelbtn" id="cancelbtn" value="홈으로" onClick="location.href='/exam/home.action'" style="cursor:pointer"/>&nbsp;
			<input type="button" class="btn btn-primary" name="nextbtn" id="nextbtn" value="로그인" onClick="login();" style="cursor:pointer" />								
		
		</div>	
		
	</div><!-- //joinsheet -->
	
	</div><!-- 본문블럭 끝-->
	
		<script type="text/javascript">
		function login() {
			
			// 0. 로그인 함수 호출시 초기화
			$("#id").css("backgroundColor", "inherit");
			$("#id").css("border", "1px solid #DEDEDE");
			$("#pw").css("backgroundColor", "inherit");
			$("#pw").css("border", "1px solid #DEDEDE");
			$("#loginCaution").remove(); 
			
			
			// 1. 아이디 null 검사
			if( $("#id").val() == "" || $("#id").val() == null ) {	
				$("#id").css("backgroundColor", "#F2C9C5");
				$("#id").css("border", "1px solid #C0392B");
				$("#joinBody p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;아이디를 입력하세요.</span>");
				$("#id").focus();
				return
			}
			
			// 2. 비밀번호 null 검사
			if( $("#pw").val() == "" || $("#pw").val() == null ) {
				$("#pw").css("backgroundColor", "#F2C9C5");
				$("#pw").css("border", "1px solid #C0392B");
				$("#joinBody p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;비밀번호를 입력하세요.</span>");
				$("#pw").focus();
				return
			}
			
			// 3. 아이디 중복검사
			var idCheck;
			
			$.ajax({
				type: "POST",
				url: "/exam/auth/idcheck.action",
				data: "id=" + $("#id").val() + "&pw=" + $("#pw").val(),
				success: function(obj){
					
					//console.log(obj);
				
					var obj = $.parseJSON(obj);
					
					console.log(obj.idCheck);
					
					if( !obj.idCheck ) {
						
						$("#id").css("backgroundColor", "#F2C9C5");
						$("#id").css("border", "1px solid #C0392B");
						$("#joinBody p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;아이디가 존재하지 않습니다.</span>");
						$("#id").focus();
						return
						
					} else { 
						
						// 4. 패스워드 유효성 검사후 분기(로그인 or '비밀번호가 일치하지 않습니다')
						
						//alert("이제 로그인합시다!");
						
						$.ajax({
							type: "POST",
							url: "/exam/auth/login.action",
							data: "id=" + $("#id").val() + "&pw=" + $("#pw").val(),
							success: function(check){
								
								var obj = $.parseJSON(check);
								//console.log(obj);
								
								if ( !obj.check ) {
									
									$("#pw").css("backgroundColor", "#F2C9C5");
									$("#pw").css("border", "1px solid #C0392B");
									$("#joinBody p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;비밀번호가 일치하지 않습니다.</span>");
									$("#pw").focus();
								
								} else if ( obj.check ) {
									
									location.reload();
									
								}
								
							}
							
						});
						
					} //else
					
				} // success
			
			}); //$.ajax
			
		}
		
		
		// 아이디창에서 엔터치면, 비밀 번호로 이동
		$("#id").keydown(function (key) {
            if (key.keyCode == 13) {
                $("#pw").focus();
            }
        });
		
		
		// 비밀번호창에서 엔터치면, 로그인버튼 클릭
		$("#pw").keydown(function (key) {
            if (key.keyCode == 13) {
            	login();
            }
        });
		
		

		
	
	
	</script>
	
</div>
<!-- Container 끝 -->



</body>
</html>