<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/bbscttInsert.css" rel="stylesheet" type="text/css">
<title>게시글 등록</title>
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
				<div class="container">
					<div class="row">
						<form method="post" action="bbscttInsert.do">
							<table class="table table-striped"
								style="text-align: center; border: 1px solid #dddddd">
								<thead>
									<tr>
										<th colspan="2"
											style="background-color: #eeeeee; text-align: center;">글쓰기</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" class="b-sj"
											placeholder="글 제목" name="bbscttSj" maxlength="500"></td>
									</tr>
									<tr>
										<td><textarea name="bbscttCn" rows="13" class="b-cn"
												cols="40" style="ime-mode: inactive;"></textarea></td>
									</tr>
								</tbody>
							</table>
							<input type="submit" class="btn-1" value="등록">
							<input type="button" class="btn-2" value="취소" onclick="location.href='/LifeMenu/bbscttMulti.do?start=1&cnt=8'">
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