<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
</head>
<body>
	<div class="header">
		<h2>관심목록</h2>
		<a href="#" class="grayfont">전체삭제</a>
	</div>
	<c:forEach var="interests" items="${interests}">
		<div class="item-section">
			<div class="image-section">
				<img src="${interests.image1}" alt="Product Image">
			</div>
			<div class="info-section">
				<h3>${interests.item_name}</h3>
				<p>등록일자: ${interests.create_date}</p>
				<p class="enddate">종료일자: ${interests.end_date}</p>
				<a href="#" class="grayfont">상세보기 ></a>
			</div>
			<div class="status-section">
				<c:set var="endDate" value="${interests.end_date}" />
				<c:choose>
					<c:when test="${now le endDate}">
						<button class="status-button-proceeding">진행중</button>
					</c:when>
					<c:otherwise>
						<button class="status-button-sold">종료됨</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</c:forEach>
</body>
</html>
