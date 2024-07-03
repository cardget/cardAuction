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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="sidebar">
			<div class="logo">
				<img src="${path}/resources/image/logo.png" alt="로고이미지" height=41 onclick="location.href='../main.do'">
				<h1>관리자페이지</h1>
			</div>		
			<div class="sidemenu">
				<ul>
					<li><a href="manageUser.do">회원관리</a></li>
					<li><a href="insertPCard.do">포켓몬DB추가</a></li>
					<li><a href="insertYCard.do">유희왕DB추가</a></li>
					<li><a href="insertDCard.do">디지몬DB추가</a></li>
					<li><a href="insertOCard.do">원피스DB추가</a></li>
					<li><a href="manageDelivery.do" class="selected">배송관리</a></li>
				</ul>
			</div>
			<hr class="grayfont" style="margin-top: 20px; margin-bottom: 20px;">
			<h2>${user.nickname}</h2>
			<div class="bottom-div">
				<div>
					<a href="../auth/logout.do" class="grayfont">로그아웃</a> 					
				</div>
			</div>
		</div>
		<div class="main">
			<div class="main-header">			
				
			</div>
			<div class="content">
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
			</div>
		</div>
	</div>
</body>
</html>