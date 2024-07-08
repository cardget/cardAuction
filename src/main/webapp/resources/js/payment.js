/* 포인트 사용 */
function usingPoint() {
	// trade.price 값 가져오기
	var tradePrice = parseInt(document.getElementById("tradePrice").innerText, 10);
	console.log(tradePrice);

	// point-used 클래스의 input 값 가져오기
	var pointUsed = parseInt($('.point-used').val(), 10);
	console.log(pointUsed);
	
	// 전체 포인트 값 가져오기
	var point = parseInt(document.getElementById("totalPoint").innerText, 10);
	console.log(point);
	
	// NaN 체크
	if (isNaN(tradePrice) || isNaN(pointUsed) || isNaN(point)) {
		alert("가격 또는 포인트 정보가 유효하지 않습니다.");
		return;
	}
	
	// 계산된 결제 금액
	var totalPayment = tradePrice - pointUsed + 3000;

	// 계산된 잔여 포인트
	var remainingPoint = point - pointUsed;

	// 잔여 포인트 음수 확인
	if (remainingPoint < 0) {
		alert("포인트 입력을 다시 한번 확인해주세요");
		return;
	}

	// 잔여 포인트 업데이트
	document.getElementById("remainingPoint").innerText = remainingPoint + " P";

	// total-payment 클래스의 input에 값 설정
	$('.total-payment').val(totalPayment);
}
	
/* 결제 결과 */
function postRequest(url, data) {
    return fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
        console.log('Success:', data);
    })
    .catch((error) => {
        console.error('Error:', error);
    });
}