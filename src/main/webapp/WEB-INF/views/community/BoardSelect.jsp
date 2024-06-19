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
<link href="../resources/css/BoardSelect.css?after" rel="stylesheet">
</head>
<body>
	<c:set var="path" value="${pageContext.servletContext.contextPath}" />
	<div class="search-bar">
		<select>
			<option value="전체선택">전체선택</option>
		</select> <input type="text" placeholder="검색어를 입력해주세요">
		<button class="searchBtn">검색</button>
	</div>
	<div class="container">
		<div class="nav-links">
			<a href="#">카드경매</a> <a href="#">티어덱 리스트</a> <a href="#"
				class="active">커뮤니티</a> <a href="#">문의</a>
		</div>
		<hr>
		<div class="breadcrumbs">
			<a href="#">홈</a> &gt; <a href="#">포켓몬</a> &gt; <span>커뮤니티</span>
		</div>
		<div class="form-inline">
			<input type="submit" class="btn-primary" value="글 작성" onClick="location.href='${path}/community/BoardInsert.do'">
			<div class="search-elements">
				<select>
					<option value="옵션1">검색 옵션</option>
					<option value="옵션2">옵션2</option>
				</select> <select>
					<option value="옵션1">태그 선택</option>
					<option value="옵션2">옵션2</option>
				</select> <input type="text" placeholder="검색어를 입력해주세요">
				<button>검색</button>
			</div>
		</div>
		<table>
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
					<tr onClick="location.href='${path}/community/BoardDetail.do?commId=${board.comm_id}'">
						<td>${board.comm_id}</td>
						<td>[${board.tag}]${board.title}</td>
						<td>${board.nickname}</td>
						<td>${board.create_date}</td>
						<td>${board.recommend}</td>
						<td>${board.views}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination">
			<a href="#">&laquo;</a> <a href="#">1</a> <a href="#">2</a> <a
				href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a>
			<a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a>
			<a href="#">&raquo;</a>
		</div>
	</div>
</body>
</html>
