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
function previewImage(input) {
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
        document.getElementById('profile-image').src = '../resources/images/기본 이미지.png';
        document.getElementById('profile-image-hidden').value = null; // null 값을 설정하여 DB에 저장
    }
}

// 기본 이미지로 재설정
function resetProfileImage() {
    document.getElementById('profile-image').src = '../resources/images/기본 이미지.png';
    document.getElementById('profile-image-hidden').value = null; // null 값을 설정하여 DB에 저장
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

// 비밀번호 필드에 키 입력이 있을 때마다 호출
function checkPasswordMatch() {
    var password = document.getElementById("pw").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    var message = document.getElementById("passwordMessage");

    if (password !== confirmPassword) {
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
