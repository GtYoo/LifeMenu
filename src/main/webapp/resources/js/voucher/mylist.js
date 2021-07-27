$(document).ready(function() {
	var voucherCode;
	
	$('#remove').click(function() {
		let vochrCode = $('#selectedVoucherCode')
				.val();
		let result = confirm("정말 삭제하겠습니까?!!");
		
		if (result) {
			$.ajax({
				url : "/LifeMenu/voucher/remove/"
						+ vochrCode,
				type : "get",
				contentType : "application/json",
				success : function(data) {
					window.location.reload();
				},
				error : function() {
					alert("error!");
				}
			});
		}
		;
	});
	
	$('#regist').click(function() {
		let url = "/LifeMenu/voucher/register/"
				+ $(document).find(
						'#mberCode').val();
		let name = "popup test";
	
		let option = "width = 430, height = 300, top = 200, left = 680, locations = no, scrollbars = yes, toolbars=no, status=no";
		window.open(url, name, option);
	});
	
	$('.vochr_box').click(function() {
		$('.vochr_box').css("border", "0px");
		$(this).css("border","4px solid black");
		voucherCode = $(this).find(".voucherCode").val();
		$('#selectedVoucherCode').val(voucherCode);
	});
});