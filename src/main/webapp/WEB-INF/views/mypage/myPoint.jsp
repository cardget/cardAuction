<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<li><a href="myInfo.do">내정보</a></li>
					<li><a href="myBid.do">입찰내역</a></li>
					<li><a href="myTrade.do">낙찰내역</a></li>
					<li><a href="mySale.do">판매내역</a></li>
					<li><a href="myPoint.do" class="selected">포인트</a></li>
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
				<div>
					<div class="total-point">
						<h2>카드득 포인트</h2>
						<h1>
							<fmt:formatNumber value="${total}" pattern="#,###"/>P
						</h1>
					</div>
					<div class="point-per-month">
						<div class="point-summary">
							<div>
								<p>구매 포인트</p>
								<p>
									<fmt:formatNumber value="${purchase}" pattern="#,###"/>P
								</p>
							</div>
							<div>
								<p>판매 포인트</p>
								<p>
									<fmt:formatNumber value="${sales}" pattern="#,###"/>P
								</p>
							</div>
							<div>
								<p>이벤트 포인트</p>
								<p>
									<fmt:formatNumber value="${event}" pattern="#,###"/>P
								</p>
							</div>
							<div>
								<p>사용 포인트</p>
								<p>
									<fmt:formatNumber value="${used}" pattern="#,###"/>P
								</p>
							</div>
						</div>
					</div>
				</div>
				<h2>포인트내역</h2>
				<c:forEach var="points" items="${points}">
					<div class="history-section">
						<p class="grayfont">${points.create_date}</p>
						<div class="point-detail">
							<c:choose>
								<c:when test="${points.is_add == 1}">
									<h3 class="point-status-blue">적립 +<fmt:formatNumber value="${points.amount}" pattern="#,###"/></h3>
								</c:when>
								<c:when test="${points.is_add == -1}">
									<h3 class="point-status-red">사용 -<fmt:formatNumber value="${points.amount}" pattern="#,###"/></h3>
								</c:when>
							</c:choose>
							<p>${points.cmt}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
