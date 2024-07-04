<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/adminMain.css">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<c:choose>
	<c:when test="${empty dlist}">
		<div class="item-section">
			<div class="info-section">
				<h3>배송 중인 상품이 없습니다</h3>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<c:forEach var="delivery" items="${dlist}">
			<div class="item-section">
				<div class="image-section">
					<img src="${delivery.image1}" alt="Product Image">
				</div>
				<div class="info-section">
					<h3>${delivery.item_name}</h3>
					<p>구매자 : ${delivery.user_id}</p>
					<p>
						${empty delivery.invoice_number ? '송장 미등록' : '송장 번호 : ' + delivery.invoice_number}
					</p>
				</div>
				<div class="status-section">
					<button class="${empty delivery.invoice_number ? 'status-button-sold' : 'status-button-proceeding'}"
						onclick="location.href=`/myapp/admin/updateInvoice.do?deliveryId=${delivery.delivery_id}`">
						${empty delivery.invoice_number ? '송장 등록' : '송장 편집'}
					</button>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>
</body>
</html>