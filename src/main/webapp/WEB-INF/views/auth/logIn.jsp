<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카드득 로그인 페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/logIn.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">

</head>
<body>
	<div class="login-container">
		<div class="logo">
			<img src="../resources/images/로고 이미지.png" alt="로고" class="logo-img">
			<h1 class="logo-text">카드득</h1>
		</div>
		<div class="container">
			<form action="login_process.php" method="POST">
				<div class="form-group">
					<div class="input-with-icon">
			        <img alt="" src="../resources/icon/loginUser.png" class="id-icon">
			        <input type="text" id="username" name="username" placeholder="아이디" required>
			    </div>
			    <div class="input-with-icon">
			        <img alt="" src="../resources/icon/lock.png" class="pw-icon">
			        <input type="password" id="password" name="password" placeholder="비밀번호" required>
			    </div>
				</div>
				<div class="remember-me">
					<label> <input type="checkbox" name="remember" class ="remember-me"> 로그인 정보 기억하기</label>
				</div>
				<button type="submit" class="login-btn">로그인</button>
			</form>
			<div class="links">
				<a href="#">아이디 찾기</a> <a href="#">비밀번호 찾기</a> <a href="#">회원가입</a>
			</div>
		</div>
		
	</div>
</body>
</html>