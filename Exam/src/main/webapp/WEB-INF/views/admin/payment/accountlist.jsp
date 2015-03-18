<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시험의 정석 | 관리자</title>
<%@include file="/resources/inc/Extend_Admin.jsp" %>
<script type="text/javascript">
	function add() {
		
		var bankName = $("#bankName").val();
		var bankNumber = $("#bankNumber").val();
		var bankRep = $("#bankRep").val();
		
		$.ajax({
			type: "POST",
			url: "/exam/admin/accountadd.action",
			data: "bankName="+bankName+"&bankNumber="+bankNumber+"&bankRep="+bankRep,
			success: function(data) {
				var data = $.parseJSON(data);
				
				if(data.count<=1) {
					$("#tblList").html("<tr><th>거래은행명</th><th>게좌번호</th><th>예금주</th><th>기능</th></tr><tr>"
							+ "<td>" + bankName + "</td>"
							+"<td>" + bankNumber + "</td>"
							+"<td>" + bankRep + "</td>"
							+"<td>"
							+"<input type='button' value=' 삭제 ' class='form-control' onclick=\"bankdel('"+ data.seq +"');\" />"
							+"</td>"
						 + "</tr>");
					$("#bankName").val("");
					$("#bankNumber").val("");
					$("#bankRep").val("");
				} else {
					$("#tblList").append("<tr>"
							+ "<td>" + bankName + "</td>"
							+"<td>" + bankNumber + "</td>"
							+"<td>" + bankRep + "</td>"
							+"<td>"
							+"<input type='button' value=' 삭제 ' class='form-control' onclick=\"bankdel('"+ data.seq +"');\" />"
							+"</td>"
						 + "</tr>");
					$("#bankName").val("");
					$("#bankNumber").val("");
					$("#bankRep").val("");
				}
			}
		});
	}
	
	function bankdel(seq) {
		
		var btn = event.srcElement;
		if (confirm("정말로 삭제하시겠습니까?"))	{
			$.ajax({
				type: "GET",
				url: "/exam/admin/accountdel.action",
				data: "seq=" + seq,
				success: function(count) {
					$(btn).parent("td").parent("tr").remove("tr");
					if (count==0)
						$("#tblList").append("<tr><td colspan='4' style='text-align: center'>계좌번호가 존재하지 않습니다.</td>	</tr>");
						
				}
			})
			
		}
	}
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
						<li class="side_select" onclick="location.href='/exam/admin/accountlist.action'">입금계좌관리</li>
						<li onclick="location.href='/exam/admin/listpayment.action'">결제요청목록</li>
						
					</ul>
				</div>
			
			</div>
			<script type="text/javascript" src="/exam/resources/dist/js/sidebar.js"></script>
			<!-- 사이드바 끝 -->
			
			<!-- 본문 시작 -->
			<div id="article">
			
				<div id="location">
					
					<h3>입금계좌관리</h3><!-- 본문 상단 제목 -->
					
					<!-- 본문 상단 우측 : 현재 위치 -->
					<span>
						<input type="button" value="홈" class="btn btn-xs btn-success" id="home-btn" onclick="location.href='#'" />  
						<input type="button" value="결재관리" class="btn btn-xs btn-primary" id="home-btn" onclick="location.href='/exam/admin/accountlist.action'" />  
						<input type="button" value="입금계좌관리" class="btn btn-xs btn-default" id="home-btn" onclick="location.href='#'" />
					</span>  
				
				</div>
				
				<div id="article-body">
				
				<!-- 본문 작성 영역 -->
				
					<table id="tblAdd" class="table table-striped">
						<tr>
							<th>거래은행명</th>
							<th>계좌번호</th>
							<th>예금주</th>
							<th>통장추가</th>
						</tr>
						<tr>
							<td>
								<input type="text" name="bankName" id="bankName" class="form-control" required/>
							</td>
							<td>
								<input type="text" name="bankNumber" id="bankNumber" class="form-control" required/>
							</td>
							<td>
								<input type="text" name="bankRep" id="bankRep" class="form-control" required/>
							</td>
							<td>
								<input type="button" value=" 등록 " class="btn btn-default" onclick="add();"/>
							</td>
						</tr>
					</table>
					
					<table id="tblList" class="table table-striped">
						<tr>
							<th>거래은행명</th>
							<th>게좌번호</th>
							<th>예금주</th>
							<th>기능</th>
						</tr>
						
						<c:if test="${list.size()>0}">
						<c:forEach items="${list}" var="dto">
						<tr>
							<td>${dto.bankName}</td>
							<td>${dto.bankNumber}</td>
							<td>${dto.bankRep}</td>
							<td>
								<input type="button" value=" 삭제 " class="form-control" onclick="bankdel('${dto.seq}')" />
							</td>
						</tr>
						</c:forEach>
						</c:if>
						<c:if test="${list.size()==0}">
							<tr>
								<td colspan="4" style="text-align: center">계좌번호가 존재하지 않습니다.</td>
							</tr>
						</c:if>
					</table>
					
				</div>
				
			</div>
			<!-- 본문 끝 -->
		
		</div>
	
	</div>
	<!-- 컨테이너 끝 -->
	
	
	<div id="footer"><div id="footer_child"><%@include file="/resources/inc/Copyright.jsp" %></div></div>
	
</body>
</html>