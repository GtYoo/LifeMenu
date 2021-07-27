$(document).ready(function() {
						$('#scrollUp').hide();
						$('.sellerImg').hover(function() {
											var kingSrc = document
													.querySelector('.sellerImg').src;
											var subSrc = $(this).attr("src");

											document.querySelector('.sellerImg').src = subSrc;
											$(this).attr("src", kingSrc);
										})

						$('#scrollDown').click(function() {
											let height = document
													.querySelector("#content_container").scrollHeight;
											$('#content_container').animate({scrollTop : height}, 500);
											$('#scrollDown').hide();
											$('#scrollUp').show();
										})

						$('#scrollUp').click(function() {
							$('#content_container').animate({scrollTop : 0}, 300);
							$('#scrollUp').hide();
							$('#scrollDown').show();
						})
						
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
						
					});