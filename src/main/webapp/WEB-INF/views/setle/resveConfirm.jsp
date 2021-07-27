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
<link href="${path}/resources/css/resveConfirm.css" rel="stylesheet">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<script src="https://kit.fontawesome.com/9691fcfe8c.js"></script>
<title>예약확인</title>
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
        <form method="post" action="/LifeMenu/ResveSetle/setleForm?RESVE_CODE=${SELECT_RESVE.resveCode}">
            <div class="resveHeader">
                <div class="resveTitle"><h1>예약확인</h1></div>
            </div>
            <div class="resveConfirm">
                 <div class="resveInfo">
                      <div class="ri">
                           <div class="resve__selerImage"><img src="/LifeMenu/display?fileName=${SELER_IMAGE}"></div>
                           <div class="ri-1">
                           		<div class="resve__selerName"><span class="ri-title-1">성명</span><div class="rtbar"></div><span class="ri-text">${SELER_NAME.mberRlnm}</span></div>
                           		<div class="resve__vochrPc"><span class="ri-title-2">식사권가격</span><div class="rtbar"></div><span class="ri-text">${VOUCHER.vochrPrice}코인</span></div>
                           		<div class="resve__vochrDt"><span class="ri-title-3">식사예정일</span><div class="rtbar"></div><span class="ri-text">${VOUCHER_MEALDT}</span></div>
                           		<div class="resve__mealTime"><span class="ri-title-4">시간</span><div class="rtbar"></div><span class="ri-text">${VOUCHER.mealTime}시간</span></div>
                           		<div class="resve__resveCode"><span class="ri-title-5">예약번호</span><div class="rtbar"></div><span class="ri-text">${SELECT_RESVE.resveCode}</span></div>
                           		<div class="resve__mberName"><span class="ri-title-6">구매자성명</span><div class="rtbar"></div><span class="ri-text">${dto.mberRlnm}</span></div>
                           		<div class="resve__mberId"><span class="ri-title-7">아이디</span><div class="rtbar"></div><span class="ri-text">${dto.mberId}</span></div>
                           		<div class="resve__resveDt"><span class="ri-title-8">예약일자</span><div class="rtbar"></div><span class="ri-text">${SELECT_RESVE.resveDt}</span></div>
                      	   </div>
                           <div class="setleButton">
                                <button type="submit">결제</button>
                           </div>
                      </div>
                      <div class="resve-msg"><span class="rm-1">확인해주세요!</span><br><span class="rm-2">예약정보를 반드시 확인하시고 결제로 진행해주세요!</span></div>
                 </div>
            </div>
        </form>
        </div> 
        <form method="post" action="/LifeMenu/ResveSetle/deleteResve?RESVE_CODE=${SELECT_RESVE.resveCode}">
                <div class="cancelButton">
                	<button type="submit">취소</button>
                </div>
        </form>
        <footer id="footer">
			<jsp:include page="${request.contextPath}/footer"></jsp:include>
        </footer>
    </div>
</div>

</body>
</html>