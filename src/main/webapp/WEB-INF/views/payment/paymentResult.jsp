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
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>	
</head>
<body>
	<div class="container">
		<div class="payment-header">
			<h3>결제가 완료되었습니다.</h3>
		</div>
		<p>배송 진행 상황은 마이페이지 > <a href="/myapp/mypage/myDelivery.do">배송조회</a>에서 확인하실 수 있습니다.</p>
	</div>
</body>
</html>
