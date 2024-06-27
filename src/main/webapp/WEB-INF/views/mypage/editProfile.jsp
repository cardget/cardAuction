<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/signUp.js"></script>

</head>
<body>
	<div class="container">
        <form class="custom-form" method="post" action="editProfile.do">
        	<div class="form-group">
                <label for="profileImage" class="input-label">프로필 이미지 등록</label>
                <div class="profile-image-container">
                	<c:choose>
						<c:when test="${empty user.profile_image}">
							<img id="profile-image" src="${path}/resources/images/기본 이미지.png" alt="Profile Image">
						</c:when>
						<c:otherwise>
							<img id="profile-image" src="${user.profile_image}" alt="프로필이미지">
						</c:otherwise>
					</c:choose>
                </div>
                <input type="file" id="profileImage" name="profileImage" onchange="previewImage(this)" accept="image/* class="input-field" value="${user.profile_image}">
                <button type="button" onclick="restProfileImage()" class="check-button">삭제</button>
            </div>
            <hr class="form-divider">
            <div class="form-group">
                <label for="username" class="input-label">아이디</label>
                <input type="text" id="username" name="username" value = "${user.user_id}" required class="input-field" disabled>
            </div>
            <hr class="form-divider">
            <div class="form-group">
                <label for="password" class="input-label">비밀번호</label>
                <input type="password" id="password" name="pw" value="${user.pw}" required class="input-field">
            </div>
            <p class="noti-info-text">※ 영문/숫자/특수문자를 2가지 이상 포함하여 6~12자로 작성해주세요. </p>
            <hr class="form-divider">
            <div class="form-group">
                <label for="confirmPassword" class="input-label">비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required class="input-field">
            </div>
            <hr class="form-divider">
            <div class="form-group">
		        <label for="nickname" class="input-label">닉네임</label>
		        <input type="text" id="nickname" name="nickname" value="${user.nickname }" required class="input-field" required>
		        <button type="button" class="check-button" id="checkNickname" onclick="f_checkNickname()">중복확인</button>
		    </div>
            <hr class="form-divider">
            <div class="form-group">
                <label for="email" class="input-label">이메일</label>
                <input type="text" id="email" name="email" required value="${localPart}" class="email-input-field">
                <span>@</span>
                <input type="text" id="domain" name="domain" required value="${domainPart}" class="email-input-field">
                &nbsp;
                <select class="email-select" name="emailList" size="1" onchange="checkEmail(this)">
		            <option value="">직접 입력</option>
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
			        <input type="text" id="sample6_postcode" name="zipCode" value="${user.zip_code}" class="input-field">
			        <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" class="check-button">
			    </div>
			    <div class="address-fields">
			        <input type="text" id="sample6_address" name="address" value="${user.address}" class="input-field">
			        <input type="text" id="sample6_detailAddress" name="detailAddress" value="${user.address_detail}" class="input-field">
			    </div>
			</div>
			<hr class="form-divider">
            <div class="form-group">
		        <label class="input-label">알림 서비스</label>
		        <div class="notification-options">
		            <div class="notification-option">
		                <label><input type="radio" name="email_agreement" value="1"
		                	<c:if test="${user.email_agreement == 1}">
							    checked
							</c:if>
		                > 동의</label>
		                <label><input type="radio" name="email_agreement" value="0" 
		                	<c:if test="${user.email_agreement == 0}">
							    checked
							</c:if>
		                > 비동의</label>                        
		            </div>                               
		        </div>
		        <br>
		        <p class="noti-info-text">※ 알림 서비스에 동의하시면 인기 경매 물품과 회원님의 관심 정보와 관련된 알람을 보내드립니다.</p>
		    </div>
            <div class=button-section>
            	<button type="submit" class="submit-button">수정완료</button>
            </div>
        </form>
    </div>
</body>
</html>
