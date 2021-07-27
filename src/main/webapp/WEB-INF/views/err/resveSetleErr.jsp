<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css?v=1" rel="stylesheet">
<link href="${path}/resources/css/resve.css?v=1" rel="stylesheet">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<script src="https://kit.fontawesome.com/9691fcfe8c.js"></script>
<title>err</title>
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
        <c:set var="mbCoin" value="${MBER_COIN}"/>
        <c:choose>
        	<c:when test="${mbCoin eq 0}">
        		<div>
        		<h2>잔여 코인이 부족합니다.</h2>
        		</div>
        		<div>
        		<span>결제하는데 코인이 부족합니다. 내 지갑에서 코인 충전후 이용해주세요.</span>
        		</div>
        		<div><a href="/LifeMenu/seller/list">리스트로 돌아가기</a></div>
        	</c:when>
        </c:choose>
        <c:set var="notResve" value="${RESVE_DTO}"/>
        <c:choose>
        	<c:when test="${notResve == null}">
        		<div>
        		<h2>예약내역이 없거나 시스템 오류 입니다.</h2>
        		</div>
        		<div>
        		<span>해당 식사권에 대한 예약이 없습니다. 자세한 문의는 관리자 메일로 문의 주세요.</span>
        		</div>
        		<div><a href="/LifeMenu/seller/list">리스트로 돌아가기</a></div>
        	</c:when>
        </c:choose>
        <c:set var="notSetle" value="${SETLE_DTO}"/>
        <c:choose>
        	<c:when test="${notSetle == null}">
        	    <div>
        		<h2>결제내역이 없거나 시스템 오류 입니다.</h2>
        		</div>
        		<div>
        		<span>해당 식사권에 대한 결제내역이 없습니다. 자세한 문의는 관리자 메일로 문의 주세요.</span>
        		</div>
        		<div><a href="/LifeMenu/seller/list">리스트로 돌아가기</a></div>
        	</c:when>
        </c:choose>
        <c:set var="refndAt" value="${REFND}"/>
        <c:choose>
        	<c:when test="${refndAt != null}">
        	    <div>
        		<h2>이미 환불신청을 하셨습니다.</h2>
        		</div>
        		<div>
        		<span>환불신청이 이미 완료된 상태입니다. 자세한 문의는 관리자 메일로 문의 주세요.</span>
        		</div>
        		<div><a href="/LifeMenu/seller/list">리스트로 돌아가기</a></div>
        	</c:when>
        </c:choose>
        <c:set var="tlList" value="${T_LIST}"/>
        <c:choose>
        	<c:when test="${T_LIST == null}">
        	    <div>
        		<h2>거래내역이 없습니다.</h2>
        		</div>
        		<div>
        		<span>거래내역이 없습니다.</span>
        		</div>
        		<div><a href="/LifeMenu/seller/list">리스트로 돌아가기</a></div>
        	</c:when>
        </c:choose>
        </div>
        <footer id="footer">
			<jsp:include page="${request.contextPath}/footer"></jsp:include>
        </footer>
    </div>
</div>
</body>
</html>