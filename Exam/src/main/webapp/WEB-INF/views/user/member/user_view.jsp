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
h3 {
	font-size: 16px;
	font-weight: bold;
}

#btn {
	text-align: center;
}

#myPhoto { 
	margin: 20px 0px;
	padding: 50px;
	text-align: center;
	border-top: 1px dotted #DEDEDE;
}

#myInfoPaper{
	padding: 0px;
	text-align: center;
	
}

#myId {
	font-size: 33px;
	font-weight: bold;
	color: #565656;
}
#myInfoPaper p {
	font-size: 18px;
}


</style>
<script type="text/javascript">
	$(document).ready(function() {

		$("#userPW").focus();

		//alert(gender);

		var gender = "${dto.gender}";

		if (gender == "m") {
			$("#male").attr("checked", true);
		} else {
			$("#female").attr("checked", true);
		}

		var emailCheck = "${dto.emailCheck}";
		var smsCheck = "${dto.smsCheck}";
		var messageCheck = "${dto.messageCheck}";

		if (emailCheck == "y") {
			$("#emailCheck").attr("checked", true);

		}
		if (smsCheck == "y") {
			$("#smsCheck").attr("checked", true);
		}
		if (messageCheck == "y") {
			$("#messageCheck").attr("checked", true);
		}

		var memberShip = "${dto.memberShip}";

		if (memberShip == "y") {

			/* 		$("#memberShip").attr("value","유료회원"); */
			$("#memberShip").text(memberShip);
			/* $("#memberPeriod").show(); */

		} else if (memberShip == "n") {

			/* 		$("#memberShip").attr("value","일반회원"); */
			$("#memberShip").text(memberShip);
			/* $("#memberPeriod").hide(); */
		}

	});

	function send() {
		/* 유효성 검사*/

		// 사용자가 입력한 이름(문자열)
		var name = $("#name").val();

		if (name == "") {
			alert("이름을 입력하세요");
			$("#name").focus();
			return;
		}

		if (name.length<2 || name.length>5) {
			alert("이름은 2자~5자 이내로 입력하세요")
			$("#name").focus();
			return;
		}

		// 사용자가 입력한 ID & PW
		// 공백 유효성 검사
		var userID = $("#userID").val();

		if (userID == "") {
			alert("아이디를 입력하세요");
			$("#userID").focus();
			return;
		}

		var userPW = $("#userPW").val();

		if (userPW == "") {
			alert("패스워드를 입력하세요");
			$("#userPW").focus();
			return;
		}

		// 아이디 검사 4-10 자 사이의 숫자,문자만 허용

		var regexp = /^[a-z0-9]{4,10}$/;

		if (!regexp.test(form.userID.value)) {
			alert('아이디는 소문자와 숫자로 4 ~ 10자입니다.');
			$("#userID").focus();
			return false;
		}

		// 비밀번호 4 - 10 자 사이의 숫자,문자만 허용

		var regexp = /^[a-z0-9]{4,10}$/;

		if (!regexp.test(form.userPW.value)) {
			alert('비밀번호는 소문자 숫자로 4 ~10자입니다');
			$("#userPW").focus();
			return false;
		}

		// 전화번호 두번째 자리는 3~4자리 숫자
		// 세번째 자리는 4자리 숫자

		var regtel = /^01[016789]-\d{3,4}-\d{4}$/;
		var tel1 = $("#tel1").val();
		var tel2 = $("#tel2").val();
		var tel3 = $("#tel3").val();

		if (tel1 != "") {
			if (!regtel.test(tel2)) {
				alert('전화번호는 숫자로 3 ~4자입니다');
				$("#tel2").focus();
				return false;
			}
			if (!regtel.test(tel3)) {
				alert('전화번호는 숫자로 4자입니다');
				$("#tel3").focus();
				return false;
			}
		}

		
		var password = "${dto.userPW}";
		
		if(userPW != password ) {
			
			alert("비밀번호를 확인하세요");
		} else {
			var form1 = document.getElementById("form1");
			form1.submit();
		}
			
		
		
	}//send

/* 	function checkPwd() {
		var userPW = "${dto.userPW}";
		var userPW_check = $("#userPW_check").val();
		if (userPW != userPW_check) {
			$("#userPW_check").style.color = "red";
			$("#userPW_check").innerHTML = "동일한 암호를 입력하세요.";
		} else {
			$("#userPW_check").style.color = "black";
			$("#userPW_check").innerHTML = "암호가 확인 되었습니다.";
		}

	} */
	
function del() {
		alert("삭제하시겠습니까");
		location.href="/exam/user/user_del.action?seq="+${dto.seq};	
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
					href="/exam/mypage/myinfo.action">마이페이지</a> &gt;
				<!-- 상단메뉴(카테고리) 제목과 해당 링크 수정 -->

				<a href="/exam/mypage/myinfo.action">회원정보보기</a>
				<!-- 해당페이지 제목(서브메뉴 제목) 과 해당 링크 수정 -->
			</div>

		</div>


		<!-- 본문블럭 시작-->
		<div id="mainBlock">

			<!-- 2. 사이드바 -->
			<div id="aside">

				<div id="side_title">마이페이지</div>
				<!-- 제작 페이지의 카테고리 제목 -->

				<div id="side_menu">
					<ul>
							
						<li class="side_select" onclick="location.href='/exam/mypage/myinfo.action'">회원정보보기</li>
						<li onclick="location.href='/exam/mypage/edit.action'">회원정보수정</li>
						<li onclick="location.href='/exam/admin/addms.action'">쪽지보내기</li>
						<li onclick="location.href='/exam/admin/getms.action'">받은 쪽지함</li>
						<li onclick="location.href='/exam/admin/setms.action'">보낸 쪽지함</li>
						<li onclick="location.href='/exam/user/listpayment.action'">결제하기</li>
						<li onclick="location.href='/exam/mypage/unregister.action'">회원 탈퇴</li>
					</ul>
				</div>
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>


			<!-- 3. 본문 -->
			<div id="content">

				<div id="content_title">회원정보보기</div>

				<div id="content_body">
				
					
					<table class="table " style="width:100%;margin:0px auto;">
						<tr>
							<td rowspan="10" style="width:180px;padding:15px 20px;"><img src="${dto.userImage}" /></td>
							<td colspan="2"><span id="myId">${dto.userID}</span></td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${dto.name}</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>${dto.birth.substring(0,10)}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${dto.address}</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${dto.tel1}. ${dto.tel2}. ${dto.tel3}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${dto.email}</td>
						</tr>
						<tr>
							<th>마일리지</th>
							<td>${dto.mileagePoint}</td>
						</tr>
						<tr>
							<th>수신설정</th>
							<td>
								<input type="checkbox" name="smsCheck" id="smsCheck" disabled="disabled"> sms 
								<input type="checkbox" name="emailCheck" id="emailCheck" disabled="disabled"> 이메일
								<input type="checkbox" name="messageCheck" id="messageCheck" disabled="disabled"> 쪽지
							</td>
						</tr>
						<tr>
							<th>유료구분</th>
							<td>
								<input type="radio" name="memberShip" id="memberShip" value="n" checked="checked" onclick="membership_no();"> 일반회원 
								<input type="radio" name="memberShip" id="memberShip" value="y" onclick="membership_yes();" > 유료회원
							</td>
						</tr>
					</table>
					<div style="border-top:1px solid #DEDEDE;margin-top: 10px;"></div>

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