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
<script>

</script>
</head>
<body>
	<div class="container">
        <form class="custom-form" method="post" action="editProfile.do" enctype="multipart/form-data">
        	<div class="form-group">
			    <label for="profile_image" class="input-label">프로필 이미지</label>
			    <div class="profile-image-container">
			    	<c:choose>
						<c:when test="${empty user.profile_image}">
							<img id="profile-image" src="${path}/resources/image/profile.png" alt="Profile Image" onclick="document.getElementById('profile_image').click()">
						</c:when>
						<c:otherwise>
							<img id="profile-image" src="${user.profile_image}" alt="프로필이미지" onclick="document.getElementById('profile_image').click()">
						</c:otherwise>
					</c:choose>
			    </div>
			    <input type="file" id="profile_image_id" name="profile_image_name" onchange="previewImage(this, '${path}')" accept="image/*" class="input-field" style="margin-left:10px;" multiple>
			    <button type="button" onclick="resetProfileImage('profile-image', '${path}')" class="check-button">삭제</button>
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
                <label for="bank" class="input-label">계좌</label>
                <input type="hidden" id="bank" name="backHidden" value="${user.bank}" class="email-input-field" required>
                <select class="email-select" name="bank" size="1">
		            <option value="신한" ${user.bank eq '신한' ? 'selected' : ''}>신한</option>
				    <option value="국민" ${user.bank eq '국민' ? 'selected' : ''}>국민</option>
				    <option value="우리" ${user.bank eq '우리' ? 'selected' : ''}>우리</option>
				    <option value="하나" ${user.bank eq '하나' ? 'selected' : ''}>하나</option>
		        </select>
		        &nbsp;
                <input type="text" id="accnt" name="accnt" required value="${user.accnt}" class="email-input-field"><br>
                <p class="noti-info-text">※ 물품 판매 대금 정산을 위해선 필수입니다.</p>
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
