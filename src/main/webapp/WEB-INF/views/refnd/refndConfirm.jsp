<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css?v=1" rel="stylesheet">
<link href="${path}/resources/css/refndConfirm.css" rel="stylesheet">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<script src="https://kit.fontawesome.com/9691fcfe8c.js"></script>
<title>refnd</title>
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
        	<div class="refndCf">
            	<div class="rf">
            		<div class="rfTitle">
            			<span>환불접수가 정상적으로 완료되었습니다.</span><br>
            			<p>접수이후 5일이내에 처리될 예정입니다.</p>
            			<p>빠른시일내에 처리될 수 있도록 최선을 다하겠습니다.</p>
            			<p>다른 문의 사항이 있으시면 아래의 메일로 문의를 보내주시면 감사하겠습니다.</p>
            			<p>lifemenu@gmail.com</p>
            		</div>
            		<div class="homeBtn">
            			<a href="/LifeMenu/seller/list">홈으로</a>
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