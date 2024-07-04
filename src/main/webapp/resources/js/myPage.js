$(function() {
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