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
<link href="../resources/css/BoardInsert.css?after" rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<c:set var="path" value="${pageContext.servletContext.contextPath}" />
	<div class="container custom-container mt-3">
		<div class="right-aligned-button">
			<input type="submit" class="btn btn-primary" value="글 작성">
		</div>
		<hr>
		<form action="${path}/community/boardInsert.do" method="post">
			<div class="form-inline mb-3 mt-3">
				<div class="col">
					<input type="text" class="form-control" id="title" name="title"
						placeholder="제목을 입력해주세요">
				</div>
				<div class="col">
					<select class="form-select boardType" id="tag" name="tag">
						<option value="none" selected>태그 ( 필수 )</option>
						<option value="pokemon">자유</option>
						<option value="yugioh">경매</option>
						<option value="digimon"></option>
						<option value="onepiece"></option>
						<option value="sports"></option>
					</select>
				</div>
				<div class="col" id="ImageLogoContainer">
					<img class="ImageLogo" src="../resources/icon/image.png" alt="1">
					<img class="ImageLogo" src="../resources/icon/video.png" alt="2">
					<img class="ImageLogo" src="../resources/icon/link.png" alt="3">
				</div>
			</div>
			<div class="mb-3 mt-3">
				<div class="form-control comment-div" id="comment"
					contenteditable="true">내용을 입력해주세요</div>
			</div>
		</form>
	</div>
	<script src="../js/BoardInsert.js"></script>
</body>
</html>
