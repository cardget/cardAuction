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
					<li>
						<a href="myBid.jsp">입찰내역</a>
					</li>
					<li>
						<a href="mySale.jsp">판매내역</a>
					</li>
					<li class="selected">
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
				<div>
					<div class="total-point">
						<h2>카드득 포인트</h2>
						<h1>100P</h1>
					</div>
					<div class="point-per-month">
						<div class="select-month">
							<a href="#">
								<img src="../static/images/left.png" alt="왼쪽화살표">
							</a>
							<h2>5월</h2>
							<a href="#">
								<img src="../static/images/right.png" alt="오른쪽화살표">
							</a>
						</div>
						<div class="point-summary">
							<div>
								<h3>총 적립 포인트</h3>
								<h3>140P</h3>
							</div>
							<div>
								<p>구매 포인트</p>
								<p>40P</p>
							</div>
							<div>
								<p>입찰 포인트</p>
								<p>100P</p>	
							</div>
							<div>
								<p>위로 포인트</p>
								<p>0P</p>
							</div>
							<div>
								<p>이벤트 포인트</p>
								<p>0P</p>
							</div>
						</div>
					</div>
				</div>
				<h2>적립내역</h2>
				<div class="history-section">
					<p class="grayfont">2024-05-30</p>
					<div class="point-detail">
						<h3 class="point-status">적립 +20</h3>
						<p>[판매] [포켓몬] 1998 피카츄 일러스트레이터 카드 PSA 8 한정판</p>
					</div>
				</div>
				<div class="history-section">
					<p class="grayfont">2024-05-30</p>
					<div class="point-detail">
						<h3 class="point-status">적립 +20</h3>
						<p>[판매] [포켓몬] 1998 피카츄 일러스트레이터 카드 PSA 8 한정판</p>
					</div>
				</div>
				<div class="history-section">
					<p class="grayfont">2024-05-30</p>
					<div class="point-detail">
						<h3 class="point-status">적립 +20</h3>
						<p>[판매] [포켓몬] 1998 피카츄 일러스트레이터 카드 PSA 8 한정판</p>
					</div>
				</div>
				<div class="history-section">
					<p class="grayfont">2024-05-30</p>
					<div class="point-detail">
						<h3 class="point-status">적립 +20</h3>
						<p>[판매] [포켓몬] 1998 피카츄 일러스트레이터 카드 PSA 8 한정판</p>
					</div>
				</div>
			</div>
		</div>
    </div>
</body>
</html>