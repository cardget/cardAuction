
// twilio를 활용한 SMS 본인인증 API 

function sendCode() {
    const phoneNumber = document.getElementById('phone_number').value;
    const message = document.getElementById('smsSendNotiMessage');
    if (phoneNumber === "") {
    	message.innerText("전화번호를 입력하세요.");
        message.style.color="red";
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
            message.innerText = "인증번호가 발송되었습니다.";
            message.style.color = "green";
        } else {
            message.innerText = "인증번호 발송에 실패하였습니다.";
            message.style.color = "red";
        }
    })
    .catch(error =>{
    	massage.innerText="인증번호 발송 중 오류가 발생하였습니다.";
    	message.style.color = "red";    
    });
}

function verifyCode() {
    const phoneNumber = document.getElementById('phone_number').value;
    const code = document.getElementById('verificationCode').value;
    const message = document.getElementById('smsVerifyNotiMessage');
    if (code === "") {
    	message.innerText = "인증번호를 입력하세요.";
        return;
    }
    fetch('http://localhost:9090/myapp/api/verify-code', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `phoneNumber=${encodeURIComponent(phoneNumber)}&code=${encodeURIComponent(code)}`
    })
    .then(response=>response.text())
    .then(data => {   
        if (data == "1") {
            message.innerText = "인증 성공";
            message.style.color = "green";
        } else {
            message.innerText = "인증 실패";
            message.style.color = "red";
        }
    })
    .catch(error => {
        message.innerText = "인증 처리 중 오류가 발생하였습니다.";
        message.style.color = "red";
    });
}