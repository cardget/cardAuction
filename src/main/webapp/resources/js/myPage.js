$(function() {
		$(".sidemenu a").click(function(event) {
			event.preventDefault();
			
			// 기존에 선택된 메뉴의 selected 클래스 제거
			$(".sidemenu a").removeClass("selected");

			// 클릭한 메뉴에 selected 클래스 추가
			$(this).addClass("selected");
			
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
		
		$(".revision").click(function() {
			$.ajax({
				url : '/myapp/mypage/editProfile.do',
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
		
		$(".header a").click(function(event) {
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
		
		$(".withdrawl").click(function(event){
			event.preventDefault();
			
			var url = $(this).attr("href");
			window.open(url, 'popupWindow', 'width=600,height=300,scrollbars=yes');
		})
		
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
		
		$('.item-section').on('click', function() {
            var element = $(this);
            var notiId = element.data('noti-id');
            var itemId = element.data('item-id');
            
            element.addClass('already-read');
            
            window.location.href = '${path}/mypage/markAsRead.do?notiId=' + notiId + '&itemId=' + itemId;
            
        });
	});