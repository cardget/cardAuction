<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/adminMain.css">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="sidebar">
			<div class="logo">
				<img src="${path}/resources/image/logo.png" alt="로고이미지" height=41 onclick="location.href='../main'">
				<h1>관리자페이지</h1>
			</div>		
			
			<div class="sidemenu">
				<ul>
					<li><a href="adminMain.do" class="selected">회원관리</a></li>
					<li><a href="insertPCard.do">포켓몬DB추가</a></li>
					<li><a href="insertYCard.do">유희왕DB추가</a></li>
					<li><a href="insertDCard.do">디지몬DB추가</a></li>
					<li><a href="insertOCard.do">원피스DB추가</a></li>
					<li><a href="manageDelivery.do">배송관리</a></li>
				</ul>
			</div>
			<hr class="grayfont" style="margin-top: 20px; margin-bottom: 20px;">
			<h2>${user.nickname}</h2>
			<div class="bottom-div">
				<div>
					<a href="../auth/logout" class="grayfont">로그아웃</a> 					
				</div>
			</div>
		</div>
		<div class="main">
			<div class="content">
				<div class="basicInfo">
					<h3 class="grayfont">ⓘ 회원 정보</h3>					
					<table>
						<thead>
							<tr>	
								<th>전체 회원</th>
								<th>당월 가입</th>
								<th>당월 탈퇴</th>
								<th>변화 추이</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<fmt:formatNumber value="${info.userCnt}" pattern="#,###"/>
								</td>
								<td>
									<fmt:formatNumber value="${info.signupCnt}" pattern="#,###"/>
								</td>
								<td>
									<fmt:formatNumber value="${info.disableCnt}" pattern="#,###"/>
								</td>
								<td class="change">
									<fmt:formatNumber value="${info.signupCnt - info.disableCnt}" pattern="#,###"/>
								</td>
							<tr>
						</tbody>
					</table>
					<hr>
					<h3 class="grayfont">ⓘ 거래 정보</h3>					
					<table>
						<thead>
							<tr>	
								<th>전체 등록 물품</th>
								<th>당월 등록 물품</th>
								<th>당월 낙찰 물품</th>
								<th>당월 거래액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>	
									<fmt:formatNumber value="${info.itemCnt}" pattern="#,###"/>건
								</td>
								<td>
									<fmt:formatNumber value="${info.registerCnt}" pattern="#,###"/>건
								</td>
								<td>
									<fmt:formatNumber value="${info.winningCnt}"/>건
								</td>
								<td class="change"> 
									<fmt:formatNumber value="${info.turnover}" pattern="#,###"/>원
								</td>
							<tr>
						</tbody>
					</table>
					<hr>						
				</div>
			</div>
		</div>
	</div>
</body>
</html>
