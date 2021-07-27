<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ver.1.0.1 -->

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin/admin-detail-ver.1.0.1.css" rel="stylesheet" type="text/css">
<title>Lifemenu~administrator</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(function(){
	
	$("#updateBtn").hide();
	$("#cancelBtn").hide();
	$("#modifyBtn").click(function(){
		$("#updateBtn").show();
		$("#cancelBtn").show();
		$("#modifyBtn").hide();
		$("#deleteBtn").hide();
		$("input[name='bbscttSj']").attr("readonly", false);
		$("textarea[name='bbscttCn']").attr("readonly", false);
	});
	$("#cancelBtn").click(function(){
		$("#modifyBtn").show();
		$("#deleteBtn").show();
		$("#updateBtn").hide();
		$("#cancelBtn").hide();
		$("input[name='bbscttSj']").attr("readonly", true);
		$("textarea[name='bbscttCn']").attr("readonly", true);
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
	            <div class="box-wrap">
	            	<div class="title box">
	            		<h2>공지사항 상세</h2>
	            	</div>
	          		<div class="bbs box">
	          		    <div class="info_box">
	          		        <span class="col">공지사항 번호</span>
	          		        <span class="col-bbsctt-data">${NOTICE.bbscttNo}</span>
	          		        <span class="col">등록일시</span>
	          		        <span class="col-bbsctt-data">${NOTICE.bbscttDt}</span>
	          		        <span class="col">작성자</span>
	          		        <span class="col-bbsctt-data">${NOTICE.mberCode}</span>
	          		    </div>
	          		    <div class="info_box">
	          		        <span class="col">제목</span>
	          		        <span class="col-bbscttSj-data"><input type="text" name="bbscttSj" value="${NOTICE.bbscttSj}" readonly></span>
	          		    </div>
	            	</div>
	            	<div class="text-content box">
	            		<textarea name="bbscttCn" readonly>${NOTICE.bbscttCn}</textarea>
	            	</div>
	            	<div class="button-group box">
	            	    <input id="modifyBtn" type="button" value="수정" />
	            		<input id="updateBtn" type="submit" value="수정확인" formaction="updateNotice.do">
	            		<input id="deleteBtn" type="submit" value="삭제" formaction="deleteNotice.do">
	            		<input id="cancelBtn" type="reset" value="취소">
	            		
	            		<input type="hidden" name="bbscttNo" value="${NOTICE.bbscttNo}">
	            		<input type="hidden" name="start" value="${START}">
	            		<input type="hidden" name="cnt" value="${CNT}">
	            		
	            		<input type="submit" value="돌아가기" formaction="noticeMngrCondition.do">
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