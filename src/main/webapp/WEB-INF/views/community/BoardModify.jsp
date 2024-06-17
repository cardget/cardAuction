<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BoardModify</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/BoardModify.css?after">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container custom-container mt-3">
        <div class="right-aligned-button">
            <input type="submit" class="btn btn-primary" value="글 수정">
        </div>
        <hr>
        <form action="">
            <div class="form-inline mb-3 mt-3">
                <div class="col">
                    <input type="text" class="form-control" id="title" name="title" placeholder="이 덱 구성할 때 어떤 카드 필요할까요">
                </div>
                <div class="col">
                    <select class="form-select boardType" id="boardType">
                        <option value="none" selected>태그 ( 필수 )</option>
                        <option value="pokemon">포켓몬</option>
                        <option value="yugioh">유희왕</option>
                        <option value="digimon">디지몬</option>
                        <option value="onepiece">원피스</option>
                        <option value="sports">스포츠</option>
                    </select>
                </div>
                <div class="col" id="ImageLogoContainer">
                    <img class="ImageLogo" src="../Images/picture.png" alt="1">
                    <img class="ImageLogo" src="../Images/video.png" alt="2">
                    <img class="ImageLogo" src="../Images/file.png" alt="3">
                </div>
            </div>
            <div class="mb-3 mt-3">
                <div class="form-control comment-div" id="comment" contenteditable="true">코리안 리그 시즌1에 나왔던 타부자고ex덱 구성하고 싶은데 트레이너스 카드 어떤 것들 필요한지 알려주세요 ㅠㅠ
                 타부자고 ex 포켓몬 카드는 보유하고 있습니다.</div>
            </div>
        </form>
    </div>
    <script src="../js/BoardModify.js"></script>
</body>
</html>
