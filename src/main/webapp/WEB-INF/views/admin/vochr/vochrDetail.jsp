<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ver.1.0.2 -->

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/img/logoD.png" rel="shortcut icon" type="image/x-icon">
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin/admin-detail-ver.1.0.1.css?ver=1" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin/admin-voucher-ver.1.0.0.css?ver=2" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin/column-width.css?ver=3" rel="stylesheet" type="text/css">

<title>Lifemenu~administrator</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){

	var currentNo = "<c:out value='${CURRENT}'/>";
	var setleCnt = "<c:out value='${SETLE_CNT}'/>"
	var vochr = "<c:out value='${VOCHR}'/>";
	
	var setleMngrOneUrl = "setleMngrOne.do";;
	if(setleCnt != 0){
		updateSetle(Number(currentNo)-1);
		$(".count").text(currentNo+"/"+setleCnt);
		
		/* 버튼 처리 */
		// 이전 버튼 처리
	    $("input[name='beforeBtn']").click(function(){
	    	if($(".count").text()){
	    		currentNo = $(".count").split("/")[0];
	        	setleCnt = $(".count").split("/")[1];
	        	updateSetle(Number(currentNo)-1);
	        	$(".count").text(currentNo+"/"+setleCnt);
	    	}
	    });
		// 다음 버튼 처리
	    $("input[name='nextBtn']").click(function(){
	    	if($(".count").text()){
	    		currentNo = $(".count").split("/")[0];
	        	setleCnt = $(".count").split("/")[1];
	        	updateSetle(Number(currentNo)+1);
	        	$(".count").text(currentNo+"/"+setleCnt);
	    	}
	    });
	}
	
    /* function 마지막 */
}); 

function updateSetle(){
	setleMngrOneUrl = setleMngrOneUrl + "?vochrCode=" + vochr.vochrCode + "&currentNo=" + (Number(currentNo)-1);
	$.getJSON(setleMngrOneUrl, {
		"vochrCode" : vochr.vochrCode , 
		"currentNo" : currentNo
	}, function(json){
		$("#setleCode").text(json.setleCode);
		$("#purchaserCode").text(json.purchaserCode);
		$("#setlePc").text(json.setlePc);
		$("#setleDt").text(json.setleDt);
		$("#setleAt").text(json.setleAt);
		$("#refndReqstAt").text(json.refndReqstAt);
		$("#purchsDcsnAt").text(json.purchsDcsnAt);
	});
}

</script>

</head>
<body>
<div id="frameOut">
    <div id="frameIn">
        <div class="sub_logo">
			<a href="adminMain.do"><img src="${path}/resources/img/logoB.png" class="mlogo" alt=""></a>
		</div>
		<header id="header">
			<jsp:include page="${request.contextPath}/header"></jsp:include>
		</header>
        <div id="content">
         	<form action="" method="POST">
	            <div class="box-wrap">
	            	<div class="title box">
	            		<div><h3>식사권 상세</h3></div>
	            	</div>
	            	<div class="content box">
	            	    <div class="voucher box">
		          		    <div class="info_title">
		          		        <h4>식사권 정보</h4>
		          		        <span>meal voucher information</span>
		          		    </div>
		            	    <div class="info_box">
		            	        <span class="col">식사권코드</span>
		            	        <span class="col-vochr-data">${VOCHR.vochrCode}</span>
		            	        <span class="col">판매자코드</span>
		            	        <span class="col-vochr-data">${VOCHR.mberCode}</span>
		            	    </div>
		            	    <div class="info_box">
		            	        <span class="col">식사권 가격</span>
		            	        <span class="col-vochr-data">${VOCHR.vochrPrice}</span>
		            	        <span class="col">식사권 등록 일시</span>
		            	        <span class="col-vochr-data">${VOCHR.vochrRegistDt}</span>
		            	    </div>
		            	    <div class="info_box">
		            	        <span class="col">식사 예정 일시</span>
		            	        <span class="col-vochr-data">${VOCHR.mealPrearngeDt}</span>
		            	        <span class="col">식사 시간</span>
		            	        <span class="col-vochr-data">${VOCHR.mealTime}</span>
		            	    </div>
		            	    <div class="info_box">
		            	        <span class="col">거래 가능 여부</span>
		            	        <span class="col-vochr-data">${VOCHR.delngAt}</span>
		            	    </div>
		            	</div>
		            	<div class="seller box">
		          		    <div class="info_title">
		          		        <h4>판매자 정보</h4>
		          		        <span>seller information</span>
		          		    </div>
		            	    <div class="info_box">
		            	        <span class="col">판매자 닉네임</span>
		            	        <span class="col-vochr-data">${VOCHR.mberNcnm}</span>
		            	        <span class="col">판매자 실명</span>
		            	        <span class="col-vochr-data">${VOCHR.mberRlnm}</span>
		            	    </div>
		            	    <div class="info_box">
		            	        <span class="col">판매자 이메일</span>
		            	        <span class="col-vochr-data">${VOCHR.mberEmail}</span>
		            	        <span class="col">판매자 전화번호</span>
		            	        <span class="col-vochr-data">${VOCHR.mberTel}</span>
		            	    </div>
		            	    <div class="info_box">
		            	        <span class="col">은행코드</span>
		            	        <span class="col-vochr-data">${VOCHR.bankCode}</span>
		            	        <span class="col">은행명</span>
		            	        <span class="col-vochr-data">${VOCHR.codeNm}</span>
		            	    </div>
		            	    <div class="info_box">
		            	        <span class="col">판매자 계좌번호</span>
		            	        <span class="col-vochr-data">${VOCHR.mberAcountNo}</span>
		            	    </div>
		            	</div>
		            	<div class="setle box">
		            	    <div class="info_title">
		            	        <h4>결제 정보</h4>
		            	        <span>setle information</span>
		            	        <span class="count">${CURRENT}/${SETLE_CNT}</span>
		            	        <span class="countBtn">
		            	            <c:if test="${CURRENT > 1}">
		            	                <input type="button" name="beforeBtn" value="이전">
		            	            </c:if>
		            	            <c:if test="${CURRENT < SETLE_CNT}">
		            	                <input type="button" name="nextBtn" value="다음">
		            	            </c:if>
		            	        </span>
		            	    </div>
		            	    <c:set var="setleCnt" value="${SETLE_CNT}" />
		            	    <c:if test="${setleCnt == 0}">
		            		    <div class="info_box">
		            		        <div class="no_data">아직 결제되지 않은 식사권입니다</div>
		            		    </div>
		            		</c:if>
		            		<c:if test="${setleCnt != 0}">
		            		    <div class="info_box">
		            	            <span class="col">결제코드</span>
		            	            <span class="col-vochr-data" id="setleCode">${setleCode}</span>
		            	            <span class="col">구매자코드</span>
		            	            <span class="col-vochr-data" id="purchaserCode">${purchaserCode}</span>
		            	        </div>
		            	        <div class="info_box">
		            	            <span class="col">결제가격</span>
		            	            <span class="col-vochr-data" id="setlePc">${setlePc}</span>
		            	            <span class="col">결제일시</span>
		            	            <span class="col-vochr-data" id="setleDt">${setleDt}</span>
		            	        </div>
		            	        <div class="info_box">
		            	            <span class="col">결제완료여부</span>
		            	            <span class="col-vochr-data" id="setleAt">${setleAt}</span>
		            	            <span class="col">환불신청여부</span>
		            	            <span class="col-vochr-data" id="refndReqstAt">${refndReqstAt}</span>
		            	        </div>
		            	        <div class="info_box">
		            	            <span class="col">구매확정여부</span>
		            	            <span class="col-vochr-data" id="purchsDcsnAt">${purchsDcsnAt}</span>
		            	        </div>
		            		</c:if>
							<div class="button-group box">
		            		    <input class="cancelBtn" type="submit" value="돌아가기" formaction="vochrMngrCondition.do">
		            		    <input type="hidden" name="start" value="${START}">
		            		    <input type="hidden" name="cnt" value="${CNT}">
		            	    </div>
		            	</div>
	            	</div>
	            </div>
	            <%-- end box-wrap --%>
            </form>
        </div>
        <footer id="footer">
			<jsp:include page="${request.contextPath}/footer"></jsp:include>
        </footer>
    </div>
</div>
</body>
</html>