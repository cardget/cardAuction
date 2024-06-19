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
<link rel="stylesheet" href="${path}/resources/css/login.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">

</head>
<body>
	<div class="login-container">
		<div class="logo">
			<img src="${path}/resources/images/로고 이미지.png" alt="로고" class="logo-img">
			<h1 class="logo-text">카드득</h1>
		</div>
		<div class="container">
			<form action="login.do" method="POST">
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
					<label> <input type="checkbox" id = "remember" name="remember" class ="remember-me"> 로그인 정보 기억하기</label>
				</div>
				<button type="submit" class="login-btn">로그인</button>
			</form>
			<div class="links">
				<a href="findId.do">아이디 찾기</a> <a href="findPassword.do">비밀번호 찾기</a> <a href="signUp.do">회원가입</a>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			$("form").on("submit", f);
			$("#userid").val(localStorage.getItem("userid"));
			$("#password").val(localStorage.getItem("password"));
			var checkStatus = localStorage.getItem("checkStatus");
			if (checkStatus == 1){
				$("#remember").prop("checked", true);
			}
		});
		function f(){
			var check = $("#remember").prop("checked");
			if(check){
				localStorage.setItem("userid", $("#userid").val());
				localStorage.setItem("password", $("#password").val());
				localStorage.setItem("checkStatus", 1);
			}else {
				localStorage.removeItem("userid");
				localStorage.removeItem("password");
				localStorage.removeItem("checkStatus");
			}
		}
	</script>
</body>
</html>