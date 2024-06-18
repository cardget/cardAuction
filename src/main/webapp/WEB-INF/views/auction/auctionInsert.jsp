<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
<link rel="stylesheet" href="${path }/resources/css/main.css" />
<link rel="stylesheet" href="${path }/resources/css/auctionInsert.css" />
<title>카드득</title>

<style>


</style>
</head>
<body>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<!--header-->
<%@ include file="/WEB-INF/views/main/header.jsp" %>
    
<!-- Body -->
<div class="container">
	
	<form action="${path}/auction/auctionInsert.do" class="insert-form" method="post">
		<div class="top-wrapper">
			<h1 class="top-item">포켓몬 카드 경매 등록</h1>
			<button type="submit" class="top-insert-btn">판매 글 작성</button>
		</div>
		<hr class="top-hr">
		
		
		
		<div class="input-container">
			<input type="text" id="title" class="input-field" placeholder="제목을 입력하세요" name="item_name">
			<label for="trade_type" class="radio-title">선호 거래 방식</label>
		    <input type="radio" id="status1" name="trade_type" value="1">
		    <label for="status1">상관없음</label>
		    
		    <input type="radio" id="status2" name="trade_type" value="2">
		    <label for="status2">직거래</label>
		    
		    <input type="radio" id="status3" name="trade_type" value="3">
		    <label for="status3">중개</label>
		    
		    
		    <select name="p_card_id" class="select-field-card">
				<option>뮤ex</option>
				<option>피카츄ex</option>
				<option>날뛰는우레ex</option>
				<option>뮤츠</option>
			</select>
		    
		</div>

		<div class="image-format">
			<img src="${path}/resources/icon/error.png" class="icon-error" alt="icon"> 실제 카드 이미지 1개 필수 ( 최대 5개 )
			<div class="input-container3">
				<label for="image-input" class="image-upload-label">물품 이미지 업로드</label>
				<input type="file" id="image-input" accept="image/*" multiple>
			</div>
			
		</div>
		<!-- 이미지 input-->
		
		<div class="image-preview-wrapper">
			<div class="default-image">
					<img src="${path}/resources/icon/camera.png" class="icon-camera">
					<b>0/5</b>
				</div>
			<div class="image-preview" id="image-preview"></div>
		</div>
		
		<!-- 나머지 input-->
		<div class="input-container">
			<label for="end_date">경매 종료 날짜 / 시간 </label>
			<input type="datetime-local" id="end_date" class="input-field-date" name="end_date" >
			
		</div>
		<div class="input-container">
			<label for="status">물품 상태</label>
			<select name="status" class="select-field-status">
				<option value="1">최상</option>
				<option>상</option>
				<option>중</option>
				<option>하</option>
			</select>
			
		</div>
		<div class="input-container">
			<label for="rarity">희귀도</label>
			<input type="text" id="rarity" class="input-field-rarity" name="rarity" >
		</div>
		<div class="input-container">
			<label for="min_price">유찰가</label>
			<input type="number" id="min_price" class="input-field-min-price" name="min_price"> 원
		</div>
		<div class="input-container2">
			<label for="cmt">물품 상세 설명</label><br>
			<textarea id="cmt" class="input-field-cmt" placeholder="물품에 대한 상세 정보를 입력하세요" name="cmt"></textarea>
		</div>
		
	</form>
	
	
	
	<!--footer-->
    <footer data-include-path="footer.html"></footer>
    <script type="module" src="${path}/resources/js/main.js"></script>
	
</div>

<script>
document.getElementById('image-input').addEventListener('change', function(event) {
	const imagePreview = document.getElementById('image-preview');
	imagePreview.innerHTML = '';
	const files = event.target.files;
	if (files.length > 5) {
		alert('최대 5개의 이미지만 업로드할 수 있습니다.');
		event.target.value = '';
		return;
	}
	for (let i = 0; i < files.length; i++) {
		const file = files[i];
		const reader = new FileReader();
		reader.onload = function(e) {
			const img = document.createElement('img');
			img.src = e.target.result;
			imagePreview.appendChild(img);
		}
		reader.readAsDataURL(file);
	}
});
</script>

</body>
</html>

