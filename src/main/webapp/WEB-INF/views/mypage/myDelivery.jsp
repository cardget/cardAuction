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
<script>
	function openNew(url) {
		var popupWidth = 600;
		var popupHeight = 400;
		var left = (screen.width - popupWidth) / 2;
		var top = (screen.height - popupHeight) / 2;
		var popupFeatures = 'width=' + popupWidth + ',height=' + popupHeight
				+ ',top=' + top + ',left=' + left
				+ ',resizable=yes,scrollbars=yes';
		window.open(url, '_blank', popupFeatures);
	}
</script>
</head>
<body>
	<div class="header">
		<h2>배송조회</h2>
	</div>
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
						<p class="grayfont">${delivery.create_date}거래완료</p>
						<a href="#" class="grayfont">상세보기 ></a>
					</div>
					<div class="status-section">
						<c:choose>
							<c:when test="${empty delivery.invoice_number}">
								<button class="status-button-sold">
									배송 준비
								</button>
							</c:when>
							<c:otherwise>
								<button class="status-button-proceeding"
									onclick="openNew('https://tracker.delivery/#/:kr.epost/:${delivery.delivery_id}')">
									배송 조회
								</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
</body>
</html>
