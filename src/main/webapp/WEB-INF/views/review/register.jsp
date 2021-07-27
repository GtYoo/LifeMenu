<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 등록</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="${path}/resources/css/review/register.css" rel="stylesheet" type="text/css">
<script>
	function checkCn() {
		let reviewCn = $("#reviewCn").val();
		
		if(reviewCn.length > 30) {
			alert("리뷰는 최대 30자를 초과 할 수 없습니다.")
			return false;
		}
	}
</script>
</head>
<body>
	<h3><span id="ncnm">${ selerNcnm }</span> 님과의 식사는 어떠셨나요?<br>
	리뷰를 남겨주세요!</h3>
	<form method="post" id="reviewRegister" name="reviewRegister"
	onsubmit="return checkCn();" action="/LifeMenu/review/register">
	<input type="hidden" name="setleCode" value="${ setleCode }">
	<input type="hidden" name="mberCode" value="${ mberCode }">
	<textarea id="reviewCn" name="reviewCn"></textarea>
	<input type="submit" value="등록" id="register">
	</form>
</body>
</html>