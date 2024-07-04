<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>카드득</title>
<link rel="stylesheet" href="${path }/resources/css/main.css" />
<link rel="icon" href="${path }/resources/icon/favicon.ico"
	type="image/x-icon">
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
	<div class="list-top-container">
		<!--서브카테고리-->
		<div class="sub-category">
			<ul class="sub-category-box">
				<li class="sub-category-item"><a
					href="${path}/auction/auctionMain">카드경매</a></li>
				<li class="main-category-item"><a
					href="${path}/deckMakers/pokemonDeckListMain">티어덱리스트</a></li>
				<li class="main-category-item"><a
					href="${path}/community/BoardSelect?cat=1">커뮤니티</a></li>
			</ul>
		</div>
		<div class="sort-container">
			<div class="sort-nav">
				<ul class="sort-box">
					<li class="sort-item"><a href="main.html">홈 > </a><a href="#">포켓몬
							> </a><a href="#">티어덱리스트</a></li>
					<li class="sort-item">정렬기준 : <select class="sort-select"
						onchange="location.href='${path}/deckMakers/pokemonDeckListMain?sort=' + this.value">
							<option value="create_date"
								${sort == 'create_date' ? 'selected' : ''}>최신순</option>
							<option value="recommend"
								${sort == 'recommend' ? 'selected' : ''}>추천순</option>
					</select>
					</li>
				</ul>
			</div>
		</div>
		<div class="option-container">
			<ul class="option-box">
				<li class="option-item">
					<form id="conditionForm"
						action="${path}/deckMakers/pokemonDeckListMain" method="get">
						<input type="text" class="option-search" id="option-search"
							name="query" placeholder="덱이름 검색">
						<button type="submit" class="search-btn-default">검색</button>
					</form>
				</li>
				<li class="option-item">
					<button type="button" class="create-deck"
						onclick="location.href='${path}/deckMakers/pokemonDeckMaker'">덱
						생성</button>
				</li>
			</ul>
		</div>
		<!--메인선택-->
		<div class="deck-container" id="deckContainer">
			<c:forEach var="deck" items="${decks}">
				<div class="deckType">
					<div class="deck-overlay-container">
						<img src="${deck.CARD_IMAGE}" class="pcard">
						<div class="overlay-text"
							onclick="location.href='${pageContext.request.contextPath}/deckMakers/pokemonDeckListDetail?deck_id=${deck.DECK_ID}'">
							<div class="deck-number">${deck.DECK_TITLE}</div>
							<div>
								<div class="username">${deck.USER_ID}</div>
								<div class="deck-info">
									<div class="date">${deck.CREATE_DATE}</div>
									<div class="recommend">추천수 : ${deck.RECOMMEND}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!--페이지네이션-->
		<div class="pagination">
			<c:if test="${totalPages > 1}">
				<ul class="pagination">
					<c:if test="${currentPage > 1}">
						<li><a
							href="?page=${currentPage - 1}&pageSize=${pageSize}&sort=${sort}&query=${query}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:forEach begin="1" end="${totalPages}" var="i">
						<li class="${i == currentPage ? 'active' : ''}"><a
							href="?page=${i}&pageSize=${pageSize}&sort=${sort}&query=${query}">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${currentPage < totalPages}">
						<li><a
							href="?page=${currentPage + 1}&pageSize=${pageSize}&sort=${sort}&query=${query}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
				</ul>
			</c:if>
		</div>

	</div>
	<!--footer-->

	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
	<script type="module" src="${path }/resources/js/main.js"></script>
</body>

</html>
