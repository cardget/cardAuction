<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드득 신규 가입 페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
<link rel="stylesheet" href="${path}/resources/css/signUp.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../resources/js/signUp.js"></script>

</head>
<body>
	<div style="text-align: left; position: relative; margin-bottom: 30px">
	    <img src="../resources/images/로고 이미지.png" alt="로고" class="logo-img">
        <h1 class="logo-text">카드득</h1>
	    <h5 style="position: absolute; left: 155px; top: 25px; margin: 0;">회원 가입</h5>
	</div>
	
    <div class="container">
        <h4>약관 동의</h4>
        <div style="background-color: #F8F9FC; padding: 20px; border-radius: 5px; height: 150px;">
		    <label>
		        <input type="checkbox" name="allAgree"> <strong>필수 약관 전체 동의</strong>
		    </label>
		    <hr>
		    <label style="display: block; margin-top:20px; margin-bottom: 13px;">
		        <input type="checkbox" name="termsAgree"> <span style="color: blue;">[필수]</span> 이용약관 --- <a href="#">보기</a>
		    </label>
		    <label style="display: block; margin-bottom: 13px;">
		        <input type="checkbox" name="privacyAgree"> <span style="color: blue;">[필수]</span> 개인정보 수집 및 이용안내 --- <a href="#">보기</a>
		    </label>
		    <label style="display: block; margin-bottom: 13px;">
		        <input type="checkbox" name="usageAgree"> <span style="color: blue;">[필수]</span> 개인정보 활용 동의 --- <a href="#">보기</a>
		    </label>
		</div>

        
        <h4>회원정보 입력</h4>
        <hr style="border: 1px solid blue;">
        <form class="custom-form">
            <div class="form-group">
                <label for="username" class="input-label">아이디</label>
                <input type="text" id="username" name="username" placeholder="shinhanDS03" required class="input-field" style="background-color: #F8F9FC;">
                <button id="IDDupCheck" class="check-button">중복확인</button>
            </div>
            <hr class="form-divider">
            <div class="form-group">
                <label for="password" class="input-label">비밀번호</label>
                <input type="password" id="password" name="password" placeholder="●●●●●●●●●●" required class="input-field" style="background-color: #F8F9FC;">
            </div>
            <hr class="form-divider">
            <div class="form-group">
                <label for="confirmPassword" class="input-label">비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="●●●●●●●●●●" required class="input-field" style="background-color: #F8F9FC;">
            </div>
            <hr class="form-divider">
            <div class="form-group">
                <label for="nickname" class="input-label">닉네임</label>
                <input type="text" id="nickname" name="nickname" placeholder="로로뽀" required class="input-field" style="background-color: #F8F9FC;">
                <button class="check-button">중복확인</button>
            </div>
            <hr class="form-divider">
            <div class="form-group">
                <label for="email" class="input-label">이메일</label>
                <input type="email" id="email" name="email" required class="email-input-field" style="background-color: #F8F9FC;">
                <span>@</span>
                <input type="text" id="domain" name="domain" required class="email-input-field" style="background-color: #F8F9FC;">
                &nbsp;
                <select class="email-select" name="emailList" size="1" onchange="return checkEmail()">
                    <option value="" >직접 입력</option>
                    <option value="naver.com">naver.com</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="nate.com">nate.com</option>
                </select>
            </div>
            <hr class="form-divider"> 
           <div class="form-group address-group">
			    <label for="address" class="input-label">주소</label>
			    <div class="address-container">
			        <input type="text" id="sample6_postcode" placeholder="우편번호" class="input-field" style="background-color: #F8F9FC;">
			        <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" class="check-button">
			    </div>
			    <div class="address-fields">
			        <input type="text" id="sample6_address" name="address" placeholder="도로명 주소 (지번 주소)" class="input-field" style="background-color: #F8F9FC;">
			        <input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="상세 주소" class="input-field" style="background-color: #F8F9FC;">
			    </div>
			</div>
			
            <hr class="form-divider">
            <div class="form-group">
                <label for="profileImage" class="input-label">프로필 이미지 등록</label>
                <div class="profile-image-container">
                    <img id="profile-image" src="../resources/images/기본 이미지.png" alt="Profile Image">
                </div>
                <input type="file" id="profileImage" name="profileImage" onchange="previewImage(this)" accept="image/* class="input-field" style="background-color: #F8F9FC;">
                <button type="button" onclick="restProfileImage()" class="check-button">삭제</button>
            </div>
            
            <hr class="form-divider">
            <div class="form-group">
			    <label class="input-label">알림 서비스</label>
			    <div class="notification-options">
			        <div class="notification-option">
			            <label class="phone-notification">휴대폰 알림 수신</label>
			            <label><input type="radio" name="phone-notification-choice" class="phone-agree"> 동의</label>
			            <label><input type="radio" name="phone-notification-choice" class="phone-disagree"> 비동의</label>
			        </div>
			        <div class="notification-option">
			            <label class="email-notification">이메일 알림 수신</label>
			            <label><input type="radio" name="email-notification-choice" class="email-agree"> 동의</label>
			            <label><input type="radio" name="email-notification-choice" class="email-disagree"> 비동의</label>			            
			        </div>					       
			    </div>
			    <p class="noti-info-text">※ 알림 서비스에 동의하시면 인기 경매 물품과 회원님의 관심 정보와 관련된 알람을 보내드립니다.<br>가입 후 마이페이지에서 수신 동의 여부를 변경하실 수 있습니다.</p>
			    
			</div>
            <hr class="form-divider">
            <div class="form-group">
                <label for="phone" class="input-label">휴대전화</label>
                <button class="check-button">간편 인증하기</button>
            </div>
            <hr class="form-divider">
            <br>
            <button type="submit" class="submit-button">회원가입하기</button>
        </form>
    </div>
</body>
</html>
