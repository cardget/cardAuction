<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정 페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/resetPassword.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${path}/resources/js/signUp.js"></script>

</head>
<body>
	<div class="find-pw-container">
		<div class="logo">
			<img src="${path}/resources/image/logo.png" alt="로고이미지" height=41 onclick="location.href='../main.do'">
		</div>
		<div style="display: flex; justify-content: space-between; height: 40px;">
		<h5>비밀번호 재설정</h5>
		</div>		
		<hr style="width:440px;">
		<h6 style="margin-top:0px;"><img src="${path}/resources/icon/blue_error.png">&nbsp;영문/숫자/특수문자(!,@,#,$,~)를 2가지 이상 포함하여 6~30자로 작성해주세요.</h6>
		
		<form action="${path}/auth/updatePassword.do" method="post" class="custom-form" onsubmit="return checkPasswordMatch()">
			<div >
				<div class="form-group">
					<label class="input-label" >아이디  </label>
					<c:choose>
                    <c:when test="${not empty userId}">
                        <input type="text" id="userId" name="userId" class="input-field" value="${userId}" readonly style="color : #007FFF">
                    </c:when>
                    <c:otherwise>
                        <input type="text" id="userId" name="userId" class="input-field" placeholder="아이디를 입력하세요" required>
                    </c:otherwise>
                </c:choose>      
					
			    </div>
			    <div class="form-group">
			    	<label for="password" class="input-label">새 비밀번호</label>
			    	<input type="password" id="pw" name="password" required class="input-field" onkeyup="checkPasswordMatch()" required>
			    </div>
			    <div class="form-group">
			        <label for="confirmPassword" class="input-label">비밀번호 확인</label>
			        <input type="password" id="confirmPassword" name="confirmPassword" class="input-field" onkeyup="checkPasswordMatch()" required>
			        <span id="passwordMessage" style="margin-left: 120px; margin-top: 8px; font-size: 10px;"></span>			        
			    </div>
			    
			</div>							
			<button type="submit" class="submit-button">비밀번호 수정</button>
		</form>
		
	</div>
</body>
</html>