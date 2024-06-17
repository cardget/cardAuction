<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">

<title>카드득</title>

<style>

body {
	display: flex;
	justify-content: center; /* 수평 가운데 정렬 */
	font-family: 'Apple SD Gothic Neo', sans-serif;
	height: 100vh; /* 화면 전체 높이 */
	margin: 0; /* 기본 여백 제거 */
}
/*header*/
.logo {
	width: 95px;
	height: 25px;
}

.top {
	backdrop-filter: blur(10px);
	border-bottom: 1px solid #fff;
	width: 100%;
	box-sizing: border-box;
	position: fixed;
	z-index: 1000;
}

.top-nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 16px;
	padding: 0 270px;
	height: 60px;
	box-sizing: border-box;
	background-color: rgba(255, 255, 255, .3);
	position: relative;
	margin: 0 auto;
	width: 100%;
}

.category-box {
	display: flex;
	gap: 20px;
	margin: 0;
	padding: 0;
	font-weight: 500;
}

.category-item {
	list-style: none;
	text-align: center;
}

.category-item a {
	text-decoration: none;
	color: #2c2c2c;
}

.container {
	padding: 60px 270px 0;
	margin-bottom: 200px;
	flex: 1;
}

.row-content {
	gap: 95px;
	margin-top: 100px;
	display: flex;
}

ul {
	list-style: none;
	padding: 0;
}

.cardType {
	width: 200px;
	height: 300px;
	box-shadow: 4px 4px 5px 1px rgba(0, 0, 0, .3);
	cursor: pointer;
	transition: 0.6;
}

.cardType:hover {
	transform: scale(1.1)
}
/*footer*/
.info-page {
	background-color: #002E5B;
	color: #ffffff;
	padding: 30px 270px;
	font-size: 12px;
	font-family: 'Apple SD Gothic NeoL', sans-serif;
	bottom: 0;
}

.link-container {
	display: flex;
	flex-direction: row;
	gap: 10px;
	font-size: 14px;
	font-weight: 300;
}

/*form 구분선 나중에 지울거
form {
	border:1px solid gray;
	
	
}*/
/*전체박스 1186*/
.container{
	width:1186px;
	
}
/*상단정보*/

.top-item{
	margin-left: 20px;
	font-size:22px;
	
}
.top-wrapper{
	display: flex;
	justify-content: space-between; /* 요소들을 양 끝으로 배치 */
	align-items: center; /* 요소들을 수직 가운데 정렬 */
}
.top-insert-btn{
	margin-left: auto; /* 버튼을 오른쪽으로 */
	margin-right: 24px;
	margin-top:4px;
	border-radius:5px;
	border : 1px solid #007FFF;
	background-color: #007FFF;
	color: #fff;
	width: 114px;
	height: 36px;
	font-size: 16px
}
.image-format{
	width:500px;
	height:44px;
	font-size:14px;
	display: flex;
	justify-content: center; /* 가로 가운데 정렬 */
    align-items: center; /* 세로 가운데 정렬 */
	margin-left:38px;
	
}
.icon-error{
	width:16px;
	height:16px;
	padding-right: 5px;
}
/*input*/
.input-field {
	width: 400px; /* 원하는 너비 설정 */
	padding: 10px; /* 패딩 설정 */
	border: none; /* 기본 테두리 제거 */
	border-bottom: 2px solid gray; /* 아래쪽에만 선 추가 */
	outline: none; /* 클릭 시 외곽선 제거 */
	font-size: 16px; /* 글자 크기 설정 */
}

.input-container {
	margin: 20px 38px; /* 입력 필드 간의 간격 설정 */
	display: flex;
	align-items: center;
}
.input-container2 {
	margin: 20px 38px; /* 입력 필드 간의 간격 설정 */
	
}
.input-container3{
	margin: 10px 38px;
}

.input-container .select-field-status {
	margin-left: 20px;
}

.input-field-cmt{
	width:1000px;
	height: 260px;
	resize: none;
	margin: 10px 0;
	padding:10px;
	
}
.input-container label{
	font-size:18px;
}
.input-container2 label{
	font-size:18px;
}
#title {
	font-size:22px ;
}
.input-field-date{
	margin-left: 20px;
	width:100px;
	height:25px;
}
.input-field-rarity{
	margin-left: 20px;
	height:25px;
}
.input-field-min-price{
	margin-right: 10px;
	margin-left: 20px;
	height:25px;
}

.select-field-status{
	margin-left: 20px;
	width:100px;
	height:25px;
	
}
.radio-title{
	margin:0 20px;
}
#status1, #status2, #status3 {
	margin:10px;
}
input[type="radio"] {
    width: 20px;
    height: 20px;
}
.select-field-card{
	margin-left: 20px;
	width:140px;
	height:26px;
	font-size:16px;
	
}

/*image*/
.image-preview {
	
	display: flex;
	flex-wrap: wrap;
	
	padding: 10px;
	width: 1100px;
	min-height: 170px;
	box-sizing: border-box; /* 패딩과 테두리를 포함한 크기 계산 */
}
.image-preview img {
	margin-right: 20px;
	
	width: 150px;
	height: 150px;
	border: 1px solid gray;
	border-radius:5px;
}
.default-image{
	width: 150px;
	height: 150px;
	border: 1px solid gray;
	border-radius:5px;
	margin-right: 20px;
	
	display:flex;
	flex-direction:column;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center;
	margin-top:10px;
	margin-left:38px;
	
	
}
.icon-camera{
	width: 56px !important;
	height: 50px !important;
	
}
.image-preview-wrapper{
	display:flex;
	justify-content: center;
	
}
.input-container3 {
    margin: 10px 38px;
    position: relative;
}

.image-upload-label {
    cursor: pointer; /* 마우스를 가져다 댔을 때 포인터 모양으로 변경 */
    display: inline-block;
    padding: 6px 8px;
    border:1px solid  #007FFF;
    border-radius: 5px;
    background-color: white;
    color: #007FFF;
    font-size:14px;
}

#image-input {
    display: none; /* 실제 파일 선택 버튼 숨기기 */
}

</style>
</head>
<body>
<!--header-->
<header data-include-path="main-header.html"></header>
    
<!-- Body -->
<div class="container">
	
	<form action="#" class="insert-form" method="post">
		<div class="top-wrapper">
			<h1 class="top-item">포켓몬 카드 경매 등록</h1>
			<button type="submit" class="top-insert-btn">판매 글 작성</button>
		</div>
		<hr class="top-hr">
		
		
		
		<div class="input-container">
			<input type="text" id="title" class="input-field" placeholder="제목을 입력하세요">
			<label for="trade_type" class="radio-title">선호 거래 방식</label>
		    <input type="radio" id="status1" name="trade_type" value="">
		    <label for="status1">상관없음</label>
		    
		    <input type="radio" id="status2" name="trade_type" value="">
		    <label for="status2">직거래</label>
		    
		    <input type="radio" id="status3" name="trade_type" value="">
		    <label for="status3">중개</label>
		    
		    
		    <select name="cardid" class="select-field-card">
				<option>뮤ex</option>
				<option>피카츄ex</option>
				<option>날뛰는우레ex</option>
				<option>뮤츠</option>
			</select>
		    
		</div>
		<!--  
		<div class="input-container">
			<label for="description">설명</label>
			<input type="text" id="description" class="input-field" placeholder="설명을 입력하세요">
		</div>
		-->
		<div class="image-format">
			<img src="../static/icon/icon_error.png" class="icon-error" alt="icon"> 실제 카드 이미지 1개 필수 ( 최대 5개 )
			<div class="input-container3">
				<label for="image-input" class="image-upload-label">물품 이미지 업로드</label>
				<input type="file" id="image-input" accept="image/*" multiple>
			</div>
			
		</div>
		<!-- 이미지 input-->
		
		<div class="image-preview-wrapper">
			<div class="default-image">
					<img src="../static/icon/icon_camera.png" class="icon-camera">
					<b>0/5</b>
				</div>
			<div class="image-preview" id="image-preview"></div>
		</div>
		
		<!-- 나머지 input-->
		<div class="input-container">
			<label for="end_date">경매 종료 날짜 / 시간 </label>
			<input type="date" id="end_date" class="input-field-date" >
		</div>
		<div class="input-container">
			<label for="status">물품 상태</label>
			<select name="status" class="select-field-status">
				<option>최상</option>
				<option>상</option>
				<option>중</option>
				<option>하</option>
			</select>
			
		</div>
		<div class="input-container">
			<label for="rarity">희귀도</label>
			<input type="text" id="rarity" class="input-field-rarity" >
		</div>
		<div class="input-container">
			<label for="min_price">유찰가</label>
			<input type="number" id="min_price" class="input-field-min-price"> 원
		</div>
		<div class="input-container2">
			<label for="cmt">물품 상세 설명</label><br>
			<textarea id="cmt" class="input-field-cmt" placeholder="물품에 대한 상세 정보를 입력하세요"></textarea>
		</div>
		
	</form>
	<hr class="bottom-hr">
	
	
	<!--footer-->
    <footer data-include-path="footer.html"></footer>
    <script type="module" src="../static/js/main.js"></script>
	
</div>

<script>
document.getElementById('image-input').addEventListener('change', function(event) {
	const imagePreview = document.getElementById('image-preview');
	imagePreview.innerHTML = '';
	const files = event.target.files;
	if (files.length > 5) {
		alert('최대 5개의 이미지만 업로드할 수 있습니다.');
		event.target.value = '';
		return;
	}
	for (let i = 0; i < files.length; i++) {
		const file = files[i];
		const reader = new FileReader();
		reader.onload = function(e) {
			const img = document.createElement('img');
			img.src = e.target.result;
			imagePreview.appendChild(img);
		}
		reader.readAsDataURL(file);
	}
});
</script>

</body>
</html>

