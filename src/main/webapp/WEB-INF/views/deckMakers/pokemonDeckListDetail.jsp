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
			<p>날뛰는우레 & 모래털가죽</p>
			<div class="makerInfo">
				<img src="${path }/resources/icon/profile.png">
				<div>제작자명</div>
				<div>제작일자</div>
				<div>추천수</div>
			</div>
		</div>
		<img src="${path }/resources/images/default/deckDetail-banner.png">
	</div>
	<div class="detail-container">
		<div class="sidebar">
			<div class="card-info">
				<img src="${path }/resources/images/default/innercard.png"
					alt="카드 이미지" class="card-img">
				<div class="card-details">
					<h2>날뛰는 우레 ex</h2>
					<p>타입 : 기본</p>
					<p>종류 : 고대</p>
					<p>특성 : 전기</p>
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
								<img src="${card.card_image}" alt="${card.card_id}"
									class="listCard">
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<p class="builder-comment">제작자 코멘트</p>
			<div class="detail-comment">
				<textarea cols="50" rows="6" class="commentBox" disabled>${deck.comment}</textarea>
			</div>
			<div class="recommend-button">
				<button type="button" onclick="recommendDeck(${deck.deck_id})">추천</button>
			</div>
		</div>
	</div>
	<!--footer-->
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
	<script type="module" src="${path }/resources/js/main.js"></script>
	<script>
	function recommendDeck(deckId) {
        fetch('${pageContext.request.contextPath}/recommendDeck.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ deck_id: deckId })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('추천이 성공적으로 반영되었습니다.');
                location.reload(); // 페이지 새로고침하여 업데이트된 추천 수 반영
            } else {
                alert('추천 처리 중 오류가 발생했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('추천 처리 중 오류가 발생했습니다.');
        });
    }	
	</script>
</body>

</html>