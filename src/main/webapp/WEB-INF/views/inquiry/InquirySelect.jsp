<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>InquirySelect</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/BoardSelect.css" rel="stylesheet">
<link rel="icon" href="${path}/resources/icon/favicon.ico" type="image/x-icon">
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
	<div class="topimage"></div>

	<div class="container2">
		<br>
		<div class="nav-links">
			<a href="#">카드경매</a>
			<a href="#">티어덱 리스트</a>
			<a href="#" class="active">커뮤니티</a>
			<a id="inquiryBtn" href="#">문의</a>
		</div>
		<hr>
		<div class="breadcrumbs">
			<a href="#">홈</a> &gt; <span>문의</span>
		</div>
		<div class="form-inline">
			<input type="submit" class="btn-primary" value="문의하기" onClick="location.href='${path}/inquiry/InquiryInsert.do'">
		</div>
		<table class="table">
			<thead>
				<tr>
					<th></th>
					<th>제목</th>
					<th>작성자</th>
					<th>답변</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="question" items="${ilist}">
					<tr onClick="location.href='${path}/inquiry/InquiryDetail.do?questId=${question.quest_id}'">
						<td>${question.quest_id}</td>
						<td>${question.is_secret} ${question.title}</td>
						<td>${question.nickname}</td>
						<td>${question.answer}</td>
						<td>${question.create_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="pagination">
			<c:forEach var="i" begin="1" end="${(totalCount / pageSize) + (totalCount % pageSize > 0 ? 1 : 0)}">
				<a href="${path}/inquiry/InquirySelect.do?page=${i}&pageSize=${pageSize}" class="${i == currentPage ? 'active' : ''}">${i}</a>
			</c:forEach>
		</div>
	</div>
	<!--footer-->
	<%@ include file="/WEB-INF/views/main/footer.jsp"%>
</body>
</html>
