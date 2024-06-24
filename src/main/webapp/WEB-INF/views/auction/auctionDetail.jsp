<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.servletContext.contextPath }" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
<link rel="stylesheet" href="${path }/resources/css/auctionDetail.css" />
<link rel="stylesheet" href="${path }/resources/css/main.css" />


<title>카드득</title>
<style>
.like-btn {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 10px 20px;
	border: 1px solid #007FFF;
	border-radius: 5px;
	background-color: white;
	color: #007FFF;
	cursor: pointer;
	width: 140px;
	height: 34px;
}

.like-btn.act {
	border: 1px solid #007FFF;
	border-radius: 5px;
	background-color: #007FFF;
	color: white;
	font-weight: bold;
	width: 140px;
	height: 34px;
}


.bidding-wrapper {
	display: flex;
	align-items: center;
	
	gap: 10px;
	font-size: 18px;
}
</style>

</head>
<body>
	<c:set var="path" value="${pageContext.servletContext.contextPath}" />
	<!--header-->
	<%@ include file="/WEB-INF/views/main/header.jsp"%>

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

	<div class="back-wrap">
		<button onclick="location.href='${path}/auction/auctionMain.do'"
			class="back-btn">목록으로 돌아가기</button>
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
									<img src="${path}/resources/images/pokemon/sampleimage1.png"
										alt="이미지1">
								</div>
								<div class="slider" role="group" aria-label="2/5">
									<img src="${path}/resources/images/pokemon/sampleimage1.png"
										alt="이미지2">
								</div>
								<div class="slider" role="group" aria-label="3/5">
									<img src="${path}/resources/images/pokemon/sampleimage1.png"
										alt="이미지3">
								</div>
								<div class="slider" role="group" aria-label="4/5">
									<img src="${path}/resources/images/pokemon/sampleimage1.png"
										alt="이미지4">
								</div>
								<div class="slider" role="group" aria-label="5/5">
									<img src="${path}/resources/images/pokemon/sampleimage1.png"
										alt="이미지5">
								</div>
							</div>
							<div class="slider__btn">
								<a href="#" class="prev" role="button" aria-label="왼쪽 이미지">prev</a>
								<a href="#" class="next" role="button" aria-label="오른쪽 이미지">next</a>
							</div>
						</div>
						<div class="slider__preview">
							<img src="${path}/resources/images/pokemon/sampleimage1.png"
								alt="이미지1"> <img
								src="${path}/resources/images/pokemon/sampleimage1.png"
								alt="이미지2"> <img
								src="${path}/resources/images/pokemon/sampleimage1.png"
								alt="이미지3"> <img
								src="${path}/resources/images/pokemon/sampleimage1.png"
								alt="이미지4"> <img
								src="${path}/resources/images/pokemon/sampleimage1.png"
								alt="이미지5">
						</div>
					</div>
				</section>
			</main>
		</div>
		<div class="auction-detail-wrapper">
			<div class="detail-header">
				<h2>${itemDetailOne.item_name}</h2>
			</div>

			<hr class="hr1">
			<div class="detail-container">

				<div class="card-info">카드 정보 : ${itemDetailOne.card_name}</div>
				<div class="auction-start-date">경매등록시간 :
					${itemDetailOne.formattedCreateDate}</div>
				<div class="auction-end-date">경매종료시간 :
					${itemDetailOne.end_date}</div>
				<div class="people-cnt">참여인원 : ${itemDetailOne.bid_count}</div>
				<div class="detail-card-status">
					물품상태 :
					<c:choose>
						<c:when test="${itemDetailOne.status == 1}">최상</c:when>
						<c:when test="${itemDetailOne.status == 2}">상</c:when>
						<c:when test="${itemDetailOne.status == 3}">중</c:when>
						<c:when test="${itemDetailOne.status == 4}">하</c:when>
						<c:otherwise>알 수 없음</c:otherwise>
					</c:choose>
				</div>
				<div class="trans-method">
					거래방식 :
					<c:choose>
						<c:when test="${itemDetailOne.trade_type == 1}">상관없음</c:when>
						<c:when test="${itemDetailOne.trade_type == 2}">직거래</c:when>
						<c:when test="${itemDetailOne.trade_type == 3}">중개</c:when>
						<c:otherwise>알 수 없음</c:otherwise>
					</c:choose>
				</div>

				<div class="card-detail-cmt-wrapper">
					<div class="detail-cmt-title">정보</div>
					<div class="card-detail-cmt">${itemDetailOne.cmt}</div>
				</div>
				<hr class="hr1">
				<div class="seller-nick">판매자닉네임 : ${itemDetailOne.nickname}</div>
				<div class="seller-rank">판매자등급 : ${itemDetailOne.user_tier}</div>
				<div class="bidding-wrapper">
					<input type="number" id="bidding_price" class="bidding-price-field"
						placeholder="입찰 가격을 입력하세요.">
					<button class="bidding-btn">경매 참여</button>
					<button class="like-btn" onclick="toggleInterest(this, ${itemDetailOne.item_id})">
						관심 물품
					</button>
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
	
	//관심물품토글
	//function toggleAct(button) {
    //      button.classList.toggle("act");
    //}
	 function toggleAct(button) {
	        button.classList.toggle("act");

	    }
	 function toggleInterest(button, itemId) {
	        const isAct = button.classList.contains("act");
	        const url = isAct ? "${path}/auction/removeInterest" : "${path}/auction/registerInterest";
	        const action = isAct ? "삭제" : "등록";

	        $.ajax({
	            type: "POST",
	            url: url,
	            data: { item_id: itemId },
	            success: function(response) {
	                console.log("Response:", response); // 응답 확인을 위한 콘솔 로그
	                if (response === "success") {
	                    button.classList.toggle("act");
	                } else {
	                    alert("로그인이 필요합니다.");
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error("Error:", error); // 에러 메시지 확인을 위한 콘솔 로그
	                alert("관심 물품 " + action + "에 실패했습니다.");
	            }
	        });
	    }
</script>

	<!--footer-->
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
	<script type="module" src="${path}/resources/js/main.js"></script>

</body>
</html>

