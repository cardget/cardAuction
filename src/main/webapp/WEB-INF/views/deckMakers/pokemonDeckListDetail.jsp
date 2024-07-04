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
	<div class="deck-detail-image">
		<div class="banner-overlay">
			<!--정보입력 오버레이-->
			<p class="deckTitle">${deck.DECK_TITLE}</p>
			<div class="makerInfo">
				<div>제작자 : ${deck.USER_ID}</div>
				<div>${deck.CREATE_DATE}</div>
				<div>추천수 : ${deck.RECOMMEND}</div>
			</div>
		</div>
		<img src="${path }/resources/images/default/pokemon_banner.png"
			id="banner">
	</div>
	<div class="detail-container">
		<div class="sidebar">
			<div class="card-info">
				<img src="" alt="카드 이미지" class="card-img" id="cardImage">
				<div class="card-details">
					<h2 id="cardName"></h2>
					<p id="cardType"></p>
					<p id="cardSort"></p>
					<p id="cardFeature"></p>
				</div>
			</div>
		</div>
		<div class="main-content">
			<div class="accordion">
				<div class="accordion-item">
					<div class="accordion-header">포켓몬</div>
					<div class="accordion-content active" id="deckList">
						<c:forEach items="${cards}" var="card">
							<div class="card-count">
								<img src="${card.CARD_ID}" alt="${card.CARD_ID}"
									class="listCard" onclick="showCardDetails('${card.CARD_ID}')">
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<p class="builder-comment">제작자 코멘트</p>
			<div class="detail-comment">
				<textarea cols="50" rows="6" class="commentBox" disabled>${deck.CMT}</textarea>
			</div>
			<div class="btnContainer">
				<div class="recommend-button">
					<button type="button" onclick="recommendDeck(${deck.DECK_ID})">추천</button>
				</div>
				<div class="delete-button">
					<button type="button" onclick="deleteDeck(${deck.DECK_ID})">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!--footer-->
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
	<script type="module" src="${path }/resources/js/main.js"></script>
	<script>
	function recommendDeck(deckId) {
	    $.ajax({
	        url: '${path}/deckMakers/recommendDeck',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({ deck_id: deckId }),
	        dataType: 'json',
	        success: function(data) {
	            if (data.success) {
	                alert('추천되었습니다.');
	                location.reload(); // 페이지 새로고침하여 업데이트된 추천 수 반영
	            } else {
	                if (data.message) {
	                    alert(data.message); // 서버에서 반환된 메시지 표시
	                } else {
	                    alert('추천 처리 중 오류가 발생했습니다.');
	                }
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Fetch error:', error);
	            alert('추천 처리 중 오류가 발생했습니다.');
	        }
	    });
	}
	function deleteDeck(deckId) {
	    $.ajax({
	        url: '${path}/deckMakers/deleteDeck',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({ deck_id: deckId }),
	        dataType: 'json',
	        success: function(data) {
	            if (data.dSuccess) {
	                alert('삭제되었습니다.');
	                location.href='${path}/deckMakers/pokemonDeckListMain';
	            } else {
	                alert('삭제 중 오류가 발생했습니다.');
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Fetch error:', error);
	            alert('삭제 중 오류가 발생했습니다.');
	        }
	    });
	}
	//카드변경
	function showCardDetails(cardId) {
	    if (!cardId) {
	        console.error('cardId is not provided');
	        return;
	    }

	    console.log('Fetching details for cardId:', cardId);

	    $.ajax({
	        url: '${path}/deckMakers/getPCardDetails',
	        type: 'GET',
	        data: { card_id: cardId },
	        dataType: 'json',
	        success: function(data) {
	            console.log('Response data:', data);
	            document.getElementById('cardImage').src = data.card_image;
	            document.getElementById('cardName').textContent = data.card_name;
	            document.getElementById('cardType').textContent = '타입 : ' + data.card_type;
	            document.getElementById('cardSort').textContent = '종류 : ' + data.card_sort;
	            document.getElementById('cardFeature').textContent = '특성 : ' + data.feature;
	        },
	        error: function(xhr, status, error) {
	            console.error('Fetch error:', error);
	        }
	    });
	}
	//첫번째 카드 자동불러오기
	$(document).ready(function() {
		var firstCardId = $("#deckList .listCard").first().attr("alt");
		if (firstCardId) {
			showCardDetails(firstCardId);
		}
	});
	
	</script>
</body>

</html>