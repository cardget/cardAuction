<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${path}/resources/css/header.css">
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
<div class="top">
	<nav class="top-nav">
		<a href="main.html" class="top-title"> <img
			src="${path }/resources/image/logo.png" alt="logo"
			class="logo">
		</a>
		<div class="main-category">
			<ul class="main-category-box">
				<li class="main-category-item"><a
					href="auction/auctionPMain.do">포켓몬</a></li>
				<li class="main-category-item"><a
					href="auction/auctionYMain.do">유희왕</a></li>
				<li class="main-category-item"><a
					href="auction/auctionDMain.do">디지몬</a></li>
				<li class="main-category-item"><a
					href="auction/auctionOMain.do">원피스</a></li>
				<li class="main-category-item"><a
					href="auction/auctionSMain.do">스포츠</a></li>
			</ul>
		</div>
		<div class="top-nav-category">
			<ul class="category-box">
				<li class="category-item"><a href="auth/login.do"> <img
						src="${path}/resources/icon/logout.png" class="icon">로그인
				</a></li>
				<li class="category-item"><a href="auth/signUp.do"> <img
						src="${path}/resources/icon/logout.png" class="icon">회원가입
				</a></li>
			</ul>
		</div>
	</nav>
</div>