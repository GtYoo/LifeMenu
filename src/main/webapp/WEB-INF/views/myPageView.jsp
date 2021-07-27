<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/myPage.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/9691fcfe8c.js"></script>
<title>마이페이지</title>
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
	        <div id="content_container">
	            <div class="line_menu1">
	               	<span class="menu1"><a class="link" href="/LifeMenu/updateMberView"><i class="fas fa-user-secret"></i>정보수정</a></span>
	               	<span class="menu1"><a class="link" href="/LifeMenu/walletView"><i class="fas fa-wallet"></i>지갑</a></span>
	               	<span class="menu1"><a class="link" href="/LifeMenu/transactionList?MBER_CODE=${dto.mberCode}"><i class="fas fa-list-alt"></i>거래목록</a></span>
	               	<span class="menu1"><a class="link" href="/LifeMenu/seller/myinfo"><i class="fas fa-glass-cheers"></i>판매</a></span>
	           	</div>
		        <div class="line_menu1">
		           <span class="menu1"><a class="link" href="tagMngrMulti.do?start=1&cnt=8"><i class="fas fa-comments"></i>자유게시판</a></span>
		           <span class="menu1"><a class="link" href="excclcMngr.do"><i class="fas fa-exclamation-circle"></i>문의게시판</a></span>
		           <span class="menu1"><a class="link" href="/LifeMenu/scencView"><i class="fas fa-sign-out-alt"></i>회원탈퇴</a></span>
		           <span class="menu1"><a class="link" href="/LifeMenu/seller/list"><i class="fas fa-home"></i>홈으로</a></span>
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