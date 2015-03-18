<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="/resources/inc/Extend.jsp" %>
<style type="text/css">
	body {
		background-color: white;
	}
</style>
<script type="text/javascript">
	function selid() {
		var userId = $("#selid option:selected").val();
		window.opener.sendMeData(userId)
		window.close();
	}
	function sendid() {
		var name = $("#userId").val();
		$.ajax({
			type: "GET",
			url: "/exam/admin/searchidajax.action",
			data: "name=" + name,
			success: function(data) {
				var list = $.parseJSON(data);
				$("#selid").html("")
				for (var i=0; i<list.length; i++) {
					var item = list[i];
					$("#selid").attr("multiple", "multiple");
					$("#selid").attr("size", list.length+"");
					$("#selid").append("<option value='"+item.userId+"'>"+item.userId+"("+item.name+")</option>");
				}
			}
		});
	}
</script>
</head>
<body>
	<div>
		<span style="width: 100px;">
			<input type="text" id="userId" name="userId" class="form-control" style="display: inline-block; width: 180px;" required placeholder="이름을 입력해주세요"/>
		</span>
		<span style="width: 30px;">
			<input type="button" value=" 아이디 찾기 " class="btn btn-default" style="display: inline-block;" onclick="sendid()"/>
		</span>
	</div>
	<div>
		<select name="selid" id="selid" onchange="selid();" class="form-control">
			<option value="-1">아이디를 선택하세요.</option>
		</select>
	</div>
</body>
</html>