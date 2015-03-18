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

#stepimg {
	width: 788px;
	margin-top: -20px;
	margin-left: -20px;
	margin-bottom: 20px;
	margin-right: 0px;
}
</style>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#mileagePoint").focus();
	
	var gender = "${dto.gender}";
	
	//alert(gender);
	
	
	if(gender == "m"){
			$("#male").attr("checked",true);
		}else{
			$("#female").attr("checked",true);
		} 

	var emailCheck = "${dto.emailCheck}";	
	var smsCheck = "${dto.smsCheck}";
	var messageCheck = "${dto.messageCheck}";
	
	if(emailCheck == "y"){
		$("#emailCheck").attr("checked", true);
		
	} 
	if(smsCheck == "y"){
		$("#smsCheck").attr("checked",true);
	} 
	if(messageCheck == "y") {
		$("#messageCheck").attr("checked", true);
	} 
	
	$("#memberPeriod").hide();


	
	var memberStateDIV = "${dto.memberStateDIV}";
	
	if(memberStateDIV.val() == "1"){
		$("#memberStateDIV").attr("checked",true);
	}else if(memberStateDIV.val() == "2"){
		$("#memberStateDIV").attr("checked",true);
	} else if(memberStateDIV.val() == "3"){
		$("#memberStateDIV").attr("checked",true);
	}
	
	
});

function membership_no() {
	$("#memberPeriod").hide();
}

function membership_yes() {
	$("#memberPeriod").show();
}


function send() {
		
	}//send
	
	

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

					<li class="side_select" onclick="location.href='#'">회원목록</li>
					<li onclick="location.href='#'">유료회원목록</li>
					<li onclick="location.href='#'">탈퇴회원목록</li>
					<li onclick="location.href='#'">쪽지관리</li>
					<li onclick="location.href='#'">SMS관리</li>
					<li onclick="location.href='#'">이메일발송</li>
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

					<form name="member_edit" method="POST"
						action="/exam/admin/member_editok.action?seq=${dto.seq}">

						<table class="table table-bordered">
							
							<tr>
								<th style="width: 120px;">아이디</th>
								<td>${dto.userID}</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="userPW" id="userPW" disabled="disabled" value="${dto.userPW}"/></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="name" id="name"
									value="${dto.name}" disabled="disabled"/></td>
							</tr>
							<tr>
								<th>포인트</th>
								<td><input type="text" name="mileagePoint" id="mileagePoint"
									value="${dto.mileagePoint}" /> 점</td>
							</tr>
<!-- 							<tr>
								<th>캐쉬</th>
								<td><input type="text" name="memberPrice" id="memberPrice"
									value="" /> 원</td>
							</tr> -->
							<tr>
								<th>성별</th>
								<td><input type="radio" name="gender" id="male" disabled="disabled">
									남자 <input type="radio" name="gender" id="female" disabled="disabled">
									여자</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" maxlength="4" name="tel1" id="tel1" disabled="disabled" value="${dto.tel1}"/>
								 - <input type="text" maxlength="4" name="tel2" id="tel2" disabled="disabled" value="${dto.tel2}"/>
								 - <input type="text" maxlength="4" name="tel3" id="tel3" disabled="disabled" value="${dto.tel3}"/></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="date" name="birth" id="birth" value="${dto.birth.substring(0,10)}" disabled="disabled"/></td>
							</tr>
							<tr>
								<th>자택주소</th>
								<td><input type="text" name="address" id="address"
									value="${dto.address}" disabled="disabled"/></td>
							</tr>
							<tr>
								<th>email</th>
								<td><input type="email" name="email" id="email"
									value="${dto.email}"  disabled="disabled"  required="required"></td>
							</tr>
							<tr>
								<th>사진</th>
								<td></td>
							</tr>
							<tr>
								<th>자기소개</th>
								<td><textarea rows="5" cols="50" name="userProduce"
										id="userProduce" disabled="disabled">${dto.userProduce}</textarea></td>
							</tr>
							<tr>
								<th>수신여부</th>
								<td><input type="checkbox"
									name="smsCheck" id="smsCheck" disabled="disabled"> sms 수신동의 <input type="checkbox" name="emailCheck"
									id="emailCheck" disabled="disabled"> 이메일 수신동의 <input
									type="checkbox" name="messageCheck" id="messageCheck" disabled="disabled"> 쪽지
									수신동의</td>
							</tr>
							<tr>
								<th>유료구분</th>
								<td><input type="radio" name="memberShip" id="memberShip" value="n" checked="checked" onclick="membership_no();">
								아니오(일반회원) <input type="radio" name="memberShip" id="memberShip" value="y" onclick="membership_yes();" >
									네(유료회원)</td>
							</tr>
							<tr id="memberPeriod">
								<th>유료회원기간</th>
								<td><input type="date" name="memberPeriodStart"id="memberPeriodStart" />
								 - <input type="date" name="memberPeriodEnd"  id="memberPeriodEnd"  /></td>
							</tr>
							<tr>
								<th>회원상태</th>
								<td><input type="radio" name="memberStateDIV" id="memberStateDIV" checked="checked" value="1" > 일반
								 <input type="radio" name="memberStateDIV" id="memberStateDIV" value="2" > 경고 
								 <input type="radio" name="memberStateDIV" id="memberStateDIV" value="3" > 차단 </td>
							</tr>
							
						</table>

						<br />
						<br />

						<div id="btn">
							<input type="submit" name="editbtn" id="editbtn" value="수정"
								onClick="send();" style="cursor: pointer" /> <input
								type="button" name="cancelbtn" id="cancelbtn" value="취소"
								onClick="history.back();" style="cursor: pointer" />
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