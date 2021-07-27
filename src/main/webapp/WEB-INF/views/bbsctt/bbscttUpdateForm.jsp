<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/bbscttDetail.css" rel="stylesheet" type="text/css">
<title>게시글 수정</title>
</head>
<body>
	<div id="frameOut">
		<div id="frameIn">
			<div class="sub_logo">
				<a href="/LifeMenu/seller/list"><img src="${path}/resources/img/logoB.png" class="mlogo" alt=""></a>
			</div>
			<header id="header">
				<jsp:include page="${request.contextPath}/header"></jsp:include>
			</header>
			<div id="content">
			<form method="post" action="/LifeMenu/bbscttUpdate.do">
				<div class="box-wrap">
					<div class="bbscttBox-i">
						<table class="bbscttBox-1">
							<tr>
								<td class="info_title">게시글번호</td>
								<td class="info_contents">${BBS_ONE.bbscttNo}
								<input type="hidden" name="bbscttNo" value="${BBS_ONE.bbscttNo}"></td>
								<td class="info_title">제목</td>
								<td class="info_contents" colspan="5">${BBS_ONE.bbscttSj}
								<input type="hidden" name="bbscttSj" value="${BBS_ONE.bbscttSj}"></td>
								<td class="info_title">작성자</td>
								<td class="info_contents">${BBS_ONE.mberCode}
								<input type="hidden" name="mberCode" value="${BBS_ONE.mberCode}"></td>
								<td class="info_title">등록일</td>
								<fmt:parseDate var="dateString" value="${BBS_ONE.bbscttDt}" pattern="yyyy-MM-dd HH:mm:ss" />
								<td class="info_contents"><fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm" />
								<input type="hidden" name="bbscttDt" value="${BBS_ONE.bbscttDt}"></td>
							</tr>
						</table>
					</div>
					<div class="bbscttBox-j">
						<div class="bb-1"><textarea name="bbscttCn" rows="13" class="b-cn-1"
												cols="40" style="ime-mode:active;">${BBS_ONE.bbscttCn}</textarea>
						</div>
					</div>
					<div class="bbscttBox-x">
						<input class="bb-1" type="button" value="목록"
							onclick="location.href='/LifeMenu/bbscttMulti.do?start=1&cnt=8'">
						<input class="bb-2" type="submit" value="수정">
					</div>
				</div>
			</form>
			</div>
        <footer id="footer">
			<jsp:include page="${request.contextPath}/footer"></jsp:include>
        </footer>
		</div>
	</div>
</body>
</html>