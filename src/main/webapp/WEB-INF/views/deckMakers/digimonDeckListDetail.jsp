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
		<img src="${path }/resources/images/default/digimon_banner.png" id="banner">
	</div>
	<div class="detail-container">
		<div class="sidebar">
			<div class="card-info">
				<img src=""
					alt="카드 이미지" class="card-img" id="cardImage">
				<div class="card-details">
					<h2 id="cardName"></h2>
					<p id="cardAttr"></p>
					<p id="cardSort"></p>
					<p id="cardMonsterType"></p>
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
			<div class="recommend-button">
				<button type="button" onclick="recommendDeck(${deck.DECK_ID})">추천</button>
			</div>
		</div>
	</div>
	<!--footer-->
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
	<script type="module" src="${path }/resources/js/main.js"></script>
	<script>
	function recommendDeck(deckId) {
	    $.ajax({
	        url: '${path}/deckMakers/recommendDeck.do',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify({ deck_id: deckId }),
	        dataType: 'json',
	        success: function(data) {
	            if (data.success) {
	                alert('추천되었습니다.');
	                location.reload(); // 페이지 새로고침하여 업데이트된 추천 수 반영
	            } else {
	                alert('추천 처리 중 오류가 발생했습니다.');
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Fetch error:', error);
	            alert('추천 처리 중 오류가 발생했습니다.');
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
	        url: '${path}/deckMakers/getDCardDetails.do',
	        type: 'GET',
	        data: { card_id: cardId },
	        dataType: 'json',
	        success: function(data) {
	            console.log('Response data:', data);
	            //document.getElementById('banner').src = data.card_image;
	            document.getElementById('cardImage').src = data.card_image;
	            document.getElementById('cardName').textContent = data.card_name;
	            document.getElementById('cardAttr').textContent = '타입 : ' + data.card_attr;
	            document.getElementById('cardSort').textContent = '종류 : ' + data.card_sort;
	            document.getElementById('cardMonsterType').textContent = '특성 : ' + data.monster_type;
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
	
	
	var container = document.querySelector('.card-img')
	var overlay = document.querySelector('.overlay')
	container.addEventListener('mousemove', function (e) {
	  var x = e.offsetX
	  var y = e.offsetY
	  console.log(x, y);
	  var rotateY = -1 / 5 * x + 20
	  var rotateX = 4 / 30 * y - 20

	  overlay.style = `background-position : ${x / 5 + y / 5}%; filter : opacity(${x / 200}) brightness(1.2)`

	  container.style = `transform : perspective(350px) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`
	})

	container.addEventListener('mouseout', function () {
	  overlay.style = 'filter : opacity(0)'
	  container.style = 'transform : perspective(350px) rotateY(0deg) rotateX(0deg)'
	})
	
	</script>
</body>

</html>