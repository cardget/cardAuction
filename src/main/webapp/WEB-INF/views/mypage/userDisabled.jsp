<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(function() {
        $("#deleteForm").submit(function(event) {
            event.preventDefault();
                
            var password = $("#password").val();
            $.ajax({
                url: '/deleteUser.do',
                method: 'POST',
                data: { password: password },
                success: function(response) {
                    if (response.success) {
                        alert("User successfully deleted.");
                        window.close();
                    } else {
                        alert("Failed to delete user. Please check your password.");
                    }
                },
                error: function(xhr, status, error) {
                    console.log("Error: " + error);
                    console.log("Status: " + status);
                    console.dir(xhr);
                    alert("An error occurred while processing the request.");
                }
            });
        });
    });
</script>
</head>
<body>
	<form class="custom-form deleteForm" method="post">
		<h1>회원 탈퇴</h1>
		<h4 class="warning">거래 중인 물품이 있을 시, 물품이나 판매 대금 수령을 받지 못할 수 있습니다.</h4>
        <div class="form-group">
            <label for="password" class="input-label">비밀번호</label>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요" required class="input-field">
        </div>
        <hr class="form-divider">
        <div class=button-section>
        	<button type="submit" class="submit-button-withdrawl">회원탈퇴</button>
        </div>
    </form>
</body>
</html>

