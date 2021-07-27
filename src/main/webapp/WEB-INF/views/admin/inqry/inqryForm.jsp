<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ver.1.0.0. -->

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin-detail-ver.1.0.1.css" rel="stylesheet" type="text/css">
<title>Lifemenu~administrator</title>
</head>
<body>
<div id="frameOut">
    <div id="frameIn">
        <div class="sub_logo">
			<a href="adminMain.do"><img src="${path}/resources/img/logoB.png" class="mlogo" alt=""></a>
		</div>
		<header id="header">
			<jsp:include page="${request.contextPath}/header"></jsp:include>
		</header>
        <div id="content">
            <form action="insertMngrAnswer.do" method="POST">
                <div class="box-wrap">
            	    <div class="title box">
            		    <h2>관리자 문의 답변 등록</h2>
            	    </div>
          		    <div class="info box">
            		    <table>
            			    <tr>
            				    <td class="info_title">제목</td>
            				    <td class="info_contents"><input name="inqrySj" type="text" size="80" value=""></td>
            			    </tr>
            		    </table>
            	    </div>
            	    <div class="text-content box">
            		    <textarea name="inqryCn"></textarea>
            	    </div>
            	    <div class="button-group box">
            		    <input type="submit" value="등록">
            		    <input type="button" value="돌아가기" onclick="document.location.href='mngrInqryMulti.do?start=${ START }&cnt=${ CNT }'">
            		
            		    <input type="hidden" name="mngrInqryNo" value="${ MNGR_INQRY_NO }">
            		    <input type="hidden" name="mberCode" value="${ MBER_CODE }">
            		    <input type="hidden" name="start" value="${ START }">
            		    <input type="hidden" name="cnt" value="${ CNT }">
            	    </div>
                </div>
				<%-- end box-wrap --%>
            </form>
        </div>
        <footer id="footer">
			<jsp:include page="${request.contextPath}/footer"></jsp:include>
        </footer>
    </div>
</div>
</body>
</html>