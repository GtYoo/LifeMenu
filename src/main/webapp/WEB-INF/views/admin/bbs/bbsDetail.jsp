<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ver.1.0.0 -->

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin/admin-detail-ver.1.0.1.css" rel="stylesheet" type="text/css">
<title>Lifemenu~administrator</title>
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
            <form action="deleteBbsMngr.do">
	            <div class="box-wrap">
	            	<div class="title box">
	            		<h2>공지글 상세</h2>
	            	</div>
	          		<div class="info box">
	            		<table>
	            			<tr>
	            				<td class="info_title">게시글번호</td>
	            				<td class="info_contents">${BBSCTT.bbscttNo}</td>
	            				<td class="info_title">등록일시</td>
	            				<td class="info_contents">${BBSCTT.bbscttDt}</td>
	            				<td class="info_title">회원코드</td>
	            				<td class="info_contents">${BBSCTT.mberCode}</td>
	            			</tr>
	            			<tr>
	            				<td class="info_title">제목</td>
	            				<td class="info_l_contents" colspan="5">${BBSCTT.bbscttSj}</td>
	            			</tr>
	            		</table>
	            	</div>
	            	<div class="text-content box">
	            		<textarea readonly>${BBSCTT.bbscttCn}</textarea>
	            	</div>
	            	<div class="button-group box">
	            		<input id="deleteBtn" type="submit" value="삭제" formaction="deleteBbsMngr.do">
	            		<input type="hidden" name="bbscttNo" value="${ BBSCTT.bbscttNo }">
	            		<input type="submit" value="돌아가기" formaction="bbsMngrCondition.do">
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