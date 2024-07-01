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
</head>
<body>
	<div class="container">
		<div class="sidebar">
			<div class="logo">
				<img src="${path}/resources/image/logo.png" alt="로고이미지" height=41 onclick="location.href='../main.do'">
				<h1>회원정보</h1>
			</div>
			<div class="profile">
				<div class="profile-image">
					<div class="imageinfo">
						<c:choose>
							<c:when test="${empty user.profile_image}">
								<img src="${path}/resources/images/default/defaultprofile.png"
									alt="프로필이미지" height="150"  class="profile-image">
							</c:when>
							<c:otherwise>
								<img src="${user.profile_image}" alt="프로필이미지" height="150"  class="profile-image">
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
					<li><a href="myInfo.do" class="selected">내정보</a></li>
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
					<a href="../auth/logout.do" class="grayfont">로그아웃</a> 
					<span class="grayfont"> | </span> 
					<a href="updateUserDisabled.do" class="grayfont withdrawl">회원탈퇴</a>
				</div>
			</div>
		</div>
		<div class="main">
			<div class="main-header">
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
				<div class="basicInfo">
					<h3 class="grayfont">ⓘ 기본정보</h3>
					<c:choose>
						<c:when test="${empty user.profile_image}">
							<img src="${path}/resources/images/default/defaultprofile.png"
								alt="프로필이미지" height="150" class="profile-image">
						</c:when>
						<c:otherwise>
							<img src="${user.profile_image}" alt="프로필이미지" height="150" class="profile-image">
						</c:otherwise>
					</c:choose>
					<h2>${user.nickname}</h2>
					<p class="grayfont">${user.user_id}</p>
					<hr class="grayfont">
					<img src="${path}/resources/icon/phone.png" alt="핸드폰아이콘" height=20
						class="info">
					<h3 class="info">${user.phone_number}</h3><br/>
					 <img src="${path}/resources/icon/mail.png" alt="이메일아이콘"
						height=20 class="info">
					<h3 class="info">${user.email}</h3>
					<hr class="grayfont">
					<img src="${path}/resources/icon/location.png" alt="주소아이콘"
						class="info">
					<h3 class="info">${user.address} ${user.address_detail}</h3><br /> 
					<img src="${path}/resources/icon/account.png" alt="계좌아이콘" height=20 class="info">
					<c:choose>
						<c:when test="${user.accnt == null}">
							<p class="noti-info-text">※ 물품 판매 대금 수령을 위해서 계좌 등록이 필요합니다</p>
						</c:when>
						<c:otherwise>
							<h3 class="info">${user.bank} ${user.accnt}</h3>
						</c:otherwise>
					</c:choose>
					<hr class="grayfont">
					<h3 class="grayfont">알림 서비스 수신 동의</h3>
					<div id="auctionAlarm">
					<!--  
						<div class="alarmSetting">
							<div>
								<img src="${path}/resources/icon/phone.png" alt="핸드폰아이콘" height=20
									class="info">
								<h3 class="info">휴대전화</h3>
							</div>
							<div class="slider-button">
								<label class="switch"> <input class="alarm" type="checkbox"
									<c:if test="${user.phone_agreement == 1}">
				                                        checked="checked"
				                                    </c:if>>
									<span class="slider round"></span>
								</label>
							</div>
						</div>
						<hr>
					-->
						<div class="alarmSetting">
							<div>
								<img src="${path}/resources/icon/mail.png" alt="메일아이콘" height=20
									class="info">
								<h3 class="info">이메일</h3>
							</div>
							<div class="slider-button">
								<label class="switch"> <input class="alarm" type="checkbox"
									<c:if test="${user.email_agreement == 1}">
				                                        checked="checked"
				                                    </c:if> disabled>
									<span class="slider round"></span>
								</label>
							</div>
						</div>
					</div>
					<div class="button-section">
						<button class="revision">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
