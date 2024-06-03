<style>
/* toggle */
label {
  height: 30px;
  width: 60px;
  border-radius: 30px;
}

input {
  display: none;
}

input:checked + span {
  background-color: gray;
}

input:checked + span::before {
  left: 30px;
}

.toggle-circle {
  height: 100%;
  width: 100%;
  display: block;
  border-radius: 30px;
  transition: 0.4s ease;
  border: 1px solid black;
  position: relative;
}

.toggle-circle::before {
  content: '';
  position: absolute;
  left: 0;
  height: 28px;
  width: 28px;
  display: block;
  border-radius: 50%;
  background-color: aliceblue;
  transition: 0.4s ease;
}
</style>

<div id="basicInfo">
	<img src="${path }/resources/images/digimon/BT5-086P.png" alt="정보아이콘">
	<h3>기본정보</h3>
	<img src="${path }/resources/images/digimon/BT5-086P.png" alt="프로필이미지">
	<h2>닉네임</h2>
	<h3>아이디</h3>
	<hr>
	<img src="${path }/resources/images/digimon/BT5-086P.png" alt="전화번호아이콘">
	<h3>전화번호</h3>
	<img src="${path }/resources/images/digimon/BT5-086P.png" alt="메일아이콘">
	<h3>이메일주소</h3>
	<hr>
	<img src="${path }/resources/images/digimon/BT5-086P.png" alt="주소아이콘">
	<h3>주소</h3>
	<img src="${path }/resources/images/digimon/BT5-086P.png" alt="계좌아이콘">
	<h3>은행 + 계좌</h3>
	<button>수정</button>
</div>
<h1>경매 알림 서비스 수신 동의</h1>
<div id="auctionAlarm">
	<img src="${path }/resources/images/digimon/BT5-086P.png" alt="전화아이콘">
	<h3>휴대전화</h3>
	<label>
		<input id="toggle" type="checkbox">
		<span class="toggle-circle"></span>
	</label>
	<hr>
	<img src="${path }/resources/images/digimon/BT5-086P.png" alt="메일아이콘">
	<h3>이메일</h3>
	<label>
		<input id="toggle" type="checkbox">
		<span class="toggle-circle"></span>
	</label>
</div>
<h1>게시물 조치 알림 서비스 수신 동의</h1>
<div id="commAlarm">
	<img src="${path }/resources/images/digimon/BT5-086P.png" alt="전화아이콘">
	<h3>휴대전화</h3>
	<label>
		<input id="toggle" type="checkbox">
		<span class="toggle-circle"></span>
	</label>
	<hr>
	<img src="${path }/resources/images/digimon/BT5-086P.png" alt="메일아이콘">
	<h3>이메일</h3>
	<label>
		<input id="toggle" type="checkbox">
		<span class="toggle-circle"></span>
	</label>
</div>