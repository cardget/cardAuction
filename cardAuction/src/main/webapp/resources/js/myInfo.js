$(function(){
		$("#listButton").click(function(){
			  $.ajax({
			          type: 'post',
			          url: '/list.html',
			          dataType : 'html',
			          success: function(data) {
			        	$("#listDiv").html(data);
			          }
			  });	
		})		
})
