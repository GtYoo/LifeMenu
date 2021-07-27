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
<link href="${path}/resources/css/setleConfirm.css?v=2" rel="stylesheet">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<script src="https://kit.fontawesome.com/9691fcfe8c.js"></script>
<title>결제확인</title>
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
        <form action="/LifeMenu/seller/list">
            <div class="resveHeader">
                <div class="setleTitle"><h1>결제확인</h1></div>
            </div>
            <div class="resveConfirm">
                <div class="resveInfo">
                	<div class="tt">결제가 정상적으로 완료되었습니다!</div>
                	<div class="ttt">결제내용은 <span style="font-weight: bold;">마이페이지</span> &gt; <span style="font-weight: bold;">거래목록</span> 에서 확인하실수 있습니다.<br>맛있는 식사와 함께 즐거운 만남이 되시길!</div>
                    <div class="ri">
                        <div class="setle__selerImage"><img
                                src="/LifeMenu/display?fileName=${SELER_IMAGE}"></div>
                        <div class="ri-1">
                        	<div class="setle__selerName"><span class="ri-title-1">성명</span><div class="rtbar"></div><span class="ri-text">${SELECT_SELER.mberRlnm}</span></div>
                        	<div class="setle__setleCode"><span class="ri-title-5">결제번호</span><div class="rtbar"></div><span class="ri-text">${SELECT_SETLE.setleCode}</span></div>
                        	<div class="setle__vochrPc"><span class="ri-title-5">결제가격</span><div class="rtbar"></div><span class="ri-text">${SELECT_SETLE.setlePc}코인</span></div>
                        	<div class="setle__vochrDt"><span class="ri-title-2">식사예정일</span><div class="rtbar"></div><span class="ri-text">${VOUCHER_DT}</span></div>
                        	<div class="setle__resveDt"><span class="ri-title-5">결제일자</span><div class="rtbar"></div><span class="ri-text">${SELECT_SETLE.setleDt}</span></div>
                        </div>
                        <div class="setleConfirmButton">
                            <button type="submit">확인</button>
                        </div>
                    </div>
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