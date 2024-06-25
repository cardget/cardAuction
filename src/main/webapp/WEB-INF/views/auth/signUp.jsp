<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드득 신규 가입 페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
<link rel="stylesheet" href="${path}/resources/css/signUp.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/signUp.js"></script>
<script src="${path}/resources/js/verificationSMS_API.js"></script>
<script src="${path}/resources/js/mapAPI.js"></script>
<script>
       
function f_checkUserId() {
    var userId = $("#user_id").val();
    $.ajax({
        url: "${path}/auth/checkUserId",
        type: "GET",
        data: { "userId": userId },
        success: function(isDuplicate) {
            if (isDuplicate > 0) {
                alert("이미 사용중인 아이디입니다.");
            } else {
                alert("사용 가능한 아이디입니다.");
            }
        },
        error:function(){
        	alert("error");
        }
    });
}

function f_checkNickname() {
    var nickname = $("#nickname").val();
    $.ajax({
        url: "${path}/auth/checkNickname",
        type: "GET",
        data: { "nickname": nickname },
        success: function(isDuplicate) {
            if (isDuplicate > 0) {
                alert("이미 사용중인 닉네임입니다.");
            } else {
                alert("사용 가능한 닉네임입니다.");
            }
        },
        error:function(){
        	alert("error");
        }
    });
}

</script>
</head>
<body>
	<div style="text-align: left; position: relative; margin-bottom: 30px">
	<div class="logo-container">
		<img src="${path}/resources/images/로고 이미지.png" alt="로고" class="logo-img">
        <h1 class="logo-text">카드득</h1>
	</div>	    
	    <h5 style="position: absolute; left: 430px; top: 25px; margin: 0;">회원 가입</h5>
	</div>
	
    <div class="container">
        <h4>약관 동의</h4>
        <div class="agree-container">
		    <label>
		        <input type="checkbox" id="agreeAll" name="allAgree" onclick="toggleAll()"> <strong>필수 약관 전체 동의</strong>
		    </label>
		    <hr>
		    <label style="display: block; margin-top:20px; margin-bottom: 13px;">
		        <input type="checkbox" name="termsAgree" id="agree1" class="agree"> <span style="color: blue;">[필수]</span> 이용약관  <a href="#" style="text-align: right;">보기</a>
		    </label>
		    <label style="display: block; margin-bottom: 13px;">
		        <input type="checkbox" name="privacyAgree" id="agree2" class="agree"> <span style="color: blue;">[필수]</span> 개인정보 수집 및 이용안내  <a href="#">보기</a>
		    </label>
		    <label style="display: block; margin-bottom: 13px;">
		        <input type="checkbox" name="usageAgree" id="agree3" class="agree"> <span style="color: blue;">[필수]</span> 개인정보 활용 동의  <a href="#">보기</a>
		    </label>
		</div>

        <h4>회원정보 입력</h4>
        <hr style="border: 1px solid blue; margin-bottom: 25px;">
        <form action="insertSignUp.do" class="custom-form" onsubmit="return validatePasswords()" method="post">
		    <div class="form-group">
		        <label for="user_name" class="input-label">이름</label>
		        <input type="text" id="user_name" name="user_name" required class="input-field">
		    </div> 
		    <hr class="form-divider">
		    <div>                
		        <div class="form-group">
		            <label class="input-label">전화번호</label>
		            <input type="text" id="phone_number" name="phone_number" class="input-field" required>
		            <button type="button" class="check-button" onclick="sendCode()">인증번호 발송</button>
		            <input type="tel" id="verificationCode" class="input-field" style="margin-left: 190px;" placeholder="인증번호 입력">
		            <button type="button" class="check-button" onclick="verifyCode()">확인</button>  
		            <p id="result"></p>            
		        </div>                
		    </div>          
		    <hr class="form-divider">      
		    <div class="form-group">
		        <label for="user_id" class="input-label">아이디</label>
		        <input type="text" id="user_id" name="user_id" class="input-field" required>
		        <button type="button" class="check-button" id="checkUserId" onclick="f_checkUserId()">중복확인</button>
		    </div>
		    <hr class="form-divider">
		    <div class="form-group">
		        <label for="pw" class="input-label">비밀번호</label>
		        <input type="password" id="pw" name="pw" placeholder="●●●●●●●●●●" required class="input-field" onkeyup="checkPasswordMatch()">
		    </div>
		    <p class="noti-info-text">※ 영문/숫자/특수문자를 2가지 이상 포함하여 6~12자로 작성해주세요. </p>
		    <hr class="form-divider">
		    <div class="form-group">
		        <label for="confirmPassword" class="input-label">비밀번호 확인</label>
		        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="●●●●●●●●●●" required class="input-field" onkeyup="checkPasswordMatch()">
		        <span id="passwordMessage" style="margin-left: 160px; margin-top: 8px; font-size: 10px;"></span>
		    </div>
		    <hr class="form-divider">
		    <div class="form-group">
		        <label for="nickname" class="input-label">닉네임</label>
		        <input type="text" id="nickname" name="nickname" placeholder="로로뽀" required class="input-field">
		        <button type="button" class="check-button" id="checkNickname" onclick="f_checkNickname()">중복확인</button>
		    </div>
		    <hr class="form-divider">
		    <div class="form-group">
		        <label for="email" class="input-label">이메일</label>
		        <input type="text" id="emailName" name="emailName" required class="email-input-field">
		        <span>@</span>
		        <input type="text" id="domain" name="domain" required class="email-input-field">
		        <select class="email-select" name="emailList" size="1" onchange="checkEmail(this)">
		            <option value="">직접 입력</option>
		            <option value="naver.com">naver.com</option>
		            <option value="gmail.com">gmail.com</option>
		            <option value="daum.net">daum.net</option>
		            <option value="nate.com">nate.com</option>
		        </select>
		    </div>
		    <!-- 이메일을 결합하여 숨겨진 필드에 저장 -->
            <input type="hidden" id="email" name="email">
		    
		    <hr class="form-divider"> 
		    <div class="form-group address-group">
		        <label for="address" class="input-label">주소</label>
		        <div class="address-container">
		            <input type="text" id="sample6_postcode" name="zip_code" placeholder="우편번호" class="input-field">
		            <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" class="check-button">
		        </div>
		        <div class="address-fields">
		            <input type="text" id="sample6_address" name="address" placeholder="도로명 주소 (지번 주소)" class="input-field">
		            <input type="text" id="sample6_detailAddress" name="address_detail" placeholder="상세 주소" class="input-field">
		        </div>
		    </div>
		    <hr class="form-divider">
		    <div class="form-group">
		        <label for="profile_image" class="input-label">프로필 이미지 등록</label>
		        <div class="profile-image-container">
		            <img id="profile-image" src="${path}/resources/images/기본 이미지.png" alt="Profile Image">
		        </div>
		        <input type="file" id="profile_image" name="profile_image" onchange="previewImage(this)" accept="image/*" class="input-field" style="margin-left:10px;">
		    	<button type="button" onclick="restProfileImage()" class="check-button">삭제</button>
		    </div>
		    <hr class="form-divider">
		    <div class="form-group">
		        <label class="input-label">알림 서비스</label>
		        <div class="notification-options">
		            <div class="notification-option">
		                <label class="phone-notification">휴대폰 알림 수신</label>
		                <label><input type="radio" name="phone_agreement" value="1"> 동의</label>
		                <label><input type="radio" name="phone_agreement" value="0"> 비동의</label>
		            </div>
		            <div class="notification-option">
		                <label class="email-notification">이메일 알림 수신</label>
		                <label><input type="radio" name="email_agreement" value="1"> 동의</label>
		                <label><input type="radio" name="email_agreement" value="0"> 비동의</label>                        
		            </div>                               
		        </div>
		        <br>
		        <p class="noti-info-text">※ 알림 서비스에 동의하시면 인기 경매 물품과 회원님의 관심 정보와 관련된 알람을 보내드립니다.<br>가입 후 마이페이지에서 수신 동의 여부를 변경하실 수 있습니다.</p>
		    </div>
		    <hr class="form-divider">
		    <br>
		    <div class="button-container">
		        <button type="submit" id="submitButton" class="submit-button disabled-button" style="align-items: center;" disabled>회원가입하기</button>
		    </div>
		</form>

    </div>
</body>
</html>
