<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css" rel="stylesheet">
<link href="${path}/resources/css/resve.css" rel="stylesheet">
<link href="${path}/resources/css/setle.css" rel="stylesheet">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<script src="https://kit.fontawesome.com/9691fcfe8c.js"></script>
<title>결제</title>
<script>
function atConfirm(){
	if(confirm("이대로 결제를 진행 하시겠습니까?")){
		alert("결제확인 페이지로 이동합니다.");
	}
	else{
		return false;
	}
}
</script>
</head>
<body>
<div id="frameOut">
    <div id="frameIn">
        <div class="sub_logo">
            <a href="#"><img src="${path}/resources/img/logoB.png" class="mlogo" alt=""></a>
        </div> 
        <header id="header">
        	<jsp:include page="${request.contextPath}/header"></jsp:include>
        </header>
        <div id="content">
        <form method="post" action="/LifeMenu/Setle/insertSetle">
            <div class="resveHeader">
                <div class="setleTitle"><h1>결제</h1></div>
            </div>
            <div class="vochrResve">
                    <div class="vochrInfo">
                        <div class="vi">
                            <div class="vi-1">
                            <div class="setle_selerImage"><img src="/LifeMenu/display?fileName=${SELER_IMAGE}"></div>
                            </div>
                            <div class="vi-2">
                            <div class="setle_selerName"><span>성명</span><div class="rtbar"></div><span class="vi-2-text">${SELER_DTO.mberRlnm}</span></div>
                            <div class="setle_vochrPc"><span>결제금액</span><div class="rtbar"></div><span class="vi-2-text">${VOUCHER_INFO.vochrPrice}코인</span></div>
                            <div class="setle_seleteDt"><span>선택날짜</span><div class="rtbar"></div><span class="vi-2-text">${VOUCHER_MEALDT}</span></div>
                            <input type="hidden" id="mberCode" name="mberCode" value="${dto.mberCode}">
                            <input type="hidden" id="vochrCode" name="vochrCode" value="${VOUCHER_INFO.vochrCode}">
                            <input type="hidden" id="setlePc" name="setlePc" value="${VOUCHER_INFO.vochrPrice}">
                            </div>
                        </div>
                    </div>
            <div class="resveTime">
                    <div class="st">
                        <div class="precTitle"><h1>꼭 읽어주세요!</h1></div>
                        <div class="preccontent">
							<p class="setleP2">LifeMenu는 예약과 동시에 결제를 진행하고 있습니다. 결제 후 환불시에는 별도의 과정이 필요하며
								마이페이지 > 거래목록에서 환불신청을 할 수 있습니다. 아래 결제 버튼을 선택하면 결제가 진행되고 본 LifeMenu 이용약관, 
								개인정보 처리방침, 환불 정책, 코로나 방역지침 관련 정책에 동의하는 것입니다. 또한 결제 금액에 대해 동의합니다. </p>
						</div>
                    </div>
            </div>
            <div class="setlePaymentButton">
                    <button type="submit" class="custom-btn btn-5" onclick="atConfirm()"><span>결제</span></button>
            </div>
            </div>
        </form>
        </div>
        <footer id="footer">
			<jsp:include page="${request.contextPath}/footer"></jsp:include>
        </footer>
    </div>
</div>
</body>
</html>