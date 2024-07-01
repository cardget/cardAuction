
$(function(){
			$("form").on("submit", f);
			$("#userid").val(localStorage.getItem("userid"));
			$("#password").val(localStorage.getItem("password"));
			var checkStatus = localStorage.getItem("checkStatus");
			if (checkStatus == 1){
				$("#remember").prop("checked", true);
			}
		});
	function f(){
		var check = $("#remember").prop("checked");
		if(check){
			localStorage.setItem("userid", $("#userid").val());
			localStorage.setItem("password", $("#password").val());
			localStorage.setItem("checkStatus", 1);
		}else {
			localStorage.removeItem("userid");
			localStorage.removeItem("password");
			localStorage.removeItem("checkStatus");
		}
}



//signUp.jsp 아이디 중복 체크
function f_checkUserId() {
    var userId = $("#user_id").val();
    $.ajax({
        url: "/myapp/auth/checkUserId",
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

//signUp.jsp 닉네임 중복 체크
function f_checkNickname() {
    var nickname = $("#nickname").val();
    $.ajax({
        url: "/myapp/auth/checkNickname",
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

var contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
// DOMContentLoaded 이벤트를 사용하여 페이지가 로드된 후에 코드를 실행
document.addEventListener('DOMContentLoaded', function () {    
    var checkboxes = document.querySelectorAll('.agree');    
    checkboxes.forEach(function (checkbox) {
        checkbox.addEventListener('change', function () {            
            checkAllAgreed();
        });
    });
});

// 약관 전체 동의 체크박스를 클릭했을 때 호출되는 함수
function toggleAll() {    
    var agreeAll = document.getElementById('agreeAll').checked;   
    var checkboxes = document.querySelectorAll('.agree');    
    checkboxes.forEach(function (checkbox) {
        checkbox.checked = agreeAll;
    });
    
    checkAllAgreed();
}

// 모든 체크박스가 체크되었는지 확인하고 버튼 활성화 여부를 결정하는 함수
function checkAllAgreed() {
    var checkboxes = document.querySelectorAll('.agree');
    var allChecked = true;
    checkboxes.forEach(function (checkbox) {
        if (!checkbox.checked) {
            allChecked = false;
        }
    });
    var submitButton = document.getElementById('submitButton');
    if (allChecked) {
        submitButton.disabled = false;
        submitButton.classList.remove('disabled-button');
    } else {
        submitButton.disabled = true;
        submitButton.classList.add('disabled-button');
    }
}

// 프로필 이미지 미리보기
function previewImage(input, path) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('profile-image').src = e.target.result;
        }
        reader.readAsDataURL(input.files[0]);
        // DB에 저장할 값 설정
        document.getElementById('profile-image-hidden').value = ''; // 사진이 선택된 경우 null이 아닌 값을 저장해야 함
    } else {
        // 파일이 선택되지 않은 경우 기본 이미지로 설정하고 DB에 null 값 설정
        document.getElementById('profile-image').src = path + '/resources/image/profile.png';
        document.getElementById('profile-image-hidden').value = null; // null 값을 설정하여 DB에 저장
    }
}

// 기본 이미지로 재설정
function resetProfileImage(path) {
    document.getElementById('profile-image').src = path + '/resources/image/profile.png';
    document.getElementById('profile_image').value = ""; // 파일 선택 입력값 초기화
    document.getElementById('profile_image_hidden').value = null; // hidden input 값 초기화
}

//폼 제출시 호출됨
function validatePasswords(){
	var password = document.getElementById("pw").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var message = document.getElementById("passwordMessage");
    
    if (password !== confirmPassword) {
        message.style.color = 'red';
        message.textContent = '비밀번호가 일치하지 않습니다. 다시 입력해주세요.';
        return false;
    } else {
        message.style.color = 'green';
        message.textContent = '일치하는 비밀번호입니다.';
        return true;
    }
    
}

// 비밀번호 유효성 검사 함수
function isValidPassword(password) {
    // 영문, 숫자, 특수문자 각각 포함 여부 확인
    var hasLetter = /[a-zA-Z]/.test(password);
    var hasNumber = /[0-9]/.test(password);
    var hasSpecialChar = /[!@#$%~]/.test(password);

    // 길이와 두 가지 이상의 조건을 만족하는지 확인
    var isValidLength = password.length >= 6 && password.length <= 30;
    var isValidContent = (hasLetter + hasNumber + hasSpecialChar) >= 2;

    return isValidLength && isValidContent;
}


// 비밀번호 필드에 키 입력이 있을 때마다 호출
function checkPasswordMatch() {
    var password = document.getElementById("pw").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var message = document.getElementById("passwordMessage");

	if(!isValidPassword(password)){
		message.style.color = 'red';
        message.textContent = '비밀번호는 영문, 숫자, 특수문자 중 두 가지 이상을 포함하여 6~30자로 작성해야 합니다.';
    }else if (password !== confirmPassword) {
        message.style.color = 'red';
        message.textContent = '비밀번호가 일치하지 않습니다. 다시 입력해주세요.';
    } else {
        message.style.color = 'green';
        message.textContent = '일치하는 비밀번호입니다.';
    }
}

// 이메일 선택 js
function checkEmail(select) {
    document.getElementById('domain').value = select.value;
}

function combineEmail() {
    var emailName = document.getElementById("emailName").value;
    var domain = document.getElementById("domain").value;
    var email = emailName + "@" + domain;
    document.getElementById("email").value = email;
}

document.addEventListener("DOMContentLoaded", function() {
    document.querySelector("form").addEventListener("submit", function(event) {
        combineEmail();
    });
});
