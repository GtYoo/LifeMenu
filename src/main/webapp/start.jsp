<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/start.css" rel="stylesheet" type="text/css">
<title>start</title>

<!--  jQuery Framework 참조하기 -->
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>

<!-- 사용자 스크립트 블록 -->
<script>
$(function (){//$(document).ready(function(){})
	/** id속성이 "checkid"인 요소에 대한 "click"이벤트 정의 */
	
	
	$("#login").click(function(){
		// 사용자 입력값 얻어오기
		var input_value = $("input[name='id']").val();
		
		if(!input_value){
			$(".console").html("<span style='color:red'>아이디를 입력하세요.</span>");
			$("input[name='id']").focus();
			return false;// true로 주든 false로 주든 여기선 상관없음.
		}
		
		var input_value2 = $("input[name='pw']").val(); //input태그중 name이 code
		// 입력여부 검사
		if(!input_value2){
			$(".console").html("<span style='color:red'>비밀번호를 입력하세요.</span>");
			$("input[name='pw']").focus();
			return false;// true로 주든 false로 주든 여기선 상관없음.
		}

	});
});

$(document).ready(function(){
	$('.slider>li').hide();
	$('.slider>li:first-child').show();
	
	setInterval(function(){
		$('.slider>li:first-child').fadeOut().next().fadeIn().end(5000).appendTo('.slider');
	},5000);
});
</script>
<style>
.slider li{
	position: absolute;
	list-style: none;
	left: 25px;
	top: 50px;
}
</style>
</head>
<body>
	<div id="frameOut">
		<div id="frameIn">
			<div class="main_logo">
				<img src="resources/img/logoA.png" class="mlogo" alt="">
			</div>
			<header id="header"></header>
			<div id="content">
				<div id="content_container">
					<div class="line_menu">
						<div class="box">
							<ul class="slider">
								<li><img src="${path}/resources/img/main1.png" width=600 height=400></li>
								<li><img src="${path}/resources/img/main2.png" width=600 height=400></li>
								<li><img src="${path}/resources/img/main3.png" width=600 height=400></li>
								<li><img src="${path}/resources/img/main4.png" width=600 height=400></li>
								<li><img src="${path}/resources/img/main5.png" width=600 height=400></li>
							</ul>
						</div>
						
						<div class="box">
							<form method="post" action="login.do">
								<header>
									<h2 align="center">Login</h2>
								</header>
									<div class="input-box"> 
										<input  type="text" id="id" name="id" placeholder="ID"> 
										<label for="id">아이디</label> 
									</div>
									<div class="input-box"> 
										<input type="password" id="pw"  name="pw" placeholder="PW"> 
										<label for="password">비밀번호</label>
									 </div>
									 <div class="console">
									<font color="red">${ msg }</font>
									</div>
								<button type="submit" class="btn" id="login">로그인</button><br>
								<div id="btn_group"> 
								<input  id="test_btn1" type="button" value="회원가입"	onclick="document.location.href='insertPreView'"> 
								<input  id="test_btn2" type="button" value="ID/PW 찾기" onclick="document.location.href='findView'">
								
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<footer id="footer">
				<div class="otc">
					<a href="#">회사소개</a> <a href="#">인재채용</a> <a href="#">제휴제안</a> <a
						href="#">이용약관</a> <a href="#">개인정보처리방침</a> <a href="#">고객센터</a> <a
						href="#">@LM Corp.</a>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>