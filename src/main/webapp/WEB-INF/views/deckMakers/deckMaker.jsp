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
    <div class="header-image">
        <img src="../image/pokemon_banner.png">
    </div>
    <div class="top-container">
        <div class="search-area-full">
            <div class="search-input-wrapper">
                <input type="text" class="card-search-box" placeholder="검색어를 입력하세요.">
                <button type="submit" class="card-search">
                    <img src="../icon/search.png" alt="search" class="card-search-icon">
                </button>
            </div>
            <button type="button" class="filter-btn">
                <img src="../icon/filter.png" class="filter-icon">필터</button>
        </div>
    </div>
    <div class="container">
        <div class="main-content-2">
            <div class="accordion">
                <div class="accordion-item">
                    <div class="accordion-header">포켓몬</div>
                    <div class="accordion-content" id="deckList">
                        <div class="card-count">
                            <img src="../image/innercard.png" class="listCard" value="1">
                        </div>
                        <div class="card-count">
                            <img src="../image/innercard.png" class="listCard" value="2">
                        </div>
                        <div class="card-count">
                            <img src="../image/innercard.png" class="listCard" value="3">
                        </div>
                        <div class="card-count">
                            <!-- <div class="count-overlay">
                                <div class="count-circle">
                                    2
                                </div>
                            </div> -->
                            <img src="../image/innercard.png" class="listCard" value="4">
                        </div>
                        <div class="card-count">
                            <img src="../image/innercard.png" class="listCard" value="5">
                        </div>
                        <div class="card-count">
                            <img src="../image/innercard.png" class="listCard" value="6">
                        </div>
                        <div class="card-count">
                            <img src="../image/innercard.png" class="listCard" value="7">
                        </div>
                        <div class="card-count">
                            <img src="../image/innercard.png" class="listCard" value="8">
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <div class="accordion-header">트레이너스</div>
                    <div class="accordion-content">
                        <img src="../image/innercard.png" class="listCard" value="9">
                        <img src="../image/innercard.png" class="listCard" value="10">
                        <img src="../image/innercard.png" class="listCard" value="11">
                        <img src="../image/innercard.png" class="listCard" value="12">
                        <img src="../image/innercard.png" class="listCard" value="13">
                        <img src="../image/innercard.png" class="listCard" value="14">
                        <img src="../image/innercard.png" class="listCard" value="15">
                        <img src="../image/innercard.png" class="listCard" value="16">
                        <img src="../image/innercard.png" class="listCard" value="17">
                        <img src="../image/innercard.png" class="listCard" value="18">
                    </div>
                </div>
                <div class="accordion-item">
                    <div class="accordion-header">에너지</div>
                    <div class="accordion-content">
                        <img src="../image/innercard.png" class="listCard" value="19">
                        <img src="../image/innercard.png" class="listCard" value="20">
                        <img src="../image/innercard.png" class="listCard" value="21">
                        <img src="../image/innercard.png" class="listCard" value="22">
                        <img src="../image/innercard.png" class="listCard" value="23">
                        <img src="../image/innercard.png" class="listCard" value="24">
                        <img src="../image/innercard.png" class="listCard" value="25">
                        <img src="../image/innercard.png" class="listCard" value="26">
                        <img src="../image/innercard.png" class="listCard" value="27">
                        <img src="../image/innercard.png" class="listCard" value="28">
                    </div>
                </div>
            </div>
            <div class="comment">
                <textarea cols="28" rows="1" placeholder="덱 이름을 입력해주세요." class="deckTitle"></textarea>
                <textarea cols="50" rows="6" placeholder="코멘트를 적어주세요." class="commentBox"></textarea>
                <button type="submit" class="regist-btn" onclick="location.href='deckListMain.html'">등록하기</button>
            </div>
        </div>
        <div class="deck-list">
            <ul class="deckList">
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="1">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="2">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="3">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="4">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="5">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="6">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="7">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="8">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="9">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="10">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="11">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="12">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="13">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="14">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="15">
                </li>
                <li class="makeList">
                    <img src="../image/makerlist-pokemon.png" class="makerCard" value="16">
                </li>
            </ul>
        </div>
    </div>
    <!--footer-->
    <footer data-include-path="footer.html"></footer>
    <script type="module" src="../js/main.js"></script>
</body>

</html>