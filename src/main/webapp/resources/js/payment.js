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
	var totalPayment = tradePrice - pointUsed;

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
	
/* 결제 */
function pay() {
    var totalPayment = parseInt($('.total-payment').val());

    if (totalPayment == 0) {
        var postData = {
            trade_id: `${trade.trade_id}`,
            used_point: parseInt($('.point-used').val(), 10),
            paid_amount: 0,
            buyer_name: `${user.user_name}`
        };

        postRequest('result.do', postData).then(() => {
            window.location.href = '/payment/result'; // 결과 페이지로 이동
        });
        return; // totalPayment가 0인 경우 이후 코드를 실행하지 않도록 return
    }

    IMP.init("imp82846867");
    IMP.request_pay({
        pg: 'html5_inicis.INIpayTest',
        pay_method: 'card',
        merchant_uid: `${trade.trade_id}`, // 상점에서 관리하는 주문 번호를 전달
        name: `${trade.item_name}`,
        amount: totalPayment,
        buyer_email: `${user.email}`,
        buyer_name: `${user.user_name}`,
        buyer_tel: `${user.phone_number}`,
        buyer_addr: `${user.address} ${user.address_detail}`,
        buyer_postcode: `${user.zip_code}`,
        m_redirect_url: '{모바일에서 결제 완료 후 리디렉션 될 URL}' // 예: https://www.my-service.com/payments/complete/mobile
    }, function(rsp) { // callback 로직
        if (rsp.success) {
            var postData = {
                trade_id: rsp.merchant_uid,
                used_point: parseInt($('.point-used').val(), 10),
                item_name: rsp.name,
                amount: rsp.paid_amount,
                buyer_name: rsp.buyer_name,
                imp_uid: rsp.imp_uid,
                apply_num: rsp.apply_num,
                bank_name: rsp.bank_name,
                card_name: rsp.card_name,
                card_number: rsp.card_number,
                paid_amount: rsp.paid_amount,
                paid_at: rsp.paid_at,
                pay_method: rsp.pay_method,
                pg_provider: rsp.pg_provider,
                pg_tid: rsp.pg_tid,
                pg_type: rsp.pg_type,
                receipt_url: rsp.receipt_url,
                status: rsp.status
            };

            postRequest('/payment/result', postData).then(() => {
                window.location.href = '/payment/result'; // 결과 페이지로 이동
            });
        } else {
            // 결제 실패 시 처리할 로직 추가
            alert("결제에 실패하였습니다. 다시 시도해주세요.");
        }
    });
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