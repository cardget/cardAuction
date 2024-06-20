<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
</head>
<body>
	<div class="container">
        <div class="sidebar">
			<div class="logo">
				<img src="${path}/resources/images/default/logo.png" alt="로고이미지" height=41>
				<h1>회원정보</h1>
			</div>
		    <div class="profile">
		    	<div class="profile-image">
			    	<div class="imageinfo">
			    		<c:choose>
					        <c:when test="${empty user.profile_image}">
					            <img src="${path}/resources/images/default/defaultprofile.png" alt="프로필이미지" height="150">
					        </c:when>
					        <c:otherwise>
					            <img src="${user.profile_image}" alt="프로필이미지" height="150">
					        </c:otherwise>
					    </c:choose>
						<a href="#">
							<img src="${path}/resources/icon/editprofile.png" alt="프로필편집" height=50 class="editprofile">
						</a>
			    	</div>
		    	</div>
				<div class="textinfo">
					<h2>${user.nickname}</h2>
					<h3 class="grayfont">${user.user_id}</h3>
				</div>
			</div>
		    <div class="sidemenu">
				<ul>
					<li>
						<a href="myInfo.do">내정보</a>
					</li>
					<li class="selected">
						<a href="myBid.do">입찰내역</a>
					</li>
					<li>
						<a href="mySale.do">판매내역</a>
					</li>
					<li>
						<a href="myPoint.do">포인트</a>
					</li>
					<li>
						<a href="myInterest.do">관심목록</a>
					</li>
					<li>
						<a href="myDelivery.do">배송조회</a>
					</li>
				</ul>
			</div>
			<hr class="grayfont">
			<div class="bottom-div">
				<div>
					<a href="../auth/logout.do" class="grayfont">로그아웃</a>
		    		<span class="grayfont"> | </span>
					<a href="#" class="grayfont">회원탈퇴</a>
				</div>
    		</div>
		</div>
        <div class="main">
            <div class="main-header">
            	<div class="dropdown">
            		<a href="#" class="dropdown-toggle">
						<img src="${path}/resources/icon/uncheckedchat.png" alt="채팅" height=30>
					</a>
            		<div class="dropdown-content">
						<div class="chat-brief">
							<div class="chat-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="chat-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>네고가능한가요?</p>
							</div>
						</div>
			            <div class="chat-brief">
							<div class="chat-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="chat-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>이거 경맨데요?</p>
							</div>
						</div>
						<div class="chat-brief">
							<div class="chat-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="chat-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>너무 비싸게 낙찰돼서요 ㅠ</p>
							</div>
						</div>
						<div class="chat-brief">
							<div class="chat-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="chat-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>차단하고 신고할게요</p>
							</div>
						</div>
						<div class="chat-brief">
							<div class="chat-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="chat-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>저도 차단하고 신고할게요</p>
							</div>
						</div>
			            <a class="mainColor" href="#">모든 채팅 보기</a>
			        </div>
			    </div>
			    <div class="dropdown">
            		<a href="#" class="dropdown-toggle">
						<img src="${path}/resources/icon/isAlarm.png" alt="알림" height=30>
					</a>
					<div class="dropdown-content">
			            <div class="chat-brief">
							<div class="chat-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="chat-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>축하드립니다. 낙찰되셨습니다. 낙찰금: 500,000원</p>
							</div>
						</div>
						<div class="chat-brief">
							<div class="chat-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="chat-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>최저판매금액을 달성하지 못해 유찰되었습니다.</p>
							</div>
						</div>
						<div class="chat-brief">
							<div class="chat-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="chat-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>아쉽게도 낙찰되지 못하셨습니다.</p>
							</div>
						</div>
						<div class="chat-brief">
							<div class="chat-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="chat-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>등록하신 물품이 500,000원에 낙찰되었습니다.</p>
							</div>
						</div>
						<div class="chat-brief">
							<div class="chat-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="chat-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>등록하신 물품이 유찰되었습니다.</p>
							</div>
						</div>
			            <a class="mainColor" href="#">모든 알림 보기</a>
			        </div>
            	</div>
			</div>
            <div class="content">
            	<div class="header">
			        <h2>입찰내역</h2>
			        <a href="#" class="grayfont">전체삭제</a>
			    </div>
			    <c:forEach var="bids" items="${bids}">
			    	<div class="item-section">
						<div class="image-section">
						    <img src="${bids.image1}" alt="Product Image">
						</div>
						<div class="info-section">
						    <h3>${bids.item_name}</h3>
						    <p>입찰시간: ${bids.bid_time}</p>
						    <p class="enddate">종료일자: ${bids.end_date}</p>
						    <a href="#" class="grayfont">상세보기 ></a>
						</div>
						<div class="status-section">
						    <c:set var="endDate" value="${bids.end_date}" />
			                <c:choose>
			                    <c:when test="${now gt endDate && bids.is_win == 1}">
			                        <button class="status-button-winning">낙찰!</button>
			                    </c:when>
			                    <c:when test="${now gt endDate && bids.is_win == 0}">
			                        <button class="status-button-sold">종료됨</button>
			                    </c:when>
			                    <c:otherwise>
			                        <button class="status-button-proceeding">진행중</button>
			                    </c:otherwise>
			                </c:choose>
						</div>
					</div>
			    </c:forEach>
            </div>
		</div>
	</div>
</body>
</html>
