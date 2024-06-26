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
	<div class="header">
		<h2>입찰내역</h2>
		<a href="#" class="grayfont">전체삭제</a>
	</div>
	<c:forEach var="bids" items="${bids}">
		<div class="item-section">
			<div class="image-section">
				<img src="${bids.image1}" alt="Product Image">
			</div>
			<div class="info-section">
				<h3>${bids.item_name}</h3>
				<p>입찰시간: ${bids.bid_time}</p>
				<p class="enddate">종료일자: ${bids.end_date}</p>
				<a href="../auction/auctionDetail?item_id=${bids.item_id}" class="grayfont">상세보기 ></a>
			</div>
			<div class="status-section">
				<c:set var="endDate" value="${bids.end_date}" />
				<c:choose>
					<c:when test="${now gt endDate && bids.is_win == 1}">
						<button class="status-button-winning">낙찰!</button>
					</c:when>
					<c:when test="${now gt endDate && bids.is_win == 0}">
						<button class="status-button-sold">종료됨</button>
					</c:when>
					<c:otherwise>
						<button class="status-button-proceeding">진행중</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</c:forEach>
</body>
</html>
