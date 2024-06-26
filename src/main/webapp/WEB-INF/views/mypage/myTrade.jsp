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
		<h2>낙찰내역</h2>
		<a href="#" class="grayfont">거래완료 상품 일괄 삭제</a>
	</div>
	<c:choose>
		<c:when test="${empty tlist}">
			<div class="item-section">
				<div class="info-section">
					<h3>거래 품목이 없습니다</h3>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="trade" items="${tlist}">
				<div class="item-section">
					<div class="image-section">
						<img src="${trade.image1}" alt="Product Image">
					</div>
					<div class="info-section">
						<h3>${trade.item_name}</h3>
						<p>낙찰일자: ${trade.create_date}</p>
						<a href="../auction/auctionDetail.do?item_id=${trade.item_id}" class="grayfont">상세보기 ></a>
					</div>
					<div class="status-section">
						<c:choose>
							<c:when test="${empty trade.confirm_date}">
								<button class="status-button-winning">낙찰</button>
							</c:when>
							<c:otherwise>
								<button class="status-button-done">거래완료</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>
