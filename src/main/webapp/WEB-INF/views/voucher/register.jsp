<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식사권 등록</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${path}/resources/js/voucher/register.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="${path}/resources/css/voucher/register.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="content">
	<form method="get" id="registerFrm" name="register">
		<input type="hidden" name="mberCode" value="${ mberCode }">
		<table>
			<tr>
				<td>가격 : </td><td><input type="number" name="vochrPrice"></td>
			</tr>
			<tr>
				<td>식사 예정 일시 : </td><td><input type="datetime-local" name="mealPrearngeDt" id="datefield"></td>
			</tr>
			<tr>
				<td>식사 소요 시간 : </td><td><input type="number" name="mealTime"></td>
			</tr>
		</table>
		<input id="register" type="button" value="등록">
	</form>
	</div>
</body>
</html>