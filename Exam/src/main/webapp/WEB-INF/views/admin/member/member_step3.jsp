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


#container { 
	min-height: 600px; 
	background-color: /* #E9EAED; */ #F3F3F4;
	padding: 40px 0px;
}

#joinSheet {
	border: 1px solid #ECECEC;
	background-color: #FFFFFF;
	width: 650px;
	margin: 30px auto;
}

#joinSheet #joinTitle {
	padding: 30px 20px;
	border-bottom: 1px solid #ECECEC;

}

#joinSheet #joinBody {
	padding: 30px;
	

}

#btn {
	text-align: right;
	border-top: 1px solid #ECECEC;
	padding: 20px 0px;
}

#stepimg{
	/* width:780px;  */
	/* margin-top:-20px; */
	margin-left: 0px;
	margin-bottom: 20px;
	margin-right: 0px;
}

</style>
<script type="text/javascript">



function id_check(userID) {
	
	$("#id_check_tag").remove();

	$.ajax ({
		type: "POST",
		url: "/exam/member/id_check.action",
		data: "userID=" + userID,
		success: function(id_check){
			
			var obj = $.parseJSON(id_check);
			
			console.log(obj);
			
			var tag = "";
			
			if( $("#userID").val() == "" || $("#userID").val() == null ) {
				
				tag += "<span id='id_check_tag' style='color: red;'> 아이디를 입력해주세요.</span>";
				
				$("#userID").focus();
				$("#nextbtn").attr("disabled",true);
			
			} else if ( obj.id_check ) {
				
				tag += "<span id='id_check_tag' style='color: green;'> 사용가능한 아이디입니다.</span>";
				$("#nextbtn").attr("disabled",false);
				$("#userPW").focus();
				
			
			} else {
				
				tag += "<span id='id_check_tag' style='color: red;'> 사용불가능한 아이디입니다.</span>";
				
				$("#userID").focus();
				$("#nextbtn").attr("disabled",true);

			}
			
			$("#id_check_td").append(tag);
			
		}
		
	});
	
} 

function check() {
		
	 $("#id_check_tag").remove();
	 
}


function send() {
	var form1 = document.getElementById("form1");
	/* 유효성 검사*/
	
	// 사용자가 입력한 이름(문자열)

	var name = $("#name").val();
	
	if(name == "") {
		alert("이름을 입력하세요");
		$("#name").focus();
		return;
	}
	
	if(name.length<2 || name.length>5) {
		alert("이름은 2자~5자 이내로 입력하세요")
		$("#name").focus();
		return false;
	}
	
	
	// 사용자가 입력한 ID & PW
	// 공백 유효성 검사
	 var userID = $("#userID").val();
	  
	 if(userID ==""){ 
		alert("아이디를 입력하세요");
		$("#userID").focus(); 
		return;
	}
	    
	 var userPW = $("#userPW").val();
	  
	 if(userPW ==""){ 
		alert("패스워드를 입력하세요");
		$("#userPW").focus(); 
		return;
	}
	
	 // 아이디 검사 4-10 자 사이의 숫자,문자만 허용
	   var regexp = /^[a-z0-9]{4,10}$/;
	      
	   if(!regexp.test($("#userID").val())){
	    alert('아이디는 소문자와 숫자로 4 ~ 10자입니다.');
	    $("#userID").focus();
	    return;
	   }

	// 비밀번호 4 - 10 자 사이의 숫자,문자만 허용
	
	    var regexp = /^[a-z0-9]{4,10}$/;
	    
	    if(!regexp.test($("#userPW").val()))
	    {
	     alert('비밀번호는 소문자 숫자로 4 ~10자입니다');
	     $("#userPW").focus();
	     return false;
	    }

	   
	     // 전화번호 두번째 자리는 3~4자리 숫자
	     // 세번째 자리는 4자리 숫자

	    var regtel1 = /^01[016789]$/;
	    var regtel2 = /^[0-9]{3,4}$/;
	    var regtel3 = /^[0-9]{4}$/;
	    
	    var tel1 = $("#tel1").val();
       var tel2 = $("#tel2").val();
       var tel3 = $("#tel3").val();
       
       if (tel1 != "") {
           if (!regtel2.test(tel2)){
				alert('전화번호는 숫자로 3 ~4자입니다');
  	   		    $("#tel2").focus();
               return false;
           }
           if (!regtel3.test(tel3)){
				alert('전화번호는 숫자로 4자입니다');
  	   		    $("#tel3").focus();
               return false;
           }
       }
       
       form1.submit();
		
}//send






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
				<h2>회원정보입력</h2>
			</div>
			
			
			<form name="member_step3" method="POST" id="form1" action="/exam/admin/member_step3ok.action">
			
			<div id="joinBody">
			
				
				<h3>회원기본정보</h3><br />
			
				
				<table class="table">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name" value="" /></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td id="id_check_td"><input type="text" name="userID" id="userID" value="" onkeydown="check();" />
						<input type="button" name="ck_name" id="ck_name" value="ID중복검사" onClick="id_check(this.form.userID.value);"/>
						<span id="id_check_tag "></span></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="userPW" id="userPW" value="" /></td>
					</tr>
					<tr>
					<th>성별</th>
						<td><input type="radio" name="gender" id="male" value="m"  onclick="change();" checked="checked"> 남자
							<input type="radio" name="gender" id="female" value="f" onclick="change();"> 여자</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><select name="tel1" id="tel1" style="width:120px; height: 24px;">
							<option value="011" >011</option>
							<option value="010" >010</option>
							<option value="017" >017</option>
							<option value="019" >019</option>
						</select>
						 - <input type="text" maxlength="4" name="tel2" id="tel2" />
						 - <input type="text" maxlength="4" name="tel3" id="tel3" /></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="date" name="birth" id="birth" /></td>
					</tr>
					<tr>
						<th>자택주소</th>
						<td><input type="text" name="address" id="address" style="width:420px;" required="required"/></td>
					</tr>
					<tr>
						<th>email</th>
						<td><input type="email" name="email" id="email" required="required"></td>
					</tr>
					<!-- <tr>
						<th>사진</th>
						<td></td>
					</tr> -->
					<tr>
						<th>자기소개</th>
						<td><textarea rows="5" cols="50" name="userProduce" id="userProduce" ></textarea></td>
					</tr>
					<tr>
						<th>수신여부</th>
						<td><input type="checkbox" name="smsCheck" id="smsCheck" value="s" > sms 수신동의
						<input type="checkbox" name="emailCheck" id="emailCheck" value="e" > 이메일 수신동의
						<input type="checkbox" name="messageCheck" id="messageCheck" value="m" >쪽지 수신동의
						</td>
					</tr>
				</table>	

				<br />
					
			
			
		
		
	
		
		<div id="btn"> 
					
			<input type="button" class="btn btn-default" name="cancelbtn" id="cancelbtn" value="이전단계" onClick="location.href='/exam/admin/member_step2.action'" style="cursor:pointer"/>
			&nbsp;<input type="submit" class="btn btn-success" name="nextbtn" id="nextbtn" value="가입하기" onClick="send();" style="cursor:pointer" disabled="disabled"/>						
		</div>
	</form>	
			
		
		</div>
	
	</div><!-- 본문블럭 끝-->
	
</div>
<!-- Container 끝 -->



</body>
</html>