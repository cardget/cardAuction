<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/payment.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="payment-header">
			<h3>결제 결과</h3>
		</div>
		<div class="item-section">
			<div class="image-section">
				<img src="${trade.image1}" alt="Product Image">
			</div>
			<div class="info-section">
				<h3 id="item-name">${trade.item_name}</h3>
				<p>낙찰일: ${trade.create_date}</p>
			</div>
		</div>
		<div class="trade-section">
			<div>
				<p>낙찰금</p>
				<p>${trade.price} 원</p>
			</div>
			<div>
				<p>사용 포인트</p>
				<p>${payments.point} P</p>
			</div>
			<div>
				<p>잔여 포인트</p>
				<p>${remainingPoint} P</p>
			</div>
			<hr>
			<div>
				<p>최종결제금액</p>
				<div>
					<input type="number" class="total-payment" value="${trade.price}" disabled>
					<P>${trade.price - payments.point }원</P>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
