<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BoardSelect</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../resources/css/BoardSelect.css" rel="stylesheet">
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
			<a href="${path}/inquiry/InquirySelect.do">카드경매</a> <a href="#">티어덱 리스트</a> <a href="#"
				class="active">커뮤니티</a>
		</div>
		<hr>
		<div class="breadcrumbs">
			<a href="../main.do">홈</a> &gt;
			<select id="catSelect" name="cat" onchange="changeCategory()">
				<option value="null" ${cat == null ? 'selected' : ''}>전체 카테고리</option>
				<option value="1" ${cat == 1 ? 'selected' : ''}>포켓몬</option>
				<option value="2" ${cat == 2 ? 'selected' : ''}>유희왕</option>
				<option value="3" ${cat == 3 ? 'selected' : ''}>디지몬</option>
				<option value="4" ${cat == 4 ? 'selected' : ''}>원피스</option>
				<option value="5" ${cat == 5 ? 'selected' : ''}>스포츠</option>
			</select>
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
				</select> 
				<select id="tagSelect" name="tag">
					<option value="all" ${tag == 'all' ? 'selected' : ''}>전체 태그</option>
					<option value="경매" ${tag == '경매' ? 'selected' : ''}>경매</option>
					<option value="자유" ${tag == '자유' ? 'selected' : ''}>자유</option>
				</select> 
				<input type="text" id="searchKeyword" placeholder="검색어를 입력해주세요"
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
						onClick="location.href='${path}/community/BoardDetail.do?commId=${board.comm_id}'">
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
                                    [${board.tag}]${board.title}
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
					href="${path}/community/BoardSelect.do?page=${i}&pageSize=${pageSize}&sort=${sort}&keyword=${keyword}&tag=${tag}&cat=${cat}"
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
			var cat = document.getElementById('catSelect').value;
			if (cat === "null") {
				cat = "";
			}
			var url = "${path}/community/BoardSelect.do?page=1&pageSize=${pageSize}&sort="
					+ sort
					+ "&keyword="
					+ encodeURIComponent(keyword)
					+ "&tag=" + encodeURIComponent(tag)
					+ "&cat=" + cat;
			location.href = url;
		}

		function changeCategory() {
			search();
		}
	</script>
</body>
</html>
