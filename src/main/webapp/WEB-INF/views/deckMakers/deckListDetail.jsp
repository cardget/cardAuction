<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
    <title>카드득</title>
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="icon" href="../icon/favicon.ico" type="image/x-icon">
</head>

<body>
    <!--header-->
    <header data-include-path="header.html"></header>
    <div class="deck-detail-image">
        <div class="banner-overlay"> <!--정보입력 오버레이-->
            <p>날뛰는우레 & 모래털가죽</p>
            <div class="makerInfo"><img src="../icon/profile.png">
                <div>제작자명</div>
                <div>제작일자</div>
                <div>추천수</div>
            </div>
        </div>
        <img src="../image/deckDetail-banner.png">
    </div>
    <div class="container">
        <div class="sidebar">
            <div class="card-info">
                <img src="../image/innercard.png" alt="카드 이미지" class="card-img">
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
                            <img src="../image/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="../image/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="../image/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="../image/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="../image/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="../image/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="../image/innercard.png" class="listCard">
                        </div>
                        <div class="card-count">
                            <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div>
                            <img src="../image/innercard.png" class="listCard">
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <div class="accordion-header">트레이너스 (38)</div>
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
                <textarea cols="50" rows="6" placeholder="알아서 재밌게 쓰시면 되는 덱입니다. 질문 받지 않습니다." class="commentBox"></textarea>
            </div>
            <div class="recommend-button">
                <button onclick="recommendDeck()">추천</button>
            </div>
        </div>
    </div>
    <!--footer-->
    <footer data-include-path="footer.html"></footer>
    <script type="module" src="../js/main.js"></script>
</body>

</html>