<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<link rel="stylesheet" type="text/css" href="../css/InquiryDetail.css">
</head>
<body>
	<div class="container custom-container mt-3">
		<div class="right-aligned-button">
			<input type="submit" class="btn btn-primary" value="문의 목록">
		</div>
		<hr>
		<form action="">
			<div class="form-inline mb-3 mt-3">
				<div class="input-group col">
					<p class="form-control" id="title">중개 결제 관련 문의합니다</p>
					<p class="form-control" id="writer">작성자: 서연잇</p>
					<p class="form-control" id="date">작성일 : 2024-05-29</p>
				</div>
			</div>
			<div class="mb-3 mt-3">
				<p class="form-control comment-textarea" id="comment">
					제가 OO 물품을 낙찰 받아서 중개로 상품을 받고 싶습니다. 결제 방식에 대해서 문의드리고 싶습니다.어쩌구저쩌구</p>
				<br>
				<div class="form-inline mb-3 mt-3">
					<div class="input-group col" id="answerHead">
						<p class="form-control">답변</p>
					</div>
				</div>
			</div>
			<p class="form-control comment-textarea" id="answer">
				OOO님 안녕하세요. 문의 답변 드립니다어쩌구저쩌구 asdasd a 
				sdasd</p>
		</form>
	</div>
</body>
</html>
