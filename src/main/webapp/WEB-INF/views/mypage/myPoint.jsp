<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
</head>
<body>
	<div>
		<div class="total-point">
			<h2>카드득 포인트</h2>
			<h1>${total}P</h1>
		</div>
		<div class="point-per-month">
			<div class="point-summary">
				<div>
					<p>구매 포인트</p>
					<p>${purchase}P</p>
				</div>
				<div>
					<p>판매 포인트</p>
					<p>${sales}P</p>
				</div>
				<div>
					<p>위로 포인트</p>
					<p>${sorry}P</p>
				</div>
				<div>
					<p>이벤트 포인트</p>
					<p>${event}P</p>
				</div>
				<div>
					<p>사용 포인트</p>
					<p>${used}P</p>
				</div>
			</div>
		</div>
	</div>
	<h2>포인트내역</h2>
	<c:forEach var="points" items="${points}">
		<div class="history-section">
			<p class="grayfont">${points.create_date}</p>
			<div class="point-detail">
				<c:choose>
					<c:when test="${points.is_add == 1}">
						<h3 class="point-status-blue">적립 +${points.amount}</h3>
					</c:when>
					<c:when test="${points.is_add == -1}">
						<h3 class="point-status-red">사용 -${points.amount}</h3>
					</c:when>
				</c:choose>
				<p>${points.cmt}</p>
			</div>
		</div>
	</c:forEach>
</body>
</html>