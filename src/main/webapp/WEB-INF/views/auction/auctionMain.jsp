<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
<title>카드득</title>
<link rel="stylesheet" href="${path }/resources/css/auctionMain.css" />

<script src="../static/js/select.js"></script>

<style>

</style>
</head>
<body>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<!--header-->
    <%@ include file="/WEB-INF/views/main/header.jsp" %>
    
<!-- Body -->
<div class="topimage"></div>
<!-- 검색창 -->
<div class="container">
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
            <div class="auction-insert-wrapper">
            	<button onclick="" class="insert-btn">판매 물품 등록</button>
            </div>
	</div>
	
	 <div class="sub-category">
            <ul class="sub-category-box">
                <li class="sub-category-item">
                    <a href="#">카드경매</a>
                </li>
                <li class="main-category-item">
                    <a href="deckListMain.html">티어덱리스트</a>
                </li>
                <li class="main-category-item">
                    <a href="#">커뮤니티</a>
                </li>
                <li class="main-category-item">
                    <a href="#">문의</a>
                </li>
            </ul>
    </div>
	
		 <div class="sort-container">
            <div class="sort-nav">
                <ul class="sort-box">
                    <li class="sort-item">
                        <a href="main.html">홈 > </a><a href="#">포켓몬 > </a><a href="#">카드경매</a>
                    </li>
                    <li class="sort-item">
                        정렬기준 :
                        <select class="sort-select">
                            <option>최신순</option>
                            <option>종료임박순</option>
                            <option>참여자많은순</option>
                            <option>참여자적은순</option>
                        </select>
                    </li>
                </ul>
            </div>
        </div>
	
	<div class="auction-list-wrapper">
		<div class="auction-item">
			<img src="https://s3.ap-southeast-2.amazonaws.com/shinhan.cardauction/images/피카츄+ex.png" alt="card image" class="card-image">
			<div class="title-wrapper">
				글제목
			</div>
			<hr class="hr2">
			<div class="date-wrapper">
				마감일: 2024-07-10
			</div>
			<div class="info-wrapper">		
				<span class="people">참여자 00명</span>
				<span class="tmethod">선호거래방식</span>
			</div>
			<div class="button-wrapper">
				<button class="auction-interest">
					<img src="${path}/resources/icon/interest.png" alt="icon" class="interest-icon"> 관심물품</button>
				<button class="auction-detail-btn">상세보기</button>
			</div>
		</div>
		<div class="auction-item">
			<img src="${path}/resources/images/pokemon/피카츄 ex.png" alt="card image" class="card-image">
			<div class="title-wrapper">
				글제목
			</div>
			<hr class="hr2">
			<div class="date-wrapper">
				마감일: 2024-07-10
			</div>
			<div class="info-wrapper">		
				<span class="people">참여자 00명</span>
				<span class="tmethod">선호거래방식</span>
			</div>
			<div class="button-wrapper">
				<button class="auction-interest">
					<img src="${path}/resources/icon/interest.png" alt="icon" class="interest-icon"> 관심물품</button>
				<button class="auction-detail-btn">상세보기</button>
			</div>
		</div>
		<div class="auction-item">
			<img src="${path}/resources/images/pokemon/피카츄 ex.png" alt="card image" class="card-image">
			<div class="title-wrapper">
				글제목
			</div>
			<hr class="hr2">
			<div class="date-wrapper">
				마감일: 2024-07-10
			</div>
			<div class="info-wrapper">		
				<span class="people">참여자 00명</span>
				<span class="tmethod">선호거래방식</span>
			</div>
			<div class="button-wrapper">
				<button class="auction-interest">
					<img src="${path}/resources/icon/interest.png" alt="icon" class="interest-icon"> 관심물품</button>
				<button class="auction-detail-btn">상세보기</button>
			</div>
		</div>
		<div class="auction-item">
			<img src="${path}/resources/images/pokemon/피카츄 ex.png" alt="card image" class="card-image">
			<div class="title-wrapper">
				글제목
			</div>
			<hr class="hr2">
			<div class="date-wrapper">
				마감일: 2024-07-10
			</div>
			<div class="info-wrapper">		
				<span class="people">참여자 00명</span>
				<span class="tmethod">선호거래방식</span>
			</div>
			<div class="button-wrapper">
				<button class="auction-interest">
					<img src="${path}/resources/icon/interest.png" alt="icon" class="interest-icon"> 관심물품</button>
				<button class="auction-detail-btn">상세보기</button>
			</div>
		</div>
	</div>
	<!--페이지네이션-->
        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">7</a>
            <a href="#">8</a>
            <a href="#">9</a>
            <a href="#">10</a>
            <a href="#">&raquo;</a>
        </div>
  
</div>

    <!--footer-->
    <footer data-include-path="footer.html"></footer>
    <script type="module" src="${path}/resources/js/main.js"></script>
        
</body>
</html>