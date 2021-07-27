<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css" rel="stylesheet">
<link href="${path}/resources/css/refnd.css" rel="stylesheet">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<script src="https://kit.fontawesome.com/9691fcfe8c.js"></script>
<script>
$(function(){
	$("#directInput").hide();
	
	$("#refndList").change(function(){
		if($("#refndList").val() == "op4:"){
			$("#directInput").show();
		}else{
			$("#directInput").hide();
		}
	})
});

function atConfirm(){
	if(confirm("환불신청을 진행 하시겠습니까?")){
		alert("환불완료 페이지로 이동합니다.");
	}
	else{
		return false;
	}
}
</script>
<title>refnd</title>
</head>
<body>
<div id="frameOut">
    <div id="frameIn">
        <div class="sub_logo">
            <a href="/LifeMenu/seller/list"><img src="${path}/resources/img/logoB.png" class="mlogo" alt=""></a>
        </div>
        <header id="header">
        	<jsp:include page="${request.contextPath}/header"></jsp:include>
        </header>
        <div id="content">
            <div class="refndHeader">
                <div class="prevbtn">
                    <a href="#" class="prevbtn_a"><i class="fas fa-chevron-circle-left fa-2x"></i></a>
                </div>
                <div class="refndTitle"><h1>환불</h1></div>
            </div>
            <form method="post" action="/LifeMenu/Refnd/insertRefnd">
            <div class="refndConfirm">
                <div class="refndInfo">
                    <div class="rf">
                        <div class="rf-1">
                            <div class="refnd__selerImage"><img src="/LifeMenu/display?fileName=${SELER_IMAGE}"></div>
                        </div>
                        <div class="rf-2">
                            <div class="refnd__selerName"><span class="rf-title-1">성명</span><div class="rtbar"></div><span class="rf-text">${SELER_INFO.mberRlnm}</span></div>
                            <div class="refnd__vochrPc"><span class="rf-title-1">결제금액</span><div class="rtbar"></div><span class="rf-text">${VOUCHER_INFO.vochrPrice}코인</span></div>
                            <div class="refnd__vochrDt"><span class="rf-title-1">식사예정일</span><div class="rtbar"></div><span class="rf-text">${VOUCHER_MEALDT}</span></div>
                            <div class="refnd__setleCode"><span class="rf-title-1">결제번호</span><div class="rtbar"></div><span class="rf-text">${SETLE_INFO.setleCode}</span></div>
                            <div class="refnd__resveDt"><span class="rf-title-1">결제일자</span><div class="rtbar"></div><span class="rf-text">${SETLE_INFO.setleDt}</span></div>
                        </div>
                    </div>
                </div>
                <div class="refndReqst">
                    <div class="rfr">
                		<label for="refnd">환불 사유</label>
                		<select id="refndList" name="refndResn" required>
                    		<option value="" selected="selected">--환불사유를 선택하세요.--</option>
                    		<option value="op1:판매자가 식사권을 취소하였습니다.">판매자가 식사권을 취소하였습니다.</option>
                    		<option value="op2:판매자가 약속장소에 나오지 않았습니다.">판매자가 약속장소에 나오지 않았습니다.</option>
                    		<option value="op3:예약시간이 맞지 않습니다.">예약시간이 맞지 않습니다.</option>
                    		<option value="op4:">직접입력</option>
                		</select>
                		<input type="hidden" name="setleCode" value="${SETLE_INFO.setleCode}">
                		<input type="hidden" name="refndPc" value="${SETLE_INFO.setlePc}">
                		<input type="text" class="directInput" id="directInput" name="refndResn">
                	</div>
                </div>
                <div class="refndButton">
                    <button type="submit" class="custom-btn btn-5" onclick="atConfirm()"><span>환불신청</span></button>
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