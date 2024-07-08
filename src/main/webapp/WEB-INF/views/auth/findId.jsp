<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<link rel="stylesheet" href="${path}/resources/css/findId.css">
<script src="${path}/resources/js/verificationSMS_API.js"></script>
<script src="${path}/resources/js/verificationEmail_API.js"></script>
</head>

<body>
	<div class="find-id-container">
		<div class="logo">
			<img src="${path}/resources/image/logo.png" alt="로고이미지" height=41 onclick="location.href='../main'">
		</div>
		<div style="display: flex; justify-content: space-between; height: 40px;">
		<h5>아이디 찾기</h5>
		<h6>회원정보에 등록한 휴대전화로 인증</h6>
		</div>		
		<hr style="width:440px;">
		
		<h6 style="margin-top:0px;"><img src="${path}/resources/icon/blue_error.png">&nbsp;회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야 인증 번호를 받을 수 있습니다.</h6>
		<form action="findIdResult" class="custom-form" method="post">
			<div >
				<div class="form-group">
			        <label class="input-label" for="userName">이름</label>
			        <input type="text" id="userName" name="userName" class="input-field" required>
			    </div>
			    <!-- 시험용 계정이라 계정주만 테스트가능한 이슈가 있음 -->
			    <div class="form-group">
			        <label class="input-label">전화번호</label>
			        <input type="text" id="phone_number" name="phone_number" class="input-field" placeholder="숫자만 입력" required>
			        <button type="button" class="check-button" onclick="sendCode()">인증번호 발송</button>
			        <span id="smsSendNotiMessage" style="margin-left: 80px; font-size: 12px;"></span>
			     </div>   
			     <div class="form-group">
			        <input type="text" id="verificationCode" class="input-field" style="margin-left: 80px;" placeholder="인증번호 입력" >
			   	 	<button type="button" class="check-button" onclick="verifyCode()">확인</button>
			   	 	<span id="smsVerifyNotiMessage" style="margin-left: 80px; font-size: 12px;"></span>
			    </div>		        
		    </div>         
				
			<button type="submit" class="submit-button">아이디 찾기</button>
		</form>		
	</div>
	
	
</body>
</html>