<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
	<div id="side">
	<img src="${path}/resources/images/digimon/BT5-086P.png" alt="로고이미지" height=100>
	<h2>회원정보</h2>
	<img src="${path}/resources/images/digimon/BT5-086P.png" alt="프로필이미지" height=100>
	<a href="#">
		<img src="${path}/resources/images/digimon/BT5-086P.png" alt="프로필편집" height=100>
	</a>
	<h2>닉네임</h2>
	<h3>아이디</h3>
	<ul>
		<li>
			<a href="#">내정보</a>
		</li>
		<li>
			<a href="#">구매내역</a>
		</li>
		<li>
			<a href="#">판매내역</a>
		</li>
		<li>
			<a href="#">포인트</a>
		</li>
		<li>
			<a href="#">관심목록</a>
		</li>
		<li>
			<a href="#">배송조회</a>
		</li>
	</ul>
	<a href="#">로그아웃</a>
	<a href="#">회원탈퇴</a>
	</div>
	<div id="header">
	<img src="${path}/resources/images/digimon/BT5-086P.png" alt="채팅" height=100>
	<img src="${path}/resources/images/digimon/BT5-086P.png" alt="미확인내용있음" height=100>
	<img src="${path}/resources/images/digimon/BT5-086P.png" alt="알림" height=100>
	<img src="${path}/resources/images/digimon/BT5-086P.png" alt="미확인내용있음" height=100>
	</div>
	<div id="bodyContent">
	</div>
</body>
</html>