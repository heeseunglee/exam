<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석 | 관리자</title>
<%@include file="/resources/inc/Extend_Admin.jsp" %>
<style type="text/css">

#container {

	 opacity: 1;
	 background-image: url('/exam/resources/images/marvel_agents_of_shield_.png');
	
	 
	 background-repeat: none; 
	 background-size:100% ;
	 
	 /* background-image: url('/exam/resources/images/s_h_i_e_l_d_by_killerb526-d6awiha.png');
	 background-position: -18px -150px; */
	
}

#login-box {

	opacity:0.89;
}


</style>
</head>
<script type="text/javascript">

	$(document).ready(function() {
		$("#id").focus();
	});
</script>
<body>
	
	<div id="header"><%@include file="/resources/inc/Admin-Menu.jsp" %></div>
	
	<!-- 컨테이너 시작 -->
	<div id="container">
		<div id="container_child">

		<c:if test="${empty userSeq || memberState != '4' }">
			<div id="login-box">
			
				<div id="admin-home-title">
					<h4>관리자 로그인</h4>
					
				</div>
				
				<div id="login-box-body">
					<input type="text" id="id" name="id" class="form-control span3" placeholder="아이디" required />
			       	<input type="password" id="pw" name="pw" class="form-control span3" placeholder="비밀번호" required />
					
				    <p> </p>
				</div>
				
				<div id="login-box-footer">
					<button type="submit" class="btn btn-primary form-control" id="login-btn" onclick="login();">로그인</button>
				</div>
				
			</div>
		</c:if>	
			
		</div>
	
	</div>
	<!-- 컨테이너 끝 -->
	
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
				$("#login-box-body p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;아이디를 입력하세요.</span>");
				$("#id").focus();
				return
			}
			
			// 2. 비밀번호 null 검사
			if( $("#pw").val() == "" || $("#pw").val() == null ) {
				$("#pw").css("backgroundColor", "#F2C9C5");
				$("#pw").css("border", "1px solid #C0392B");
				$("#login-box-body p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;비밀번호를 입력하세요.</span>");
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
						$("#login-box-body p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;아이디가 존재하지 않습니다.</span>");
						$("#id").focus();
						return
						
					} else { 
						
						// 4. 패스워드 유효성 검사후 분기(로그인 or '비밀번호가 일치하지 않습니다')
						
						//alert("이제 로그인합시다!");
						
						$.ajax({
							type: "POST",
							url: "/exam/auth/login.action",
							data: "id=" + $("#id").val() + "&pw=" + $("#pw").val() +"&isAdmin=admin",
							success: function(check){
								
								var obj = $.parseJSON(check);
								console.log( obj );
								

								
								if ( !obj.check ) {
									
									$("#pw").css("backgroundColor", "#F2C9C5");
									$("#pw").css("border", "1px solid #C0392B");
									$("#login-box-body p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;비밀번호가 일치하지 않습니다.</span>");
									$("#pw").focus();
								
								} else if ( obj.check ) {
									
									if ( !obj.isAdminId ) {
										
										$("#id").css("backgroundColor", "#F2C9C5");
										$("#id").css("border", "1px solid #C0392B");
										$("#login-box-body p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;관리자 아이디가 아닙니다.</span>");
										$("#id").focus();
										return
										
									} else {
										
										location.reload();
										
									}
									
									
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
	
	
	<div id="footer"><div id="footer_child"><%@include file="/resources/inc/Copyright.jsp" %></div></div>
	
</body>
</html>