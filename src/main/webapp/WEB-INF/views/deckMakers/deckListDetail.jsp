<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
    <title>카드득</title>
    <link rel="stylesheet" href="${path }/resources/css/main.css" />
    <link rel="icon" href="${path }/resources/icon/favicon.ico" type="image/x-icon">
</head>

<body>
    <!--header-->
    <%@ include file="/WEB-INF/views/main/header.jsp" %>
    <div class="deck-detail-image">
        <div class="banner-overlay"> <!--정보입력 오버레이-->
            <p>날뛰는우레 & 모래털가죽</p>
            <div class="makerInfo"><img src="${path }/resources/icon/profile.png">
                <div>제작자명</div>
                <div>제작일자</div>
                <div>추천수</div>
            </div>
        </div>
        <img src="${path }/resources/images/default/deckDetail-banner.png">
    </div>
    <div class="container">
        <div class="sidebar">
            <div class="card-info">
                <img src="${path }/resources/images/default/innercard.png" alt="카드 이미지" class="card-img">
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
                    <div class="accordion-header">포켓몬 (12)</div>
                    <div class="accordion-content">
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="${path }/resources/images/default/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="${path }/resources/images/default/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="${path }/resources/images/default/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="${path }/resources/images/default/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="${path }/resources/images/default/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="${path }/resources/images/default/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="${path }/resources/images/default/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="${path }/resources/images/default/innercard.png" class="listCard">
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <div class="accordion-header">트레이너스 (38)</div>
                    <div class="accordion-content">
                        <img src="${path }/resources/images/default/innercard.png" class="listCard">
					<img src="${path }/resources/images/default/innercard.png" class="listCard">
					<img src="${path }/resources/images/default/innercard.png" class="listCard">
					<img src="${path }/resources/images/default/innercard.png" class="listCard">
					<img src="${path }/resources/images/default/innercard.png" class="listCard">
					<img src="${path }/resources/images/default/innercard.png" class="listCard">
					<img src="${path }/resources/images/default/innercard.png" class="listCard">
					<img src="${path }/resources/images/default/innercard.png" class="listCard">
					<img src="${path }/resources/images/default/innercard.png" class="listCard">
					<img src="${path }/resources/images/default/innercard.png" class="listCard">
					<img src="${path }/resources/images/default/innercard.png" class="listCard">
                    </div>
                </div>
                <div class="accordion-item">
                    <div class="accordion-header">에너지 (10)</div>
                    <div class="accordion-content">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                        <img src="../image/innercard.png" class="listCard">
                    </div>
                </div>
            </div>
            <p class="builder-comment">제작자 코멘트</p>
            <div class="comment">
                <textarea cols="50" rows="6" placeholder="알아서 재밌게 쓰시면 되는 덱입니다. 질문 받지 않습니다."
                    class="commentBox" disabled></textarea>
            </div>
            <div class="recommend-button">
                <button type="submit" onclick="recommendDeck()">추천</button>
            </div>
        </div>
    </div>
    <!--footer-->
    <%@ include file="/WEB-INF/views/main/footer.jsp" %>
    <script type="module" src="${path }/resources/js/main.js"></script>
    <script>
        function recommendDeck() {
            alert("추천되었습니다!");
        }
    </script>
</body>

</html>