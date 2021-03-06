<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<!-- 상단 타이틀바 시작 -->
	<div id="superBar">
		<div id="superBarChild">
			<a href="/exam/home.action"><img src="/exam/resources/images/exam_logo_2.png" alt="시험의 정석 로고" id="examLogo"/></a>
			<span>
			
							
				<c:if test="${empty userSeq}">
					
					<!-- 로그인 전 -->
					<span style="float: right;"><a data-toggle="modal" data-target="#myModal" href="#">로그인</a>&nbsp;&nbsp; 
					<a href="/exam/admin/member_step2.action">회원가입</a></span>
				
				</c:if>				
				
				
				<c:if test="${!empty userSeq}">
				
					<!-- 로그인 후 -->
					<div id="userImg">
						<img src="${userImage}" />
					</div>
					<div id="userInfo">
						<span id="userName">
							<h4><strong>${userName}</strong></h4> ${userId}<br /> 
						</span>
						<span id="userData">
							<a id="mile" href="#"><img src="/exam/resources/images/icons/1425007519_cur_dollar.png"/>${userMile}</a>&nbsp;&nbsp;
							 <a id="massageCount" href="/exam/admin/getms.action"><img src="/exam/resources/images/icons/1425008273_internt_web_technology-14-128.png"/> ${massageCNT}</a>
							  <!-- <a href='/exam/admin/home.action' ><img src="/exam/resources/images/mono-icons/1425388046_settings.png" /></a> -->
						</span>
						
						
					</div>
						
					<div id="userMenu">	
						
						
						<img src="/exam/resources/images/icons/1425008829_cross-128.png" onclick="location.href='/exam/auth/logout.action';"/>
						
					</div>
				
				</c:if>	

			</span>
		</div>
	</div>
	<!-- 상단 타이틀바 끝 -->


	<!-- 네비게이션바 시작 -->
	<div id="navBar">
		<div id="navBarChild">
				<ul>
					<li class="navBtn"><a href="/exam/mypage/myinfo.action">마이페이지</a></li>
					<li class="navBtn"><a href="/exam/user/exam/list.action">시험보기</a></li>
					<li class="navBtn"><a href="/exam/user/utrlist.action">오답노트</a></li>
					<li class="navBtn"><a href="/exam/user/calendar.action">시험일정</a></li>
					<li class="navBtn"><a href="/exam/user/freeboardlist.action">커뮤니티</a></li>
					<li class="navBtn"><a href="/exam/user/noticeuserlist.action">고객센터</a></li>
				</ul>
		</div><!-- navBarChild -->
	</div>
	
	<div id="navBar_sub" style="display: none;">
		<div id="navBar_subChild">
			서브메뉴1 <br />서브메뉴2<br />서브메뉴3<br />서브메뉴4<br />서브메뉴5
		</div>
	</div>
	
	<!-- LogIn Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	        <h4 class="modal-title"><strong> 로그인</strong></h4>
	      </div>
	      
	      	<!-- <form method="POST" action="/exam/auth/login.action"> -->
		    
		      <div class="modal-body">
		      
		       	<input type="text" id="id" name="id" class="form-control span3" placeholder="아이디" required />
		       	<input type="password" id="pw" name="pw" class="form-control span3" placeholder="비밀번호" required />
		     	<input type="checkbox" id="rememberMe" name="rememberMe" /><label for="rememberMe">&nbsp;아이디 기억하기</label>
		     
		     	<br />
		     	<p>
		     		<br />
		     		<a href="#"><em>아이디, 비밀번호 잊으셨나요?</em></a><br />
		     		<a href="/exam/admin/member_step2.action"><em>아직 회원이 아니신가요?</em></a>
		     	</p>
		     	
		      </div>
		      
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-primary" id="login-btn" onclick="login();">로그인</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		      </div>
		    
		   <!-- </form> -->
		      
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	
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
				$(".modal-body p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;아이디를 입력하세요.</span>");
				$("#id").focus();
				return
			}
			
			// 2. 비밀번호 null 검사
			if( $("#pw").val() == "" || $("#pw").val() == null ) {
				$("#pw").css("backgroundColor", "#F2C9C5");
				$("#pw").css("border", "1px solid #C0392B");
				$(".modal-body p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;비밀번호를 입력하세요.</span>");
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
						$(".modal-body p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;아이디가 존재하지 않습니다.</span>");
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
									$(".modal-body p").before("<span id='loginCaution' style='color:red;'><img src='/exam/resources/images/icons/warning.png' />&nbsp;비밀번호가 일치하지 않습니다.</span>");
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
		
		
		// 페이지 로딩후 모달창 이벤트
		$("#myModal").on("shown.bs.modal", function () {
			 
			/* $("#id").focus(); */
		});
		
		
		// 모달창 활성화시 아이디에 포커스
		$("#myModal").on("shown.bs.modal", function () {
			 
			$("#id").focus();
		});
		
		
		// 모달창 주변 비활성화시 입력값/메시지 지우기
		$("#myModal").on("hidden.bs.modal", function () {
			
			$("#id").css("backgroundColor", "inherit");
    		$("#id").css("border", "1px solid #DEDEDE");
    		$("#id").val("");
    		$("#pw").css("backgroundColor", "inherit");
    		$("#pw").css("border", "1px solid #DEDEDE");
    		$("#pw").val("");
    		$("#loginCaution").remove();
		
		});
		

		
		
	
	
	</script>
	
	<!-- 상단 드랍다운 메뉴 비활성화 -->
	<!-- <script type="text/javascript" src="/exam/resources/dist/js/submenu.js"></script> -->
	<!--네비게이션바 끝 -->
	
	