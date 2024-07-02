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
		
		<form action="${path}/admin/insertPokemonCard.do" method="post" enctype="multipart/form-data">
			<h3 class="info">포켓몬 카드 업로드</h3>
            <div class="form-group">
                <label for="pokemon_card_name" class ="input-label">카드 이름:</label>
                <input type="text" id="card_name" name="card_name" class="input-field" required>
            </div>
            <div class="form-group">
                <label for="pokemon_card_sort" class ="input-label">카드 종류:</label>
                <input type="text" id="card_sort" name="card_sort" class="input-field" required>
            </div>
            <div class="form-group">
                <label for="pokemon_feature" class ="input-label">특징:</label>
                <input type="text" id="feature" name="feature" class="input-field">
            </div>
            <div class="form-group">
                <label for="pokemon_card_type" class ="input-label">카드 타입:</label>
                <input type="text" id="card_type" name="card_type" class="input-field">
            </div>
            <div class="image-container">
    			<img id="pokemon-image" src="${path}/resources/image/profile.png" alt="Pokemon Image" onclick="document.getElementById('pokemon_image_id').click()">
			</div>
			<input type="file" id="pokemon_image_id" name="pokemon_card_image" onchange="previewImage(this, '${path}')" accept="image/*" class="input-field" style="margin-left:10px;" multiple required>
			<button type="button" onclick="resetProfileImage('pokemon-image', '${path}')" class="check-button">삭제</button>	
			<br>
			<button type="submit" class="submit-button disabled-button">등록하기</button>	
		</form>		
		<hr class="grayfont">
		<!-- --------------------------------------------------------------------------------------------------------------  -->
		
        <form action="${path}/admin/insertDigimonCard.do" method="post" enctype="multipart/form-data">            
            <h3 class="info">디지몬 카드 업로드</h3>
            <div class="form-group">
                <label for="digimon_card_name" class ="input-label">카드 이름:</label>
                <input type="text" id="card_name" name="card_name" class="input-field" required>
            </div>
            <div class="form-group">
                <label for="digimon_card_sort" class ="input-label">카드 종류:</label>
                <input type="text" id="card_sort" name="card_sort" class="input-field" required>
            </div>
            <div class="form-group">
                <label for="digimon_card_attr" class ="input-label">카드 속성:</label>
                <input type="text" id="card_attr" name="card_attr" class="input-field">
            </div>
            <div class="form-group">
                <label for="digimon_card_level" class ="input-label">카드 레벨:</label>
                <input type="text" id="card_level" name="card_level" class="input-field">
            </div>
            <div class="form-group">
                <label for="digimon_card_color" class ="input-label">카드 색상:</label>
                <input type="text" id="card_color" name="card_color" class="input-field">
            </div>
            <div class="form-group">
                <label for="digimon_monster_type" class ="input-label">카드 타입:</label>
                <input type="text" id="monster_type" name="monster_type" class="input-field">
            </div>
            <div class="form-group">
                <label for="digimon_card_cost" class ="input-label">카드 비용:</label>
                <input type="text" id="card_cost" name="card_cost" class="input-field">
            </div>
            <div class="image-container">
                <img id="digimon-image" src="${path}/resources/image/profile.png" alt="Digimon Image" onclick="document.getElementById('digimon_image_id').click()">
            </div>
            <input type="file" id="digimon_image_id" name="digimon_card_image" onchange="previewImage(this, 'digimon-image')" accept="image/*" class="input-field" style="margin-left:10px;" multiple required>
            <button type="button" onclick="resetProfileImage('digimon-image', '${path}')" class="check-button">삭제</button>
            <br>
            <button type="submit" class="submit-button disabled-button">등록하기</button>
           </form>
            <hr class="grayfont">
            
            <!-- --------------------------------------------------------------------------------------------------------------  -->
            <form action="${path}/admin/insertYugiohCard.do" method="post" enctype="multipart/form-data">
	            <h3 class="info">유희왕 카드 업로드</h3>
	            <div class="form-group">
	                <label for="yugioh_card_name" class ="input-label" >카드 이름:</label>
	                <input type="text" id="yugioh_card_name" name="card_name" class="input-field" required>
	            </div>
	            <div class="form-group">
	                <label for="yugioh_card_sort" class ="input-label">카드 종류:</label>
	                <input type="text" id="yugioh_card_sort" name="card_sort" class="input-field" required>
	            </div>
	            <div class="form-group">
	                <label for="yugioh_card_attr" class ="input-label">카드 속성:</label>
	                <input type="text" id="yugioh_card_attr" name="card_attr" class="input-field">
	            </div>
	            <div class="form-group">
	                <label for="yugioh_card_type" class ="input-label">카드 레벨:</label>
	                <input type="text" id="yugioh_card_level" name="card_level" class="input-field">
	            </div>
	            <div class="form-group">
	                <label for="yugioh_card_type" class ="input-label">카드 타입:</label>
	                <input type="text" id="yugioh_card_type" name="card_type" class="input-field">
	            </div>
	            <div class="image-container">
	                <img id="yugioh-image" src="${path}/resources/image/profile.png" alt="Yugioh Image" onclick="document.getElementById('yugioh_image_id').click()">
	            </div>
	            <input type="file" id="yugioh_image_id" name="yugioh_card_image" onchange="previewImage(this, 'yugioh-image')" accept="image/*" class="input-field" style="margin-left:10px;" multiple required>
	            <button type="button" onclick="resetProfileImage('yugioh-image', '${path}')" class="check-button">삭제</button>
            	<br>
            	<button type="submit" class="submit-button disabled-button">등록하기</button>
            </form>
            <hr class="grayfont">
            
            <!-- --------------------------------------------------------------------------------------------------------------  -->          
            
           <form action="${path}/admin/insertOnepieceCard.do" method="post" enctype="multipart/form-data"> 
            <h3 class="info">원피스 카드 업로드</h3>                    
            <div class="form-group">
                <label for="onepiece_card_name" class ="input-label">카드 이름:</label>
                <input type="text" id="card_name" name="card_name" class="input-field" required>
            </div>
            <div class="form-group">
                <label for="onepiece_card_sort" class ="input-label">카드 종류:</label>
                <input type="text" id="card_sort" name="card_sort" class="input-field" required>
            </div>
            <div class="form-group">
                <label for="onepiece_card_attr" class ="input-label">카드 속성:</label>
                <input type="text" id="card_attr" name="card_attr" class="input-field">
            </div>
            <div class="form-group">
                <label for="onepiece_color" class ="input-label">카드 색상:</label>
                <input type="text" id="color" name="color" class="input-field" required>
            </div>
            <div class="form-group">
                <label for="onepiece_card_cost" class ="input-label">카드 비용:</label>
                <input type="text" id="card_cost" name="card_cost" class="input-field">
            </div>
            <div class="form-group">
                <label for="onepiece_feature" class ="input-label">카드 특성:</label>
                <input type="text" id="feature" name="feature" class="input-field" required>
            </div>
            <div class="image-container">
                <img id="onepiece-image" src="${path}/resources/image/profile.png" alt="Onepiece Image" onclick="document.getElementById('onepiece_image_id').click()">
            </div>
            <input type="file" id="onepiece_image_id" name="onepiece_card_image" onchange="previewImage(this, 'onepiece-image')" accept="image/*" class="input-field" style="margin-left:10px;" multiple required>
            <button type="button" onclick="resetProfileImage('onepiece-image', '${path}')" class="check-button">삭제</button>
            <br>
            	<button type="submit" class="submit-button disabled-button">등록하기</button>
            <hr class="grayfont">            
        	</form>
    </div>
</div>
</body>
</html>