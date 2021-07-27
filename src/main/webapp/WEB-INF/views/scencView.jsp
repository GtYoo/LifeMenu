<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css?ver=1" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/scencView.css" rel="stylesheet" type="text/css">
<!--  jQuery Framework 참조하기 -->
<script type="text/javascript" src="${path}/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<title>회원탈퇴</title>

<script>

$(function (){//맨첨에 들어왔을 때
	$(".pw_confirm_box").show();	//비밀번호 체크하는 곳 보이기
	$(".confirm_box").hide();		//탈퇴 확인할거냐는 곳 보이기
});

$(function pwCheck(){ 	// 비밀번호 두개가 같은지 체크
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
	
$(function pwCheck(){//비밀번호 체크
	
	$("#pwCheck").click(function(){
		
		var pw_value = $("input[name='mberPw']").val();	//비밀번호
		var pwConfirm_value = $("input[name='mberPwConfirm']").val(); // 비밀번호 확인
		var code_value = "<c:out value='${dto.mberCode}'/>";
		
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
		
		if($("input[name='passwardOK']").val()==''){	//확인 버튼 눌렀을때 비밀번호 합격여부
	        alert('비밀번호를 확인하세요.');
	        $("input[name='mberPw']").focus();
	        return false;
	    }
		
		var url = "pwCheck.do?t=" + Math.random(); 
		$.getJSON(url, {
			"code" : code_value,
			"pw" : pw_value
		}, function(json){
			var result_text = json.result;

			var result = eval(result_text);
			
			
			if(result){//결과값이 트루면 : 비밀번호가 맞다는 말.
				 $(".confirm_box").show();
				 $(".pw_confirm_box").hide();
			}else{
				$(".confirm_box").hide();
				 $(".pw_confirm_box").show();
				 alert("비밀번호가 틀립니다.");
				 $("input[name='mberPw']").val('');
				 $("input[name='mberPwConfirm']").val('');
			}
		});
		return false;
	});
});

$(function scencBtn(){
	
	$("#scencBtn").click(function(){

		var scencConfirm = prompt("정말 회원탈퇴를 원하신다면 입력창에 '회원탈퇴' 라고 입력해주세요.","");
		
		if (scencConfirm =='회원탈퇴')
			{
				alert('회원탈퇴가 완료되었습니다.');
			}
		else{
				alert('회원탈퇴 안하시는거죠?ㅎㅎ');
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
        	<a href="/LifeMenu/seller/list"><img src="resources/img/logoB.png"  class="mlogo" alt="로그인화면으로 이동"></a> 
        </div>
        <header id="header">
				<jsp:include page="${request.contextPath}/header"></jsp:include>
		</header>
        <div id="content">
	        <div class="content_container">
		        <div class="line_menu">
		        	<div class="scencHeader">
				   		 <div class="wh-1">
							<h2 align="left">회원탈퇴</h2>
						</div>
						<div class="wh-2">
							<h3>보유코인 ${WALLET_INFO.coinCo} 개</h3>
						</div>
				  	</div>
						<div class="scencBox">
					        <div class="pw_confirm_box">
						        	<table>
						        		<tr>     		
						        			<td id="title1"><font color="red">*</font>비밀번호</td>
						        			<td>
						        				<input type="password" id="mberPw" class="mberPwZone"name="mberPw" maxlength="12" placeholder="영문/숫자 혼합 12자리 이하" style="width:210px;height:24px;font-size:15px;">
						        			</td>		
						        		</tr>     		
						        		<tr>
						        			<td id="title1"><font color="red">*</font>비밀번호 확인</td>
						        			<td id="title1">
						        				<input type="password" id="mberPwConfirm" class="mberPwZone" name="mberPwConfirm" maxlength="12" placeholder="비밀번호를 한번 더 입력하세요" style="width:210px;height:24px;font-size:15px;"> 
						        			</td>
						        			<td>
						        				<div class="alert alert-success" id="alert-success" style="color:#199894b3">비밀번호가 동일합니다.</div>
						        				<div class="alert alert-danger" id="alert-danger" style="color:#f82a2aa3">위의 비밀번호와 동일하지 않습니다.</div><br>
						        			</td>			
						        		</tr>
						        	</table>
						        	<br>
						        	<br>
						        	<div class="pwConfirmBtn">
						        	<input type="hidden" name ="passwardOK" 	 value="" >		<!-- 비밀번호 합격 -->
						       		<input type="button"  class="btn" id="pwCheck" value="확인">&nbsp;	<input type="button"  class="btn" id="cancel" value="취소" onclick="location.href='scencView'">
									</div>
						        </div>
			        
			        
			         <div class="confirm_box"><!-- 회원탈퇴 아이디, 이름, 이메일, 가입일 보여주는 곳 -->
			        <form method="post" action="updateScenc.do" onsubmit="return scencBtn()">
			        	<table>
			        		<tr>     		
			        			<td id="title"><b>아이디</b></td>
			        			<td>
			        				${dto.mberId }
			        			</td>		
			        		</tr>     		
			        		<tr>
			        			<td id="title"><b>이름</b></td>
			        			<td>
									${dto.mberRlnm }
			        			</td>
			
			        		</tr>
			        		<tr>
			        			<td id="title"><b>이메일</b></td>
			        			<td>
			        				${dto.mberEmail }
			        			</td>
			        		</tr>
			        		<tr>
			        			<td id="title"><b>가입일</b></td>
			        			<td>
			        				${dto.srbde}
			        			</td>
			        		</tr>
			        	</table>
			        	<br>
			        	<div class="scencConfirmBtn">
			        	<font size="3em" color="red"><b>현재  보유코인 ${WALLET_INFO.coinCo} 개 입니다. 계속 진행 하시려면 회원탈퇴를 누르세요.</b></font>
			        	<br>
			        	<br>
			        	<input type="hidden" name ="mberCode" value="${dto.mberCode}" >		 <!-- 회원코드 -->
			       		<input type="submit" class="btn" id="scencBtn" value="회원탈퇴"> <input type="button"  class="btn" id="cancel" value="취소" onclick="location.href='scencView'">
			        	</div>
			        </form>
			        </div>
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