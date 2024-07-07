<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/findId.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Apple+SD+Gothic+Neo&display=swap">
<script src="${path}/resources/js/verificationSMS_API.js"></script>
<script type="text/javascript">
        // 페이지가 로드되면 errorMessage가 있을 경우 alert을 표시
        window.onload = function() {
            var errorMessage = '${errorMessage}';
            if (errorMessage) {
                alert(errorMessage);
            }
        }
    </script>
</head>

<body>
	<div class="find-id-container">
		<div class="logo">
			<img src="${path}/resources/image/logo.png" alt="로고이미지" height=41 onclick="location.href='../main'">
		</div>
		<div style="display: flex; justify-content: space-between; height: 40px;">
		<h5>아이디 찾기</h5>
		<h6>회원정보에 등록한 휴대전화로 인증</h6>
		</div>		
		<hr style="width:440px;">
		
		<h6 style="margin-top:0px;"><img src="${path}/resources/icon/blue_error.png">&nbsp;회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야 인증 번호를 받을 수 있습니다.</h6>
		<form action="findIdResult "class="custom-form" method="post">
			<div >
				<div class="form-group">
			        <label class="input-label" for="userName">이름</label>
			        <input type="text" id="userName" name="userName" class="input-field" required>
			    </div>
			    <div class="form-group">
			        <label class="input-label">전화번호</label>
			        <input type="text" id="phone_number" name="phone_number" class="input-field" required>
			        <button type="button" class="check-button" onclick="sendCode()">인증번호 발송</button>
			        <input type="text" id="verificationCode" class="input-field" style="margin-left: 80px;" placeholder="인증번호 입력" >
			   	 	<button type="button" class="check-button" onclick="verifyCode()">확인</button>
			   	 	<p id="result"></p>
			   	 	<h6 style="margin-left: 80px; margin-top:1px;">
			   	 		<img src="${path}/resources/icon/red_error.png">&nbsp;인증번호를 다시 입력해주세요
			   	 	</h6>

			    </div>			    
			</div>					
			<button type="submit" class="submit-button">아이디 찾기</button>
		</form>		
	</div>
	<script>
    $(document).ready(function() { // 문서가 완전히 로드되었을 때 실행되는 함수
      $('#findIdResult').on('submit', function(event) { // 폼 제출 이벤트를 가로챕니다.
        event.preventDefault(); // 폼의 기본 제출 동작을 막습니다.

        $.ajax({ // jQuery의 AJAX 메서드를 사용하여 비동기 요청을 보냅니다.
          url: '/findIdResult', // 요청을 보낼 URL
          type: 'POST', // HTTP 메서드 타입
          data: $(this).serialize(), // 폼 데이터를 직렬화하여 보냅니다.
          success: function(response) { // 요청이 성공적으로 완료되었을 때 실행되는 콜백 함수
            if (response.status === 'success') { // 응답이 성공 상태일 때
              // 성공 시 페이지 이동
              window.location.href = 'auth/findIdResult?userId=' + response.userId; // 지정된 URL로 페이지를 이동합니다.
            } else if (response.status === 'error') { // 응답이 오류 상태일 때
              // 실패 시 알림 표시
              alert(response.message); // 오류 메시지를 알림으로 표시합니다.
            }
          },
          error: function() { // 요청이 실패했을 때 실행되는 콜백 함수
            alert('서버 요청 중 오류가 발생했습니다.'); // 서버 요청 중 오류가 발생했음을 알림으로 표시합니다.
          }
        });
      });
    });
</script>
	
</body>
</html>