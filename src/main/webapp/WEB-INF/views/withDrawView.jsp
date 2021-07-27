<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/common.css" rel="stylesheet"	type="text/css">
<link href="${path}/resources/css/withdrawView.css" rel="stylesheet"	type="text/css">
<!--  jQuery Framework 참조하기 -->
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<title>출금</title>

<script>
$(function number(){ 
    $("#rcppayAmount").keyup(function (event) {

        regexp = /[^0-9]/gi;

        v = $(this).val();

        if (regexp.test(v)) {

            alert("숫자만 입력가능 합니다.");

            $(this).val(v.replace(regexp, ''));

        }
    });
});

$(function() {	//단위 10000원으로 
	  $('#rcppayAmount').on('change', function() {
	     var n = $(this).val(); 
	     n = Math.floor(n/10000) * 10000; 
	      n = parseInt(n); 
	     $(this).val(n);
	  });
	});
	
$(function withDraw(){
	var money = "<c:out value='${MONEY}'/>"; 
	
	money = parseInt(money);
	
	var rcppayAmount = $("input[name='rcppayAmount']").val();
	
	$("#withDrawBtn").click(function(){
		var rcppayAmount = $("input[name='rcppayAmount']").val();
		var havedCoin = "<c:out value='${COIN }'/>";	//가지고 있는 코인
		
		if(!rcppayAmount || rcppayAmount == 0){
			alert("출금 하실 금액을 확인해주세요.");
			return false;
		}
		else if(rcppayAmount > money){
			alert("해당 금액은 보유하신 금액보다 많아서 출금하실수 없습니다.");
			$("input[name='rcppayAmount']").val('');
			$('#yoteiCoin').val(havedCoin);	
			return false;
			}
	});
});

$(function yoteiCoin(){
	var money = "<c:out value='${MONEY}'/>"; 		//가지고 있는 돈
	var havedCoin = "<c:out value='${COIN }'/>";	//가지고 있는 코인
	$('#yoteiCoin').val(havedCoin);					//화면 보였을 때 기본
	
	$('#rcppayAmount').blur(function(){
		var money_value = $("input[name='rcppayAmount']").val();	//출금금액 쓴 것
		
		if(money_value.length > 4)
		$('#yoteiCoin').val((money-money_value)/10000);
		
	});
});
</script>
</head>
<body>
	<div id="frameOut">
		<div id="frameIn">
			<div class="sub_logo"><a href="/LifeMenu/seller/list"><img src="resources/img/logoB.png"	class="mlogo" alt="로그인화면으로 이동"></a></div>
			<header id="header">
				<jsp:include page="${request.contextPath}/header"></jsp:include>
			</header>
			<div id="content">
				<div class="content_container">
					<div class="line_menu">
						<div class="withDrawHeader">
							<div class="wh-1">
								<h2 align="left">출금</h2>
							</div>
							<div class="wh-2">
								<h3>보유코인 ${COIN } 개</h3>
							</div>
						</div>
						<div class="withdrawBox">
							<div class="withdrawLeftBox">
								<form action="withDraw.do" method="post" onsubmit="return withDraw()">
									<table>
										<tr>
											<td>내 계좌 : </td>
											<td>
												<font color="blue">${dto.mberAcountNo}</font>
											</td>
										</tr>
									</table>
									<br>
									출금가능 금액 : <b>${MONEY } 원</b>
									<br> 
									<br>
									<br>
									<br>
									출금 금액 <input type="text" id="rcppayAmount" name=rcppayAmount>원
									<br>
									<font color="red">(10000원 단위로 출금이 가능합니다.)</font>
									<br>
									<br>
									예상 잔여코인 : <b><input type="text" name=yoteiCoin id="yoteiCoin" value="" readonly style="width:156px; border:0 solid black; font-size:33px;  color: red;"></b>
									<br>
									<div class="withdrawBtn">
										<input type="submit" class="btn" id="withDrawBtn" value="출금">&nbsp;	<input type="button" class="btn" id="cancelBtn" value="취소"onclick="document.location.href='walletView'">
									</div>
										<input type="hidden" name="mberCode" value="${dto.mberCode}"> <!-- 회원코드 -->
					       			    <input type="hidden" name="rcppayCl" value="W"> 			 <!-- 입출금 분류 -->
					       			    <input type="hidden" name="excngCoinCo" value="0"> 			 <!-- 환전 코인 수 -->
					       			    <!-- <input type="hidden" name="rcppayDt" value=""> 				  입출금 일시 -->
								</form>
							</div>
							<div class="withdrawRightBox">
								<textarea rows="25" cols="50" style="resize: none;" readonly>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*** 주의사항 ***
											1. LIFEMENU 서비스는 인터넷 쇼핑 이용자의 편의를 위해 인터넷상에 공개된 인터넷쇼핑몰의 정보(상품정보, 가격정보, 상품구성, 이미지 등)를 수집, 정리하여 쇼핑 이용자의 편리한 상품비교와 구매를 돕는 서비스 입니다.

2. LIFEMENU는 LIFEMENU 링크, 다운로드, 광고 등을 포함하여 LIFEMENU 통해 배포, 전송, 노출되는 정보에 대해서 정확성이나 신뢰성이 있는 정보를 제공하기 위해 노력하지만, 그 과정에서 발생할 수 있는 정보의 정확성이나 신뢰성에 대해서는 어떤 보증도하지 않으며, 정보의 오류로 인해 발생하는 모든 직접, 간접, 파생적, 징벌적,부수적인 손해에 대해 책임을 지지 않습니다. 

또한 LIFEMENU 에서 제공하는 정보(상품정보, 가격정보, 폼구성, 이미지 등)에 대해 신뢰 여부는 전적으로 이용자 본인의 책임이며, 상품의 색상과 사이즈 및 자세한 상품 구성은 해당 쇼핑몰에서 이용자 본인이 반드시 확인해야 하며 상품 주문, 환불의 의무와 책임은 해당 쇼핑몰에 있습니다.

3. LIFEMENU에 식사권을 판매중인 판매자는 독자적으로 운영하며 해당 판매자의 전적인 책임 하에 있습니다.

LIFEMENU는 활동, 상품이나 서비스, 또는 게재되는 내용, 접속 또는 접속 불능으로 인한 어떠한 손해, 손실, 상해 등 이용자와 쇼핑몰간에 행하여지는 거래에 대해서 명시적으로 어떠한 책임이나 의무도 부담하지 아니합니다. 

판매자 등이 제공하는 다양한 상품이나 서비스에 대한 질문과 불만에 대하여는 해당 쇼핑몰 등에 직접 연락을 취하시기 바랍니다. 
				        		</textarea>
							</div>
						</div>
				</div>
				</div>
			</div>
			<footer id="footer">
				<jsp:include page="${request.contextPath}/footer"></jsp:include>
        	</footer>
		</div>
	</div>
</body>
</html>