<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${path}/resources/css/header.css">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
<div class="top">
	<nav class="top-nav">
		<a href="${path}/main" class="top-title"> 
			<img src="${path}/resources/image/logo.png" alt="logo" class="logo">
		</a>
		<div class="main-category">
			<ul class="main-category-box">
				<li class="main-category-item">
					<a href="${path}/auction/auctionMain">포켓몬</a>
				</li>
				<li class="main-category-item">
					<a href="${path}/auction/auctionYMain">유희왕</a>
				</li>
				<li class="main-category-item">
					<a href="${path}/auction/auctionDMain">디지몬</a>
				</li>
				<li class="main-category-item">
					<a href="${path}/auction/auctionOMain">원피스</a>
				</li>
				<li class="main-category-item">
					<a href="${path}/auction/auctionSMain">스포츠</a>
				</li>
				<li class="main-category-item">
					<a href="${path}/inquiry/InquirySelect">문의</a>
				</li>
			</ul>
		</div>
		<div class="top-nav-category">
			<ul class="category-box">
				<li class="category-item">
					<a href="/myapp/auth/login"> 
						<img src="${path}/resources/icon/logout.png" class="icon">
						로그인
					</a>
				</li>
				<li class="category-item">
					<a href="/myapp/auth/signUp">
						<img src="${path}/resources/icon/logout.png" class="icon">
						회원가입
					</a>
				</li>
			</ul>
		</div>
	</nav>
</div>