<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/insertMberView.css" rel="stylesheet" type="text/css">
<title>회원가입</title>

<!--  jQuery Framework 참조하기 -->
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>

<!-- 사용자 스크립트 블록 -->
<script>
$(function engnumber(){ //영문숫자만 입력가능. - 아이디

       $("#mberId").keyup(function (event) {

            regexp = /[^a-z0-9]/gi;

            v = $(this).val();

            if (regexp.test(v)) {

                alert("영문,숫자만 입력가능 합니다.");

                $(this).val(v.replace(regexp, ''));

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


	


$(function idCheck(){//아이디 체크
	
	$("#checkid").click(function(){/** id속성이 "checkid"인 요소에 대한 "click"이벤트 정의 */
		
		var id_value = $("input[name='mberId']").val();	//아이디
		
		if(!id_value){
			alert('아이디를 입력해주세요.');
			return false;
		}
		
		var url = "idCheck.do?t=" + Math.random(); //동일한 정보를 또 처리할 가능성이 있기때문에
		$.getJSON(url, {//url 자리 > 컨트롤러 위치
			"id" : id_value// JSON OBJECT 표기법 //키값이 id 고 데이터값은 id_value 에 들어있는 값
		}, function(json){//true 또는 false로 들어있다. ctrl에서왓음
			// 결과가 전달되는 파라미터에 읽어온 데이터가 담겨 있으며,
			// JSON이므로 별도의 추출 과정 없이 점(.)으로 데이터 계층을 연결하여 사용할 수 있다.
			var result_text = json.result; //이구간에 데이터가 넘어왓을땐 문자열 boolean값이 넘어옴
			
			//alert(result_text);
			
			// "true" 혹은 "false"라는 문자열이므로, eval함수를 사용하여 boolean값으로 변경
			var result = eval(result_text);
			
			// 결과 출력
			if(result){//result가 트루면 ~ false니깐 사용할 수 없는 아이디 입니다.
				$("#mberIdConsole").html("<span style='color:#199894b3'>사용할 수 있는 아이디입니다.</span>");
				$("input[name=checked_id]").val('y');
			}else{
				$("#mberIdConsole").html("<span style='color:#f82a2aa3'>중복된  아이디입니다.</span>");
			}
		});
		return false;
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
		
		var ncnm_value = $("input[name='mberNcnm']").val();	//아이디
		
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

	$("#mberEmail").blur(function(){//올바른 형식의 이메일인지

	var mberEmail = document.getElementById("mberEmail").value;

	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if(exptext.test(mberEmail)==false){

		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

		alert("올바른 이메일 형식이 아닙니다.");

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


$(function insertBtn(){
	
	$("#insertBtn").click(function(){
		
		
		var id_value = $("input[name='mberId']").val();	//아이디
		var pw_value = $("input[name='mberPw']").val(); // 비밀번호
		var pwConfirm_value = $("input[name='mberPwConfirm']").val(); // 비밀번호 확인
		var rlnm_value = $("input[name='mberRlnm']").val();	//이름 
		var ncnm_value = $("input[name='mberNcnm']").val(); // 닉네임
		var email_value = $("input[name='mberEmail']").val(); // 이메일
		var year_value = $("input[name='year']").val(); // 생년
		var month_value = $('#month > option:selected').val(); // 생월
		var day_value = $("input[name='day']").val(); // 생일
		var yymmdd = year_value + month_value + day_value;	//yymmdd
		var tel_value = $("input[name='mberTel']").val(); // 전화번호
	
		if(!id_value){// 입력여부 검사 - 아이디
			$("#idConsole").html("<span style='color:#f82a2aa3'>아이디를 입력하세요.</span>");
			$("input[name='mberId']").focus();
			return false;
		}
		
		
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
		
		if(!year_value){// 입력여부 검사 - 생
			$('#birthdayConsole').html("<span style='color:#f82a2aa3'>년은 필수정보 입니다.</span>");
			$("input[name='year']").focus();
			return false;
		}
		
		if(year_value.length <4){	//년 4자리 검사
			$('#birthdayConsole').html("<span style='color:#f82a2aa3'>년은 4자리 입니다.</span>");
			$("input[name='year']").focus();
			return false;
		}
		if(!month_value){// 입력여부 검사 - 월
			$('#birthdayConsole').html("<span style='color:#f82a2aa3'>월은 필수정보 입니다.</span>");
			$("input[name='month']").focus();
			return false;
		}
		if(!day_value){// 입력여부 검사 - 일
			$('#birthdayConsole').html("<span style='color:#f82a2aa3'>일은 필수정보 입니다.</span>");
			$("input[name='day']").focus();
			return false;
		}
		if(day_value.length <2){	// 일 2글자 밑이면 안되게.
			$('#birthdayConsole').html("<span style='color:#f82a2aa3'>일을 정확하게 입력하세요. ex)1일 = 01</span>");
			return false;
		}
		
		if(!(!year_value && !month_value && !day_value)){// 모든 생년월일을 입력하면 콘솔 깨끗해지면서 생년월일 합치기
			$('#birthdayConsole').html("");
			$("input[name=mberBrthdy]").val(yymmdd);
			
		}	
		
		if($("input[name='checked_id']").val()==''){	//가입하기 버튼 눌렀을때 아이디중복 확인 했는지 물어보는 것
	        alert('아이디중복 확인을 해주세요.');
	        $("input[name='mberId']").focus();
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
		
		if($("input[name='checked_mberEmail']").val()==''){	//가입하기 버튼 눌렀을때 닉네임중복 확인 했는지 물어보는 것
	        alert('이메일중복 확인을 해주세요.');
	        $("input[name='mberEmail']").focus();
	        return false;
	    }
		
		alert('회원가입이 완료되었습니다. 다시 로그인하세요.');
	});
	
	
});

$(function resetBtn(){	//초기화 버튼 클릭했을 떄
	
	$("#resetBtn").click(function(){
		$("#mberIdConsole").hide(); //id콘솔 숨기기
		$("#alert-danger").hide();	//비번 콘솔 숨기기
		$("#alert-success").hide(); //비번 콘솔 숨기기
		$("#mberRlnmConsole").hide();	//이름콘솔 숨기기 - 구현안되있음
		$("#mberNcnmConsole").hide(); //닉네임 콘솔 숨기기
		$("#mberEmailConsole").hide(); //이메일 콘솔 숨기기
		$("#birthdayConsole").hide();	//생년월일 콘솔 숨기기
		$("#mberTelConsole").hide();	//전화번호 콘솔 숨기기
		
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
			        <form method="post" action="insert.do" onsubmit="return insertBtn()">
			        	<table>
			        		<tr>
			        			<td id="title"><font color="red">*</font>아이디</td>
			        			<td class="ff">
									<input type="text" id="mberId"	name="mberId"  maxlength="12"  placeholder="영문/숫자 혼합 12자리 이하"  style="width:210px;height:24px;font-size:15px;" >
			        			</td>
			        			<td>
			        				<button id="checkid">중복확인</button>  
			        			</td>
			        			<td>
			        			<div class = "console" id=mberIdConsole></div>  
			        			</td>
			        		</tr>
			        		<tr>     		
			        			<td id="title"><font color="red">*</font>비밀번호</td>
			        			<td class="ff">
			        				<input type="password" id="mberPw" class="mberPwZone"name="mberPw" maxlength="12" placeholder="영문/숫자 혼합 12자리 이하" style="width:210px;height:24px;font-size:15px;">
			        			</td>		
			        		</tr>     		
			        		<tr>
			        			<td id="title"><font color="red">*</font>비밀번호 확인</td>
			        			<td id="title" class="ff">
			        				<input type="password" id="mberPwConfirm" class="mberPwZone" name="mberPwConfirm" maxlength="12" placeholder="비밀번호를 한번 더 입력하세요" style="width:210px;height:24px;font-size:15px;"> 
			        			</td>
			        			<td colspan="2">
			        				<span class="alert alert-success" id="alert-success" style="color:#199894b3">비밀번호가 일치합니다.</span>
			        				<span class="alert alert-danger" id="alert-danger" style="color:#f82a2aa3">비밀번호가 일치하지 않습니다.</span>
			        			</td>			
			        		</tr>
			        	 	<tr>
			        	 		<td id="title"><font color="red">*</font>이름</td>
			        	 		<td class="ff">
			        	 			<input type="text" id = "mberRlnm" name="mberRlnm" maxlength="10" placeholder="한글로 입력하세요." style="width:210px;height:24px;font-size:15px;"><br>
			        	 		</td>
			        	 		<td>
			        	 		<div class = "console" id=mberRlnmConsole></div>
			        	 		</td>
			        	 	</tr>
			        	 	<tr>
			        	 		<td id="title"><font color="red">*</font>닉네임</td>
			        	 		<td class="ff">
			        	 			<input type="text" name="mberNcnm" maxlength="10" placeholder="영어/한글 10자리 이하" style="width:210px;height:24px;font-size:15px;">
			        			</td>
			        			<td>
			        				<button id="checkmberNcnm">중복확인</button>
			        			</td>
			        			<td>
			        			<div class = "console" id=mberNcnmConsole></div>
			        			</td>
			        		</tr> 	 	
			        	 	<tr>
			        	 		<td id="title"><font color="red">*</font>이메일</td>
			        	 		<td class="ff">
			        	 			<input type="text" size="" id="mberEmail" name="mberEmail" maxlength="50" placeholder="xxx@naver.com" style="width:210px;height:24px;font-size:15px;">
			        	 		</td>
			        	 		<td>
			        	 			<button id="checkmberEmail">중복확인</button>
			        	 		</td>
			        	 		<td>
			        	 			<div class = "console" id=mberEmailConsole></div>
			        	 		</td>
			        	 	</tr>
			        	 	<tr>
			        	 		<td id="title"><font color="red">*</font>생년월일</td>
			        	 		<td>
			        	 			<input type="text" name="year" id="year" placeholder="년(4자)" maxlength="4"style="width:61px;height:24px;font-size:15px;" >
			        				<select id="month" 	name="month" style="width:68px;height:30px;font-size:15px;"> 
			        					<option value="" selected>월</option>
			        					<option value="01" >01</option>
			        					<option value="02" >02</option>
			        					<option value="03" >03</option>
			        					<option value="04" >04</option>
			        					<option value="05" >05</option>
			        					<option value="06" >06</option>
			        					<option value="07" >07</option>
			        					<option value="08" >08</option>
			        					<option value="09" >09</option>
			        					<option value="10" >10</option>
			        					<option value="11" >11</option>
			        					<option value="12" >12</option>
			        				</select>
			        				
			        				<input type="text" name="day" id="day" placeholder="일" maxlength="2"style="width:61px;height:24px;font-size:15px;" >
			        	 		</td>
			        	 		<td colspan="2">
			        	 		<span class ="console" id="birthdayConsole"></span>
			        	 		</td>
			        	 	</tr>
			        	 	<tr>
			        	 		<td id="title">전화번호</td>
			        	 		<td>
			        	 			<input type="text"  id="mberTel" name="mberTel" maxlength="11" placeholder="'-'를 제외하고 숫자만 입력" style="width:210px;height:24px;font-size:15px;">
			        	 		</td>
			        	 		<td>
			        	 			<div class ="console" id="mberTelConsole"></div>
			        	 		</td>	
			        	 	</tr>					   
			        	</table>
			        	<br>
			        	<input type="hidden" name ="passwardOK" value="" >		<!-- 비밀번호 합격 -->
			        	<input type="hidden" name ="mberBrthdy" value="">		<!-- 생년월일 합친 것 -->
			        	<input type="hidden" name ="mberCode" value="" >		<!-- 회원코드 -->
			        	<input type="hidden" name ="bankCode" value="" >		<!-- 은행코드 -->
			        	<input type="hidden" name ="mberAcountNo" value="" >	<!-- 계좌번호 -->
			        	<input type="hidden" name ="mberAuthorLevel" value="1" ><!-- 회원권한 레벨 -->
			        	<input type="hidden" name ="mberSecsnAt" value="N" >	<!-- 회원탈퇴 여부 -->
			        	<input type="hidden" name ="checked_id" value="" >		<!-- 아이디 중복체크 -->
			        	<input type="hidden" name ="checked_mberNcnm" value="" >	<!-- 닉네임 중복체크 -->
			        	<input type="hidden" name ="checked_mberEmail" value="" >	<!-- 이메일 중복체크 -->
			        	
			        	<!-- 지갑 -->
			        	<input type="hidden" name="coinCo" value="0"> <!-- 코인 수 -->
			        	
			       		<div id="insertBtns">
			       		<button type="submit" class="btn" id="insertBtn">가입하기</button>&nbsp;<button type="reset" class="btn" id="resetBtn">초기화</button>
			        	</div>
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