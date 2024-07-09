<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과 페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/findIdResult.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
<script src="${path}/resources/js/signUp.js"></script>

<script>
//찾은 아이디값을 비밀번호 재설정 페이지로 가져감
function goToResetPassword() {
    var userId = document.getElementById("id").value;
    location.href = "${path}/auth/resetPassword?userId=" + userId;
}

// 찾은 아이디값을 로그인 페이지로 가져감
function goToLogin() {
    var userId = document.getElementById("id").value;
    location.href = "${path}/auth/login?userid=" + userId;
}
</script>

</head>
<body>
	<div class="find-id-container">
		<div class="logo">
			<img src="${path}/resources/image/logo.png" alt="로고이미지" height=41 onclick="location.href='../main'">
		</div>
		<div style="display: flex; justify-content: space-between; height: 40px;">
		<h5>아이디 찾기</h5>
		</div>		
		<hr style="width:440px;">
		
		<c:choose>
            <c:when test="${userFound}">
                <h6 style="margin-top:0px;">
                    <img src="${path}/resources/icon/blue_error.png">&nbsp;고객님의 정보와 일치하는 ID입니다.
                                
                </h6>
            </c:when>
            <c:otherwise>
                <h6 style="margin-top:0px;">
                    <img src="${path}/resources/icon/red_error.png">&nbsp;정보를 찾을 수 없습니다.
                </h6>
            </c:otherwise>
        </c:choose>			
		
		<form>	
			<input type="text" id="id" name="id" class="input-field" value="${userId}" readonly>
			<img src="${path}/resources/icon/CheckBox_Blue.png" style="display: inline-block; vertical-align: middle">
			<div style="margin-left: 82px;">
				<button type="button" class="check-button" onclick="goToLogin()" >로그인 하러가기</button>
				<button type="button" class="check-button" onclick="goToResetPassword()">비밀번호 재설정</button>	
			</div>
					
		</form>	
			
	</div>
	
</body>
</html>