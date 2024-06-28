<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/payment.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	function usingPoint() {
		// trade.price 값 가져오기
		var tradePrice = parseInt("${trade.price}", 10);

		// point-used 클래스의 input 값 가져오기
		var pointUsed = parseInt($('.point-used').val(), 10);

		// 전체 포인트 값 가져오기
		var point = parseInt("${point}", 10);

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
	
	function pay(){
		var totalPayment = parseInt($('.total-payment').val());
		
		if (totalPayment == 0) {
			postRequest('result.do', {
                trade_id: `${trade.trade_id}`,
                used-point: parseInt($('.point-used').val(), 10),
                amount: rsp.paid_amount,
                buyer_name: rsp.buyer_name
            });
		}
		
		IMP.init("imp82846867");
		IMP.request_pay({
		    pg : 'html5_inicis.INIpayTest',
		    pay_method : 'card',
		    merchant_uid: `${trade.trade_id}`, // 상점에서 관리하는 주문 번호를 전달
		    name : `${trade.item_name}`,
		    amount : totalPayment,
		    buyer_email : `${user.email}`,
		    buyer_name : `${user.user_name}`,
		    buyer_tel : `${user.phone_number}`,
		    buyer_addr : `${user.address} ${user.address_detail}`,
		    buyer_postcode : `${user.zip_code}`,
		    m_redirect_url : '{모바일에서 결제 완료 후 리디렉션 될 URL}' // 예: https://www.my-service.com/payments/complete/mobile
		}, function(rsp) { // callback 로직
			console.log(rsp);
		});
	}
	
	function postRequest(url, data) {
		fetch(url, {
		    method: 'POST',
		    headers: {
		        'Content-Type': 'application/json'
		    },
		    body: JSON.stringify(data)
		})
		.then(response => response.json())
		.then(data => {
		    console.log('Success:', data);
		    window.location.href = 'https://www.example.com/success'; // 성공 페이지로 이동
		})
		.catch((error) => {
		    console.error('Error:', error);
		});
	}		
}
</script>
</head>
<body>
	<div class="container">
		<div class="payment-header">
			<h3>결제</h3>
		</div>
		<div class="item-section">
			<div class="image-section">
				<img src="${trade.image1}" alt="Product Image">
			</div>
			<div class="info-section">
				<h3 id="item-name">${trade.item_name}</h3>
				<p>낙찰일: ${trade.create_date}</p>
			</div>
		</div>
		<div class="trade-section">
			<div>
				<p>낙찰금</p>
				<p>${trade.price}원</p>
			</div>
			<div>
				<p>전체 포인트</p>
				<p>${point}P</p>
			</div>
			<div>
				<p>사용 포인트</p>
				<div>
					<input type="number" class="point-used" value=0 name="pointUsed">
					<p>P</p>
					<button type="button" class="btn-blue btn-use" onclick="usingPoint()">사용</button>
				</div>
			</div>
			<div>
				<p>잔여 포인트</p>
				<p id="remainingPoint">${point}P</p>
			</div>
			<hr>
			<div>
				<p>최종결제금액</p>
				<div>
					<input type="number" class="total-payment" value="${trade.price}" disabled>
					<P>원</P>
				</div>
			</div>
		</div>
		<div class="button-section">
			<button type="button" class="btn-payment btn-blue" onclick="pay()">결제하기</button>
		</div>
	</div>
</body>
</html>
