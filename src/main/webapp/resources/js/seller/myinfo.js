$(document).ready(function() {
	$('#seller_acdmcr').hide();
	
	$('#ac').click(function() {
		$('#seller_career').hide();
		$('#ac').css("background-color", "black");
		$('#sc').css("background-color", "lightgray");
		$('#seller_acdmcr').show();
	});
	
	$('#sc').click(function() {
		$('#seller_acdmcr').hide();
		$('#sc').css("background-color", "black");
		$('#ac').css("background-color", "lightgray");
		$('#seller_career').show();
	})
	
	$('#sc').css("background-color", "black");
})	