<!DOCTYPE html>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<title>BoardDetail</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="../resources/css/BoardDetail.css?after" rel="stylesheet">
<link rel="shortcut icon" href="#">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	// JSP에서 세션 값을 자바스크립트 변수로 전달
	var userid = '${userid}';
	var commId = '${board.comm_id}';
	const path = '${path}';

	$(function() {
		$("#recommendUp").on("click", fRecommendUp);
		$("#insertComment").on("click", fInsertComment);
		loadComments();
		loadCommentsCount();
		fselectNicknameById();
	});

	// 세션으로 닉네임 조회
	function fselectNicknameById() {
		$.ajax({
			url : path + "/community/selectNicknameById",
			data : {
				"userid" : userid
			},
			type : "post",
			success : function(responseData) {
				if (responseData !== "null") {
					$("#comment-writer").text(responseData);
				} else {
					alert("로그인 후 이용하세요");
				}
			},
			error : function(data) {
				alert("오류가 발생했습니다.");
			}
		});
	}

	// 추천
	function fRecommendUp(event) {
		event.preventDefault();
		$.ajax({
			url : path + "/community/recommendUp",
			data : {
				"commId" : commId
			},
			type : "get",
			success : function(responseData) {
				if (responseData !== "fail") {
					$("#recommendCount").text("추천 " + responseData);
				} else {
					alert("추천 수 업데이트 실패");
				}
			},
			error : function(data) {
				alert("오류가 발생했습니다");
			}
		});
	}

	// 댓글 조회
	function loadComments() {
    $.ajax({
        url : path + "/community/getReplieList",
        data : {
            "commId" : commId
        },
        dataType : "json",
        type : "get",
        success : function(data) {
            var commentBox = $('#comment-box');
            commentBox.empty();
            $.each(data, function(index, board) {
                var profileImage = board.profile_image.startsWith('http') ? board.profile_image : path + board.profile_image;
                if (index < 5) { // 최대 5개만 먼저 보여줌
                    var createDate = new Date(board.create_time).toLocaleString(); // 시간 변환
                    var card = '<div class="commentCardBorder m">'
                            + '<div class="card-body d-flex">'
                            + '<img src="' + profileImage + '" onerror="handleImageError(this)" alt="이미지" class="comment-image me-2">'
                            + '<div>'
                            + '<h5 class="card-title">' + board.nickname + '</h5>'
                            + '<p class="card-text">' + board.cmt + '</p>'
                            + '<p class="text-muted">작성일 : ' + createDate + '</p>'
                            + '</div>'
                            + '</div>'
                            + '</div>';
                    commentBox.append(card);
                }
            });

            if (data.length > 5) {
                // 댓글 전체보기 버튼 추가
                commentBox.append('<div class="d-flex justify-content-center mt-3">'
                    + '<a href="#" id="loadMoreComments" class="btn btn-primary">전체 댓글보기</a>'
                    + '</div>');

                // 전체보기 버튼 클릭 이벤트
                $('#loadMoreComments').on('click', function(event) {
                    event.preventDefault();
                    $(this).parent().remove(); // 더보기 버튼 제거
                    $.each(data, function(index, board) {
                        var profileImage = board.profile_image.startsWith('http') ? board.profile_image : path + board.profile_image;
                        if (index >= 5) { // 나머지 댓글들 불러오기
                            var createDate = new Date(board.create_time).toLocaleString(); // 시간 변환
                            var card = '<div class="commentCardBorder">'
                                    + '<div class="card-body d-flex">'
                                    + '<img src="' + profileImage + '" onerror="handleImageError(this)" alt="이미지" class="comment-image me-2">'
                                    + '<div>'
                                    + '<h5 class="card-title">' + board.nickname + '</h5>'
                                    + '<p class="card-text">' + board.cmt + '</p>'
                                    + '<p class="text-muted">작성일 : ' + createDate + '</p>'
                                    + '</div>'
                                    + '</div>'
                                    + '</div>';
                            commentBox.append(card);
                        }
                    });
                });
            }
        },
        error : function(error) {
            console.error("Error fetching data: ", error);
        }
    });
}

	// 댓글 수 조회
	function loadCommentsCount() {
		$.ajax({
			url : path + "/community/getReplieCount",
			data : {
				"commId" : commId
			},
			dataType : "json",
			type : "get",
			success : function(responseData) {
				if (responseData !== "fail") {
					$("#commentCount").text("댓글수 " + responseData);
				} else {
					alert("댓글 수 조회 실패");
				}
			},
			error : function(data) {
				alert("오류가 발생했습니다");
			}
		});
	}

	// 댓글 작성
	function fInsertComment(event) {
		event.preventDefault();
		var cmt = $("#commentInput").val();
		$.ajax({
			url : path + "/community/insertReplie",
			data : {
				"commId" : commId,
				"cmt" : cmt,
				"userId" : userid
			},
			type : "post",
			success : function(responseData) {
				if (responseData !== "fail") {
					loadComments();
					loadCommentsCount();
					$("#commentInput").val(""); // 입력창 초기화
				} else {
					alert("댓글 등록 실패");
				}
			},
			error : function(data) {
				alert("로그인 후 이용해주세요");
			}
		});
	}

	// 공유하기
	function copyCurrentUrl() {
		var dummy = document.createElement('textarea');
		document.body.appendChild(dummy);
		dummy.value = window.location.href;
		dummy.select();
		document.execCommand('copy');
		document.body.removeChild(dummy);
		alert('URL이 복사되었습니다.');
	}

	// 댓글 삭제
	function deleteComment(replieId) {
		if (confirm("댓글을 삭제하시겠습니까?")) {
			$.ajax({
				url : path + "/community/deleteComment",
				data : {
					"replieId" : replieId
				},
				type : "post",
				success : function(response) {
					if (response === "success") {
						alert("댓글이 삭제되었습니다.");
						loadComments(); // 댓글 목록을 다시 로드하여 변경 사항 반영
					} else {
						alert("댓글 삭제에 실패하였습니다.");
					}
				},
				error : function() {
					alert("댓글 삭제 중 오류가 발생했습니다.");
				}
			});
		}
	}

	// 댓글 글자수
	function updateCharCount() {
		var commentInput = document.getElementById('commentInput');
		var charCount = commentInput.value.length;
		document.getElementById('charCount').innerText = charCount;
	}

	// 이미지 로드 오류 시 src 속성 제거
	function handleImageError(image) {
		image.style.display = 'none';
	}
</script>
</head>
<body>
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

	<div class="container2 custom-container mt-3">
		<div class="right-aligned-button">
			<input type="submit" class="btn btn-primary" value="게시글 목록"
				onClick="location.href='${path}/community/BoardSelect?cat=${cat}'">
		</div>
		<div class="card p-3 mt-3">
			<form id="myForm">
				<div class="form-inline mb-3 mt-3">
					<h1>[${board.tag}] ${board.title}</h1>
				</div>
				<div
					class="form-inline mb-3 mt-3 d-flex justify-content-between align-items-center">
					<div class="d-flex align-items-center">
						<img id="ImageLogo1" src="${board.profile_image}" alt="1"
							class="me-2">
						<h2 class="me-2 mb-0" id="writer">${board.nickname}</h2>
					</div>
					<div class="d-flex align-items-center ms-auto">
						<div class="dropdown">
							<button class="btn dropdown-toggle" type="button"
								id="dropdownMenuButton" data-bs-toggle="dropdown"
								aria-expanded="false">&#x22EE;</button>
							<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<c:choose>
									<c:when test="${isManager == 1 && isWriter == 1}">
										<li><a class="dropdown-item"
											href="${path}/community/BoardModify?commId=${board.comm_id}">수정하기</a></li>
										<li><a class="dropdown-item"
											href="${path}/community/BoardDelete?commId=${board.comm_id}">삭제하기</a></li>
										<li><a class="dropdown-item" onclick="copyCurrentUrl()">URL 복사</a></li>
									</c:when>
									<c:when test="${isManager == 1 && isWriter == 0}">
										<li><a class="dropdown-item"
											href="${path}/community/BoardDelete?commId=${board.comm_id}">삭제하기</a></li>
										<li><a class="dropdown-item" onclick="copyCurrentUrl()">URL 복사</a></li>
									</c:when>
									<c:when test="${isManager == 0 && isWriter == 1}">
										<li><a class="dropdown-item"
											href="${path}/community/BoardModify?commId=${board.comm_id}">수정하기</a></li>
										<li><a class="dropdown-item"
											href="${path}/community/BoardDelete?commId=${board.comm_id}">삭제하기</a></li>
										<li><a class="dropdown-item" onclick="copyCurrentUrl()">URL 복사</a></li>
									</c:when>
									<c:otherwise>
										<li><a class="dropdown-item" onclick="copyCurrentUrl()">URL 복사</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</div>
				</div>
				<hr>
				<div class="mb-3 mt-3">
					<img src="${board.image}" alt="이미지" id="uploadedImg"
						onerror="handleImageError(this)">
					<p class="detailContent">${board.ctt}</p>
				</div>
				<br>
				<div class="d-flex mb-3 mt-3 align-items-center">
					<a href="#" id="recommendUp"><img
						src="../resources/icon/heart.png" alt="like"></a>
					<p class="mb-0 me-2" id="recommendCount"> 추천수 ${board.recommend}</p>
					<img class="ImageLogo" src="../resources/icon/chat.png"
						alt="comment">
					<p class="mb-0" id="commentCount"></p>
					<p class="metadata mb-0 ms-auto" style="font-weight:bold;">${board.create_date} | 조회수 ${board.views}</p>
				</div>
				<div class="form-inline mb-3 mt-3">
					<h2>댓글</h2>
				</div>
				
				<hr>
				<div id="comment-box">
					<!-- 댓글 -->
				</div>
				<div class="mb-3 mt-3">
					<div class="card mb-3">
						<div class="comment-header comment-type">
							<p class="mb-0">
								<strong id="comment-writer"></strong>
							</p>
							<p class="mb-0 comment-type">
								<span id="charCount">0</span>/2000
							</p>
						</div>
						<input class="form-control mt-1" id="commentInput" name="comment"
							placeholder=" 댓글을 입력해주세요" maxlength="2000"
							oninput="updateCharCount()">
						<div class="right-aligned-button mt-2">
							<input type="button" class="btn btn-primary btn-primary-custom"
								value="등록" id="insertComment">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
