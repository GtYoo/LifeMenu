<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ver.1.0.2. -->

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/img/logoD.png" rel="shortcut icon" type="image/x-icon">
<link href="${path}/resources/css/common.css?ver=1" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin/admin-detail-ver.1.0.1.css?ver=1" rel="stylesheet" type="text/css">
<title>Lifemenu~administrator</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	var start 	= "<c:out value='${START}'/>";
	var cnt 	= "<c:out value='${CNT}'/>";
	console.log("start = "+start);
	console.log("cnt = " + cnt);
	
	$("#updateBtn").hide();
	
	$('#updateFormBtn').click(function(){
		$("#updateBtn").show();
		$("#updateFormBtn").hide();
		$("input").each(function(index, element){
			$(this).removeAttr("readonly");
		});
	});
	
	$("#updateBtn").click(function(){
		$("#updateFormBtn").show();
		$("#updateBtn").hide();
		$("input").each(function(index, element){
			$(this).removeAttr("readonly");
		});
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
	            		<div><h3>회원 상세</h3></div>
	            	</div>
	            	<div class="content box">
	            	    <div class="mber box">
		          		    <div class="info_title"><h4>회원정보</h4><span> &nbsp;member information </span></div>
		            	    <div class="info_box">
		            	        <span class="col">회원코드</span>
		            	        <span class="col-mber-data">${MBER.mberCode}</span>
		            	        <span class="col">아이디</span>
		            	        <span class="col-mber-data"><input name="mberId" type="text" value="${MBER.mberId}" readonly /></span>
		            	    </div>
		            	    <div class="info_box">
		            	        <span class="col">비밀번호</span>
		            	        <span class="col-mber-data"><input name="mberPw" type="text" value="${MBER.mberPw}" readonly /></span>
		            	        <span class="col">닉네임</span>
		            	        <span class="col-mber-data"><input name="mberNcnm" type="text" value="${MBER.mberNcnm}" readonly /></span>
		            	    </div>
		            	    <div class="info_box">
		            	        <span class="col">실명</span>
		            	        <span class="col-mber-data"><input name="mberRlnm" type="text" value="${MBER.mberRlnm}" readonly /></span>
		            	        <span class="col">이메일</span>
		            	        <span class="col-mber-data"><input name="mberEmail" type="text" value="${MBER.mberEmail}" readonly /></span>
		            	    </div>
		            	    <div class="info_box">
		            	        <span class="col">은행코드</span>
		            	        <span class="col-mber-data"><input name="bankCode" type="text" value="${MBER.bankCode}" readonly /></span>
		            	        <span class="col">계좌번호</span>
		            	        <span class="col-mber-data"><input name="mberAcountNo" type="text" value="${MBER.mberAcountNo}" readonly /></span>
		            	    </div>
		            	    <div class="info_box">
		            	        <span class="col">전화번호</span>
		            	        <span class="col-mber-data"><input name="mberTel" type="text" value="${MBER.mberTel}" readonly /></span>
		            	        <span class="col">생년월일</span>
		            	        <span class="col-mber-data"><input name="mberBrthdy" type="text" value="${MBER.mberBrthdy}" readonly /></span>
		            	    </div>
		            	    <div class="info_box">
		            	        <span class="col">권한레벨</span>
		            	        <span class="col-mber-data"><input name="mberAuthorLevel" type="text" value="${MBER.mberAuthorLevel}" readonly /></span>
		            	        <span class="col">가입일</span>
		            	        <span class="col-mber-data"><input name="srbde" type="text" value="${MBER.srbde}" readonly /></span>
		            	    </div>
		            	    <div class="info_box">
		            	        <span class="col">탈퇴여부</span>
		            	        <span class="col-mber-data"><input name="mberSecsnAt" type="text" value="${MBER.mberSecsnAt}" readonly /></span>
		            	    </div>
		            	</div>
		            	<c:if test="${MBER.mberAuthorLevel == 2}">
		            	    <div class="seler box">
		            	        <div class="info_title"><h4>판매자정보</h4><span> &nbsp;member information </span></div>
		            	        <div class="info_box">
		            	            <span class="col">판매자코드</span>
		            	            <span class="col-seler-data">${SELER.mberCode}</span>
		            	        </div>
		            	        <div class="info_box">
		            	            <span class="col">자기소개</span>
		            	            <span class="col-seler-data"><input id="selerSelfIntrcn" type="text" value="${SELER.selerSelfIntrcn}" readonly /></span>
		            	        </div>
		            	        <div class="info_box">
		            	            <span class="col">경력사항</span>
		            	            <span class="col-seler-data"><input id="selerCareer" type="text" value="${SELER.selerCareer}" readonly /></span>
		            	        </div>
		            	        <div class="info_box">
		            	            <span class="col">학력사항</span>
		            	            <span class="col-seler-data"><input id="selerAcdmcr" type="text" value="${SELER.selerAcdmcr}" readonly /></span>
		            	        </div>
		            	        <div class="info_box">
		            	            <span class="col">명언</span>
		            	            <span class="col-seler-data"><input id="selerAprsm" type="text" value="${SELER.selerAprsm}" readonly /></span>
		            	        </div>
		            	        <div class="info_box">
		            	            <span class="col">거주지역</span>
		            	            <span class="col-seler-data"><input id="selerResdnc" type="text" value="${SELER.selerResdnc}" readonly /></span>
		            	        </div>
		            	        <div class="info_box">
		            	            <span class="col">직업</span>
		            	            <span class="col-seler-data"><input id="selerOccp" type="text" value="${SELER.selerOccp}" readonly /></span>
		            	        </div>
		            	        <div class="info_box">
		            	            <span class="col-title">연령</span>
		            	            <span class="col-seler-data"><input id="selerAge" type="text" value="${SELER.selerAge}" readonly /></span>
		            	        </div>
		            	    </div>
		            	</c:if>
		            	<div class="button-group box">
		            		<input id="updateFormBtn" type="button" value="수정">
		            		<input id="updateBtn" type="submit" value="수정확인" formaction="updateMberMngr.do">
		            		<input class="submitBtn" type="submit" value="탈퇴" formaction="deleteMberMngr.do">
		            		<input class="cancelBtn" type="submit" value="돌아가기" formaction="mberMngrCondition.do">
		            		
		            		<input type="hidden" name="mberCode" value="${MBER.mberCode}">
		            		<input type="hidden" name="start" value="${START}">
		            		<input type="hidden" name="cnt" value="${CNT}">
		            	</div>
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