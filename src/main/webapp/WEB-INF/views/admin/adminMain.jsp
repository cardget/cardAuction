<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/adminMain.css">

	<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="sidebar">
			<div class="logo">
				<img src="${path}/resources/image/logo.png" alt="로고이미지" height=41 onclick="location.href='../main.do'">
				<h1>관리자페이지</h1>
			</div>		
			
			<div class="sidemenu">
				<ul>
					<li><a href="adminMain.do" class="selected">회원관리</a></li>
					<li><a href="insertPCard.do">포켓몬DB추가</a></li>
					<li><a href="insertYCard.do">유희왕DB추가</a></li>
					<li><a href="insertDCard.do">디지몬DB추가</a></li>
					<li><a href="insertOCard.do">원피스DB추가</a></li>
					<li><a href="manageDelivery.do">배송관리</a></li>
				</ul>
			</div>
			<hr class="grayfont" style="margin-top: 20px; margin-bottom: 20px;">
			<h2>${user.nickname}</h2>
			<div class="bottom-div">
				<div>
					<a href="../auth/logout.do" class="grayfont">로그아웃</a> 					
				</div>
			</div>
		</div>
		<div class="main">
			<div class="main-header">			
				
			</div>
			<div class="content">
				<div class="basicInfo">
					<h3 class="grayfont">ⓘ 기본정보</h3>					
					
					<hr class="grayfont">					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
