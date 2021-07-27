<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/*로그인헤더CSS*/
.logInfo{
	width: 320px;
    height: 20px;
    margin-top: 15px;
    margin-right: 30px;
    z-index: 1;
    position: relative;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 2px;
}
.logMenu{
	margin-left: 3px;
}
.logInfo ul{
    height: 30px;
}
.logInfo ul li{
    float: left;
    list-style: none;
    padding-right: 10px;
    font-size: 12px;
}
.myPage ul li{
    float: none;
    list-style: none;
    margin-top: 10px;
}
.ot ul li{
    float: none;
    list-style: none;
    margin-top: 10px;
}
ul.submenu-1{
	padding-inline-start: 0px;
}

ul{
 	margin: 0;
 	padding: 0;
 	list-style: none;
}
a{
    text-decoration: none;
}
.logInfo a:hover{
	border-bottom: 1px solid;
}
.submenu-1, .submenu-2{
	display: none;
	position: absolute;
	width: 70px;
}
.myPage:hover .submenu-1{
	display: block;
	height: 100px;
}
.ot:hover .submenu-2{
	display: block;
	height: 100px;
}
.li-1{
	padding-left: 10px;
	width: 95px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.submenu-1 li{
	background-color: white;
	
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${dto.mberNcnm eq '관리자'}">
			<div class="logInfo" style="width: 280px;">
				<ul class="logMenu">
					<li class="li-1"><a href="#">${dto.mberNcnm} 님 어서오세요.</a></li>
					<li>|</li>
					<li class="ot"><a href="adminMain.do">관리자메뉴</a></li>
					<li>|</li>
					<li class="out"><a href="/LifeMenu/logout">로그아웃</a></li>
				</ul>
			</div>
		</c:when>
		<c:otherwise>
			<div class="logInfo">
				<ul class="logMenu">
					<li class="li-1"><a href="#">${dto.mberNcnm} 님 어서오세요.</a></li>
					<li>|</li>
					<li class="myPage"><a class="myPageA"
						href="/LifeMenu/myPageView">마이페이지</a>
						<ul class="submenu-1">
							<li><a class="sb-1-1" href="/LifeMenu/updateMberView">회원정보</a></li>
							<li><a class="sb-1-1" href="/LifeMenu/seller/myinfo">판매</a></li>
							<li><a class="sb-1-1"
								href="/LifeMenu/transactionList?MBER_CODE=${dto.mberCode}">거래목록</a></li>
							<li><a class="sb-1-1" href="/LifeMenu/walletView">지갑</a></li>
						</ul></li>
					<li>|</li>
					<li class="ot"><a href="#">메뉴</a>
						<ul class="submenu-2">
							<li><a href="/LifeMenu/noticeMulti.do">공지사항</a></li>
							<li><a href="/LifeMenu/bbscttMulti.do?start=1&cnt=8">자유게시판</a></li>
							<li><a href="#">문의게시판</a></li>
						</ul></li>
					<li>|</li>
					<li class="out"><a href="/LifeMenu/logout">로그아웃</a></li>
				</ul>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>