<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css?ver=1" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/findView.css" rel="stylesheet" type="text/css">
<title>ID/PW 찾기</title>

<!--  jQuery Framework 참조하기 -->
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>

<!-- 사용자 스크립트 블록 -->
<script>
$(function findUpdatePwBtn(){
	var data = "<c:out value='${DATA.mberCode}'/>";
	if(data)
		{
		$("input[name=mberCode]").val(data);
		}

});

$(function pwCheck(){ 	// 비밀번호 체크 
	$("#alert-success").hide(); 
	$("#alert-danger").hide(); 
	$(".mberPwZone").keyup(function(){ 
		var pwd1=$("#mberPw").val(); 
		var pwd2=$("#mberPwConfirm").val(); 
		if(pwd1 != "" || pwd2 != ""){ 
			if(pwd1 == pwd2){ 
				$("#alert-success").show(); 
				$("#alert-danger").hide(); 
				$("input[name=passwardOK]").val('y');
			}else{ 
				$("#alert-success").hide(); 
				$("#alert-danger").show(); 
				} 
			} 
		}); 
	});
	
$(function updatePwBtn(){
	
	$("#updatePwBtn").click(function(){

		var pw_value = $("input[name='mberPw']").val(); // 비밀번호
		var pwConfirm_value = $("input[name='mberPwConfirm']").val(); // 비밀번호 확인
		
			
		if(!pw_value){// 입력여부 검사 - 비밀번호
			alert("비밀번호를 입력하세요.");
			$("input[name='mberPw']").focus();
			return false;
		}
		
		if(!pwConfirm_value){// 입력여부 검사 - 비밀번호 확인
			alert("비밀번호를 한번 더  입력하세요.");
			$("input[name='mberPwConfirm']").focus();
			return false;
		}		
		if($("input[name='passwardOK']").val()==''){	//가입하기 버튼 눌렀을때 비밀번호 합격여부
	        alert('비밀번호를 확인하세요.');
	        $("input[name='mberPw']").focus();
	        return false;
	    }

		alert('비밀번호가 변경되었습니다. 다시 로그인하세요.');
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
		        		<div class="updatePwBox">
			        		<form action="findUpdatePw.do" method="post" onsubmit="return updatePwBtn()">
			        		<h3>${DATA.mberRlnm} 님 비밀번호를 재설정 해주세요.</h3>
								<table id=resultViewTable>
									<tr>
										<td>새로운 비밀번호</td>
										<td>
											<input type="password" id="mberPw" class="mberPwZone" name="mberPw" placeholder="비밀번호를 입력하세요." style="width:210px;height:24px;font-size:15px;">
										</td>
									</tr>
									<tr>
										<td>새로운 비밀번호 확인</td>
										<td>
											<input type="password" id="mberPwConfirm" class="mberPwZone" name="mberPwConfirm" placeholder="비밀번호를 한번 더 입력하세요." style="width:210px;height:24px;font-size:15px;"><br>
										</td>
										<td>
											<div class="alert alert-success" id="alert-success" style="color:#199894b3">비밀번호가 일치합니다.</div>
				        					<div class="alert alert-danger" id="alert-danger" style="color:#f82a2aa3">비밀번호가 일치하지 않습니다.</div>
										</td>
									</tr>
								</table>
								<input type="hidden" name="mberCode" value="">
								
								<input type="submit" class="btn" id="updatePwBtn" name="updatePwBtn" value="비밀번호 재설정">
								<input type="button" class="btn" id="updatePwBtn" name="back" value="취소" onclick="document.location.href='findView'">
								<input type="hidden" name ="passwardOK" value="" >		<!-- 비밀번호 합격 -->
							</form>
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