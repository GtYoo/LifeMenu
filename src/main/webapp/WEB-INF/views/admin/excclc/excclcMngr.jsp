<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css?v=2" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/excclcMngr.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<script>
function atConfirm(){
	if(confirm("환불을 승인하시겠습니까?")){
		alert("환불승인 완료");
	}
	else{
		return false;
	}
}
function atNoConfirm(){
	if(confirm("환불불가처리 하시겠습니까?")){
		alert("환불불가 처리완료");
	}
	else{
		return false;
	}
}
$(document).ready(function(){
	$(".refndAllList").show();
	$(".refndAtList").hide();
	
	$(".allList").click(function(){
		$(".refndAtList").hide();
		$(".refndAllList").show();
	});
	$(".atList").click(function(){
		$(".refndAtList").show();
		$(".refndAllList").hide();
	});
});
</script>
<title>Lifemenu~administrator</title>
<style>
table{
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
}
th, td{
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
}

</style>
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
        	<div class="content_container">
            <div class="box-wrap">
            	<div class="title">
            		환불 관리
            	</div>
            	<div class="refndListBtn">
            		<input class="allList" type="button" value="전체리스트">
            		<input class="atList" type="button" value="환불신청리스트">
            	</div>
            	<div class="list">
            	<table>
            		<tr class="tr-1">
            			<td>번호</td>
            			<td>결제코드</td>
            			<td>결제금액</td>
            			<td>환불일자</td>
            			<td>처리완료여부</td>
            			<td>환불사유</td>
            			<td>처리여부</td>
            		</tr>
            		<c:forEach var="r" items="${REFND_AT_LIST}" varStatus="rStatus">
            		<tr class="refndAtList">
            			<td>${rStatus.count}</td>
            			<td>${r.setleCode}</td>
            			<td>${r.refndPc}코인</td>
            			<td>${r.refndDt}</td>
            			<td>${r.refndAt}</td>
            			<td>${r.refndResn}</td>
            			<td>
            			<c:set var="rfOk" value="${r.refndAt}"/>
            			<c:choose>
            				<c:when test='${rfOk eq "Y"}'>
            					<span>환불승인완료</span>
            				</c:when>
            				<c:when test='${rfOk eq "I"}'>
            					<span>환불불가처리</span>
            				</c:when>
            				<c:when test='${rfOk eq "N"}'>
            					<a href="/LifeMenu/refndOk?SETLE_CODE=${r.setleCode}"
            							onclick="atConfirm()"><span>환불처리</span></a>
            			 		/ 
            					<a href="/LifeMenu/refndNo?SETLE_CODE=${r.setleCode}"
            							onclick="atNoConfirm()"><span>환불불가</span></a>
            				</c:when>
            			</c:choose>
            			</td>
            		</tr>
            		</c:forEach>
            		<c:forEach var="a" items="${REFND_AT_ALL_LIST}" varStatus="aStatus">
            		<tr class="refndAllList">
            			<td>${aStatus.count}</td>
            			<td>${a.setleCode}</td>
            			<td>${a.refndPc}코인</td>
            			<td>${a.refndDt}</td>
            			<td>${a.refndAt}</td>
            			<td>${a.refndResn}</td>
            			<td>
            			<c:set var="rfOk" value="${a.refndAt}"/>
            			<c:choose>
            				<c:when test='${rfOk eq "Y"}'>
            					<span>환불승인완료</span>
            				</c:when>
            				<c:when test='${rfOk eq "I"}'>
            					<span>환불불가처리</span>
            				</c:when>
            				<c:when test='${rfOk eq "N"}'>
            					<a href="/LifeMenu/refndOk?SETLE_CODE=${a.setleCode}"
            							onclick="atConfirm()"><span>환불처리</span></a>
            			 		/ 
            					<a href="/LifeMenu/refndNo?SETLE_CODE=${a.setleCode}"
            							onclick="atNoConfirm()"><span>환불불가</span></a>
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