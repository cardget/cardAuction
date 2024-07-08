<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BoardModify</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="../resources/css/BoardModify.css?after">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/BoardInsert.js"></script>
</head>
<body>
	<c:set var="path" value="${pageContext.servletContext.contextPath}" />
	
	<div class="container custom-container mt-3">
		<form action="${path}/community/BoardModify.do" method="post"
			id="myForm" enctype="multipart/form-data">
			<input name=comm_id type="hidden" value="${board.comm_id}">
			<div class="right-aligned-button">
				<input type="submit" class="btn btn-primary" value="글 수정">
			</div>
			<hr>
			<div class="form-inline mb-3 mt-3">
				<div class="col">
					<input type="text" class="form-control" id="title" name="title"
						value="${board.title}">
				</div>
				<div class="col">
					<select class="form-select boardType" id="tag" name="tag">
						<option value="자유"
							<c:if test="${board.tag == '자유'}">selected</c:if>>자유</option>
						<option value="경매"
							<c:if test="${board.tag == '경매'}">selected</c:if>>경매</option>
						<option value="공지"
							<c:if test="${board.tag == '공지'}">selected</c:if>>공지</option>
					</select>
				</div>
				<div class="col">
					<select class="form-select categoryType" id="category" name="cat">
						<option value="1" <c:if test="${board.cat == '1'}">selected</c:if>>유희왕</option>
						<option value="2" <c:if test="${board.cat == '2'}">selected</c:if>>원피스</option>
						<option value="3" <c:if test="${board.cat == '3'}">selected</c:if>>포켓몬</option>
						<option value="4" <c:if test="${board.cat == '4'}">selected</c:if>>디지몬</option>
						<option value="5" <c:if test="${board.cat == '5'}">selected</c:if>>스포츠</option>
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
					contenteditable="true">${board.ctt}</div>
			</div>
		</form>
	</div>
</body>
</html>
