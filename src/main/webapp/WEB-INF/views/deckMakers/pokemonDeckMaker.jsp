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
		<img src="${path }/resources/images/default/pokemon_banner.png">
	</div>
	<div class="top-container">
		<div class="search-area-full">
			<div class="search-input-wrapper">
				<form action="${path}/deckMakers/searchP" method="get">
					<input type="text" class="card-search-box" name="query"
						placeholder="검색어를 입력하세요.">
					<button type="submit" class="card-search">
						<img src="${path }/resources/icon/search.png" alt="search"
							class="card-search-icon">
					</button>
				</form>
			</div>
			<button type="button" class="filter-btn"
				onclick="toggleFilterOptions()">
				<img src="${path }/resources/icon/filter.png" class="filter-icon">필터
			</button>
		</div>
		<div id="filter-options" class="filter-options">
			<form id="conditionForm" action="conditionSearch" method="get">
				카드타입 <select class="optionBox" id="card_type" name="card_type">
					<option value="t">전체</option>
					<option value="풀">풀</option>
					<option value="불꽃">불꽃</option>
					<option value="물">물</option>
					<option value="번개">번개</option>
					<option value="초">초</option>
					<option value="격투">격투</option>
					<option value="악">악</option>
					<option value="강철">강철</option>
					<option value="드래곤">드래곤</option>
					<option value="무색">무색</option>
				</select> 아이템선택 : <select class="optionBox" id="card_sort" name="card_sort">
					<option value="s">전체</option>
					<option value="서포트">서포트</option>
					<option value="아이템">아이템</option>
					<option value="포켓몬의 도구">포켓몬의 도구</option>
					<option value="스타디움">스타디움</option>
					<option value="특수에너지">특수에너지</option>
					<option value="기본에너지">기본에너지</option>
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
					<div class="accordion-header">포켓몬</div>
					<div class="accordion-content active" id="deckList">
						<c:forEach items="${pCardList}" var="card">
							<div class="card-count">
								<img src="${card.card_id}" onclick="call('${card.card_id}')"
									class="listCard">
							</div>
						</c:forEach>
					</div>
					<div id="here"></div>
				</div>
				<div class="moreBtn">
					<button type="button" id="loadMorePBtn">더보기</button>
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
	//검색쿼리 추가
	$(document).ready(function() {
        $('form').on('submit', function(e) {
            e.preventDefault();
            var query = $('.card-search-box').val();
            $.ajax({
                url: '${path}/deckMakers/loadMorePCard.do',
                method: 'GET',
                data: { query: query },
                success: function(data) {
                    var deckList = document.getElementById("deckList");
                    deckList.innerHTML = "";
                    var here = document.getElementById("here");
                    here.innerHTML = "";

                    data.forEach(card => {
                    	console.log(card);
                        var cardDiv = document.createElement("div");
                        cardDiv.classList.add("card-count");
                        cardDiv.innerHTML = `
                            <img src="\${card.card_id}" class="listCard" onclick="call('\${card.card_id}')">
                        `;
                        deckList.appendChild(cardDiv);
                    });
                },
                error: function() {
                    alert('결과값이 없습니다');
                }
            });
        });
    });
	
	//조건검색
	function con_search() {
        var form = document.getElementById("conditionForm");
        var formData = $(form).serialize();

        $.ajax({
            url: "/myapp/deckMakers/loadMorePCard.do",
            type: "GET",
            data: formData,
            dataType: "json",
            success: function(data) {
            	console.log("성공")
            	console.log(data)
                var deckList = document.getElementById("deckList");
                deckList.innerHTML = ""; // 기존 내용 삭제
                var here = document.getElementById("here");
                here.innerHTML = ""; // 기존 내용 삭제

                data.forEach(card => {
                	console.log(card);
                    var cardDiv = document.createElement("div");
                    cardDiv.classList.add("card-count");
                    cardDiv.innerHTML = `
                        <img src="\${card.card_id}" class="listCard" onclick="call('\${card.card_id}')">
                    `;
                    deckList.appendChild(cardDiv);
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
	    		url:"${path}/deckMakers/insertDeck.do",
	    		type:"post",
	    		data:{kind:"P",deckTitle:$("#deckTitle").val(),
	    			commentBox:$("#commentBox").val(),
	    		    imgList : arr	
	    		},
	    		success: function(response) {
	    			alert("등록에 성공했습니다!")
	                window.location.href = "${path}/deckMakers/deckListMain.do";
	            },
	            error: function(xhr, status, error) {
	                console.error("Error:", error);
	                alert("덱 등록에 실패했습니다. 다시 시도해 주세요.");
	            }
	    	});
	    }
	//필터옵션
		function toggleFilterOptions() {
			var filterOptions = document.getElementById('filter-options');
			if (filterOptions.style.display === 'none') {
				filterOptions.style.display = 'flex';
			} else {
				filterOptions.style.display = 'none';
			}
		}
	//더보기
		let currentPageP = 1;
		document.getElementById('loadMorePBtn').addEventListener('click', function() {

		    currentPageP++;
		    console.log(currentPageP);
		    fetch("/myapp/deckMakers/loadMorePCard.do?page=" + currentPageP)
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
		//카드리스트에추가
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