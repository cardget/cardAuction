<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
<title>카드득</title>
<link rel="stylesheet" href="../../../resources/css/auctionmain.css" />

<script src="../static/js/select.js"></script>

<style>

.top-info-wrapper{
	padding-top:10px;
} 
/*layer 구분선*/
.hr1{
	width:1380px;
}
/* 상단 이미지 */
.imgbox {
	width: 1920px;
	height: 424px;
}

.topimage {
	
	width: 1920px;
	height: 400px;
	top: 0;
	left: 0;
	background-image: linear-gradient(180deg, rgba(255, 255, 255, 0) 0%, rgb(83 83 83 / 32%) 63%,
	 rgb(0 0 0 / 74%) 100%), url('../static/image/bgP1.png');
		
}
/* 물품 판매 등록 버튼*/
.auction-insert-wrapper {
	position:relative;
	margin-left:40px;
}

.insert-btn {
	border-radius:30px;
	border : 1px solid #007FFF;
	background-color: #007FFF;
	color: #fff;
	margin-top:50px;
	width: 120px;
	height: 42px;
	
}
/*상단 정보*/
.top-info-wrapper{ 
	width:1380px;
	font-size: 16px;
	font-family: 'Apple SD Gothic Neo', sans-serif;
	color: #565A66;
	
}

/* 경매 물품 리스트 칸 width-1380 */
.auction-list-wrapper{
	width:1380px;
	display:flex;
	flex-wrap: wrap;
	margin: auto 270px;
	
}
/*경매 리스트 item*/
.auction-item {
	border:1px solid #E1E6EC;
	border-radius:10px;
	width:316px;
	margin:40px 60px;
	
	/*height:548px;*/
}

.card-image {
	width:268px;
	height:376px;
	margin:12px 24px;
	
}
.hr2{
	width:315px;
	border:1px solid #E1E6EC;
	
}
.title-wrapper{
	font-size:18px;
	width:268px;
	margin:0px 24px 12px 24px;
	overflow: hidden;
    word-wrap: break-word;
}
.date-wrapper{
	margin:6px 24px;
	font-size:14px;
	color: #FE3838;
	
}

.info-wrapper{
	display: flex;
	margin:6px 24px;
	font-size:14px;

}	
.people{
	color: #007FFF
}
.tmethod{
	margin:0 0 0 100px ;
	color: #CCC7C0;
}

/*item안에 버튼 (관심/상세)*/
.button-wrapper{
	display: flex;
	justify-content: center;
	position:relative;
	margin-top:10px;
	margin-bottom: 12px;
	font-size:14px;

}
.auction-interest{
	border-radius:5px;
	border : 1px solid #007FFF;
	color: #007FFF;
	background-color:#fff;
	width: 120px;
	height: 34px;
}

.interest-icon{
	width:14px;
	height:14px;
}

.auction-detail-btn{
	border-radius:5px;
	border : 1px solid #007FFF;
	background-color: #007FFF;
	color: #fff;
	width: 120px;
	height: 34px;
	margin-left: 20px;
}
/*서브카테고리*/
.sub-category {
    margin-top: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 16px;
    /*padding: 0 270px;*/
    margin-left: 270px;
    margin-right: 270px;
    gap: 80px;
    padding-bottom: 10px;
    border-bottom: 1px solid #E1E6EC;
}
.main-category-box {
    display: flex;
    gap: 100px;
    margin: 0;
    padding: 0;
    font-weight: 1000;
    font-size: 18px;
}

.sub-category-box {
    display: flex;
    gap: 100px;
    margin: 0;
    padding: 0;
    font-weight: 500;
    font-size: 16px;
}

.category-item,
.main-category-item,
.sub-category-item,
.sort-item {
    list-style: none;
    text-align: center;
}

.category-item a,
.main-category-item a,
.sub-category-item a,
.sort-item a {
    text-decoration: none;
    color: #2c2c2c;
}

</style>
</head>
<body>
	<!--header-->
    <header data-include-path="main-header.html"></header>
    
<!-- Body -->
<div class="topimage"></div>
<!-- 검색창 -->
<div class="container">
	<div class="search-area">
            <select class="main-select">
                <option>전체</option>
                <option>포켓몬</option>
                <option>유희왕</option>
                <option>디지몬</option>
                <option>원피스</option>
                <option>스포츠</option>
            </select>
            
            <div class="search-input-wrapper">
                <input type="text" class="search-box" placeholder="검색어를 입력하세요.">
                <button type="submit" class="search-btn">
                    <img src="../static/icon/searchimg.png" alt="search" class="search-icon">
                </button>
            </div>
            <div class="auction-insert-wrapper">
            	<button onclick="" class="insert-btn">판매 물품 등록</button>
            </div>
	</div>
	
	 <div class="sub-category">
            <ul class="sub-category-box">
                <li class="sub-category-item">
                    <a href="#">카드경매</a>
                </li>
                <li class="main-category-item">
                    <a href="deckListMain.html">티어덱리스트</a>
                </li>
                <li class="main-category-item">
                    <a href="#">커뮤니티</a>
                </li>
                <li class="main-category-item">
                    <a href="#">문의</a>
                </li>
            </ul>
    </div>
	
		 <div class="sort-container">
            <div class="sort-nav">
                <ul class="sort-box">
                    <li class="sort-item">
                        <a href="main.html">홈 > </a><a href="#">포켓몬 > </a><a href="#">카드경매</a>
                    </li>
                    <li class="sort-item">
                        정렬기준 :
                        <select class="sort-select">
                            <option>최신순</option>
                            <option>종료임박순</option>
                            <option>참여자많은순</option>
                            <option>참여자적은순</option>
                        </select>
                    </li>
                </ul>
            </div>
        </div>
	
	<div class="auction-list-wrapper">
		<div class="auction-item">
			<img src="../static/image/피카츄 ex.png" alt="card image" class="card-image">
			<div class="title-wrapper">
				글제목
			</div>
			<hr class="hr2">
			<div class="date-wrapper">
				마감일: 2024-07-10
			</div>
			<div class="info-wrapper">		
				<span class="people">참여자 00명</span>
				<span class="tmethod">선호거래방식</span>
			</div>
			<div class="button-wrapper">
				<button class="auction-interest">
					<img src="../static/icon/interest.png" alt="icon" class="interest-icon"> 관심물품</button>
				<button class="auction-detail-btn">상세보기</button>
			</div>
		</div>
		<div class="auction-item">
			<img src="../static/image/피카츄 ex.png" alt="card image" class="card-image">
			<div class="title-wrapper">
				글제목
			</div>
			<hr class="hr2">
			<div class="date-wrapper">
				마감일: 2024-07-10
			</div>
			<div class="info-wrapper">		
				<span class="people">참여자 00명</span>
				<span class="tmethod">선호거래방식</span>
			</div>
			<div class="button-wrapper">
				<button class="auction-interest">
					<img src="../static/icon/interest.png" alt="icon" class="interest-icon"> 관심물품</button>
				<button class="auction-detail-btn">상세보기</button>
			</div>
		</div>
		<div class="auction-item">
			<img src="../static/image/피카츄 ex.png" alt="card image" class="card-image">
			<div class="title-wrapper">
				글제목
			</div>
			<hr class="hr2">
			<div class="date-wrapper">
				마감일: 2024-07-10
			</div>
			<div class="info-wrapper">		
				<span class="people">참여자 00명</span>
				<span class="tmethod">선호거래방식</span>
			</div>
			<div class="button-wrapper">
				<button class="auction-interest">
					<img src="../static/icon/interest.png" alt="icon" class="interest-icon"> 관심물품</button>
				<button class="auction-detail-btn">상세보기</button>
			</div>
		</div>
		<div class="auction-item">
			<img src="../static/image/피카츄 ex.png" alt="card image" class="card-image">
			<div class="title-wrapper">
				글제목
			</div>
			<hr class="hr2">
			<div class="date-wrapper">
				마감일: 2024-07-10
			</div>
			<div class="info-wrapper">		
				<span class="people">참여자 00명</span>
				<span class="tmethod">선호거래방식</span>
			</div>
			<div class="button-wrapper">
				<button class="auction-interest">
					<img src="../static/icon/interest.png" alt="icon" class="interest-icon"> 관심물품</button>
				<button class="auction-detail-btn">상세보기</button>
			</div>
		</div>
	</div>
	<!--페이지네이션-->
        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">7</a>
            <a href="#">8</a>
            <a href="#">9</a>
            <a href="#">10</a>
            <a href="#">&raquo;</a>
        </div>
  
</div>

    <!--footer-->
    <footer data-include-path="footer.html"></footer>
    <script type="module" src="../static/js/main.js"></script>
        
</body>
</html>