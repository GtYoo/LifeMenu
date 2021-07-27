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
<title>Lifemenu</title>
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
				<div class="box-wrap">
					<div class="bbscttBox-i">
						<table class="bbscttBox-1">
							<tr>
								<td class="info_title">문의번호</td>
								<td class="info_contents">${INQRY.mngrInqryNo}</td>
								<td class="info_title">제목</td>
								<td class="info_contents">[문의]${INQRY.inqrySj}</td>
								<td class="info_title">작성자</td>
								<td class="info_contents">${WRITER_DTO.mberNcnm}</td>
								<td class="info_title">작성일</td>
								<fmt:parseDate var="dateString" value="${INQRY.inqryDt}" pattern="yyyy-MM-dd HH:mm:ss" />
								<td class="info_contents"><fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm" /></td>
							</tr>
						</table>
					</div>
					<div class="bbscttBox-j">
						<div class="bb-1"><textarea name="inqryCn" rows="13" class="b-cn-1" readonly
												cols="40" style="ime-mode: inactive;">${INQRY.inqryCn}</textarea>
						</div>
					</div>
					<form method="post" action="/LifeMenu/comentInsert.do?MNGR_INQRY_NO=${INQRY.mngrInqryNo}">
					</form>
					<div class="inqryDetail">
						<input type="button" value="목록"
							onclick="location.href='/LifeMenu/inqryMulti.do?start=1&cnt=8'">
						<c:set var="code" value="${SS_MBER_DTO}"/>
						<c:if test="${SS_MBER_DTO.mberCode eq INQRY.mberCode}">
							<input type="button" value="수정"
								onclick="location.href='/LifeMenu/inqryUpdateForm.do?MNGR_INQRY_NO=${INQRY.mngrInqryNo}'">
						
							<input type="button" value="삭제"
								onclick="location.href='/LifeMenu/inqryDelete.do?MNGR_INQRY_NO=${INQRY.mngrInqryNo}'">
						</c:if>
					</div>
					<div>
						<c:forEach var="c" items="${COMENT_LIST}" varStatus="status">
						<div class="coment-con">
							<span>${COMENT_LIST_NM[status.index].mberNcnm}</span>
							<span>${c.inqryCn}</span>
							<div class="dtotc">
							<fmt:parseDate var="dateString" value="${c.inqryDt}" pattern="yyyy-MM-dd HH:mm:ss" />
							<span class="info_contents"><fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm" /></span>
							<c:if test="${c.mberCode eq dto.mberCode }">
							<input type="button" onclick="location.href='/LifeMenu/comentDelete.do?MNGR_INQRY_NO=${c.mngrInqryNo}&MNGRANSWER_NO=${c.mngrAnswerNo}'" value="삭제">
							</c:if>
							</div>
						</div>
						</c:forEach>
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