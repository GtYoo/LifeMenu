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
<title>문의글 수정</title>
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
			<form method="post" action="/LifeMenu/inqryUpdate.do">
				<div class="box-wrap">
					<div class="bbscttBox-i">
						<table class="bbscttBox-1">
							<tr>
								<td class="info_title">문의번호</td>
								<td class="info_contents">${INQRY_ONE.mngrInqryNo}
								<input type="hidden" name="mngrInqryNo" value="${INQRY_ONE.mngrInqryNo}"></td>
								<td class="info_title">제목</td>
								<td class="info_contents" colspan="5">${INQRY_ONE.inqrySj}
								<input type="hidden" name="inqrySj" value="${INQRY_ONE.inqrySj}"></td>
								<td class="info_title">작성자</td>
								<td class="info_contents">${INQRY_ONE.mberCode}
								<input type="hidden" name="mberCode" value="${INQRY_ONE.mberCode}"></td>
								<td class="info_title">등록일</td>
								<fmt:parseDate var="dateString" value="${INQRY_ONE.inqryDt}" pattern="yyyy-MM-dd HH:mm:ss" />
								<td class="info_contents"><fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm" />
								<input type="hidden" name="inqryDt" value="${INQRY_ONE.inqryDt}"></td>
							</tr>
						</table>
					</div>
					<div class="bbscttBox-j">
						<div class="bb-1"><textarea name="inqryCn" rows="13" class="b-cn-1"
												cols="40" style="ime-mode:active;">${INQRY_ONE.inqryCn}</textarea>
						</div>
					</div>
					<div class="bbscttBox-x">
						<input class="bb-1" type="button" value="목록"
							onclick="location.href='/LifeMenu/inqryMulti.do?start=1&cnt=8'">
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