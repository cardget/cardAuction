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
	<!--  
	<div class="delivery-section">
		<h3>배송현황</h3>
		<img src="" alt="배송진행상황">
		<div class="status-table">
			<table>
				<thead>
					<tr>
						<th>날짜</th>
						<th>시간</th>
						<th>상품정보</th>
						<th>배송 진행상황</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2024-05-29</td>
						<td>14:24</td>
						<td>[포켓몬] 피카츄 일러스트레이터 카드 PSA 8 한정판</td>
						<td>상품이 접수되었습니다.</td>
					</tr>
					<tr>
						<td>2024-05-29</td>
						<td>15:24</td>
						<td>[포켓몬] 피카츄 일러스트레이터 카드 PSA 8 한정판</td>
						<td>상품이 배송중입니다.</td>
					</tr>
					<tr>
						<td>2024-05-29</td>
						<td>16:24</td>
						<td>[포켓몬] 피카츄 일러스트레이터 카드 PSA 8 한정판</td>
						<td>상품이 완료되었습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	-->
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
				<button class="status-button-proceeding"
					onclick="openNew('https://tracker.delivery/#/:kr.epost/:${delivery.delivery_id}')">
					배송조회</button>
			</div>
		</div>
	</c:forEach>
</body>
</html>
