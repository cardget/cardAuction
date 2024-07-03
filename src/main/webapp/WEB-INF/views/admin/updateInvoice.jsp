<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<h3>송장번호 등록</h3>
		</div>
		<form action="updateInvoice.do" method="post">
			<div class="item-section">
				<div class="image-section">
					<img src="${delivery.image1}" alt="Product Image">
				</div>
				<div class="info-section">
					<h3 id="item-name">${delivery.item_name}</h3>
					<p>낙찰자: ${delivery.user_id}</p>
				</div>
			</div>
			<hr>
			<div class="trade-section">
				<div>
					<input type="hidden" value="${delivery.delivery_id}" name="deliveryId">
					<label for="invoiceNumber">송장번호</label>
					<div>
						<input type="text" class="point-used" name="invoiceNumber" value="${delivery.invoice_number}">
						<button class="btn-blue">등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
