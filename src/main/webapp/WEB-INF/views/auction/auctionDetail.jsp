<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">

<title>카드득</title>
<style>

body{
	font-family: 'Apple SD Gothic Neo', sans-serif;
}
/*header*/
.logo {
	width: 95px;
	height: 25px;
}

.top {
	backdrop-filter: blur(10px);
	border-bottom: 1px solid #fff;
	width: 100%;
	box-sizing: border-box;
	position: fixed;
	z-index: 1000;
}

.top-nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 16px;
	padding: 0 270px;
	height: 60px;
	box-sizing: border-box;
	background-color: rgba(255, 255, 255, .3);
	position: relative;
	margin: 0 auto;
	width: 100%;
}

.category-box {
	display: flex;
	gap: 20px;
	margin: 0;
	padding: 0;
	font-weight: 500;
}

.category-item {
	list-style: none;
	text-align: center;
}

.category-item a {
	text-decoration: none;
	color: #2c2c2c;
}


.row-content {
	gap: 95px;
	margin-top: 100px;
	display: flex;
}

ul {
	list-style: none;
	padding: 0;
}

.cardType {
	width: 200px;
	height: 300px;
	box-shadow: 4px 4px 5px 1px rgba(0, 0, 0, .3);
	cursor: pointer;
	transition: 0.6;
}

.cardType:hover {
	transform: scale(1.1)
}

/*footer*/
.info-page {
	background-color: #002E5B;
	color: #ffffff;
	padding: 30px 270px;
	font-size: 12px;
	font-family: 'Apple SD Gothic NeoL', sans-serif;
	bottom: 0;
}

.link-container {
	display: flex;
	flex-direction: row;
	gap: 10px;
	font-size: 14px;
	font-weight: 300;
}

.container {
    width: 1380px;
    margin: 0 270px;
    display: flex; 
    gap: 20px; 
}

.auction-detail-wrapper {
	margin-top:40px;
    width: 780px;
    flex: 1; 
}
.hr1 {
	width:700px;
	margin: 10px 0px;
	
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
    background-image: linear-gradient(180deg, rgba(255, 255, 255, 0) 0%, rgb(83 83 83 / 32%) 63%, rgb(0 0 0 / 74%) 100%), url('../static/image/bgP1.png');
    position: relative; /* 상대 위치 설정 */
}

.search-area {
    width: 1380px;
    height: 106px;
    background-color: white;
    border-top-left-radius: 10px; /* 왼쪽 위 */
    border-top-right-radius: 10px; /* 오른쪽 위 */
    position: absolute; /* 절대 위치 설정 */
    bottom: 0; /* 부모 요소의 아래쪽에 위치 */
    left: 50%; /* 부모 요소의 가로 중앙에 위치 */
    transform: translateX(-50%); /* 요소의 가로 중앙을 기준으로 조정 */
    display: flex;
    justify-content: center;
}

.search-area .main-select, .search-box {
    background-color: #fff;
    margin-top: 50px;
    border: 1px solid #007FFF;
    height: 42px;
    border-radius: 30px;
}

.main-select {
    width: 120px;
    padding: 0 20px;
}

input {
    width: 500px;
    padding: 0 20px;
    
}

.search-icon {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
}

.search-input-wrapper {
    position: relative;
}

.search-btn {
    position: absolute;
    right: 5px;
    top: 70px;
    transform: translateY(-50%);
    background: none;
    border: none;
    padding: 0;
    cursor: pointer;
}

.search-icon {
    width: 24px;
    height: 24px;
    padding-right: 5px;
}

select {
    -webkit-appearance: none;
    background: url('../icon/underArrow.png') no-repeat 85% 50%/16px auto;
    cursor: pointer;
}

/* 물품 판매 등록 버튼 */
.auction-insert-wrapper {
    position: relative;
    margin-left: 40px;
}

.insert-btn {
    border-radius: 30px;
    border: 1px solid #007FFF;
    background-color: #007FFF;
    color: #fff;
    margin-top: 50px;
    width: 120px;
    height: 42px;
}

/* 이미지 슬라이더 부분 */
.wrapper {
    width: 600px;
}

/* slider */
.slider__wrap {
    width: 100%;
    margin-top:40px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

/* 이미지 보이는 부분 */
.slider__img {
    position: relative;
    width: 550px;
    height: 550px;
    overflow: hidden;
    margin-bottom: 20px;
}

/* 이미지 감싸고 있는 부모 : 움직이는 부분 */
.slider__inner {
    display: flex;
    flex-wrap: wrap;
    width: 3600px;
    height: 400px;
}

/* 개별적인 이미지 */
.slider {
    position: relative;
    width: 550px;
    height: 550px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.slider img {
    width: 100%;
    max-height: 100%;
    object-fit: contain;
}

.slider::before {
    position: absolute;
    left: 5px;
    top: 5px;
    background: rgba(0, 0, 0, 0.4);
    color: #fff;
    padding: 5px 10px;
}

.slider:nth-child(1)::before {
    content: '이미지1';
}

.slider:nth-child(2)::before {
    content: '이미지2';
}

.slider:nth-child(3)::before {
    content: '이미지3';
}

.slider:nth-child(4)::before {
    content: '이미지4';
}

.slider:nth-child(5)::before {
    content: '이미지5';
}

@media (max-width: 800px) {
    .slider__img {
        width: 400px;
        height: 300px;
    }
}

.slider__btn a {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 50px;
    height: 50px;
    background: rgba(0, 0, 0, 0.4);
    text-align: center;
    line-height: 50px;
    transition: all 0.2s;
    display: block;
    color: #fff;
    z-index: 10; /* 이미지 위로 버튼이 보이도록 설정 */
}

.slider__btn a:hover {
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.4);
    color: #000;
}

.slider__btn a.prev {
    left: 10px; /* 이미지의 왼쪽에 위치 */
}

.slider__btn a.next {
    right: 10px; /* 이미지의 오른쪽에 위치 */
}

.slider__preview {
    display: flex;
    justify-content: center;
    gap: 10px;
}

.slider__preview img {
    width: 100px;
    height: 80px;
    border-radius:5px;
    cursor: pointer;
    transition: transform 0.3s;
}

.slider__preview img:hover {
    transform: scale(1.1);
}

/*detail */
h2{
	font-size:22px;
}
.detail-container{
	padding-left:10px;
	
}
.auction-detail-wrapper{
	padding:10px;
	margin-right: 25px;
}
.card-info{
	font-size:22px;
}
.auction-start-date, .auction-end-date, .people-cnt, .detail-card-status, .trans-method,
.detail-cmt-title, .card-detail-cmt, .seller-nick, .seller-rank  {
	font-size:16px;

}
.bidding-wrapper{
	font-size:18px;
}
/*상세정보*/

.detail-container > div {
    margin-bottom: 20px;
}
.card-detail-cmt{
	border:1px solid #E1E6EC;
	border-radius:5px;
	padding:8px;
	width:680px;
	height:100px;
	color:#808892;
	
	
}
.detail-cmt-title{
	margin-bottom:10px;
}

/*경매참여*/
.bidding-price-field{
	border:1px solid #E1E6EC;
	border-radius:5px;
	height:32px;
}
.bidding-btn{
	font-weight: bold;
	border:1px solid #007FFF;
	border-radius : 5px;
	background-color: #007FFF;
	color: white;
	width:140px;
	height:34px;
	
}
/*판매자 정보*/
.seller-nick, .seller-rank{
	color: #808892;
}

</style>
</head>
<body>

<!--header-->
<header data-include-path="main-header.html"></header>

<!-- 상단 이미지 -->
<div class="topimage">
	<div class="search-area">
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
</div>


<div class="container">

	<!-- 이미지 슬라이더 -->
	<div class="wrapper">
		<main id="main">
			<section id="sliderType01">
				<div class="slider__wrap">
					
					<div class="slider__img">
						<div class="slider__inner">
							<div class="slider" role="group" aria-label="1/5">
								<img src="../static/image/sampleimage1.png" alt="이미지1">
							</div>
							<div class="slider" role="group" aria-label="2/5">
								<img src="../static/image/backgroundDigimon.png" alt="이미지2">
							</div>
							<div class="slider" role="group" aria-label="3/5">
								<img src="../static/image/sampleimage3.png" alt="이미지3">
							</div>
							<div class="slider" role="group" aria-label="4/5">
								<img src="../static/image/backgroundYou.jpg" alt="이미지4">
							</div>
							<div class="slider" role="group" aria-label="5/5">
								<img src="../static/image/sampleimage5.png" alt="이미지5">
							</div>
						</div>
						<div class="slider__btn">
							<a href="#" class="prev" role="button" aria-label="왼쪽 이미지">prev</a>
							<a href="#" class="next" role="button" aria-label="오른쪽 이미지">next</a>
						</div>
					</div>
					<div class="slider__preview">
						<img src="../static/image/sampleimage1.png" alt="이미지1">
						<img src="../static/image/backgroundDigimon.png" alt="이미지2">
						<img src="../static/image/sampleimage3.png" alt="이미지3">
						<img src="../static/image/backgroundYou.jpg" alt="이미지4">
						<img src="../static/image/sampleimage5.png" alt="이미지5">
					</div>
				</div>
			</section>
		</main>
	</div>
	<div class="auction-detail-wrapper">
		<div class="detail-header">
			<h2>제목 | 1998 포켓몬 피카츄 일러스트레이터 카드 PSA 8 한정판 포켓몬카드 팝니다</h2>
			<span>tag</span>
		</div>
		
		<hr class="hr1">
		<div class="detail-container">
			
			<div class="card-info">
				피카츄 일러스트레이터 카드 PSA 8 
			</div>
			<div class="auction-start-date">
				경매등록시간 :
			</div>
			<div class="auction-end-date">
				경매종료시간 : 
			</div>
			<div class="people-cnt">
				참여인원 :
			</div>
			<div class="detail-card-status">
				물품상태 :
			</div>
			<div class="trans-method">
				거래방식 :
			</div>

			<div class="card-detail-cmt-wrapper">
				<div class="detail-cmt-title">정보</div>
				<div class="card-detail-cmt">
					1998년 제작된 일본판 원본 피카츄일러스트 카드입니다.  진짜 옛날 카드이지만 상태도 좋고 비싼겁니다. 
					카드 소장하시는 분들은 충분히 살 만한 가치가 있다고 생각됩니다.
					구매하시면 카드 보관용 케이스와 관리 용품까지 같이 드립니다.
				</div>
			</div>
			<hr class="hr1">
			<div class="seller-nick">
				판매자닉네임 : 
			</div>
			<div class="seller-rank">
				판매자등급 :
			</div>
			<div class="bidding-wrapper">
				<input type="number" id="bidding_price" class="bidding-price-field" placeholder="입찰 가격을 입력하세요.">
				<button class="bidding-btn">경매 참여</button>
			</div>
		</div>
		
	</div>

</div>




<script>
	const sliderWrap = document.querySelector(".slider__wrap");
	const sliderImg = document.querySelector(".slider__img"); // 보여지는 영역
	const sliderInner = document.querySelector(".slider__inner"); // 움직이는 영역
	const slider = document.querySelectorAll(".slider"); // 이미지
	const sliderPreview = document.querySelectorAll(".slider__preview img"); // 프리뷰 이미지

	let currentIndex = 0; // 현재 이미지
	let sliderCount = slider.length; // 이미지 갯수
	let sliderWidth = sliderImg.offsetWidth; // 이미지 가로값

	// 이미지 이동
	function gotoSlider(num) {
		sliderInner.style.transition = "all 400ms";
		sliderInner.style.transform = "translateX(" + -sliderWidth * num + "px)";
		currentIndex = num;
	}

	// 버튼 클릭했을 때
	document.querySelectorAll(".slider__btn a").forEach((btn, index) => {
		btn.addEventListener("click", (e) => {
			e.preventDefault();
			let prevIndex = (currentIndex + (sliderCount - 1)) % sliderCount;
			let nextIndex = (currentIndex + 1) % sliderCount;

			if (btn.classList.contains("prev")) {
				gotoSlider(prevIndex);
			} else {
				gotoSlider(nextIndex);
			}
		});
	});

	// 프리뷰 이미지를 클릭했을 때 해당 이미지로 이동
	sliderPreview.forEach((preview, index) => {
		preview.addEventListener("click", () => {
			gotoSlider(index);
		});
	});
</script>

<!--footer-->
<footer data-include-path="footer.html"></footer>
<script type="module" src="../static/js/main.js"></script>

</body>
</html>

