<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
<script src="../resources/js/BoardDetail.js" defer></script>

<script>
    $(function() {
        $("#recommendUp").on("click", fRecommendUp);
        $("#insertComment").on("click", fInsertComment);
        loadComments();
        loadCommentsCount();
    });

    function fRecommendUp(event) {
        event.preventDefault();
        var commId = "${board.comm_id}";
        $.ajax({
            url : "${path}/community/recommendUp.do",
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

    function loadComments() {
        var commId = "${board.comm_id}";
        $.ajax({
            url : "${path}/community/getReplieList.do",
            data : {
                "commId" : commId
            },
            type : "get",
            success : function(data) {
                var commentBox = $('#comment-box');
                commentBox.empty();

                $.each(data, function(index, board) {
                    var card = '<div class="card mb-3">'
                            + '<div class="card-body d-flex">'
                            + '<img src="../resources/images/default/defaultprofile.png" alt="이미지 설명" class="comment-image me-2">'
                            + '<div>'
                            + '<h5 class="card-title">'
                            + board.nickname
                            + '</h5>'
                            + '<p class="card-text">'
                            + board.cmt
                            + '</p>'
                            + '<p class="text-muted">작성일 : '
                            + board.create_time
                            + '</p>'
                            + '</div>'
                            + '</div>' + '</div>';
                    commentBox.append(card);
                });
            },
            error : function(error) {
                console.error("Error fetching data: ", error);
            }
        });
    }

    function loadCommentsCount() {
        var commId = "${board.comm_id}";
        $.ajax({
            url : "${path}/community/getReplieCount.do",
            data : {
                "commId" : commId
            },
            type : "get",
            success : function(responseData) {
                if (responseData !== "fail") {
                    $("#commentCount").text("댓글 " + responseData);
                } else {
                    alert("댓글 수 조회 실패");
                }
            },
            error : function(data) {
                alert("오류가 발생했습니다");
            }
        });
    }
    
    function fInsertComment(event) {
        event.preventDefault();
        var commId = "${board.comm_id}";
        var cmt = $("#commentInput").val();
        var userId = "guny1117" // 나중에 세션에서 가져오기
        
        $.ajax({
            url: "${path}/community/insertReplie.do",
            data: {
                "commId": commId,
                "cmt": cmt,
                "userId": userId
            },
            type: "post",
            success: function(responseData) {
                if (responseData !== "fail") {
                	loadComments();
                    loadCommentsCount();
                    $("#commentInput").val(""); // 입력창 초기화
                } else {
                    alert("댓글 등록 실패");
                }
            },
            error: function(data) {
                alert("오류가 발생했습니다");
            }
        });
    }
</script>

</head>
<body class="DetailBoard">
    <c:set var="path" value="${pageContext.servletContext.contextPath}" />
    <div class="container custom-container mt-3">
        <div class="right-aligned-button">
            <input type="submit" class="btn btn-primary" value="목록"
                onClick="location.href='${path}/community/BoardSelect.do'">
        </div>
        <div class="card p-3 mt-3">
            <form action="">
                <div class="form-inline mb-3 mt-3">
                    <h1>[${board.tag}] ${board.title}</h1>
                </div>
                <div
                    class="form-inline mb-3 mt-3 d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <img id="ImageLogo1"
                            src="../resources/images/default/defaultprofile.png" alt="1"
                            class="me-2">
                        <h2 class="me-2 mb-0" id="writer">${board.nickname}</h2>
                        <a href="" class="d-inline">${board.nickname} 님의 게시글 더보기></a>
                    </div>
                    <div class="d-flex align-items-center">
                        <p class="metadata mb-0 me-3">${board.create_date}|조회
                            ${board.views}</p>
                        <div class="dropdown">
                            <button class="btn dropdown-toggle" type="button"
                                id="dropdownMenuButton" data-bs-toggle="dropdown"
                                aria-expanded="false">&#x22EE;</button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li><a class="dropdown-item"
                                    href="${path}/community/BoardModify.do?commId=${board.comm_id}">수정하기</a></li>
                                <li><a class="dropdown-item" href="#">삭제하기</a></li>
                                <li><a class="dropdown-item" href="#">공유하기</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="mb-3 mt-3">
                    <img src="../resources/images/test/${board.image}" alt="이미지"
                        id="uploadedImg">
                    <p>${board.ctt}</p>
                </div>
                <br>
                <div class="d-flex mb-3 mt-3">
                    <a href="#" id="recommendUp"><img
                        src="../resources/icon/heart.png" alt="like"></a>
                    <p class="mb-0 me-2" id="recommendCount">추천 ${board.recommend}</p>
                    <img class="ImageLogo" src="../resources/icon/chat.png"
                        alt="comment">
                    <p class="mb-0" id="commentCount"></p>
                </div>
                <div class="form-inline mb-3 mt-3">
                    <h2>댓글</h2>
                </div>
                <div id="comment-box">
                    <!-- 댓글 -->
                </div>
                <div class="mb-3 mt-3">
                    <div class="card mb-3">
                        <div class="comment-header comment-type">
                            <p class="mb-0" id="comment-writer">
                                <strong>${board.nickname}</strong>
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
