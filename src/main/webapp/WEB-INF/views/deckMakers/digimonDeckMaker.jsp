<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
<title>카드득</title>
<link rel="stylesheet" href="${path }/resources/css/main.css" />
<link rel="icon" href="${path }/resources/icon/favicon.ico"
	type="image/x-icon">
</head>

<body>
	<!--header-->
	<%@ include file="/WEB-INF/views/main/header.jsp"%>
	<div class="header-image">
		<img src="${path }/resources/images/default/pokemon_banner.png">
	</div>
	<div class="top-container">
		<div class="search-area-full">
			<div class="search-input-wrapper">
				<input type="text" class="card-search-box" placeholder="검색어를 입력하세요.">
				<button type="submit" class="card-search">
					<img src="${path }/resources/icon/search.png" alt="search"
						class="card-search-icon">
				</button>
			</div>
			<button type="button" class="filter-btn"
				onclick="toggleFilterOptions()">
				<img src="${path }/resources/icon/filter.png" class="filter-icon">필터
			</button>
		</div>
		<div id="filter-options" class="filter-options">
			<label><input type="checkbox" value="1"> 항목 1</label> <label><input
				type="checkbox" value="2"> 항목 2</label> <label><input
				type="checkbox" value="3"> 항목 3</label> <label><input
				type="checkbox" value="4"> 항목 4</label> <label><input
				type="checkbox" value="5"> 항목 5</label>
		</div>
	</div>
	<div class="container">
		<div class="main-content-2">
			<div class="accordion">
				<div class="accordion-item">
					<div class="accordion-header">디지몬</div>
					<div class="accordion-content active" id="deckList">
						<c:forEach items="${dCardList}" var="card">
							<div class="card-count">
								<img src="${card.card_id}" class="listCard">
							</div>
						</c:forEach>
					</div>
					<div id="here"></div>
				</div>
				<div class="moreBtn">
					<button type="button" id="loadMoreOBtn">더보기</button>
				</div>
			</div>
		</div>
		<div class="deck-list">
			<ul class="deckList">
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="1"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="2"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="3"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="4"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="5"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="6"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="7"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="8"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="9"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="10"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="11"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="12"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="13"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="14"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="15"></li>
				<li class="makeList"><img src="../image/makerlist-pokemon.png"
					class="makerCard" value="16"></li>
			</ul>
		</div>
	</div>
	<div class="comment">
		<textarea cols="28" rows="1" placeholder="덱 이름을 입력해주세요."
			class="deckTitle"></textarea>
		<textarea cols="50" rows="6" placeholder="코멘트를 적어주세요."
			class="commentBox"></textarea>
		<button type="submit" class="regist-btn"
			onclick="location.href='deckListMain.do'">등록하기</button>
	</div>
	<!--footer-->
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
	<script type="module" src="${path}/resources/js/main.js"></script>
	<script>
		function toggleFilterOptions() {
			var filterOptions = document.getElementById('filter-options');
			if (filterOptions.style.display === 'none') {
				filterOptions.style.display = 'block';
			} else {
				filterOptions.style.display = 'none';
			}
		}
		
		let currentPageD = 1;
		document.getElementById('loadMoreDBtn').addEventListener('click', function() {

		    currentPageD++;
		    console.log(currentPageD);
		    fetch("/myapp/deckMakers/loadMoreDCard.do?page=" + currentPageD)
		        .then(response =>  
		        response.json() 
		        )
		        .then(data => {
		            console.log(data);
		            const deckList = document.getElementById('here');
		            data.forEach(card => {
		                const cardDiv = document.createElement('div');
		                cardDiv.classList.add('card-count');
		                cardDiv.innerHTML += `
		                    <img src="\${card.card_id}" class="listCard">
		                `;
		                deckList.appendChild(cardDiv);
		            });
		        });
		});
	</script>
</body>

</html>