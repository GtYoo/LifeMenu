<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/common.css" rel="stylesheet"	type="text/css">
<link href="${path}/resources/css/updateMberAcountNoView.css" rel="stylesheet"	type="text/css">
	<!--  jQuery Framework 참조하기 -->
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<title>출금계좌 등록</title>


<!-- 사용자 스크립트 블록 -->
<script>

$(function number(){ //숫자만 입력가능.

    $("#mberAcountNo").keyup(function (event) {

         regexp = /[^0-9]/gi;

         v = $(this).val();

         if (regexp.test(v)) {

             alert("숫자만 입력가능 합니다.");

             $(this).val(v.replace(regexp, ''));
         }
     });
});

$(function updateMberAcountNo(){

	$("#mberAcountNoBtn").click(function(){
		var value = $("input[name='mberAcountNo']").val();	
		if(!value){
			alert('등록할 계좌번호를 입력해주세요.');
			return false;
		}
		else{
			alert("계좌번호가 등록되었습니다.");
		}
	});
});

</script>
</head>
<body>
	<div id="frameOut">
		<div id="frameIn">
			<div class="sub_logo"><a href="/LifeMenu/seller/list"><img src="resources/img/logoB.png"	class="mlogo" alt="로그인화면으로 이동"></a></div>
			<header id="header">
				<jsp:include page="${request.contextPath}/header"></jsp:include>
			</header>
			<div id="content">
				<div class="content_container">
					<div class="line_menu">
						 <div class="mberAcountNoUpdateHeader">
				   		 	<div class="wh-1">
								<h2 align="left">입금</h2>
							</div>
							<div class="wh-2">
								<h3>보유코인 ${COIN } 개</h3>
							</div>
				  		</div>
								<div class="mberAcountNoUpdateBox">
									<form action="mberAcountNoUpdate.do" method="post" onsubmit="return updateMberAcountNo()">
										<div class="msg">
										<font size="5em"><b>이런~ 계좌번호가 등록되어있지 않네요...</b></font>
										</div>
										<br>
										<input type="text" id="mberAcountNo" name="mberAcountNo" placeholder="출금계좌번호를 '-' 빼고 입력하세요." maxlength="15" style="width:320px;height:44px;font-size:20px;">
										<input type="submit" id="mberAcountNoBtn" class="btn" name="mberAcountNoBtn" value="등록">
									</form>
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