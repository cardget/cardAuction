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




// 주소찾기 api
function sample6_execDaumPostcode() {
	new daum.Postcode(
		{
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== ''
						&& /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== ''
						&& data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}

				} else {
					document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress")
					.focus();
			}
		}).open();
}

// 프로필 이미지 관련
function previewImage(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('profile-image').src = e.target.result;
		}
		reader.readAsDataURL(input.files[0]);
	} else {
		// 파일이 선택되지 않은 경우 기본 이미지로 설정
		document.getElementById('profile-image').src = '../resources/images/기본 이미지.png';
	}
}
// 기본 이미지
function restProfileImage() {
	document.getElementById('profile-image').src = '../resources/images/기본 이미지.png';
}

//폼 제출시 호출됨
function validatePasswords(){
	var password = document.getElementById("password").value;
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
    var password = document.getElementById("password").value;
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

