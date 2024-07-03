
// 로그인 정보 기억
$(function() {
    // 페이지가 로드될 때 로컬 스토리지에서 아이디와 체크박스 상태를 복원
    $("#userid").val(localStorage.getItem("userid"));
    $("#password").val(localStorage.getItem("password"));
    var checkStatus = localStorage.getItem("checkStatus");
    if (checkStatus === "1") {
        $("#remember").prop("checked", true);
    }
    
    // 폼 제출 이벤트 핸들러
    $("form").on("submit", toLocalStorage);
});

function toLocalStorage(event) {
    var check = $("#remember").prop("checked");
    if (check) {
        // 체크박스가 선택된 경우 로컬 스토리지에 아이디 저장
        localStorage.setItem("userid", $("#userid").val());
        localStorage.setItem("password", $("#password").val());
        localStorage.setItem("checkStatus", "1");
    } else {
        // 체크박스가 선택되지 않은 경우 로컬 스토리지에서 아이디 삭제
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

document.addEventListener("DOMContentLoaded", function() {
    let currentFormCheckboxId = '';

    function openClausePopup(clauseType, checkboxId, textId) {
        currentFormCheckboxId = checkboxId;
        var url = '${path}/resources/txt/' + clauseType;
        var titleText = document.getElementById(textId).innerText;

        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(data => {
                document.getElementById('modalTitle').innerText = titleText;
                document.getElementById('clauseText').innerText = data;
                document.getElementById('clauseModal').style.display = "block";
                document.getElementById('modalCheckbox').checked = document.getElementById(currentFormCheckboxId).checked;
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
        checkAllAgreed(); // 동기화 후 체크 상태 확인
    }

    window.onclick = function(event) {
        var modal = document.getElementById('clauseModal');
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

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

    // 함수들을 전역 스코프에 노출
    window.openClausePopup = openClausePopup;
    window.closeModal = closeModal;
    window.syncCheckbox = syncCheckbox;
    window.toggleAll = toggleAll;
    window.checkAllAgreed = checkAllAgreed;
});


// 프로필 이미지 미리보기
function previewImage(input, path) {
    var imageId = input.id.replace('_image_id', '-image');
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById(imageId).src = e.target.result;
        }
        reader.readAsDataURL(input.files[0]);
    } else {
        // 파일이 선택되지 않은 경우 기본 이미지로 설정
        document.getElementById(imageId).src = path + '/resources/image/profile.png';
    }
}

// 기본 이미지로 재설정
function resetProfileImage(imageId, path) {
    document.getElementById(imageId).src = path + '/resources/image/profile.png';
    document.getElementById(imageId.replace('-image', '_image_id')).value = ""; // 파일 선택 입력값 초기화
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
