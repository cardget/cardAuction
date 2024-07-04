<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카드득</title>
<link rel="stylesheet" href="${path }/resources/css/main.css" />
<link rel="icon" href="${path }/resources/icon/favicon.ico"
	type="image/x-icon">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
	<div class="header-image">
		<img src="${path }/resources/images/default/digimon_banner.png">
	</div>
	<div class="top-container">
		<div class="search-area-full">
			<div class="search-input-wrapper">
				<form id="conditionForm" action="querySearch" method="get">
					<input type="text" class="card-search-box" id="card-search-box"
						name="query" placeholder="검색어를 입력하세요.">
				</form>
				<button type="submit" class="card-search" id="querySearch"
					onclick="con_search()">
					<img src="${path}/resources/icon/search.png" alt="search"
						class="card-search-icon">
				</button>
			</div>
			<button type="button" class="filter-btn"
				onclick="toggleFilterOptions()">
				<img src="${path }/resources/icon/filter.png" class="filter-icon">필터
			</button>
		</div>
		<div id="filter-options" class="filter-options">
			<form id="conditionForm" action="conditionSearch" method="get">
				카드타입 <select class="optionBox" id="card_attr" name="card_attr">
					<option value="a">전체</option>
					<option value="데이터종">데이터종</option>
					<option value="바이러스종">바이러스종</option>
					<option value="백신종">백신종</option>
					<option value="불명">불명</option>
				</select> 속성 : <select class="optionBox" id="card_sort" name="card_sort">
					<option value="s">전체</option>
					<option value="디지몬">디지몬</option>
					<option value="디지타마">디지타마</option>
					<option value="옵션">옵션</option>
					<option value="테이머">테이머</option>
				</select>
			</form>
			<button class="conditionSearch" id="conditionSearch"
				onclick="con_search()">조건검색</button>
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
								<img src="${card.card_id}" onclick="call('${card.card_id}')"
									class="listCard">
							</div>
						</c:forEach>
					</div>
					<div id="here"></div>
				</div>
				<div class="moreBtn">
					<button type="button" id="loadMoreDBtn">더보기</button>
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
	//조건검색
	$(document).ready(function() {
        $('#conditionForm').submit(function(event) {
            event.preventDefault();
            filterCards();
        });
    });
    
	 function con_search() {
    	var cardAttr = $('#card_attr').val();
        var cardSort = $('#card_sort').val();
        var cardName = $('#card-search-box').val();
	
	    $.ajax({
	        url: "/myapp/deckMakers/loadMoreDCard",
	        type: "GET",
	        data: {
	        	card_attr: cardAttr,
	        	card_sort: cardSort,
	        	query: cardName
	        },
	        success: function(data) {
	            console.log("성공");
	            console.log(data);
	            var deckList = document.getElementById("deckList");
	            deckList.innerHTML = ""; // 기존 내용 삭제
	            var here = document.getElementById("here");
	            here.innerHTML = ""; // 기존 내용 삭제
	
	            data.forEach(card => {
	                console.log(card);
	                var cardDiv = document.createElement("div");
	                cardDiv.classList.add("card-count");
	                cardDiv.innerHTML = `
	                    <img src="\${card.card_id}" alt="\${card.card_id}" class="listCard" onclick="call('\${card.card_id}')">
	                `;
	                here.appendChild(cardDiv);
	            });
	        },
	        error: function(xhr, status, error) {
	            console.error("Error:", error);
	        }
	    });
	}
	
	//덱만들기 등록
    function insertCard(){
    	console.log($("#deckTitle").val());
    	console.log($("#commentBox").val());
    	var arr = [];
    	$(".deck-list img").each(function(index, item){
    		arr.push($(item).attr("data-card"));
    	});
    	console.log(arr);
    	$.ajax({
    		url:"${path}/deckMakers/insertDeck",
    		type:"post",
    		data:{kind:"D",deckTitle:$("#deckTitle").val(),
    			commentBox:$("#commentBox").val(),
    		    imgList : arr	
    		},
    		success: function(response) {
    			alert("등록에 성공했습니다!")
                window.location.href = "${path}/deckMakers/digimonDeckListMain";
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
                alert("덱 등록에 실패했습니다. 다시 시도해 주세요.");
            }
    	});
    }
		function toggleFilterOptions() {
			var filterOptions = document.getElementById('filter-options');
			if (filterOptions.style.display === 'none') {
				filterOptions.style.display = 'flex';
			} else {
				filterOptions.style.display = 'none';
			}
		}
		
		let currentPageD = 1;
		document.getElementById('loadMoreDBtn').addEventListener('click', function() {
			var cardAttr = $('#card_attr').val();
	        var cardSort = $('#card_sort').val();
	        var cardName = $('#card-search-box').val();

		    currentPageD++;
		    console.log(currentPageD);
		    $.ajax({
		        url: "/myapp/deckMakers/loadMoreDCard?page=" + currentPageD,
		        type: "GET",
		        data: {
		        	card_attr: cardAttr,
		        	card_sort: cardSort,
		        	query: cardName
		        },
		        success: function(data) {
		            console.log(data);
		            const deckList = document.getElementById('here');
		            data.forEach(card => {
		                console.log(card);
		                var cardDiv = document.createElement("div");
		                cardDiv.classList.add("card-count");
		                cardDiv.innerHTML += `
		                    <img src="\${card.card_id}" alt="\${card.card_id}" class="listCard" onclick="call('\${card.card_id}','\${card.card_id}')">
		                `;
		                here.appendChild(cardDiv);
		            });
		        },
		        error: function(xhr, status, error) {
		            console.error("Error:", error);
		        }
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