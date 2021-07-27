<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ver.1.0.0 -->

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/img/logoD.png" rel="shortcut icon" type="image/x-icon">
<link href="${path}/resources/css/common.css?ver=1" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin/admin.css?ver=2" rel="stylesheet" type="text/css">

<title>Lifemenu~administrator</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function{
	$("#histMngr").click(function(){
		$("input[name='cnt']").val("5");
	});
});
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
		    <form method="POST">
		        <div id="content_container">
		            <div class="line_menu">
		               	<span class="menu"><input type="submit" class="link" value="회원관리" formaction="mberMngrCondition.do"></span>
		               	<span class="menu"><input type="submit" class="link" value="관리자문의" formaction="mngrInqryCondition.do"></span>
		               	<span class="menu"><input type="submit" class="link" value="공지사항 관리" formaction="noticeMngrCondition.do"></span>
		               	<span class="menu"><input type="submit" class="link" value="자유게시판 관리" formaction="bbsMngrCondition.do"></span>
		           	</div>
			        <div class="line_menu">
			           <span class="menu"><input type="submit" class="link" value="태그 관리" formaction="tagMngrCondition.do"></span>
			           <span class="menu"><input type="submit" class="link" value="환불 관리" formaction="excclcMngrCondition.do"></span>
			           <span class="menu"><input type="submit" class="link" value="식사권 관리" formaction="vochrMngrCondition.do"></span>
			           <span class="menu"><input type="submit" class="link" value="히스토리 관리" formaction="histMngrCondition.do" id="histMngr"></span>
			       </div>
		        </div>
		        <div>
		            <input type="hidden" name="start" value="1">
		            <input type="hidden" name="cnt" value="8">
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