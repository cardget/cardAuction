<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<html lang="en">
<head>
<title>InquiryDetail</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../resources/css/InquiryDetail.css">
</head>
<body>
	<c:choose>
		<c:when test="${empty userid}">
			<%@ include file="/WEB-INF/views/main/defaultHeader.jsp"%>
		</c:when>
		<c:otherwise>
			<%@ include file="/WEB-INF/views/main/loginHeader.jsp"%>
		</c:otherwise>
	</c:choose>
	<div class="topimage"></div>

	<div class="container2 custom-container2 mt-3">
		<div class="right-aligned-button">
			<input type="submit" class="btn btn-primary" value="문의 목록"
				onClick="location.href='${path}/inquiry/InquirySelect.do'">
		</div>
		<hr>
		<form action="">
			<div class="form-inline mb-3 mt-3">
				<div class="input-group col">
					<p class="form-control" id="title">${inquiry.title}</p>
					<p class="form-control" id="writer">${inquiry.nickname}</p>
					<p class="form-control" id="date">작성일 : ${inquiry.create_date}</p>
				</div>
			</div>
			<div class="mb-3 mt-3">
				<p class="form-control comment-textarea" id="comment">${inquiry.ctt}</p>
				<br>
				<div class="form-inline mb-3 mt-3">
					<div class="input-group col" id="answerHead">
						<p class="form-control">답변</p>
					</div>
				</div>
			</div>
			<p class="form-control comment-textarea" id="answer">${inquiry.answer}</p>
		</form>
	</div>
</body>
</html>
