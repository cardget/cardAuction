<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${path}/resources/js/myPage.js"></script>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
</head>
<body>
	<div class="container">
		<div class="sidebar">
			<div class="logo">
				<img src="${path}/resources/image/logo.png" alt="로고이미지" height=41 onclick="location.href='../main'">
				<h1>회원정보</h1>
			</div>
			<div class="profile">
				<div class="profile-image">
					<div class="imageinfo">
						<c:choose>
							<c:when test="${empty user.profile_image}">
								<img src="${path}/resources/images/default/defaultprofile.png"
									alt="프로필이미지" height="150">
							</c:when>
							<c:otherwise>
								<img src="${user.profile_image}" alt="프로필이미지" height="150">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="textinfo">
					<h2>${user.nickname}</h2>
					<h3 class="grayfont">${user.user_id}</h3>
				</div>
			</div>
			<div class="sidemenu">
				<ul>
					<li><a href="myInfo.do">내정보</a></li>
					<li><a href="myBid.do">입찰내역</a></li>
					<li><a href="myTrade.do">낙찰내역</a></li>
					<li><a href="mySale.do">판매내역</a></li>
					<li><a href="myPoint.do">포인트</a></li>
					<li><a href="myInterest.do">관심목록</a></li>
					<li><a href="myDelivery.do">배송조회</a></li>
				</ul>
			</div>
			<hr class="grayfont">
			<div class="bottom-div">
				<div>
					<a href="../auth/logout" class="grayfont">로그아웃</a> 
					<span class="grayfont"> | </span> 
					<a href="updateUserDisabled.do" class="grayfont withdrawl">회원탈퇴</a>
				</div>
			</div>
		</div>
		<div class="main">
			<div class="main-header">
				<!--
				<div class="dropdown">
					<a href="#" class="dropdown-toggle"> 
						<img src="${path}/resources/icon/uncheckedchat.png" alt="채팅" height=30>
					</a>
					<div class="dropdown-content">
						<div class="noti-brief">
							<div class="noti-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="noti-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>네고가능한가요?</p>
							</div>
						</div>
						<div class="noti-brief">
							<div class="noti-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="noti-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>이거 경맨데요?</p>
							</div>
						</div>
						<div class="noti-brief">
							<div class="noti-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="noti-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>너무 비싸게 낙찰돼서요 ㅠ</p>
							</div>
						</div>
						<div class="noti-brief">
							<div class="noti-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="noti-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>차단하고 신고할게요</p>
							</div>
						</div>
						<div class="noti-brief">
							<div class="noti-image">
								<img src="${path}/resources/images/test/pikachucard.png" alt="Product Image">
							</div>
							<div class="noti-content">
								<h3>[포켓몬] 1998 피카츄 일러스트레이터...</h3>
								<p>저도 차단하고 신고할게요</p>
							</div>
						</div>
						<a class="mainColor" href="#">모든 채팅 보기</a>
					</div>
				</div>
				-->
				<div class="dropdown">
					<a href="#" class="dropdown-toggle"> 
						<c:choose>
							<c:when test="${empty nlist}">
								<img src="${path}/resources/icon/alarm.png" alt="알림" height=30>
							</c:when>
							<c:otherwise>
								<img src="${path}/resources/icon/isAlarm.png" alt="알림" height=30>
							</c:otherwise>
						</c:choose>
						
					</a>
					<div class="dropdown-content">
						<c:choose>
							<c:when test="${empty nlist}">
								<div class="no-unread-noti">
									<h3>미확인 알림이 없습니다.</h3>
								</div>
							</c:when>
							<c:otherwise>
								<c:forEach var="noti" items="${nlist}">
									<div class="noti-brief">
										<div class="noti-image">
											<img src="${noti.image1 }" alt="Product Image">
										</div>
										<div class="noti-content">
											<h3>${noti.item_name }</h3>
											<p>${noti.cmt }</p>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<a id="allNoti" class="mainColor" href="myNoti.do">모든 알림 보기</a>
					</div>
				</div>
			</div>
			<div class="content">
				<div class="header">
					<h2>알림 내역</h2>
					<div class="noti-control">
						<a href="${path}/mypage/readUpdate.do" class="grayfont">전체 읽음 표시</a> /
						<a href="${path}/mypage/deleteAllNoti.do" class="grayfont">읽은 알림 삭제</a>
					</div>
				</div>
				<c:choose>
					<c:when test="${empty nlist}">
						<div class="item-section">
							<div class="info-section">
								<h3>알림이 없습니다</h3>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="noti" items="${nlist}">
					        <div class="${noti.is_read == 1 ? 'item-section already-read' : 'item-section'}" data-noti-id="${noti.notification_id}" data-item-id="${noti.item_id}">
					            <div class="image-section">
									<img src="${noti.image1}" alt="Product Image">
								</div>
								<div class="info-section">
									<h3>${noti.item_name}</h3>
									<p>${noti.cmt }</p>
									<p>${noti.create_date }</p>
								</div>
								<div class="status-section">
									<button class="status-button-sold">삭제</button>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>