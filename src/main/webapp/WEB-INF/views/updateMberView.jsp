<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css?ver=1" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/updateMberView.css" rel="stylesheet" type="text/css">
<!--  jQuery Framework 참조하기 -->
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<title>회원가입</title>

<script>

$(function (){//이페이지 첨 들어왔을때
	$("input[name=passwardOK]").val('y'); //첨 들어오면 비밀번호 합격 기본으로 y
	
	$('#checkmberNcnm').hide();	//닉네임 중복확인 숨기기
	$('#checkmberEmail').hide();//이메일 중복확인 숨기기
	
	var mberNcnm = "<c:out value='${dto.mberNcnm}'/>";	//mber 원래닉네임
	var pageNcnm = $("input[name='mberNcnm']").val();	//현재 페이지 닉네임
	var mberEmail = "<c:out value='${dto.mberEmail}'/>";//mber 원래이메일
	var pageEmail = $("input[name='mberEmail']").val();	//현재 페이지 닉네임
	
	 $('#mberNcnm').blur(function () {
		 pageNcnm = $("input[name='mberNcnm']").val();
		 if(mberNcnm != pageNcnm){
			 $('#checkmberNcnm').show();
			 $("input[name=checked_mberNcnm]").val('');
			}
		 else{
			 $('#checkmberNcnm').hide();
		 }
	 });
	
	 $("input[name='mberEmail']").blur(function () {
		 
		 pageEmail = $("input[name='mberEmail']").val();
		 if(mberEmail != pageEmail){
				$('#checkmberEmail').show();
				$("input[name=checked_mberEmail]").val('');
			}
		 else{
			 $('#checkmberEmail').hide();
		 }
	 });
});



$(function number(){ //숫자만 입력가능. - 전화번호

       $("#mberTel").keyup(function (event) {

            regexp = /[^0-9]/gi;

            v = $(this).val();

            if (regexp.test(v)) {

                alert("숫자만 입력가능 합니다.");

                $(this).val(v.replace(regexp, ''));

            }

        });

});

$(function korean(){//한글만 입력가능. - 이름

       $("#mberRlnm").keyup(function (event) {

            regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;

            v = $(this).val();

            if (regexp.test(v)) {

                alert("한글만 입력가능 합니다.");

                $(this).val(v.replace(regexp, ''));

            }
       });
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
				$("input[name=passwardOK]").val('');
				} 
			} 
		}); 
	});

$(function ncnmcheck(){
	
	$("#checkmberNcnm").click(function(){
		
		var ncnm_value = $("input[name='mberNcnm']").val();	//닉네임 중복 체크
		
		if(!ncnm_value){
			alert('닉네임을 입력해주세요.');
			return false;
		}
		
		var url = "ncnmCheck.do?t=" + Math.random(); 
		$.getJSON(url, {
			"ncnm" : ncnm_value
		}, function(json){
			var result_text = json.result;
			var result = eval(result_text);
			
			if(result){
				$("#mberNcnmConsole").html("<span style='color:#199894b3'>사용할 수 있는 닉네임입니다.</span>");
				$("input[name=checked_mberNcnm]").val('y');
			}else{
				$("#mberNcnmConsole").html("<span style='color:#f82a2aa3'>중복된  닉네임입니다.</span>");
			}
		});
		return false;
	});
});

$(function emailCheck() {		//이메일 체크
	var originalEmail = "<c:out value='${dto.mberEmail}'/>";
	
	$("#mberEmail").blur(function(){//올바른 형식의 이메일인지

	var mberEmail = document.getElementById("mberEmail").value;

	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if(exptext.test(mberEmail)==false){

		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

		alert("올바른 이메일 형식이 아닙니다.");
		
		$("#mberEmail").val(originalEmail);	//원래 이메일로 바꾸기

		$('#checkmberEmail').hide();
		
		document.addjoin.mberEmail.focus();

		return false;

		}
	});

	$("#checkmberEmail").click(function(){	// 이메일 중복 체크
			
			var email_value = $("input[name='mberEmail']").val();
			
			if(!email_value){
				alert('이메일을 입력해주세요.');
				return false;
			}
			
			var url = "emailCheck.do?t=" + Math.random(); 
			$.getJSON(url, {
				"email" : email_value
			}, function(json){
				var result_text = json.result;
				var result = eval(result_text);
				
				if(result){
					$("#mberEmailConsole").html("<span style='color:#199894b3'>사용할 수 있는 이메일입니다.</span>");
					$("input[name=checked_mberEmail]").val('y');	//체크이메일 벨류 y로 바꾸기
				}else{
					$("#mberEmailConsole").html("<span style='color:#f82a2aa3'>중복된  이메일입니다.</span>");
				}
			});
			return false;
		});
	

});

$(function updateBtn(){
	
	$("#updateBtn").click(function(){
		
		var pw_value = $("input[name='mberPw']").val(); // 비밀번호
		var pwConfirm_value = $("input[name='mberPwConfirm']").val(); // 비밀번호 확인
		var rlnm_value = $("input[name='mberRlnm']").val();	//이름 
		var ncnm_value = $("input[name='mberNcnm']").val(); // 닉네임
		var email_value = $("input[name='mberEmail']").val(); // 이메일
		var tel_value = $("input[name='mberTel']").val(); // 전화번호

		
		if(!pw_value){// 입력여부 검사 - 비밀번호
			alert("비밀번호를 입력하세요.");
			$("input[name='mberPw']").focus();
			return false;
		}
		
		if(!pwConfirm_value){// 입력여부 검사 - 비밀번호 확인
			alert("비밀번호확인을 입력하세요.");
			$("input[name='mberPwConfirm']").focus();
			return false;
		}
		
		
		if(!rlnm_value){// 입력여부 검사 - 이름
			$('#mberRlnmConsole').html("<span style='color:#f82a2aa3'>필수정보 입니다.</span>");
			$("input[name='mberRlnm']").focus();
			return false;
		}
		
		if(!ncnm_value){// 입력여부 검사 - 닉네임
			$('#mberNcnmConsole').html("<span style='color:#f82a2aa3'>필수정보 입니다.</span>");
			$("input[name='mberNcnm']").focus();
			return false;
		}
		
		if(!email_value){// 입력여부 검사 - 이메일
			$('#mberEmailConsole').html("<span style='color:#f82a2aa3'>필수정보 입니다.</span>");
			$("input[name='mberEmail']").focus();
			return false;
		}

		if($("input[name='passwardOK']").val()==''){	//가입하기 버튼 눌렀을때 비밀번호 합격여부
	        alert('비밀번호를 확인하세요.');
	        $("input[name='mberPw']").focus();
	        return false;
	    }
		
		if($("input[name='checked_mberNcnm']").val()==''){	//가입하기 버튼 눌렀을때 닉네임중복 확인 했는지 물어보는 것
	        alert('닉네임중복 확인을 해주세요.');
	        $("input[name='mberNcnm']").focus();
	        return false;
	    }
		
		if($("input[name='checked_mberEmail']").val()==''){	//가입하기 버튼 눌렀을때 이메일중복 확인 했는지 물어보는 것
	        alert('이메일중복 확인을 해주세요.');
	        $("input[name='mberEmail']").focus();
	        return false;
	    }
		
		alert('회원정보가 수정되었습니다.');
	});
	
	
});

</script>
</head>
<body>
<div id="frameOut">
    <div id="frameIn">
        <div class="sub_logo">
        	<a href="/LifeMenu/seller/list"><img src="resources/img/logoB.png"  class="mlogo" alt="로그인화면으로 이동"></a> 
        </div>
        <header id="header">
				<jsp:include page="${request.contextPath}/header"></jsp:include>
		</header>
        <div id="content">
	        <div id="content_container">
			        <form method="post" action="update.do" onsubmit="return updateBtn()">
			        	<table>
			        		<tr>
			        			<td id="title"><font color="gray">아이디(수정불가)</font></td>
			        			<td>
									<input type="text" id="mberId"	name="mberId"  maxlength="12"  value="${dto.mberId}"  style="width:190px;height:24px;font-size:15px; color:gray" readonly>  
									
			        			</td>
			        		</tr>
			        		<tr>     		
			        			<td id="title"><font color="red">*</font>비밀번호</td>
			        			<td>
			        				<input type="password" id="mberPw" class="mberPwZone"name="mberPw" maxlength="12" value="${dto.mberPw }" style="width:190px;height:24px;font-size:15px;">
			        			</td>		
			        		</tr>     		
			        		<tr>
			        			<td id="title"><font color="red">*</font>비밀번호 확인</td>
			        			<td id="title">
			        				<input type="password" id="mberPwConfirm" class="mberPwZone" name="mberPwConfirm" maxlength="12" value="${dto.mberPw }" style="width:190px;height:24px;font-size:15px;"> 
			        			</td>
			        			<td>
			        				<div class="alert alert-success" id="alert-success" style="color:#199894b3">비밀번호가 일치합니다.</div>
			        				<div class="alert alert-danger" id="alert-danger" style="color:#f82a2aa3">비밀번호가 일치하지 않습니다.</div><br>
			        			</td>			
			        		</tr>
			        	 	<tr>
			        	 		<td id="title"><font color="red">*</font>이름</td>
			        	 		<td>
			        	 			<input type="text" id = "mberRlnm" name="mberRlnm" maxlength="10" value="${dto.mberRlnm }" style="width:190px;height:24px;font-size:15px;"><br>
			        	 		</td>
			        	 		<td>
			        	 		<div class = "console" id=mberRlnmConsole></div>
			        	 		</td>
			        	 	</tr>
			        	 	<tr>
			        	 		<td id="title"><font color="red">*</font>닉네임</td>
			        	 		<td>
			        	 			<input type="text" id="mberNcnm" name="mberNcnm" maxlength="10" value="${dto.mberNcnm }" style="width:190px;height:24px;font-size:15px;">&nbsp;<button id="checkmberNcnm">중복확인</button><br>
			        			</td>
			        			<td>
			        			<div class = "console" id=mberNcnmConsole></div>
			        			</td>
			        		</tr> 	 	
			        	 	<tr>
			        	 		<td id="title"><font color="red">*</font>이메일</td>
			        	 		<td>
			        	 			<input type="text" id="mberEmail" name="mberEmail" maxlength="50" value="${dto.mberEmail }" style="width:190px;height:24px;font-size:15px;">&nbsp;<button id="checkmberEmail">중복확인</button><br>
			        	 		</td>
			        	 		<td>
			        	 			<div class = "console" id=mberEmailConsole></div>
			        	 		</td>
			        	 	</tr>
			        	 	<tr>
			        	 		<td id="title"><font color="gray">생년월일(수정불가)</font></td>
			        	 		<td>
			        	 			<input type="text" id="mberBrthdy" name="mberBrthdy" value="${dto.mberBrthdy }" style="width:190px;height:24px;font-size:15px; color:gray" readonly>
			        	 		</td>
			        	 	</tr>
			        	 	<tr>
			        	 		<td id="title">전화번호</td>
			        	 		<td>
			        	 			<input type="text"  id="mberTel" name="mberTel" maxlength="11" value="${mberTel }" style="width:190px;height:24px;font-size:15px;">
			        	 		</td>
			        	 		<td>
			        	 			<div class ="console" id="mberTelConsole"></div>
			        	 		</td>	
			        	 	</tr>					   
			        	</table>
			        	<br>
			        	<div class="updateMberBtn">
			        	<input type="submit" class="btn" id="updateBtn" value="수정하기">
			        	<input type="button" class="btn" id="updatePwBtn" name="back" value="취소" onclick="document.location.href='/LifeMenu/seller/list'">
			        	</div>
			        	<input type="hidden" name ="passwardOK" value="" >			<!-- 비밀번호 합격 체크용 -->
			        	<input type="hidden" name ="checked_id" value="" >			<!-- 아이디 중복체크용-->
			        	<input type="hidden" name ="checked_mberNcnm" value="y" >	<!-- 닉네임 중복체크용 //안바꾸면 기본값 y-->
			        	<input type="hidden" name ="checked_mberEmail" value="y" >	<!-- 이메일 중복체크용 //안바꾸면 기본값 y-->
			        	<input type="hidden" name ="mberCode" value="${dto.mberCode}" >				 <!-- 회원코드 -->
			        	<input type="hidden" name ="bankCode" value="${dto.bankCode}" >				 <!-- 은행코드 -->
			        	<input type="hidden" name ="mberAcountNo" value="${dto.mberAcountNo}" >		 <!-- 계좌번호 -->
			        	<input type="hidden" name ="mberAuthorLevel" value="${dto.mberAuthorLevel}" ><!-- 회원권한 레벨 -->
			        	<input type="hidden" name ="srbde" value="${dto.srbde}" >					 <!-- 가입일 -->
			        	<input type="hidden" name ="mberSecsnAt" value="${dto.mberSecsnAt}" >		 <!-- 회원탈퇴 여부 -->
			        </form>
	        </div>
        </div>
        <footer id="footer">
			<jsp:include page="${request.contextPath}/footer"></jsp:include>
        </footer>
    </div>
</div>
</body>
</html>