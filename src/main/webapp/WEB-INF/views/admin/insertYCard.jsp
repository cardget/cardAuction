<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드 등록 페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/adminMain.css"><link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${path}/resources/js/signUp.js"></script>

</head>
<body>
<div class="container">
		<div class="sidebar">
			<div class="logo">
				<img src="${path}/resources/image/logo.png" alt="로고이미지" height=41 onclick="location.href='../main'">
				<h1>관리자페이지</h1>
			</div>		
			<div class="sidemenu">
				<ul>
					<li><a href="adminMain.do">회원관리</a></li>
					<li><a href="insertPCard.do">포켓몬DB추가</a></li>
					<li><a href="insertYCard.do" class="selected">유희왕DB추가</a></li>
					<li><a href="insertDCard.do">디지몬DB추가</a></li>
					<li><a href="insertOCard.do">원피스DB추가</a></li>
					<li><a href="manageDelivery.do">배송관리</a></li>
				</ul>
			</div>
			<hr class="grayfont" style="margin-top: 20px; margin-bottom: 10px;">
			<div class="bottom-div">
				<div>
					<a href="../auth/logout" class="grayfont">로그아웃</a> 					
				</div>
			</div>
		</div>
		<div class="main">
			<div class="main-header">			
				
			</div>
			<div class="content">
			    <div class="basicInfo">
			        <h3 class="grayfont">ⓘ 유희왕 카드 등록</h3>
			        <hr class="grayfont">  
					<form action="${path}/admin/insertYugiohCard.do" method="post" enctype="multipart/form-data">
				        <div class="form-group">
				            <label for="yugioh_card_name" class ="input-label" >카드 이름:</label>
				            <input type="text" id="yugioh_card_name" name="card_name" class="input-field" required>
				        </div>
				        <div class="form-group">
				            <label for="yugioh_card_sort" class ="input-label">카드 종류:</label>
				            <input type="text" id="yugioh_card_sort" name="card_sort" class="input-field" required>
				        </div>
				        <div class="form-group">
				            <label for="yugioh_card_attr" class ="input-label">카드 속성:</label>
				            <input type="text" id="yugioh_card_attr" name="card_attr" class="input-field">
				        </div>
				        <div class="form-group">
				            <label for="yugioh_card_type" class ="input-label">카드 레벨:</label>
				            <input type="text" id="yugioh_card_level" name="card_level" class="input-field">
				        </div>
				        <div class="form-group">
				            <label for="yugioh_card_type" class ="input-label">카드 타입:</label>
				            <input type="text" id="yugioh_card_type" name="card_type" class="input-field">
				        </div>
				        <div class="image-container">
				            <img id="yugioh-image" src="${path}/resources/image/profile.png" alt="Yugioh Image" onclick="document.getElementById('yugioh_image_id').click()">
				        </div>
				        <input type="file" id="yugioh_image_id" name="yugioh_card_image" onchange="previewImage(this, 'yugioh-image')" accept="image/*" class="input-field" style="margin-left:10px;" multiple required>
				        <button type="button" onclick="resetProfileImage('yugioh-image', '${path}')" class="check-button">삭제</button>
			           	<br>
			            <button type="submit" class="submit-button disabled-button">등록하기</button>
			        </form>
			    </div>
			</div>
		</div>
	</div>
</body>
</html>