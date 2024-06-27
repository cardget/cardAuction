<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>BoardInsert</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/BoardInsert.js"></script>
<link href="../resources/css/BoardInsert.css?after" rel="stylesheet">
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

	<div class="container2 custom-container2 mt-3">
		<form action="${path}/community/BoardInsert.do" method="post"
			id="myForm" enctype="multipart/form-data">
			<div class="right-aligned-button">
				<input type="submit" class="btn btn-primary" value="글 작성">
			</div>
			<hr>
			<div class="form-inline mb-3 mt-3">
				<div class="col">
					<input type="text" class="form-control" id="title" name="title"
						placeholder="제목을 입력해주세요">
				</div>
				<div class="col">
					<select class="form-select boardType" id="tag" name="tag">
						<option value="none" selected>태그 ( 필수 )</option>
						<option value="자유">자유</option>
						<option value="경매">경매</option>
					</select>
				</div>
				<div class="col">
					<select class="form-select categoryType" id="category" name="cat">
						<option value="none" selected>카테고리 ( 선택 )</option>
						<option value="1">유희왕</option>
						<option value="2">원피스</option>
						<option value="3">포켓몬</option>
						<option value="4">디지몬</option>
						<option value="5">스포츠</option>
					</select>
				</div>
				<div class="col" id="ImageLogoContainer">
					<input type="file" name="imageFile" id="imageFile"
						style="display: none;"> <img class="ImageLogo"
						src="../resources/icon/image.png" alt="image" id="imageLogo">
				</div>
			</div>
			<div class="mb-3 mt-3">
				<div class="form-control comment-div" id="comment"
					contenteditable="true"></div>
			</div>
		</form>
	</div>
</body>
</html>
