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
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>카드득</title>
<style>

</style>

</head>
<body>
	<c:set var="path" value="${pageContext.servletContext.contextPath}" />
	<!--header-->

	<c:choose>
    	<c:when test="${empty userid}">
    		<%@ include file="/WEB-INF/views/main/defaultHeader.jsp"%>
    	</c:when>
    	<c:otherwise>
    		<%@ include file="/WEB-INF/views/main/loginHeader.jsp"%>
    	</c:otherwise>
    </c:choose>
	
	
	
	<!-- 상단 이미지 -->
	<div class="header-image">
		<img src="${path }/resources/images/default/pokemon_banner.png">
	</div>

	<div class="back-wrap">
		<c:choose>
			<c:when test="${itemDetailOne.cat == 0}">
				<button onclick="location.href='${path}/auction/auctionMain'" class="back-btn">목록으로 돌아가기</button>
			</c:when>
			<c:when test="${itemDetailOne.cat == 1}">
				<button onclick="location.href='${path}/auction/auctionDMain'" class="back-btn">목록으로 돌아가기</button>
			</c:when>
			<c:when test="${itemDetailOne.cat == 2}">
				<button onclick="location.href='${path}/auction/auctionYMain'" class="back-btn">목록으로 돌아가기</button>
			</c:when>
			<c:when test="${itemDetailOne.cat == 3}">
				<button onclick="location.href='${path}/auction/auctionOMain'" class="back-btn">목록으로 돌아가기</button>
			</c:when>
			<c:when test="${itemDetailOne.cat == 4}">
				<button onclick="location.href='${path}/auction/auctionSMain'" class="back-btn">목록으로 돌아가기</button>
			</c:when>
		</c:choose>
		
	</div>
	<div class="container">

		<!-- 이미지 슬라이더 -->
		<div class="wrapper">
			<main id="main">
				<section id="sliderType01">
					<div class="slider__wrap">

						<div class="slider__img">
							<div class="slider__inner">
								<c:if test="${itemDetailOne.image1 != null}">
									<div class="slider" role="group" aria-label="1/5">
										<img src="${itemDetailOne.image1}" alt="이미지1">
										 <div class="overlay">종료된 경매입니다.</div>
									</div>
								</c:if>
								<c:if test="${itemDetailOne.image2 != null}">
									<div class="slider" role="group" aria-label="2/5">
										<img src="${itemDetailOne.image2}" alt="이미지2">
										 <div class="overlay">종료된 경매입니다.</div>
									</div>
								</c:if>
								<c:if test="${itemDetailOne.image3 != null}">
									<div class="slider" role="group" aria-label="3/5">
										<img src="${itemDetailOne.image3}" alt="이미지3">
										 <div class="overlay">종료된 경매입니다.</div>
									</div>
								</c:if>
								<c:if test="${itemDetailOne.image4 != null}">
									<div class="slider" role="group" aria-label="4/5">
										<img src="${itemDetailOne.image4}" alt="이미지4">
										 <div class="overlay">종료된 경매입니다.</div>
									</div>
								</c:if>
								<c:if test="${itemDetailOne.image5 != null}">
									<div class="slider" role="group" aria-label="5/5">
										<img src="${itemDetailOne.image5}" alt="이미지5">
										 <div class="overlay">종료된 경매입니다.</div>
									</div>
								</c:if>
							</div>

							<div class="slider__btn">
								<a href="#" class="prev" role="button" aria-label="왼쪽 이미지">
									<img src="${path}/resources/images/leftBtn.png" alt="leftBtn"
									class="left-icon">
								</a> <a href="#" class="next" role="button" aria-label="오른쪽 이미지">
									<img src="${path}/resources/images/rightBtn.png" alt="rightBtn"
									class="right-icon">
								</a>
							</div>
						</div>
						<div class="slider__preview">
							<c:if test="${itemDetailOne.image1 != null}">
								<img src="${itemDetailOne.image1}" alt="이미지1">
							</c:if>
							<c:if test="${itemDetailOne.image2 != null}">
								<img src="${itemDetailOne.image2}" alt="이미지2">
							</c:if>
							<c:if test="${itemDetailOne.image3 != null}">
								<img src="${itemDetailOne.image3}" alt="이미지3">
							</c:if>
							<c:if test="${itemDetailOne.image4 != null}">
								<img src="${itemDetailOne.image4}" alt="이미지4">
							</c:if>
							<c:if test="${itemDetailOne.image5 != null}">
								<img src="${itemDetailOne.image5}" alt="이미지5">
							</c:if>
						</div>
					</div>
				</section>
			</main>
		</div>
		<div class="auction-detail-wrapper">
			<div class="detail-header">
				<button class="end-tag">경매종료</button>
				<h2>${itemDetailOne.item_name}</h2>
			</div>

			<hr class="hr1">
			<div class="detail-container2">

				<div class="card-info">카드 정보 : ${itemDetailOne.card_name}
					<c:choose><c:when test="${itemDetailOne.card_name == null}">알수없음</c:when></c:choose>
				</div>
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
				<div class="rarity">희귀도 : ${itemDetailOne.rarity}</div>
				<!-- <div class="trans-method">
					거래방식 :
					<c:choose>
						<c:when test="${itemDetailOne.trade_type == 1}">상관없음</c:when>
						<c:when test="${itemDetailOne.trade_type == 2}">직거래</c:when>
						<c:when test="${itemDetailOne.trade_type == 3}">중개</c:when>
						<c:otherwise>알 수 없음</c:otherwise>
					</c:choose>
				</div> -->

				<div class="card-detail-cmt-wrapper">
					<div class="detail-cmt-title">정보</div>
					<div class="card-detail-cmt">
					<textarea class="cmtArea" cols="50" rows="8" readonly><c:out value="${itemDetailOne.cmt}" /></textarea>
					</div>
				</div>
				<hr class="hr1">
				<div class="seller-nick">판매자닉네임 : ${itemDetailOne.nickname}</div>
				<div class="seller-rank">판매자등급 : ${itemDetailOne.user_tier}</div>
				
				<div class="bidding-wrapper">
					<form class="bidding-form"
						action="${path}/auction/auctionBidding.do" method="post">
						<input type="number" id="item_id" name="item_id"
							class="hidden-input-itemId" value="${itemDetailOne.item_id}">
						<input type="text" id="user_id" name="user_id" 
							class="hidden-input-sellerId" value="${itemDetailOne.user_id}">
						<input type="number" id="price" name="price"
							class="bidding-price-field" placeholder="입찰 가격을 입력하세요." step="1000" min="1000">
						<button type="submit" class="bidding-btn">경매 참여</button>
						
					</form>
						<button class="like-btn" id="likeBtn" data-user-id="${userId}" data-item-id="${itemDetailOne.item_id}">관심 물품</button>
				</div>
				 <div id="errorMessage" class="error"></div> 
				
				 <c:if test="${isBidHas == true}">
					 <div class="bidding-wrapper2" >
						 <form class="bidding-update-form" action="${path }/auction/auctionBidUpdate.do" method="post" style="display: block !important">
						 	<input type="number" id="item_id" name="item_id"
									class="hidden-input-itemId" value="${itemDetailOne.item_id}">
							<input type="text" id="user_id" name="user_id" 
									class="hidden-input-sellerId" value="${userId}">
							<input type="number" id="price" name="price" 
									class="bidding-price-field" placeholder="수정 할 입찰 가격을 입력하세요." step="1000" min="1000" style="margin-right:4px">
							<button type="submit" class="bidding-btn">입찰 수정</button>
							<div class="my-bid-price">현재 입찰 금액 : ${price}</div>
						 </form>
					 </div>
				  </c:if>
			</div>

		</div>

	</div>


	

	<script>
	$(document).ready(function() {
	    var endDate = new Date("${itemDetailOne.end_date}"); // 경매 종료 날짜, Date 객체로 변환하여 비교

	    // 현재 날짜와 경매 종료 날짜 비교
	    var currentDate = new Date(); // 현재 날짜
	    if (endDate < currentDate) {
	        $('.end-tag').show(); // 경매 종료된 경우 버튼 보이기
	        $('.overlay').show(); // 경매 종료된 경우 오버레이 보이기
	    } else {
	        $('.end-tag').hide(); // 경매 종료되지 않은 경우 버튼 숨기기
	    }
	});
	//입찰 
	document.addEventListener("DOMContentLoaded", function() {
	    const biddingForm = document.querySelector(".bidding-form");

	    if (!biddingForm) {
	        console.error("Bidding form not found");
	        return;
	    }

	    // 가격 유효성 검사
	    function validatePrice() {
	        const priceField = document.getElementById("price");
	        const price = priceField.value;
	        if (!price) {
	            alert("입찰가를 입력해주세요.");
	            return false; // 폼 제출 중지
	        }
	        if (price % 1000 !== 0) {
	            alert("입찰 가격은 1000 단위로 입력해야 합니다.");
	            return false; // 폼 제출 중지
	        }
	        return true; // 폼 제출 허용
	    }
	 	

	    biddingForm.addEventListener("submit", function(e) {
	        e.preventDefault();

	        if (!validatePrice()) {
	            return; // 유효성 검사가 실패하면 폼 제출을 중단
	        }

	        const item_id = document.getElementById("item_id").value;
	        const price = document.getElementById("price").value;
	 
	        
	        const formData = {
	            item_id: item_id,
	            price: price,
	        
	        };

	        fetch(`<%=request.getContextPath()%>/auction/auctionBidding.do`, {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json'
	            },
	            body: JSON.stringify(formData)
	        })
	        .then(response => {
	            if (!response.ok) {
	                throw new Error('Network response was not ok');
	            }
	            console.log(response)
	            return response.json();
	        })
	        .then(data=> {
	        	const errorMessageElement = document.getElementById("errorMessage");
	            errorMessageElement.textContent = data.message;
	            
	        });
	    });
	});
	//이미지슬라이더
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
	
	
	$(document).ready(function() {
	    var userId = $('#likeBtn').data('user-id');
	    var itemId = $('#likeBtn').data('item-id');

	    // 페이지 로드 시 현재 상태 확인
	    checkLikeStatus(userId, itemId);

	    $('#likeBtn').click(function() {
	        if ($(this).hasClass('act')) {
	            // 관심물품 삭제
	            $.ajax({
	                url: '/myapp/auction/removeLike',
	                type: 'POST',
	                data: { "userId": userId,
	                		"itemId": itemId },
	                success: function(response) {
	                    if (response) {
	                        $('#likeBtn').removeClass('act').text('관심 물품');
	                    } else {
	                        $('#errorMessage').text('관심 물품을 삭제하는데 실패했습니다.');
	                    }
	                }
	            });
	        } else {
	            // 관심물품 등록
	            $.ajax({
	                url: '/myapp/auction/addLike',
	                type: 'POST',
	                data:  { "userId": userId,
                			"itemId": itemId },
	                success: function(response) {
	                    if (response) {
	                        $('#likeBtn').addClass('act').text('관심 물품');
	                    } else {
	                        $('#errorMessage').text('관심 물품을 추가하는데 실패했습니다.');
	                    }
	                }
	            });
	        }
	    });

	    function checkLikeStatus(userId, itemId) {
	        $.ajax({
	            url: '/myapp/auction/isLiked',
	            type: 'POST',  // 변경된 부분
	            data: { "userId": userId, "itemId": itemId },
	            success: function(response) {
	                console.log('isLiked response:', response);
	                if (response === "liked") {
	                    $('#likeBtn').addClass('act').text('관심 물품');
	                } else {
	                    $('#likeBtn').removeClass('act').text('관심 물품');
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error('Error checking like status:', error);
	                $('#errorMessage').text('관심 물품 상태를 확인하는데 실패했습니다.');
	            }
	        });
	    }
	});
	
</script>

	<!--footer-->
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
	<script type="module" src="${path}/resources/js/main.js"></script>

</body>
</html>

