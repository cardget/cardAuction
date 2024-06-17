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

</head>
<body>
	<div class="find-pw-container">
		<div class="logo">
			<img src="${path}/resources/images/로고 이미지.png" alt="로고" class="logo-img">
			<h1 class="logo-text">카드득</h1>
		</div>
		<div style="display: flex; justify-content: space-between; height: 40px;">
		<h5>비밀번호 재설정</h5>
		</div>		
		<hr style="width:440px;">
		<h6 style="margin-top:0px;"><img src="${path}/resources/icon/blue_error.png">&nbsp;비밀번호를 변경해주세요</h6>
		<form class="custom-form">
			<div >
				<div class="form-group">
			        <label class="input-label">아이디 : </label>
			        <p style="color : #007FFF" >shinhanDS03</p>
			    </div>
			    <div class="form-group">
			    	<label class="input-label">새 비밀번호</label>
			    	<input type="text" id="password" name="password" class="input-field" placeholder="sh0303@@" required>
			    </div>
			    <div class="form-group">
			        <label class="input-label">비밀번호 확인</label>
			        <input type="text" id="password" name="password" class="input-field" placeholder="sh0303@@" required>
			        <h6>※ 영문, 숫자, 특수문자를 함께 사용하면(8자 이상 16자 이하)보다 안전합니다.</h6>
			    </div>
			    
			</div>							
			<button type="submit" class="submit-button">비밀번호 재설정</button>
		</form>
		
	</div>
</body>
</html>