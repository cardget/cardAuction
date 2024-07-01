function checkEmail(select) {
    var domain = document.getElementById("domain");
    if (select.value === "") {
        domain.value = "";
        domain.readOnly = false;
    } else {
        domain.value = select.value;
        domain.readOnly = true;
    }
}

function sendVerificationEmail() {
    var emailName = document.getElementById("emailName").value;
    var domain = document.getElementById("domain").value;
    var email = emailName + "@" + domain;
    
    document.getElementById("email").value = email;

    fetch("http://localhost:9090/myapp/email/send", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "email=" + encodeURIComponent(email)
    })
    .then(response => response.text())
    .then(data => alert(data))
    .catch(error => console.error("Error:", error));
}

function verifyCodeEmail() {
    var code = document.getElementById("verificationCodeEmail").value;

    fetch("http://localhost:9090/myapp/email/verify", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "code=" + encodeURIComponent(code)
    })
    .then(response => response.text())
    .then(data => alert(data))
    .catch(error => console.error("Error:", error));
}