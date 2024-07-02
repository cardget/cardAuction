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
<title>카드득</title>
<link rel="stylesheet" href="${path }/resources/css/auctionMain.css" />
<link rel="stylesheet" href="${path }/resources/css/main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<script>
        function redirectToAuctionInsert() {
            // 서버 측에서 path 변수를 제공해야 합니다.
            const path = '<%= request.getContextPath() %>'; 
            window.location.href = `${path}/auction/auctionInsert.do`;
        }
        function sortItems() {
            const sortOption = document.querySelector('.sort-select').value;
            const path = '<%= request.getContextPath() %>';
            console.log("Selected sort option: " + sortOption);
            window.location.href = `${path}/auction/auctionMain.do?sortOption=${sortOption}`;
        }
        
        
        
</script>
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
	
<!-- Body -->
<div class="topimage"></div>
<!-- 검색창 -->
<div class="containerM">
	<div class="search-area">
            
            
            <div class="search-input-wrapper">
             <form action="${path}/auction/auctionMainSearch.do" method="post" class="searchForm">
                <input type="text" class="search-box" id="keyword" name="keyword" placeholder="경매 물품 검색">
                <button type="submit" class="search-btn">
                    <img src="${path}/resources/icon/search.png" alt="search" class="search-icon-A">
                </button>
             </form>
            </div>
            <div class="auction-insert-wrapper">
            	<button onclick="redirectToAuctionInsert()" class="insert-btn" >판매 물품 등록</button>
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
        <div class="sort-item">
            <a href="main.html">홈 > </a><a href="#">포켓몬 > </a><a href="#">카드경매</a>
        </div>
        <div class="sort-right">
            <span>정렬기준:</span>
            <form action="${path}/auction/auctionMain.do" method="get" id="sortForm">
                <select class="sort-select" name="sortOption" onchange="document.getElementById('sortForm').submit()">
                    <option value="recent" <c:if test="${selectedSortOption == 'recent'}">selected</c:if>>최신순</option>
                    <option value="ending" <c:if test="${selectedSortOption == 'ending'}">selected</c:if>>종료임박순</option>
                    <option value="mostpeople" <c:if test="${selectedSortOption == 'mostpeople'}">selected</c:if>>참여자많은순</option>
                    <option value="leastpeople" <c:if test="${selectedSortOption == 'leastpeople'}">selected</c:if>>참여자적은순</option>
                </select>
            </form>
        </div>
    </div>
        
	
	<div class="auction-list-wrapper">
	<c:forEach var="itemd" items="${itemDlist}">
		<div class="auction-item">
			<c:choose>
                    <c:when test="${itemd.card_image != null}">
                        <img src="${itemd.card_image}" alt="card image" class="card-image">
                    </c:when>
                    <c:otherwise>
                        <img src="${path}/resources/image/defaultPCard.png" alt="card image" class="card-image">
                    </c:otherwise>
            </c:choose>
			<div class="title-wrapper">
				${itemd.item_name}
			</div>
			<hr class="hr2">
			<div class="date-wrapper">
				마감일: ${itemd.end_date}
			</div>
			<div class="info-wrapper">		
				<span class="people">참여자 ${itemd.bid_count}명</span>
				<span class="tmethod">선호 거래 방식 : 
					    <c:choose>
					        <c:when test="${itemd.trade_type == 1}">
					            상관없음
					        </c:when>
					        <c:when test="${itemd.trade_type == 2}">
					            직거래
					        </c:when>
					        <c:when test="${itemd.trade_type == 3}">
					            중개
					        </c:when>
					        <c:otherwise>
					            ${itemd.trade_type}
					        </c:otherwise>
					    </c:choose>
				</span>
			</div>
			<div class="button-wrapper">
				
				<button class="like-btn" id="likeBtn-${itemd.item_id}" data-user-id="${userId}" data-item-id="${itemd.item_id}">관심물품</button>
				<button  onclick="location.href='${path}/auction/auctionDetail.do?item_id=${itemd.item_id}'" class="auction-detail-btn">상세보기</button>
			</div>
		</div>
		</c:forEach>
		
		
	</div>
	<!--페이지네이션-->
        <div class="pagination">
			<c:forEach var="i" begin="1"
				end="${(totalCount / pageSize) + (totalCount % pageSize > 0 ? 1 : 0)}">
				<a
					href="${path}/community/BoardSelect.do?page=${i}&pageSize=${pageSize}&sort=${selectedSortOption}"
					class="${i == currentPage ? 'active' : ''}">${i}</a>
			</c:forEach>
		</div>
  
</div>
<script>

$(document).ready(function() {
    $('.like-btn').each(function() {
        var userId = $(this).data('user-id');
        var itemId = $(this).data('item-id');
        var button = $(this);

        // 페이지 로드 시 현재 상태 확인
        checkLikeStatus(userId, itemId, button);

        $(this).click(function() {
            if ($(this).hasClass('act')) {
                // 관심물품 삭제
                $.ajax({
                    url: '/myapp/auction/removeLike',
                    type: 'POST',
                    data: { "userId": userId, "itemId": itemId },
                    success: function(response) {
                        if (response) {
                            button.removeClass('act').text('관심 물품');
                        } else {
                            $('#errorMessage').text('관심 물품을 삭제하는데 실패했습니다.');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error removing like:', error);
                        $('#errorMessage').text('관심 물품을 삭제하는데 실패했습니다.');
                    }
                });
            } else {
                // 관심물품 등록
                $.ajax({
                    url: '/myapp/auction/addLike',
                    type: 'POST',
                    data: { "userId": userId, "itemId": itemId },
                    success: function(response) {
                        if (response) {
                            button.addClass('act').text('관심 물품');
                        } else {
                            $('#errorMessage').text('관심 물품을 추가하는데 실패했습니다.');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error adding like:', error);
                        $('#errorMessage').text('관심 물품을 추가하는데 실패했습니다.');
                    }
                });
            }
        });
    });

    function checkLikeStatus(userId, itemId, button) {
        $.ajax({
            url: '/myapp/auction/isLiked',
            type: 'POST',
            data: { "userId": userId, "itemId": itemId },
            success: function(response) {
                console.log('isLiked response:', response);
                if (response === "liked") {
                    button.addClass('act').text('관심 물품');
                } else {
                    button.removeClass('act').text('관심 물품');
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
    <%@ include file="/WEB-INF/views/main/footer.jsp" %>
    <script type="module" src="${path}/resources/js/main.js"></script>
        
</body>

</html>