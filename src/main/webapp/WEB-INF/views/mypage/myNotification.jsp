<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/myPage.css">
<script>
	$(function() {
		$(".noti-control a").click(function(event) {
			event.preventDefault();
			
			var url = $(this).attr("href");
			$.ajax({
				url : url,
				method : 'GET',
				success : function(response) {
					$(".content").html(response);
				},
				error : function(xhr, status, error) {
					console.log("Error: " + error);
					console.log("Status: " + status);
					console.dir(xhr);
					alert("Failed to load the page.");
				}
			});
		});
	});
	
	$(function() {
        $('.item-section').on('click', function() {
            var element = $(this);
            var notiId = element.data('noti-id');
            var itemId = element.data('item-id');
            
            element.addClass('already-read');
            
            window.location.href = '${path}/mypage/markAsRead.do?notiId=' + notiId + '&itemId=' + itemId;
            
        });
    });
</script>
</head>
<body>
	<div class="header">
		<h2>알림 내역</h2>
		<div class="noti-control">
			<a href="${path}/mypage//readUpdate.do" class="grayfont">전체 읽음 표시</a> /
			<a href="${path}/mypage/deleteAllNoti.do" class="grayfont">읽은 알림 삭제</a>
		</div>
	</div>
	<c:forEach var="noti" items="${nlist}">
        <div class="${noti.is_read == 1 ? 'item-section already-read' : 'item-section'}" data-noti-id="${noti.notification_id}" data-item-id="${noti.item_id}">
            <div class="image-section">
				<img src="${noti.image1}" alt="Product Image">
			</div>
			<div class="info-section">
				<h3>${noti.item_name}</h3>
				<p>${noti.cmt }</p>
				<p>${noti.create_date }</p>
			</div>
			<div class="status-section">
				<button class="status-button-sold">삭제</button>
			</div>
		</div>
	</c:forEach>
</body>
</html>