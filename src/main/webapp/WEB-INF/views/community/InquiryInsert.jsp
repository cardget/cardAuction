<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>InquiryInsert</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/InquiryInsert.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container custom-container mt-3">
        <div class="right-aligned-button">
            <input type="submit" class="btn btn-primary" value="문의하기">
        </div>
        <hr>
        <form action="">
            <div class="form-inline mb-3 mt-3">
                <div class="col">
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
                </div>
                <div class="col" id="ImageLogoContainer">
                    <div class="form-check">
                        <input class="form-check-input custom-checkbox" type="checkbox" id="boardType" name="boardType">
                        <label class="form-check-label" for="boardType"> 비밀글 </label>
                    </div>
                    <img class="ImageLogo" src="../Images/picture.png" alt="1">
                    <img class="ImageLogo" src="../Images/video.png" alt="2">
                    <img class="ImageLogo" src="../Images/file.png" alt="3">
                </div>
            </div>
            <div class="mb-3 mt-3">
                <textarea class="form-control comment-textarea" id="comment" name="text" placeholder="내용을 입력해주세요"></textarea>
            </div>
        </form>
    </div>
</body>
</html>
