<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드 등록 페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/adminMain.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${path}/resources/js/signUp.js"></script>

</head>
<body>
<div class="content">
    <div class="basicInfo">
        <h3 class="grayfont">ⓘ 카드등록</h3>
        <hr class="grayfont">  

        <form action="yourUploadActionURL" method="post" enctype="multipart/form-data">
            <h3 class="info">포켓몬 카드 업로드</h3><br/>
            <div class="form-group">
                <label for="pokemon_card_name">카드 이름:</label>
                <input type="text" id="pokemon_card_name" name="pokemon_card_name" required>
            </div>
            <div class="form-group">
                <label for="pokemon_card_sort">카드 종류:</label>
                <input type="text" id="pokemon_card_sort" name="pokemon_card_sort" required>
            </div>
            <div class="form-group">
                <label for="pokemon_feature">특징:</label>
                <input type="text" id="pokemon_feature" name="pokemon_feature">
            </div>
            <div class="form-group">
                <label for="pokemon_card_type">카드 타입:</label>
                <input type="text" id="pokemon_card_type" name="pokemon_card_type">
            </div>
            <div class="image-container">
                <img id="pokemon-image" src="${path}/resources/image/profile.png" alt="Pokemon Image" onclick="document.getElementById('pokemon_image_id').click()">
            </div>
            <input type="file" id="pokemon_image_id" name="pokemon_image" onchange="previewImage(this, 'pokemon-image')" accept="image/*" class="input-field" style="margin-left:10px;" multiple required>
            <button type="button" onclick="resetProfileImage('pokemon-image', '${path}')" class="check-button">삭제</button>
            <hr class="grayfont">
            
            <h3 class="info">디지몬 카드 업로드</h3>
            <div class="form-group">
                <label for="digimon_card_name">카드 이름:</label>
                <input type="text" id="digimon_card_name" name="digimon_card_name" required>
            </div>
            <div class="form-group">
                <label for="digimon_card_sort">카드 종류:</label>
                <input type="text" id="digimon_card_sort" name="digimon_card_sort" required>
            </div>
            <div class="form-group">
                <label for="digimon_feature">특징:</label>
                <input type="text" id="digimon_feature" name="digimon_feature">
            </div>
            <div class="form-group">
                <label for="digimon_card_type">카드 타입:</label>
                <input type="text" id="digimon_card_type" name="digimon_card_type">
            </div>
            <div class="image-container">
                <img id="digimon-image" src="${path}/resources/image/profile.png" alt="Digimon Image" onclick="document.getElementById('digimon_image_id').click()">
            </div>
            <input type="file" id="digimon_image_id" name="digimon_image" onchange="previewImage(this, 'digimon-image')" accept="image/*" class="input-field" style="margin-left:10px;" multiple required>
            <button type="button" onclick="resetProfileImage('digimon-image', '${path}')" class="check-button">삭제</button>
            <hr class="grayfont">
            
            <h3 class="info">유희왕 카드 업로드</h3>
            <div class="form-group">
                <label for="yugioh_card_name">카드 이름:</label>
                <input type="text" id="yugioh_card_name" name="yugioh_card_name" required>
            </div>
            <div class="form-group">
                <label for="yugioh_card_sort">카드 종류:</label>
                <input type="text" id="yugioh_card_sort" name="yugioh_card_sort" required>
            </div>
            <div class="form-group">
                <label for="yugioh_feature">특징:</label>
                <input type="text" id="yugioh_feature" name="yugioh_feature">
            </div>
            <div class="form-group">
                <label for="yugioh_card_type">카드 타입:</label>
                <input type="text" id="yugioh_card_type" name="yugioh_card_type">
            </div>
            <div class="image-container">
                <img id="yugioh-image" src="${path}/resources/image/profile.png" alt="Yugioh Image" onclick="document.getElementById('yugioh_image_id').click()">
            </div>
            <input type="file" id="yugioh_image_id" name="yugioh_image" onchange="previewImage(this, 'yugioh-image')" accept="image/*" class="input-field" style="margin-left:10px;" multiple required>
            <button type="button" onclick="resetProfileImage('yugioh-image', '${path}')" class="check-button">삭제</button>
            <hr class="grayfont">
            
            <h3 class="info">원피스 카드 업로드</h3>                    
            <div class="form-group">
                <label for="onepiece_card_name">카드 이름:</label>
                <input type="text" id="onepiece_card_name" name="onepiece_card_name" required>
            </div>
            <div class="form-group">
                <label for="onepiece_card_sort">카드 종류:</label>
                <input type="text" id="onepiece_card_sort" name="onepiece_card_sort" required>
            </div>
            <div class="form-group">
                <label for="onepiece_feature">특징:</label>
                <input type="text" id="onepiece_feature" name="onepiece_feature">
            </div>
            <div class="form-group">
                <label for="onepiece_card_type">카드 타입:</label>
                <input type="text" id="onepiece_card_type" name="onepiece_card_type">
            </div>
            <div class="image-container">
                <img id="onepiece-image" src="${path}/resources/image/profile.png" alt="Onepiece Image" onclick="document.getElementById('onepiece_image_id').click()">
            </div>
            <input type="file" id="onepiece_image_id" name="onepiece_image" onchange="previewImage(this, 'onepiece-image')" accept="image/*" class="input-field" style="margin-left:10px;" multiple required>
            <button type="button" onclick="resetProfileImage('onepiece-image', '${path}')" class="check-button">삭제</button>
            <hr class="grayfont">
            
            <div class="form-group">
                <button type="submit" class="submit-button">등록</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>