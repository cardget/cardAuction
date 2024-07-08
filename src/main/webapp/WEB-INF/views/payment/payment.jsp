<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
/* 포인트 사용 */
function usingPoint() {
	// trade.price 값 가져오기
	var tradePrice = parseInt(`${trade.price}`, 10);
	console.log(tradePrice);

	// point-used 클래스의 input 값 가져오기
	var pointUsed = parseInt($('.point-used').val(), 10);
	console.log(pointUsed);
	
	// 전체 포인트 값 가져오기
	var point = parseInt(`${point}`, 10);
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
	document.getElementById("remainingPoint").innerText = remainingPoint.toLocaleString() + " P";

	// total-payment 클래스의 input에 값 설정
	$('.total-payment').val(totalPayment);
}
	
/* 결제 */
function pay() {
    var totalPayment = parseInt($('.total-payment').val());

    if (totalPayment == 0) {
        var postData = {
            trade_id: `${trade.trade_id}`,
            point_used: parseInt($('.point-used').val(), 10),
            paid_amount: 0,
            buyer_name: `${user.user_name}`
        };

        postRequest('result', postData).then(() => {
            window.location.href = '/myapp/payment/result'; // 결과 페이지로 이동
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
                point_used: parseInt($('.point-used').val(), 10),
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
                buyer_addr: `${user.address} ${user.address_detail}`
            };

            postRequest('/myapp/payment/result', postData)
        } else {
            // 결제 실패 시 처리할 로직 추가
            alert("결제에 실패하였습니다. 다시 시도해주세요.");
        }
    });
}

/* 결제 결과 */
function postRequest(url, data) {
    $.ajax({
        url: url,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(response) {
            window.location.href = 'result';
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('Error:', errorThrown);
        }
    });
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
				<div>
					<p id=tradePrice><fmt:formatNumber value="${trade.price}" pattern="#,###"/> 원</p>
				</div>
			</div>
			<div>
				<p>전체 포인트</p>
				<div>
					<p id=totalPoint><fmt:formatNumber value="${point}" pattern="#,###"/> P</p>
				</div>
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
				<p id="remainingPoint"><fmt:formatNumber value="${point}" pattern="#,###"/> P</p>
			</div>
			<hr>
				<div>
					<p>배송비</p>
					<p>3,000 원</p>
				</div>
			<hr>
			<div>
				<p>최종결제금액</p>
				<div>
					<input type="number" class="total-payment" value="${trade.price + 3000}" disabled>
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
