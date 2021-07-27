<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/findView.css" rel="stylesheet" type="text/css">
<title>ID/PW 찾기</title>

<!--  jQuery Framework 참조하기 -->
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>

<!-- 사용자 스크립트 블록 -->
<script>
$(function() {
	//$('.pwArea').hide();	//맨첨에 비밀번호 찾기 박스 숨기기
	
	//$('#1stFindId').click(function(){	//위쪽의 아이디 찾기 누르면..
	//	$('.idArea').show();
	//	$('.pwArea').hide();
		
	//});
	
	//$('#1stFindPw').click(function(){	//위쪽의 비밀번호 찾기 누르면..
	//	$('.pwArea').show();
	//	$('.idArea').hide();
	//	$(".infindIdRlnm").val('');
	//	$(".infindIdEmail").val('');
	//});	
});

$(function findIdBefore(){ //아이디찾기 전 허가 받기

	$("#findIdBtn").click(function(){
		var Idrlnm_value =  $(".infindIdRlnm").val();
		var Idemail_value =  $(".infindIdEmail").val();
		
		if (!Idrlnm_value || !Idemail_value) {
			alert("아이디를 찾기 위한 모든정보를 입력해야합니다.");
			return false;
		}
		
	});

});

$(function findPwBefore() {//비번 찾기 전 허가 받기
	$('#findPwBtn').click(function() { //밑의 비밀번호 찾기 누르면..
		var Pwrlnm_value =  $(".infindPwId").val();
		var Pwemail_value =  $(".infindPwEmail").val();
		
		if (!Pwrlnm_value || !Pwemail_value) {
			alert("비밀번호를 찾기 위한 모든정보를 입력해야합니다.");
			return false;
		}
	});

});
</script>
</head>
<body>
<div id="frameOut">
    <div id="frameIn">
        <div class="sub_logo">
        	<a href="loginMain.do"><img src="resources/img/logoB.png"  class="mlogo" alt="로그인화면으로 이동"></a> 
        </div>
        <header id="header"></header>
        <div id="content">
	        <div id="content_container">
			        		<div class="idArea">
			        			<div class="findTitle">아이디 찾기</div>
						        <form method="post" action="findId.do" onsubmit="return findIdBefore()">
						        	<table class="findTable">		
						        	 	<tr>
						        	 		<td id="title">이름</td>
						        	 		<td>
						        	 			<input type="text" class="infindIdRlnm" name="mberRlnm" value="" placeholder="이름 입력" style="width:210px;height:24px;font-size:15px;">	
						        	 		</td>
						        	 	</tr>
						        	 	<tr>
						        	 		<td id="title">이메일</td>
						        	 		<td>
						        	 			<input type="text" class="infindIdEmail" name="mberEmail" value="" placeholder="이메일 입력" style="width:210px;height:24px;font-size:15px;">	
						        	 		</td>
						        	 	</tr>				        	 					   
						        	</table>
						        	<br>	
						       		<input type="submit" class="btn" id="findIdBtn" value ="아이디 찾기">
						        </form>
						        	<br>
						        	<div class="idMsg">
						       		<font size="4em" color="red"><b>${ERRMSG}</b></font><b>${MSG1}</b><font size="10em" color="red"><b>${DATA}</b></font><b>${MSG2 }</b>
						       		</div>
			        		</div>
			        		<div class="sen"></div>
							<div class="pwArea">
								<div class="findTitle">비밀번호 찾기</div>
						        <form method="post" action="findPw.do" onsubmit="return findPw()">
						        	<table class="findTable">
						        		<tr>
						        			<td id="title">아이디</td>
						        			<td>
												<input type="text" class="infindPwId"	name="mberId" placeholder="아이디 입력"  style="width:210px;height:24px;font-size:15px;" ><br>
						        			</td>
						        		</tr>
						        		<tr>
						        	 		<td id="title">이메일</td>
						        	 		<td>
						        	 			<input type="text" class="infindPwEmail" name="mberEmail" placeholder="이메일 입력" style="width:210px;height:24px;font-size:15px;"><br>	
						        	 		</td>
						        	 	</tr>	 					   
						        	</table>
						        	<br>
						       		<input type="submit" class="btn" id="findPwBtn" value="비밀번호 찾기">
						        </form>
						        <br> 
						        <div class="pwMsg"><font size="4em" color="red"><b>${PWMSG}</b></font></div>
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