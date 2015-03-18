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
	text-align: right;
}

#stepimg {
	width: 788px;
	margin-top: -20px;
	margin-left: -20px;
	margin-bottom: 20px;
	margin-right: 0px;
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

				<a href="/exam/mypage/edit.action">회원정보수정</a>
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
							
						<li onclick="location.href='/exam/mypage/myinfo.action'">회원정보보기</li>
						<li class="side_select" onclick="location.href='/exam/mypage/edit.action'">회원정보수정</li>
						<li onclick="location.href='/exam/admin/addms.action'">쪽지보내기</li>
						<li onclick="location.href='/exam/admin/getms.action'">받은 쪽지함</li>
						<li onclick="location.href='/exam/admin/setms.action'">보낸 쪽지함</li>
						<li onclick="location.href='/exam/user/listpayment.action'">결제하기</li>
						<li onclick="location.href='/exam/mypage/unregister.action'">회원 탈퇴</li>
					</ul>
				</div>
			</div>
			<script type="text/javascript"
				src="/exam/resources/dist/js/sidebar.js"></script>


			<!-- 3. 본문 -->
			<div id="content">

				<div id="content_title">회원정보수정</div>
				<!-- 본문 상단의 타이틀(해당페이지 제목) -->

				<div id="content_body">
					<!-- #content_body 박스 : 이하 본문 작성하시면됩니다.  -->

					<form name="user_edit" id="form1" method="POST"
						action="/exam/user/user_editok.action?seq=${dto.seq}">

						<table class="table">

							<tr>
								<th style="width: 120px;" >아이디</th>
								<td><input type="text" name="userID" id="userID" value="${dto.userID}" readonly="readonly" disabled /></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="userPW" id="userPW"
									value="" /></td>
							</tr>
<!-- 							<tr>
								<th>비밀번호확인</th>
								<td><input type="password" name="userPW" id="userPW_check"
									onkeyup="checkPwd()" value="" />
									<div id="checkPwd">동일한 암호를 입력하세요.</div></td>
							</tr> -->
							<tr>
								<th>이름</th>
								<td><input type="text" name="name" id="name" value="${dto.name}" disabled /></td>
							</tr>
							<tr>
								<th>마일리지</th>
								<td>
									<input type="text" name="mileagePoint" id="mileagePoint" value="${dto.mileagePoint}"  disabled="disabled"/> 점
								</td>
							</tr>
							<!-- 							<tr>
								<th>캐쉬</th>
								<td><input type="text" name="memberPrice" id="memberPrice"
									value="" /> 원</td>
							</tr> -->
							<tr>
								<th>성별</th>
								<td>
									<input type="radio" name="gender" id="male" value="m" disabled="disabled"> 남자
									<input type="radio" name="gender" id="female" value="f"  disabled="disabled"> 여자
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<input type="text" maxlength="4" name="tel1" id="tel1" value="${dto.tel1}" /> - 
									<input type="text" maxlength="4" name="tel2" id="tel2" value="${dto.tel2}" /> - 
									<input type="text" maxlength="4" name="tel3" id="tel3" value="${dto.tel3}" />
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="date" name="birth" id="birth"
									value="${dto.birth.substring(0,10)}"  disabled="disabled" /></td>
							</tr>
							<tr>
								<th>자택주소</th>
								<td><input type="text" name="address" id="address"
									value="${dto.address}" /></td>
							</tr>
							<tr>
								<th>email</th>
								<td><input type="email" name="email" id="email"
									value="${dto.email}" required="required"></td>
							</tr>
							<tr>
								<th>사진</th>
								<td><input type="text" name="userImage" id="userImage" value="${dto.userImage}" /> </td>
							</tr> 
							<tr>
								<th>자기소개</th>
								<td><textarea rows="5" cols="50" name="userProduce"
										id="userProduce">${dto.userProduce}</textarea></td>
							</tr>
							<tr>
								<th>수신여부</th>
								<td>
									<input type="checkbox" name="smsCheck" id="smsCheck"> sms 수신동의 
									<input type="checkbox" name="emailCheck" id="emailCheck"> 이메일 수신동의 
									<input type="checkbox" name="messageCheck" id="messageCheck"> 쪽지 수신동의
								</td>
							</tr>
							<!-- 							<tr>
								<th>유료구분</th>
								<td><input type="radio" name="memberShip" id="memberShip" value="n" checked="checked" onclick="membership_no();">
								아니오(일반회원) <input type="radio" name="memberShip" id="memberShip_y" value="y" onclick="membership_yes();" >
									네(유료회원)</td>
							</tr> -->


<%-- 							<tr id="memberPeriod">
								<th>유료회원기간</th>
								<td><input type="date" name="memberPeriodStart"id="memberPeriodStart" value="${dto.memberPeriodStart.substring(0,10)}"/>
								 - <input type="date" name="memberPeriodEnd"  id="memberPeriodEnd" value="${dto.memberPeriodEnd.substring(0,10)}" /></td>
							</tr> --%>

						</table>

						<br /> <br />

						<div id="btn">
							<input type="submit" name="btn-submit" id="btn-submit" class="btn btn-success" value="수정"  /> 
							<input type="button" name="cancelbtn" id="cancelbtn" class="btn btn-default" value="취소" onClick="history.back();" style="cursor: pointer" /> 
						</div>





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