<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
<title>카드득</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/main.css" />
<link rel="icon" href="${path}/resources/icon/favicon.ico"
	type="image/x-icon">
</head>

<body style="background-color: #F9FBFC;">
	<div class="main-body">
		<!--header-->
		<c:choose>
			<c:when test="${empty userid}">
				<%@ include file="/WEB-INF/views/main/defaultHeader.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="/WEB-INF/views/main/loginHeader.jsp"%>
			</c:otherwise>
		</c:choose>
		<div class="main-container">
			<!--검색창 돌려쓰세요
        <div class="search-area">
            <select class="main-select">
                <option>전체</option>
                <option>포켓몬</option>
                <option>유희왕</option>
                <option>디지몬</option>
                <option>원피스</option>
                <option>스포츠</option>
            </select>
            <div class="search-input-wrapper">
                <input type="text" class="search-box" placeholder="검색어를 입력하세요.">
                <button type="submit" class="search-btn">
                    <img src="${path}/resources/icon/search.png" alt="search" class="search-icon">
                </button>
            </div>
        </div>
        -->
			<!--메인선택-->
			<div class="row-content">
				<div class="cardType">
					<a href="auction/auctionPMain.do"> <img
						src="${path}/resources/image/pokemon.png">
					</a>
				</div>
				<div class="cardType">
					<a href="auction/auctionYMain.do"> <img
						src="${path}/resources/image/yugigo.png">
					</a>
				</div>
				<div class="cardType">
					<a href="auction/auctionDMain.do"> <img
						src="${path}/resources/image/digimon.png">
					</a>
				</div>
				<div class="cardType">
					<a href="auction/auctionOMain.do"> <img
						src="${path}/resources/image/onepiece.png">
					</a>
				</div>
				<div class="cardType">
					<a href="auction/auctionSMain.do"> <img
						src="${path}/resources/image/sport.png">
					</a>
				</div>
			</div>
		</div>
		<!--footer-->
		<%@ include file="/WEB-INF/views/main/footer.jsp"%>
		<script type="module" src="${path}/resources/js/main.js"></script>

	</div>
</body>

</html>