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
	
	<div id="header"><%@include file="/resources/inc/Admin-Menu.jsp" %></div>
	
	<!-- 컨테이너 시작 -->
	<div id="container">
	
		<div id="container_child">
		
			<!-- 사이드바 시작 -->	
			<div id="aside">
		
				<div id="side_menu">
					<ul>						
						<li class="side_select" onclick="location.href='/exam/admin/member_list.action'">회원목록</li>
						<li onclick="location.href='/exam/admin/membership_list.action'">유료회원목록</li>
						<li onclick="location.href='/exam/admin/unregister_list.action'">탈퇴회원목록</li>
						<li onclick="location.href='#'">쪽지관리</li>
						<li onclick="location.href='#'">SMS관리</li>
						<li onclick="location.href='#'">이메일발송</li>
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>서브메뉴제목</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='/exam/admin/home.action'" />  
						<input type="button" value="회원관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='/exam/admin/member_list.action'" />  
						<input type="button" value="회원정보수정" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				
					<form name="member_edit" method="POST" action="/exam/admin/member_editok.action?seq=${dto.seq}">

						<table class="table">
							
							<tr>
								<th style="width: 120px;">아이디</th>
								<td>${dto.userID}</td>
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
								<td>
									<input type="radio" name="memberStateDIV" id="memberStateDIV" checked="checked" value="1" > 일반
									<input type="radio" name="memberStateDIV" id="memberStateDIV" value="2" > 경고 
									<input type="radio" name="memberStateDIV" id="memberStateDIV" value="3" > 차단 
								</td>
							</tr>
							
						</table>
	
	
						<br />
						<br />
	
	
						<div id="btn">
							<input type="submit" name="editbtn" id="editbtn" value="수정" sonClick="send();" style="cursor: pointer" /> 
							<input type="button" name="cancelbtn" id="cancelbtn" value="취소" onClick="history.back();" style="cursor: pointer" />
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