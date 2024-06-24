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
<link rel="stylesheet" href="${path}/resources/css/main.css" />
<link rel="icon" href="${path }/resources/icon/favicon.ico"
	type="image/x-icon">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
					<div class="accordion-header">원피스</div>
					<div class="accordion-content active" id="deckList">
						<c:forEach items="${oCardList}" var="card">
							<div class="card-count">
								<img src="${card.card_id}" onclick="call('${card.card_id}')"
									class="listCard">
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
			<ul class="deckList" id="deckListContainer">

			</ul>
		</div>
	</div>
	<form action="createDeck" method="post">
		<div class="comment">
			<input type="text" id="deckTitle" class="deckTitle" placeholder="덱이름">
			<textarea id="commentBox" class="commentBox" placeholder="코멘트를 적어주세요"
				cols="50" rows="6"></textarea>

			<input type="button" class="regist-btn" onclick="insertCard()"
				value="등록하기">
		</div>
	</form>
	<!--footer-->
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
	<script type="module" src="${path}/resources/js/main.js"></script>
	<script>
	function insertCard(){
    	console.log($("#deckTitle").val());
    	console.log($("#commentBox").val());
    	var arr = [];
    	$(".deck-list img").each(function(index, item){
    		arr.push($(item).attr("data-card"));
    	});
    	console.log(arr);
    	$.ajax({
    		url:"${path}/deckMakers/insertDeck.do",
    		type:"post",
    		data:{kind:"O",deckTitle:$("#deckTitle").val(),
    			commentBox:$("#commentBox").val(),
    		    imgList : arr	
    		}
    	});
    }
	
		function toggleFilterOptions() {
			var filterOptions = document.getElementById('filter-options');
			if (filterOptions.style.display === 'none') {
				filterOptions.style.display = 'block';
			} else {
				filterOptions.style.display = 'none';
			}
		}
		
		let currentPageO = 1;
		document.getElementById('loadMoreOBtn').addEventListener('click', function() {

		    currentPageO++;
		    console.log(currentPageO);
		    fetch("/myapp/deckMakers/loadMoreOCard.do?page=" + currentPageO)
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
		                    <img src="\${card.card_id}" class="listCard" onclick="call('\${card.card_id}')">
		                `;
		                deckList.appendChild(cardDiv);
		            });
		        });
		});
		
		function call(card_id){
			document.querySelector("#deckListContainer").innerHTML += `
                <li class="addCard"><img src="\${card_id}" data-card="\${card_id}" onclick="removeCard(this)"></li>
            `;
		}
		
		function removeCard(element){
			element.parentElement.remove();
		}
	</script>
</body>

</html>