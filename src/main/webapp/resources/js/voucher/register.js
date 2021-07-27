	$(document).ready(function() {
		
		$('#register').click(function () {
			
			let mealPrearngeDt = $("input[name='mealPrearngeDt']").val().replaceAll("-", "").replaceAll("T", "").replaceAll(":", "");
			
			let d = new Date();
			let mon;
			
			if((d.getMonth() + 1) < 10) {
				mon = "0" + (d.getMonth() + 1);
			}else {
				mon = (d.getMonth() + 1);
			}
			
			let nowTime = "" + d.getFullYear() + mon + d.getDate() + d.getHours() + d.getMinutes();
			
			if(parseInt(nowTime) > parseInt(mealPrearngeDt)) {
				alert("현재 시간 이전의 일시는 지정할 수 없습니다.");
				return;
			}
			
			let mberCode = $("input[name='mberCode']").val();
			let vochrPrice = $("input[name='vochrPrice']").val();
			let mealTime = $("input[name='mealTime']").val();
			
			if(vochrPrice > 10000) {
				alert("10000코인 이상의 가격은 설정할 수 없습니다.")
				return;
			}
			
			let json = {"mberCode" : mberCode, "vochrPrice" : vochrPrice, "mealPrearngeDt" : mealPrearngeDt
					,"mealTime" : mealTime, "delngAt" : 'Y'};
				
			$.ajax({
			        url: "/LifeMenu/voucher/register",
			        type:"post",
			        data: JSON.stringify(json),
			        contentType: "application/json",
			        success: function(data) {
			            opener.parent.location.reload();
			            window.close();
			        },
			        error: function() {
			            alert("error!");
			        }
			    }) 
		});
	})