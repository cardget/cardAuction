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
</head>
<body>
	<div class="find-id-container">
		<div class="logo">
			<img src="${path}/resources/images/로고 이미지.png" alt="로고" class="logo-img">
			<h1 class="logo-text">카드득</h1>
		</div>
		<div style="display: flex; justify-content: space-between; height: 40px;">
		<h5>아이디 찾기</h5>
		<h6 >회원정보에 등록한 휴대전화로 인증</h6>
		</div>		
		<hr style="width:440px;">	
		<h6 style="margin-top:0px;"><img src="${path}/resources/icon/blue_error.png">&nbsp;고객님의 정보와 일치하는 ID입니다.</h6>	
			<input type="text" id="id" name="id" class="input-field" placeholder="shinhanDS03" required>
			<img src="${path}/resources/icon/CheckBox_Blue.png">
			<button type="submit" class="check-button">로그인 하러가기</button>
			<button type="submit" class="check-button">비밀번호 찾기</button>
		</form>		
	</div>
</body>
</html>