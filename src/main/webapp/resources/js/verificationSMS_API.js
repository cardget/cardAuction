
// twilio를 활용한 SMS 본인인증 API 

// 전화번호 형식 변경
function formatPhoneNumber(phoneNumber) {
    if (phoneNumber.startsWith("0")) {
        return "+82" + phoneNumber.substring(1);
    }
    return phoneNumber;
}

function sendCode() {
    const phoneNumber = document.getElementById('phone_number').value;
    if (phoneNumber === "") {
        alert("전화번호를 입력하세요");
        return;
    }
    fetch('http://localhost:9090/myapp/api/send-code', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `phoneNumber=${encodeURIComponent(phoneNumber)}`
    })
    .then(response => {
        if (response.ok) {
            alert("인증번호가 발송되었습니다.");
        } else {
            alert("인증번호 발송에 실패했습니다.");
        }
    });
}

function verifyCode() {
    const phoneNumber = document.getElementById('phone_number').value;
    const code = document.getElementById('verificationCode').value;
    if (code === "") {
        alert("인증번호를 입력하세요");
        return;
    }
    fetch('http://localhost:9090/myapp/api/verify-code', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `phoneNumber=${encodeURIComponent(phoneNumber)}&code=${encodeURIComponent(code)}`
    })
    .then(response => response.text())
    .then(data => {
        document.getElementById('result').innerText = data === 'true' ? "인증 성공" : "인증 실패";
    });
}