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
<link href="${path}/resources/css/admin/admin-detail-ver.1.0.1.css" rel="stylesheet" type="text/css">
<title>Lifemenu~administrator</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

$(function(){
	/*alert("jquery check!")*/
	
	$("#updateBtn").hide();
	$("#cancelBtn").hide();
	$("#modifyBtn").click(function(){
		$("#updateBtn").show();
		$("#cancelBtn").show();
		$("#modifyBtn").hide();
		$("#deleteBtn").hide();
		$("input[name='inqrySj']").attr("readonly", false);
		$("textarea[name='inqryCn']").attr("readonly", false);
	});
	$("#cancelBtn").click(function(){
		$("#modifyBtn").show();
		$("#deleteBtn").show();
		$("#updateBtn").hide();
		$("#cancelBtn").hide();
		$("input[name='inqrySj']").attr("readonly", true);
		$("textarea[name='inqryCn']").attr("readonly", true);
	});
	
});

</script>

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
            <form action="" method="POST">
	            <div class="box-wrap">
	            	<div class="title box">
	            		<h2>관리자 문의 상세</h2>
	            	</div>
	          		<div class="info box">
	            		<table>
	            			<tr>
	            				<td class="info_title">관리자문의 번호</td>
	            				<td class="info_contents">${INQRY.mngrInqryNo}</td>
	            				<td class="info_title">등록일시</td>
	            				<td class="info_contents">${INQRY.inqryDt}</td>
	            				<td class="info_title">작성자</td>
	            				<td class="info_contents">${INQRY.mberCode}</td>
	            			</tr>
	            			<tr>
	            				<td class="info_title">제목</td>
	            				<td class="info_contents" colspan="5"><input type="text" name="inqrySj" value="${ INQRY.inqrySj }" readonly/></td>
	            			</tr>
	            		</table>
	            	</div>
	            	<div class="text-content box">
	            		<textarea name="inqryCn" readonly>${ INQRY.inqryCn }</textarea>
	            	</div>
	            	<div class="button-group box">
	            	    <c:if test="${ isAnswer != y }">
	            	        <input type="button" value="답변등록" onclick="document.location.href='insertMngrInqryForm.do?mngrInqryNo=${ INQRY.mngrInqryNo }&start=${ START }&cnt=${ CNT }'">
	            	    </c:if>
	            	    <c:if test="${ isAnswer == y }">
	            	    	<input id="modifyBtn" type="button" value="답변수정" />
	            	    	<input id="updateBtn" type="submit" value="수정확인" formaction="updateMngrAnswer.do" />
	            	    	<input id="deleteBtn" type="submit" value="답변삭제" formaction="deleteMngrAnswer.do" />
	            	    	<input id="cancelBtn" type="reset" value="취소" />
	            	    	
	            	    	<input type="hidden" name="mngrInqryNo" value="${INQRY.mngrInqryNo}">
	            	    	<input type="hidden" name="start" value="${START}">
	            	    	<input type="hidden" name="cnt" value="${CNT}">
	            	    </c:if>
	            		<input type="button" value="돌아가기" onclick="document.location.href='mngrInqryCondition.do?start=${ START }&cnt=${ CNT }'">
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