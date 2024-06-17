<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="../static/css/myPageStyle.css">
</head>
<body>
	<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
	<div class="container">
        <div class="sidebar">
			<div class="logo">
				<img src="../static/images/logo.png" alt="로고이미지" height=41>
				<h1>회원정보</h1>
			</div>
		    <div class="profile">
		    	<div class="imageinfo">
		    		<img src="../static/images/defaultprofile.png" alt="프로필이미지" height=150>
					<a href="#">
						<img src="../static/images/editprofile.png" alt="프로필편집" height=50 class="editprofile">
					</a>
		    	</div>
				<div class="textinfo">
					<h2>유저스트액티베이티드</h2>
					<p class="grayfont">mytrapcard</p>
				</div>
			</div>
		    <div class="sidemenu">
				<ul>
					<li>
						<a href="myInfo.jsp">내정보</a>
					</li>
					<li class="selected">
						<a href="myBid.jsp">입찰내역</a>
					</li>
					<li>
						<a href="mySale.jsp">판매내역</a>
					</li>
					<li>
						<a href="myPoint.jsp">포인트</a>
					</li>
					<li>
						<a href="myInterest.jsp">관심목록</a>
					</li>
					<li>
						<a href="myDelivery.jsp">배송조회</a>
					</li>
				</ul>
			</div>
			<div class="bottom-div">
				<hr class="grayfont">
	    		<a href="#" class="grayfont">로그아웃</a>
	    		<span class="grayfont"> | </span>
				<a href="#" class="grayfont">회원탈퇴</a>
    		</div>
		</div>
        <div class="main">
            <div class="main-header">
            	<div class="dropdown">
            		<a href="#" class="dropdown-toggle">
						<img src="../static/images/uncheckedchat.png" alt="채팅" height=30>
					</a>
            		<div class="dropdown-content">
			            <a href="#">채팅 1</a>
			            <a href="#">채팅 2</a>
			            <a href="#">채팅 3</a>
			        </div>
			    </div>
			    <div class="dropdown">
            		<a href="#" class="dropdown-toggle">
						<img src="../static/images/uncheckednote.png" alt="알림" height=30>
					</a>
					<div class="dropdown-content">
			            <a href="#">알림 1</a>
			            <a href="#">알림 2</a>
			            <a href="#">알림 3</a>
			        </div>
            	</div>
			</div>
            <div class="content">
            	<div class="header">
			        <h2>입찰내역</h2>
			        <a href="#" class="grayfont">전체삭제</a>
			    </div>
				<div class="item-section">
					<div class="image-section">
					    <img src="../static/images/pikachucard.png" alt="Product Image">
					</div>
					<div class="info-section">
					    <h3>[포켓몬] 1998 피카츄 일러스트레이터 카드 PSA 8 한정판</h3>
					    <p>등록일자: 2024-05-28</p>
					    <p class="enddate">종료일자: 2024-07-01</p>
					    <a href="#" class="grayfont">상세보기 ></a>
					</div>
					<div class="status-section">
					    <button class="status-button-proceeding">진행중</button>
					</div>
				</div>
				<div class="item-section">
					<div class="image-section">
					    <img src="../static/images/pikachucard.png" alt="Product Image">
					</div>
					<div class="info-section">
					    <h3>[포켓몬] 1998 피카츄 일러스트레이터 카드 PSA 8 한정판</h3>
					    <p>등록일자: 2024-05-28</p>
					    <p class="enddate">종료일자: 2024-06-01</p>
					    <a href="#" class="grayfont">상세보기 ></a>
					</div>
					<div class="status-section">
					    <button class="status-button-sold">종료됨</button>
					</div>
				</div>
            </div>
		</div>
	</div>
</body>
</html>
