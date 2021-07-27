<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식사권 목록</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<script type="text/javascript" src="${path}/resources/js/voucher/list.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/voucher/list.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="frameOut">
		<div id="frameIn">
			<div class="sub_logo">
				<a href="/LifeMenu/seller/list">
				<img src="${path}/resources/img/logoB.png" class="mlogo" alt=""></a>
			</div>
			<header id="header">
				<jsp:include page="${request.contextPath}/header"></jsp:include>
			</header>
			<div id="content">
				<div id="content_container">
					<table id="vochr_container">
						<c:if test="${fn:length(vochrList) == 0}">
								현재 예약 가능한 식사권이 없습니다.
						</c:if>
						<c:forEach var="voucher" items="${ vochrList }" varStatus="voucherStatus">
							<c:if test="${voucherStatus.count == 1}">
								<tr>
							</c:if>
							<td>
								<table class="vochr_box" id="vochr${ voucher.vochrCode }">
									<tr>
										<td>
											<input type="hidden" class="voucherCode"value="${ voucher.vochrCode }">
											<input type="hidden"class="mberCode" value="${ voucher.mberCode }">
											<span class="subtitle">식사 예정 일시</span>
										</td>
									</tr>
									<tr>
										<td>
											<div class="date">${fn:substring(voucher.mealPrearngeDt,0,4)}/${fn:substring(voucher.mealPrearngeDt,4,6)}/${fn:substring(voucher.mealPrearngeDt,6,8)} ${fn:substring(voucher.mealPrearngeDt,8,10)}:${fn:substring(voucher.mealPrearngeDt,10,12)}</div>
										</td>
									</tr>
									<tr>
										<td>
											<span class="subtitle">식사 소요 시간</span>
										</td>
									</tr>
									<tr>
										<td>
											<div class="time">${ voucher.mealTime }시간</div>
										</td>
									</tr>
									<tr>
										<td>
											<span class="subtitle">가격</span>
										</td>
									</tr>
									<tr>
										<td>
											<div class="price">${ voucher.vochrPrice }<span class="money"><i class="far fa-copyright"></i></span></div>
										</td>
									</tr>
								</table>
							</td>
							<c:if test="${ (voucherStatus.count % 5) == 0}">
								<tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<input type="button" value="예약하기" id="reserve_btn">
			</div>
			<footer id="footer">
			<jsp:include page="${request.contextPath}/footer"></jsp:include>
		</footer>
		</div>
	</div>
</body>
</html>