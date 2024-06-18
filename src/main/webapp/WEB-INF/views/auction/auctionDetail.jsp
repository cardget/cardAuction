<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
<link rel="stylesheet" href="${path }/resources/css/auctionDetail.css" />
<link rel="stylesheet" href="${path }/resources/css/main.css" />

<title>카드득</title>
<style>

</style>
</head>
<body>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<!--header-->
    <%@ include file="/WEB-INF/views/main/header.jsp" %>

<!-- 상단 이미지 -->
<div class="topimage">
	<!-- <div class="search-area">
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
	-->
</div>

<div class="back-wrap"><button class="back-btn">목록으로 돌아가기</button></div>
<div class="container">
	
	<!-- 이미지 슬라이더 -->
	<div class="wrapper">
		<main id="main">
			<section id="sliderType01">
				<div class="slider__wrap">
					
					<div class="slider__img">
						<div class="slider__inner">
							<div class="slider" role="group" aria-label="1/5">
								<img src="${path}/resources/images/pokemon/sampleimage1.png" alt="이미지1">
							</div>
							<div class="slider" role="group" aria-label="2/5">
								<img src="${path}/resources/images/pokemon/sampleimage1.png" alt="이미지2">
							</div>
							<div class="slider" role="group" aria-label="3/5">
								<img src="${path}/resources/images/pokemon/sampleimage1.png" alt="이미지3">
							</div>
							<div class="slider" role="group" aria-label="4/5">
								<img src="${path}/resources/images/pokemon/sampleimage1.png" alt="이미지4">
							</div>
							<div class="slider" role="group" aria-label="5/5">
								<img src="${path}/resources/images/pokemon/sampleimage1.png" alt="이미지5">
							</div>
						</div>
						<div class="slider__btn">
							<a href="#" class="prev" role="button" aria-label="왼쪽 이미지">prev</a>
							<a href="#" class="next" role="button" aria-label="오른쪽 이미지">next</a>
						</div>
					</div>
					<div class="slider__preview">
						<img src="${path}/resources/images/pokemon/sampleimage1.png" alt="이미지1">
						<img src="${path}/resources/images/pokemon/sampleimage1.png" alt="이미지2">
						<img src="${path}/resources/images/pokemon/sampleimage1.png" alt="이미지3">
						<img src="${path}/resources/images/pokemon/sampleimage1.png" alt="이미지4">
						<img src="${path}/resources/images/pokemon/sampleimage1.png" alt="이미지5">
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
<script type="module" src="${path}/resources/js/main.js"></script>

</body>
</html>

