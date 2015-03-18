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
	padding: 20px;
	border-bottom: 1px solid #ECECEC;

}

#joinSheet #joinBody {
	padding: 20px;
	

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
				<h2>서비스 약관 동의</h2>
			</div>
			
			
			<div id="joinBody">
			<form name="member_step2" method="GET" action="/exam/admin/member_step3.action">
				
				<h3>인터넷 홈페이지 서비스 이용약관</h3><br />
				<div>
				<textarea rows="7" cols="120" class="form-control" disabled="disabled">
1 . 수집하는 개인정보의 항목 및 수집방법
2 . 개인정보의 수집 및 이용목적
3 . 개인정보의 보유 및 이용기간

1. 수집하는 개인정보의 항목 및 수집방법

가. 수집하는 개인정보의 항목
회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다.

- 개인회원 : 성명, 주민등록번호, 외국인등록번호(국내거주 외국인에 한함), 아이디, 비밀번호, 이메일 주소, 
		전화번호, 휴대전화, 주소
- 기업회원 : 성명, 주민등록번호, 외국인등록번호(국내거주 외국인에 한함), 아이디, 비밀번호, 이메일 주소, 
		전화번호, 휴대전화, 주소, 회사(상호)명, 사업자 등록번호, 대표자 성명, 업종, 업태 또한 
		서비스 이용과정이나 사업 처리 과정에서 아래와 같은 정보들이생성되어 수집될 수 있습니다.
- 이용자의 브라우저 종류 및 OS, 검색어, 서비스 이용 기록
- IP Address, 방문 일시, 서비스 이용기록, 불량 이용 기록
- 주소, 결제기록, 세션
				</textarea>
				</div><br />
				 <input type="checkbox" name="ckb" id="ckb" /><label for="ckb">&nbsp;개인정보의 수집 및 이용목적에 동의합니다.</label>	
				
				<br /><br /><br />
				
				<h3>개인정보취급방침</h3><br />				
				<div>
				<textarea rows="7" cols="120" class="form-control" disabled="disabled">
1 . 수집하는 개인정보의 항목 및 수집방법
2 . 개인정보의 수집 및 이용목적
3 . 개인정보의 보유 및 이용기간

1. 수집하는 개인정보의 항목 및 수집방법

가. 수집하는 개인정보의 항목
회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다.

- 개인회원 : 성명, 주민등록번호, 외국인등록번호(국내거주 외국인에 한함), 아이디, 비밀번호, 이메일 주소, 
		전화번호, 휴대전화, 주소
- 기업회원 : 성명, 주민등록번호, 외국인등록번호(국내거주 외국인에 한함), 아이디, 비밀번호, 이메일 주소, 
		전화번호, 휴대전화, 주소, 회사(상호)명, 사업자 등록번호, 대표자 성명, 업종, 업태 또한 
		서비스 이용과정이나 사업 처리 과정에서 아래와 같은 정보들이생성되어 수집될 수 있습니다.
- 이용자의 브라우저 종류 및 OS, 검색어, 서비스 이용 기록
- IP Address, 방문 일시, 서비스 이용기록, 불량 이용 기록
				</textarea>
				</div><br />
				<input type="checkbox"  name="ckb" id="ckb2" /><label for="ckb2">&nbsp;사이트이용약관에 동의합니다.</label>
				<br />
			
					
			
			</form>	
		
		</div><!-- //joinsheet -->
		
		<div id="btn"> 
					
			<input type="button" class="btn btn-default" name="cancelbtn" id="cancelbtn" value="돌아가기" onClick="location.href='/exam/home.action'" style="cursor:pointer"/>&nbsp;
			<input type="button" class="btn btn-primary" name="nextbtn" id="nextbtn" value="다음단계" onClick="Check(this.form);" style="cursor:pointer" />								
		
		</div>	
		
	</div>
	
	</div><!-- 본문블럭 끝-->
	
</div>
<!-- Container 끝 -->



</body>
</html>