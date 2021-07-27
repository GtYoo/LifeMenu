<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/common.css" rel="stylesheet"	type="text/css">
<link href="${path}/resources/css/wallet.css" rel="stylesheet"	type="text/css">
<!--  jQuery Framework 참조하기 -->
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<title>지갑</title>

<script>
</script>
</head>
<body>
	<div id="frameOut">
		<div id="frameIn">
			<div class="sub_logo">
				<a href="/LifeMenu/seller/list"><img src="resources/img/logoB.png" class="mlogo" alt="로그인화면으로 이동"></a>
			</div>
			<header id="header">
				<jsp:include page="${request.contextPath}/header"></jsp:include>
			</header>
			<div id="content">
				<div class="content_container">
					<div class="line_menu">
								<div class="walletHeader">
									<div class="wh-1">
										<h2 align="left">${dto.mberNcnm}님의 지갑</h2>
									</div>
									<div class="wh-2">
										<h3>보유코인 ${COIN } 개</h3>
									</div>
								</div>
								<div class=walletListTable>
								<table>
									<tr class="tr-1">
										<td id="title">번호</td>
										<td id="title">일자</td>
										<td id="title">입금/출금 분류</td>
										<td id="title">금액</td>
										<td id="title">비고</td>
									</tr>
									<tr>
									</tr>
									<c:if test="${ not empty LIST }">
									<c:forEach var="walletDtls" items="${LIST}"	varStatus="walletDtlsStatus">
										<tr>
											<td class="tx1">
												${walletDtlsStatus.count}
											</td>
											<td class="tx2">
												<fmt:formatDate value="${walletDtls.rcppayDt}"	pattern="yyyy-MM-dd [E] a hh:mm:ss" />
											</td>
											<td class="tx3">
												<c:if test="${walletDtls.rcppayCl == 'D'}"><font color="red">입금</font></c:if>
												<c:if test="${walletDtls.rcppayCl == 'W'}"><font color="blue">출금</font></c:if>
											</td>
											<td class="tx4">
												${walletDtls.rcppayAmount}원
											</td>
											<td class="tx4">
												${walletDtls.excngCoinCo}코인
											</td>
										</tr>
									</c:forEach>
									</c:if>
								</table>
									<div class="msg">
									<c:if test="${ empty LIST }">
										<b>${walletDtlsMsg }</b>
									</c:if>
									</div>
								</div>
								
								<div class=wallet_btn>
								<input type="button" class="btn" id="depositBtn"value="입금" onclick="document.location.href='depositView'">&nbsp;
									<input type="button" class="btn" id="withdrawBtn" value="출금" onclick="document.location.href='withDrawView'">
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