<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/transactionList.css?v=3" rel="stylesheet" type="text/css">
<!--  jQuery Framework 참조하기 -->
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<script src="https://kit.fontawesome.com/9691fcfe8c.js"></script>
<title>거래목록</title>
<script>
function atConfirm(){
	if(confirm("구매확정을 하시겠습니까?")){
		alert("구매확정 완료");
	}
	else{
		return false;
	}
}

$(document).ready(function(){
    $(".tb-2").hide();
    $(".sellList").click(function(){
    	$(".tb-1").hide();
    	$(".tb-2").show();
    });
    
    $(".buyList").click(function(){
    	$(".tb-2").hide();
    	$(".tb-1").show();
    });
    
    $('.review').click(function() {
    	let url = "/LifeMenu/review/show/" + $(this).find('input[id="setleCode"]').val();
    	let name = "review popup";
    	let option = "width=450, height=400, top=200, left=720, locations=no, scrollbars=no, toolbars=no, status=no";
    	window.open(url, name, option);
    })
});
</script>
</head>
<body>
<div id="frameOut">
    <div id="frameIn">
        <div class="sub_logo">
        	<!----> <a href="/LifeMenu/seller/list"><img src="${path}/resources/img/logoB.png"  class="mlogo" alt="로그인화면으로 이동"></a> 

        </div>
        <header id="header">
        	<jsp:include page="${request.contextPath}/header"></jsp:include>
        </header>
        <div id="content">
        	<div class="content_container">
        		<div class="line_menu">
        			<div class="resveHeader">
        				<div class="walletHistoryTitle">
        					<h2>${dto.mberNcnm}님의 거래목록</h2>
        				</div>
        			</div>
        			<div class="listBtn">
        				<span><i class="fas fa-lightbulb"></i>판매목록 / 구매목록 버튼을 통해 거래목록을 살펴보세요!</span>
        				<input type="button" class="sellList" value="판매목록">
        				<input type="button" class="buyList" value="구매목록">
        			</div>
        			<div class="transactionTable">      	  
        			<table class="tb-1">
        				<tr class="tr-1">
        					<td id="title">번호</td>
        					<td id="title">결제코드</td>
        					<td id="title">판매자이름</td>
        					<td id="title">식사권</td>
        					<td id="title">식사일</td>
        					<td id="title">결제가격</td>
        					<td id="title">비고</td>
        				</tr>
						<c:forEach var="t" items="${T_LIST}" varStatus="tStatus">
						<input id="setleCode" type="hidden" value="${t.setleCode}">
						<tr>
							<td>${ tStatus.count }</td>
							<td>${t.setleCode}</td>
							<td class="txta-3">${t.selerMberRlnm}</td>
							<td class="txta-1">${t.selerAprsm}</td>
							<fmt:parseDate var="dateString" value="${t.mealPrearngeDt}" pattern="yyyyMMddHHmm" />
							<td><fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm" /></td>
							<td class="txta-2">${t.setlePc}코인</td>
							<td class="txta-4">
							<c:set var="pdAT" value="${t.purchsDcsnAt}"/>
							<c:set var="rfAT" value="${t.refndReqstAt}"/>
							<c:choose>
								<c:when test="${pdAT eq 'Y'.charAt(0)}">
									<span>구매확정완료</span> / <a class="review" href="#"><input type="hidden" id="setleCode" value="${t.setleCode}"><span>리뷰</span></a>
								</c:when>
								<c:when test="${rfAT eq 'Y'.charAt(0)}">
									<span>환불신청완료</span>
								</c:when>
								<c:when test="${pdAT eq 'N'.charAt(0)||rfAT eq 'N'.charAt(0)}">
									<a href="/LifeMenu/Setle/puDcAt?SETLE_CODE=${t.setleCode}" 
											onclick="atConfirm()">
									<span>구매확정</span>
									</a> / 
									<a href="/LifeMenu/Refnd/refndForm?SETLE_CODE=${t.setleCode}">
									<span>환불</span> 
									</a>
								</c:when>
							</c:choose>
							</td>
						</tr>
						</c:forEach>
        			</table>
        			<table class="tb-2">
        				<tr class="tr-1">
        					<td id="title">번호</td>
        					<td id="title">결제코드</td>
        					<td id="title">구매자이름</td>
        					<td id="title">식사권</td>
        					<td id="title">식사일</td>
        					<td id="title">결제가격</td>
        					<td id="title">비고</td>
        				</tr>
						<c:forEach var="s" items="${SELL_LIST}" varStatus="sStatus">
						<tr>
							<td>${sStatus.count}</td>
							<td>${s.resveCode}</td>
							<td>${s.buyMberRlnm}</td>
							<td class="txta-1">${s.selerAprsm}</td>
							<td>${s.mealPrearngeDt}</td>
							<td class="txta-2">${s.setlePc}코인</td>
							<td>
							<c:set var="pdAT" value="${s.purchsDcsnAt}"/>
							<c:choose>
								<c:when test="${pdAT eq 'Y'.charAt(0)}">
									<span>판매완료</span>
								</c:when>
							</c:choose>
							</td>
						</tr>
						</c:forEach>
        			</table>
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