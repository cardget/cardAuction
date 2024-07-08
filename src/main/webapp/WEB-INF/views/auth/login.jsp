<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카드득 로그인 페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<link rel="stylesheet" href="${path}/resources/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${path}/resources/js/signUp.js"></script>

</head>
<body>
	<div class="login-container">
		<div class="logo-container">
			<img src="${path}/resources/image/logo.png" alt="로고이미지" height=41 onclick="location.href='../main'">			
		</div>
		<div class="container">
			<form id ="loginForm" action="login" method="POST">
				<div class="form-group">
					<div class="input-with-icon">
			        <img alt="" src="${path}/resources/icon/loginUser.png" class="id-icon">
			        <input type="text" id="userid" name="userid" placeholder="아이디" required>
			    </div>
			    <div class="input-with-icon">
			        <img alt="" src="${path}/resources/icon/lock.png" class="pw-icon">
			        <input type="password" id="password" name="password" placeholder="비밀번호" required>
			    </div>
				</div>
				<div class="remember-me">
					<label> <input type="checkbox" id = "remember" name="remember" class ="remember-me"}> 로그인 정보 기억하기</label>
				</div>
				<button type="submit" class="login-btn">로그인</button>
			</form>
			<div class="links">
				<a href="findId">아이디 찾기</a> <a href="resetPassword">비밀번호 재설정</a> <a href="signUp">회원가입</a>
			</div>
		</div>
	</div>
	
</body>
</html>