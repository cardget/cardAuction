<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 결과</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/payment.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>	
</head>
<body>
	<div class="container">
		<div class="trade-section">
			<div>
				<p>상품</p>
				<p>${itemName}</p>
			</div>
			<div>
				<p>사용 포인트</p>
				<p>${payment.point_used} P</p>
			</div>
			<hr>
			<div>
				<p>결제금액</p>
				<p>${payment.paid_amount}원</p>
			</div>
		</div>
	</div>
</body>
</html>
