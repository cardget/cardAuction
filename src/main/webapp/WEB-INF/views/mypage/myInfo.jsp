<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div class="basicInfo">
		<h3 class="grayfont">ⓘ 기본정보</h3>
		<c:choose>
			<c:when test="${empty user.profile_image}">
				<img src="${path}/resources/images/default/defaultprofile.png"
					alt="프로필이미지" height="150">
			</c:when>
			<c:otherwise>
				<img src="${user.profile_image}" alt="프로필이미지" height="150">
			</c:otherwise>
		</c:choose>
		<h2>${user.nickname}</h2>
		<p class="grayfont">${user.user_id}</p>
		<hr class="grayfont">
		<img src="${path}/resources/icon/phone.png" alt="핸드폰아이콘" height=20
			class="info">
		<h3 class="info">${user.phone_number}</h3><br/>
		 <img src="${path}/resources/icon/mail.png" alt="이메일아이콘"
			height=20 class="info">
		<h3 class="info">${user.email}</h3>
		<hr class="grayfont">
		<img src="${path}/resources/icon/location.png" alt="주소아이콘"
			class="info">
		<h3 class="info">${user.address} ${user.address_detail}</h3><br /> 
		<!--  
		<img src="${path}/resources/icon/account.png" alt="계좌아이콘"
			height=20 class="info">
		<h3 class="info">${user.bank} ${user.accnt}</h3>
		-->
		<h3 class="grayfont">알림 서비스 수신 동의</h3>
		<div id="auctionAlarm">
		<!--  
			<div class="alarmSetting">
				<div>
					<img src="${path}/resources/icon/phone.png" alt="핸드폰아이콘" height=20
						class="info">
					<h3 class="info">휴대전화</h3>
				</div>
				<div class="slider-button">
					<label class="switch"> <input class="alarm" type="checkbox"
						<c:if test="${user.phone_agreement == 1}">
	                                        checked="checked"
	                                    </c:if>>
						<span class="slider round"></span>
					</label>
				</div>
			</div>
			<hr>
		-->
			<div class="alarmSetting">
				<div>
					<img src="${path}/resources/icon/mail.png" alt="메일아이콘" height=20
						class="info">
					<h3 class="info">이메일</h3>
				</div>
				<div class="slider-button">
					<label class="switch"> <input class="alarm" type="checkbox"
						<c:if test="${user.email_agreement == 1}">
	                                        checked="checked"
	                                    </c:if> disabled>
						<span class="slider round"></span>
					</label>
				</div>
			</div>
		</div>
		<div class="button-section">
			<button class="revision">수정</button>
		</div>
	</div>
</body>
</html>
