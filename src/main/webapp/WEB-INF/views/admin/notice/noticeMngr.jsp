<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ver.1.0.4 -->

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${path}/resources/img/logoD.png" rel="shortcut icon" type="image/x-icon">
<link href="${path}/resources/css/common.css?ver=1" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin/admin-menu-ver.1.1.0.css?ver=2" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin/column-width.css?ver=3" rel="stylesheet" type="text/css">

<title>Lifemenu~administrator</title>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/admin/admin-common.js"></script>
<script type="text/javascript">

$(function(){
	
	var total = "<c:out value='${TOTAL_CNT}'/>";
	console.log("result_total = "+total);
	var conditionParam  = {
		start: "<c:out value='${CONDITION_PARAM.start}'/>",
		cnt: "<c:out value='${CONDITION_PARAM.cnt}'/>",
		conditionType: "<c:out value='${CONDITION_PARAM.conditionType}'/>",
		condition: "<c:out value='${CONDITION_PARAM.condition}'/>"
	}
	console.log("conditionParam = "+conditionParam);
	
	/* 버튼 처리 */
	// 검색 버튼 처리
	$("input[name='searchBtn']").click(function(){
		$("input[name='start']").val("1");
		$("input[name='cnt']").val("8");
	});
	// 상세보기 버튼 처리
	$("input[name='noticeMngrDetail']").each(function(i, e){
		$(this).click(function(){
			$("input[name='bbscttNo']").val($(".bbscttNo").eq(i+1).text());
			$("input[name='start']").val(conditionParam.start);
			$("input[name='cnt']").val(conditionParam.cnt);
		});
	});
	// 등록 버튼 처리
	$("input[name='registBtn']").click(function(){
		$("input[name='start']").val(conditionParam.start);
		$("input[name='cnt']").val(conditionParam.cnt);
	});
	
	/* 페이지 처리 */
	var pageHtml = {
			firstHtml: "",
			beforeHtml: "",
			pagesHtml: "",
			nextHtml: "",
			lastHtml: ""
	};
	page("noticeMngr", total, conditionParam, pageHtml);
	console.log("pageHtml = "+pageHtml);
	
	$('#first_pages').html(pageHtml.firstHtml);
	$('#before_pages').html(pageHtml.beforeHtml);
	$('#view_pages').html(pageHtml.pagesHtml);
	$('#next_pages').html(pageHtml.nextHtml);
	$('#last_pages').html(pageHtml.lastHtml);
	
	/* function 마지막 */
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
            <form method="POST">
	            <div class="box-wrap">
	            	<div class="title box">
	            		<h2>공지사항 관리</h2>
	            	</div>
	            	<div class="search box">
	            		<div class="home s_box">
	            			<a href="adminMain.do">홈으로</a>
	            		</div>
	            		<div class="combo s_box">
	            			<select name="conditionType">
	            				<option value="BBSCTT_SJ" selected="selected">제목</option>
	            				<option value="BBSCTT_CN">내용</option>
	            				<option value="BBSCTT_SJ_CN">제목+내용</option>
	            			</select>
	            		</div>
	            		<div class="search_text s_box">
	            			<input type="text" name="condition" value="" placeholder="@검색어를 입력하세요" size="80">
	            		</div>
	            		<div class="search_btn s_box">
	            			<input type="submit" name="searchBtn" value="검색" formaction="noticeMngrCondition.do">
	            		</div>
	            		<div class="regist s_box">
	            			<input type="submit" name="registBtn" value="등록" formaction="insertNoticeForm.do">
	            		</div>
	            	</div>
	            	<div class="list box">
	            		<div class="l_title l_box">
	            			<div class="bbscttNo l_column">게시글 번호</div>
	            			<div class="mberCode l_column">작성자 번호</div>
	            			<div class="mberNcnm l_column">닉네임</div>
	            			<div class="bbscttSj l_column">제목</div>
	            			<div class="bbscttDt l_column">작성일시</div>
	            			<div class="etc l_column">비고</div>
	            		</div>
	            		<c:if test="${fn:length(LIST) == 0}">
	            		    <div class="l_row l_box">
	            		        <div class="no_data">조회된 데이터가 없습니다</div>
	            		    </div>
	            		</c:if>
	            		<c:if test="${not empty MSG}">
		            	    <script type="text/javascript">alert("${MSG}");</script>
		            	</c:if>
	            		<c:forEach var="noticeMngr" items="${LIST}">
	            			<div class="l_row l_box">
	            			    <div class="bbscttNo l_column">${noticeMngr.bbscttNo}</div>
	            			    <div class="mberCode l_column">${noticeMngr.mberCode}</div>
	            			    <div class="mberNcnm l_column">
	            			        <c:set var="textMberNcnm" value="${noticeMngr.mberNcnm}" />
	            			        <c:if test="${fn:length(textMberNcnm) > 10}">
	            			            ${fn:substring(textMberNcnm, 0, 8)}..
	            			        </c:if>
	            			        <c:if test="${fn:length(textMberNcnm) <= 10}">
	            			            ${noticeMngr.mberNcnm}
	            			        </c:if>
	            			    </div>
	            			    <div class="bbscttSj l_column">
	            			        <c:set var="textBbscttSj" value="${noticeMngr.bbscttSj}" />
	            			        <c:if test="${fn:length(textBbscttSj) > 20}">
	            			            ${fn:substring(textBbscttSj, 0, 18)}..
	            			        </c:if>
	            			        <c:if test="${fn:length(textBbscttSj) <= 20}">
	            			            ${noticeMngr.bbscttSj}
	            			        </c:if>
	            			    </div>
	            			    <div class="bbscttDt l_column">
	            			        <fmt:formatDate value="${noticeMngr.bbscttDt}" pattern="yyyy-MM-dd"/>
	            			    </div>
	            			    <div class="etc l_column">
	            			        <input type="submit" name="noticeMngrDetail" value="상세보기" formaction="noticeMngrDetail.do">
	            			    </div>
	            		    </div>
	            		</c:forEach>
	            		<div>
	            			<input type="hidden" name="bbscttNo" value="">
	            			<input type="hidden" name="start" value="">
	            			<input type="hidden" name="cnt" value="">
						</div>
	            	</div>
	            	<div class="page_no box">
						<div id="first_pages" class="pages"></div>
						<div id="before_pages" class="pages"></div>
						<div id="view_pages" class="pages"></div>
						<div id="next_pages" class="pages"></div>
						<div id="last_pages" class="pages"></div>
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