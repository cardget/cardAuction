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
<script src="${path}/resources/js/verificationEmail_API.js"></script>
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        let currentFormCheckboxId = '';

        function openClausePopup(clauseType, checkboxId) {
            currentFormCheckboxId = checkboxId;
            var url = '${path}/resources/txt/' + clauseType;

            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.text();
                })
                .then(data => {
                    document.getElementById('clauseText').innerText = data;
                    document.getElementById('clauseModal').style.display = "block";
                })
                .catch(error => {
                    alert('파일을 불러오는 중 오류가 발생했습니다: ' + error.message);
                });
        }

        function closeModal() {
            document.getElementById('clauseModal').style.display = "none";
        }

        function syncCheckbox(modalCheckbox) {
            const formCheckbox = document.getElementById(currentFormCheckboxId);
            formCheckbox.checked = modalCheckbox.checked;
        }

        window.onclick = function(event) {
            var modal = document.getElementById('clauseModal');
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        // Expose functions to global scope
        window.openClausePopup = openClausePopup;
        window.closeModal = closeModal;
        window.syncCheckbox = syncCheckbox;
    });
    </script>
<style>
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0, 0, 0);
    background-color: rgba(0, 0, 0, 0.4);
    padding-top: 60px;
}

.modal-content {
    background-color: #fefefe;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 700px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    position: relative;
}

.close-btn {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close-btn:hover,
.close-btn:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

.modal-text {
    white-space: pre-wrap;
    max-height: 465px;
    overflow-y: auto;
    margin-top: 20px;
    margin-bottom:23px;
}
</style>

</head>
<body>
	<div style="text-align: left; position: relative; margin-bottom: 30px">
	<div class="logo-container">
		<img src="${path}/resources/image/logo.png" alt="로고이미지" height=41 onclick="location.href='../main.do'" style="top:20px;">
	</div>	    
	    <h5 style="position: absolute; left: 435px; top: 25px; margin: 0;">회원 가입</h5>
	</div>
	<div id="clauseModal" class="modal">
            <div class="modal-content">
                <span class="close-btn" onclick="closeModal()">&times;</span>
                <h2>약관</h2>
                <div id="clauseText" class="modal-text"></div>
                <hr>
                <div>
                    <input type="checkbox" id="modalCheckbox" onclick="syncCheckbox(this)" style="margin-top: 10px;"> 동의
                </div>
            </div>
        </div>
    </div>
	
    <div class="container">
        <h4>약관 동의</h4>
        <div class="agree-container">
        	
		    <label>
		        <input type="checkbox" id="agreeAll" name="allAgree" onclick="toggleAll()"> <strong>필수 약관 전체 동의</strong>
		    </label>
		    <hr>
		    <label style="display: block; margin-top:20px; margin-bottom: 13px;">
		        <input type="checkbox" name="termsAgree" id="agree1" class="agree"> 
		        <span style="color: blue;">[필수]</span> <span id="termsText">이용약관</span>  
		        <a href="javascript:void(0)" onclick="openClausePopup('terms','agree1')">보기</a>
		    </label>
		    <label style="display: block; margin-bottom: 13px;">
		        <input type="checkbox" name="privacyAgree" id="agree2" class="agree"> 
		        <span style="color: blue;">[필수]</span> 개인정보 수집 및 이용안내  
		        <a href="javascript:void(0)" onclick="openClausePopup('privacy','agree2')">보기</a>
		    </label>
		    <label style="display: block; margin-bottom: 13px;">
		        <input type="checkbox" name="usageAgree" id="agree3" class="agree"> 
		        <span style="color: blue;">[필수]</span> 개인정보 활용 동의  
		        <a href="javascript:void(0)" onclick="openClausePopup('usage','agree3')">보기</a>
		    </label>
		</div>
		

        <h4>회원정보 입력</h4>
        <hr style="border: 1px solid blue; margin-bottom: 25px;">
        <form action="${path}/auth/insertSignUp.do" class="custom-form" onsubmit="return validatePasswords()" method="post" enctype="multipart/form-data">
		    <div class="form-group">
		        <label for="user_name" class="input-label">이름</label>
		        <input type="text" id="user_name" name="user_name" required class="input-field" required>
		    </div> 
		    <hr class="form-divider">
		    <div>                
		        <div class="form-group">
		            <label class="input-label">전화번호</label>
		            <input type="text" id="phone_number" name="phone_number" class="input-field" required>
		            <button type="button" class="check-button" onclick="sendCode()">인증번호 발송</button>
		            <input type="text" id="verificationCode" class="input-field" style="margin-left: 190px;" placeholder="인증번호 입력">
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
		    <p class="noti-info-text">※ 영문/숫자를 사용하여 6~15자로 작성해주세요. </p>
		    <hr class="form-divider">
		    <div class="form-group">
		        <label for="pw" class="input-label">비밀번호</label>
		        <input type="password" id="pw" name="pw" required class="input-field" onkeyup="checkPasswordMatch()" required>
		    </div>
		    <p class="noti-info-text">※ 영문/숫자/특수문자(!,@,#,$,~)를 2가지 이상 포함하여 6~30자로 작성해주세요. </p>
		    <hr class="form-divider">
		    <div class="form-group">
		        <label for="confirmPassword" class="input-label">비밀번호 확인</label>
		        <input type="password" id="confirmPassword" name="confirmPassword" class="input-field" onkeyup="checkPasswordMatch()" required>
		    </div>
		    <span id="passwordMessage" style="margin-left: 190px; margin-top: 8px; font-size: 12px;"></span>
		    <hr class="form-divider">
		    <div class="form-group">
		        <label for="nickname" class="input-label">닉네임</label>
		        <input type="text" id="nickname" name="nickname" required class="input-field" required>
		        <button type="button" class="check-button" id="checkNickname" onclick="f_checkNickname()">중복확인</button>		       
		    </div>
		     <p class="noti-info-text">※ 7자 이하로 작성해주세요. </p>
		    <hr class="form-divider">
		    <div class="form-group">
		        <label for="email" class="input-label">이메일</label>
		        <input type="text" id="emailName" name="emailName" required class="email-input-field" required>
		        <span>@</span>
		        <input type="text" id="domain" name="domain" required class="email-input-field">
		        <select class="email-select" name="emailList" size="1" onchange="checkEmail(this)">
		            <option value="">직접 입력</option>
		            <option value="naver.com">naver.com</option>
		            <option value="gmail.com">gmail.com</option>
		            <option value="daum.net">daum.net</option>
		            <option value="nate.com">nate.com</option>
		        </select>
		        <button type="button" id="mail-Check-Btn" class="check-button" onclick="sendVerificationEmail()" style="margin-left: 10px;">인증번호 발송</button>
		    </div>
		    <!-- 이메일을 결합하여 숨겨진 필드에 저장 -->
            <input type="hidden" id="email" name="email">            
            <input type="text" id="verificationCodeEmail" class="input-field" style="margin-left: 190px;" placeholder="인증번호 입력">
		    <button type="button" class="check-button" onclick="verifyCodeEmail()">확인</button>   
		    
		    <hr class="form-divider"> 
		    <div class="form-group address-group">
		        <label for="address" class="input-label">주소</label>
		        <div class="address-container">
		            <input type="text" id="sample6_postcode" name="zip_code" placeholder="우편번호" class="input-field" required>
		            <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" class="check-button">
		        </div>
		        <div class="address-fields">
		            <input type="text" id="sample6_address" name="address" placeholder="도로명 주소 (지번 주소)" class="input-field" required>
		            <input type="text" id="sample6_detailAddress" name="address_detail" placeholder="상세 주소" class="input-field" required>
		        </div>
		    </div>
		    <hr class="form-divider">
		    <div class="form-group">
			    <label for="profile_image" class="input-label">프로필 이미지 등록</label>
			    <div class="profile-image-container">
			        <img id="profile-image" src="${path}/resources/image/profile.png" alt="Profile Image" onclick="document.getElementById('profile_image').click()">
			    </div>
			    <input type="file" id="profile_image_id" name="profile_image_name" onchange="previewImage(this, '${path}')" accept="image/*" class="input-field" style="margin-left:10px;" multiple required>
			    <button type="button" onclick="resetProfileImage('profile-image', '${path}')" class="check-button">삭제</button>
			</div>
		    <hr class="form-divider">
		    <div class="form-group">
		        <label class="input-label">알림 서비스</label>
		        <div class="notification-options">
		            <div class="notification-option">
		                <label class="phone-notification">휴대폰 알림 수신</label>
		                <label><input type="radio" name="phone_agreement" value="1" required> 동의</label>
		                <label><input type="radio" name="phone_agreement" value="0" required> 비동의</label>
		            </div>
		            <div class="notification-option">
		                <label class="email-notification">이메일 알림 수신</label>
		                <label><input type="radio" name="email_agreement" value="1" required> 동의</label>
		                <label><input type="radio" name="email_agreement" value="0" required> 비동의</label>                        
		            </div>                               
		        </div>
		        <br>		        
		    </div>
		    <p class="noti-info-text">※ 알림 서비스에 동의하시면 인기 경매 물품과 회원님의 관심 정보와 관련된 알람을 보내드립니다.<br>가입 후 마이페이지에서 수신 동의 여부를 변경하실 수 있습니다.</p>
		    <hr class="form-divider">
		    <br>
		    <div class="button-container">
		        <button type="submit" id="submitButton" class="submit-button disabled-button" style="align-items: center;" disabled>회원가입하기</button>
		    </div>
		</form>

    </div>
</body>
</html>
