<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.servletContext.contextPath }"></c:set>
<meta charset="UTF-8">
<title>카드득 신규 가입 페이지test</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../resources/css/signUp.css">
<script src="../resources/js/signUp.js"></script>
</head>
<body>
	<div style="text-align: left; position: relative; margin-bottom: 30px">
	    <img src="../resources/images/로고 이미지.png"
	        style="width: 50px; height: 50px; display: inline-block; vertical-align: middle;">
	    <h1 style="color: #F8C501; display: inline-block; vertical-align: middle; margin: 0; position: relative;">카드득</h1>
	    <h5 style="position: absolute; left: 155px; top: 25px; margin: 0;">회원 가입</h5>
	</div>
	
	<h4>약관 동의</h4>
	<div style="background-color: #F8F9FC; padding: 20px; border-radius: 5px; height: 150px;">
	    <label>
	        <input type="checkbox" name="allAgree"> <strong>필수 약관 전체 동의</strong>
	    </label>
	    <hr>
	    <label style="display: block; margin-top:20px; margin-bottom: 13px;">
	        <input type="checkbox" name="termsAgree"> <span style="color: blue;">[필수]</span> 이용약관 --- 보기
	    </label>
	    <label style="display: block; margin-bottom: 13px;">
	        <input type="checkbox" name="privacyAgree"> <span style="color: blue;">[필수]</span> 개인정보 수집 및 이용안내 --- 보기
	    </label>
	    <label style="display: block; margin-bottom: 13px;">
	        <input type="checkbox" name="usageAgree"> <span style="color: blue;">[필수]</span> 개인정보 활용 동의 --- 보기
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
        <select class="email-select" name="emailList" size="1" onchange="return checkEmail()">
            <option value="" >직접 입력</option>
            <option value="naver.com">naver.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="daum.net">daum.net</option>
            <option value="nate.com">nate.com</option>
        </select>
    </div>
    <hr class="form-divider">
    <div class="form-group">
        <label for="address" class="input-label">주소</label>
        <input type="text" id="sample6_postcode" placeholder="우편번호" style="background-color: #F8F9FC;">
        <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="background-color: white;">
        <br>
        <input type="text" id="sample6_address" name="address" placeholder="주소" style="background-color: #F8F9FC; margin-top: 5px;">
        <br>
        <input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소" style="background-color: #F8F9FC; margin-top: 5px;">
    </div>
    <hr class="form-divider">
    <div class="form-group">
        <label for="profileImage" class="input-label">프로필 이미지 등록</label>
        <div class="profile-image-container">
            <img id="profile-image" src="../resources/images/기본 이미지.png" alt="Profile Image">
        </div>
        <input type="file" id="profileImage" name="profileImage" class="input-field" style="background-color: #F8F9FC;">
        <button type="button" onclick="restProfileImage()" class="check-button">삭제</button>
    </div>
    <hr class="form-divider">
    <div class="form-group">
        <label class="input-label">알림 서비스</label>
        <label><input type="checkbox" checked> 수신</label>
        <label><input type="checkbox"> 수신 거부</label>
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




</body>

</html>