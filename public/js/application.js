$(document).ready(function(){
	$("h1").hide()
	$("h1").fadeIn(3000)

	$("tr td:nth-child(3)").hover(

		function(){
			$(this).css("background-color","white");
		},

		function(){
			$(this).css("background-color","transparent");
		});

	$("#target").submit(function(event){
		event.preventDefault();
		var formData = $(this).serialize();
		var URL = $(this).attr("action");
		$.ajax({

			type: "POST",
			url: URL,
			data: formData,
			success: function(response){
			$('#table_id').append(response);
			},
		});
	});
});
