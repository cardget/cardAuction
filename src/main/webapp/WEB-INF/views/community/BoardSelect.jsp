<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>카드득 커뮤니티</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link href="../resources/css/BoardSelect.css" rel="stylesheet">
<link href="../resources/css/main.css" rel="stylesheet">
<link rel="icon" href="${path}/resources/icon/favicon.ico"
	type="image/x-icon">
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

	<!-- banner -->
	<c:choose>
		<c:when test="${cat == 1}">
			<div class="pokemonBanner"></div>
		</c:when>
		<c:when test="${cat == 2}">
			<div class="yugiohBanner"></div>
		</c:when>
		<c:when test="${cat == 3}">
			<div class="digimonBanner"></div>
		</c:when>
		<c:when test="${cat == 4}">
			<div class="onepieceBanner"></div>
		</c:when>
		<c:when test="${cat == 5}">
			<div class="sportBanner"></div>
		</c:when>
		<c:otherwise>
			<div class="defaultBanner"></div>
		</c:otherwise>
	</c:choose>

	<div class="container2"> 
		<br>
		<div class="nav-links">
			<c:choose>
				<c:when test="${cat == 1}">
					<a href="${path}/auction/auctionMain">카드경매</a>
					<a href="${path}/deckMakers/pokemonDeckListMain">티어덱 리스트</a>
				</c:when>
				<c:when test="${cat == 2}">
					<a href="${path}/auction/auctionYMain">카드경매</a>
					<a href="${path}/deckMakers/yugiohDeckListMain">티어덱 리스트</a>
				</c:when>
				<c:when test="${cat == 3}">
					<a href="${path}/auction/auctionDMain">카드경매</a>
					<a href="${path}/deckMakers/digimonDeckListMain">티어덱 리스트</a>
				</c:when>
				<c:when test="${cat == 4}">
					<a href="${path}/auction/auctionOMain">카드경매</a>
					<a href="${path}/deckMakers/onepieceDeckListMain">티어덱 리스트</a>
				</c:when>
				<c:when test="${cat == 5}">
					<a href="${path}/auction/auctionSMain">카드경매</a>
					<a href="${path}/deckMakers/">티어덱 리스트</a>
				</c:when>
				<c:otherwise>
					<a href="${path}/auction/auctionMain">카드경매</a>
					<a href="${path}/deckMakers/">티어덱 리스트</a>
				</c:otherwise>
			</c:choose>
			<a href="#" class="active">커뮤니티</a>
		</div>
		<br>
		<div class="breadcrumbs">
			<a href="../main">홈</a> &gt;
			<c:choose>
				<c:when test="${cat == 1}">
					<span>포켓몬</span>
				</c:when>
				<c:when test="${cat == 2}">
					<span>유희왕</span>
				</c:when>
				<c:when test="${cat == 3}">
					<span>디지몬</span>
				</c:when>
				<c:when test="${cat == 4}">
					<span>원피스</span>
				</c:when>
				<c:when test="${cat == 5}">
					<span>스포츠</span>
				</c:when>
				<c:otherwise>
					<span>기타</span>
				</c:otherwise>
			</c:choose>
			&gt; <span>커뮤니티</span>
		</div>
		<div class="form-inline">
			<input type="submit" class="btn-primary" value="글 작성"
				onClick="location.href='${path}/community/BoardInsert.do'">
			<div class="search-elements">
				<select id="sortSelect" name="sort">
					<option value="date" ${sort == 'date' ? 'selected' : ''}>날짜순</option>
					<option value="recommend" ${sort == 'recommend' ? 'selected' : ''}>추천순</option>
					<option value="view" ${sort == 'view' ? 'selected' : ''}>조회순</option>
				</select> <select id="tagSelect" name="tag">
					<option value="all" ${tag == 'all' ? 'selected' : ''}>전체
						태그</option>
					<option value="경매" ${tag == '경매' ? 'selected' : ''}>경매</option>
					<option value="자유" ${tag == '자유' ? 'selected' : ''}>자유</option>
				</select> <input type="text" id="searchKeyword" placeholder="검색어를 입력해주세요"
					value="${keyword}">
				<button onclick="search()">검색</button>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th></th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>추천수</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${blist}">
					<tr
						onClick="location.href='${path}/community/BoardDetail?commId=${board.comm_id}'">
						<td><c:choose>
								<c:when test="${board.tag == '공지'}">
									<div class="custom-notice-icon">공지</div>
								</c:when>
								<c:otherwise>
                                    ${board.sort_num}
                                </c:otherwise>
							</c:choose></td>
						<td class="titleText"><c:choose>
								<c:when test="${board.tag == '공지'}">
                                    ${board.title}
                                </c:when>
								<c:otherwise>
                                    [${board.tag}] ${board.title}
                                </c:otherwise>
							</c:choose></td>
						<td>${board.nickname}</td>
						<td>${board.create_date}</td>
						<td>${board.recommend}</td>
						<td>${board.views}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination">
			<c:forEach var="i" begin="1"
				end="${(totalCount / pageSize) + (totalCount % pageSize > 0 ? 1 : 0)}">
				<a
					href="${path}/community/BoardSelect?page=${i}&pageSize=${pageSize}&sort=${sort}&keyword=${keyword}&tag=${tag}&cat=${cat}"
					class="${i == currentPage ? 'active' : ''}">${i}</a>
			</c:forEach>
		</div>
	</div>
	<!--footer-->
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
	<script>
		function search() {
			var sort = document.getElementById('sortSelect').value;
			var keyword = document.getElementById('searchKeyword').value;
			var tag = document.getElementById('tagSelect').value;
			var cat = "${cat}";
			var url = "${path}/community/BoardSelect?page=1&pageSize=${pageSize}&sort="
					+ sort
					+ "&keyword="
					+ encodeURIComponent(keyword)
					+ "&tag=" + encodeURIComponent(tag) + "&cat=" + cat;
			location.href = url;
		}
	</script>
</body>
</html>
