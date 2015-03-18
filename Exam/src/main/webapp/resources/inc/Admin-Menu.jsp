<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- 상단 네비게이션바 시작 -->
	<div id="header_child">
	
		<div id="nav_title">
			<img id="header_logo" src="/exam/resources/images/admin_logo_chacol.png" onclick="location.href='/exam/home.action'"/>
			<span> <em>for </em>&nbsp;<strong>ADMIN</strong></span>
		</div>
		
		<c:if test="${!empty userSeq && memberState == '4'}">
		
			<div id="nav_bar">
				<ul>
					<li onclick="location.href='/exam/admin/member_list.action'">회원관리</li>
					<li onclick="location.href='/exam/admin/questionlist.action'">시험관리</li>
					<li onclick="location.href='/exam/admin/list.action'">게시판관리</li>
					<li onclick="location.href='/exam/admin/accountlist.action'">결재관리</li>
					<li onclick="location.href='/exam/auth/logout.action'">로그아웃</li>
				</ul>
			</div>
			
		</c:if>
		
	</div>
	<!-- 상단 네비게이션바 끝 -->