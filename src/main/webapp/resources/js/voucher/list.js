$(document).ready(function() {
	var mberCode;
	var voucherCode;

	$('.vochr_box').click(function() {
						$('.vochr_box').css("border", "0px");
						$(this).css("border","4px solid black");
						mberCode = $(this).find(".mberCode").val();
						voucherCode = $(this).find(".voucherCode").val();
						$('#reserve_btn').attr("onclick","location.href='/LifeMenu/Setle/setleBeForm?&VOUCHER_CODE="
										+ voucherCode
										+ "&MBER_CODE="
										+ mberCode + "'");
					});

	var vouchrListLength = "${vochrList.size()}";

	if (vouchrListLength == 0) {
		$('#reserve_btn').hide();
	}

	$('#reserve_btn').click(function() {
		if ("" == voucherCode || null == voucherCode) {
			alert("식사권을 선택하세요.");
		}
	});
});