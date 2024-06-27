<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--Apple SD 고딕 폰트-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
    <title>카드득</title>
    <link rel="stylesheet" href="${path }/resources/css/main.css" />
    <link rel="icon" href="${path }/resources/icon/favicon.ico" type="image/x-icon">
    <script type="text/javascript">
        var path = '${path}';
    </script>
</head>

<body>
    <!--header-->
    <c:choose>
    	<c:when test="${empty userid}">
    		<%@ include file="/WEB-INF/views/main/defaultHeader.jsp"%>
    	</c:when>
    	<c:otherwise>
    		<%@ include file="/WEB-INF/views/main/loginHeader.jsp"%>
    	</c:otherwise>
    </c:choose>
    <!--헤더이미지-->
    <div class="header-image">
        <img src="${path }/resources/images/default/pokemon_banner.png">
    </div>
    <div class="top-container">
        <!--검색창 돌려쓰세요-->
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
                    <img src="${path }/resources/icon/search.png" alt="search" class="search-icon">
                </button>
            </div>
        </div>
        <!--서브카테고리-->
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
                        <a href="main.html">홈 > </a><a href="#">포켓몬 > </a><a href="#">티어덱리스트</a>
                    </li>
                    <li class="sort-item">
                        정렬기준 :
                        <select class="sort-select">
                            <option>최신순</option>
                            <option>포켓몬</option>
                            <option>유희왕</option>
                            <option>디지몬</option>
                        </select>
                    </li>
                </ul>
            </div>
        </div>
        <div class="option-container">
            <ul class="option-box">
                <li class="option-item">
                    <select class="option-select">
                        <option>검색옵션</option>
                        <option>포켓몬</option>
                        <option>유희왕</option>
                        <option>디지몬</option>
                    </select>
                    <input type="text" class="option-search">
                    <button type="button" class="search-btn-default"><a href="#">검색</a></button>
                </li>
                <li class="option-item">
                    <button type="button" class="create-deck" onclick="location.href='deckMaker.html'">덱 생성</button>
                </li>
            </ul>
        </div>
        <!--메인선택-->
        <div class="container">
            <div class="row-deck-content" id="deckContainer">
            </div>
        </div>
        <!--페이지네이션-->
        <div class="pagination" id="paginationContainer">
        </div>
    </div>
    <!--footer-->
    
	<%@ include file="/WEB-INF/views/main/footer.jsp" %>
    <script type="module" src="${path }/resources/js/main.js"></script>
</body>

</html>
