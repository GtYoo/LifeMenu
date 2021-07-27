<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ver.1.0.3 -->

<c:set var="path" value="${pageContext.request.contextPath}" />
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
	
	// 필터 기본 설정(리스트 출력 제외 항목)
	$("#filter_contents").hide();
	$(".selerCode").hide();
	$(".mberEmail").hide();
	$(".mberTel").hide();
	$(".vochrRegistDt").hide();
	$(".bankCode").hide();
	$(".mberAcountNo").hide();
	$(".mberBrthdy").hide();
	
	
	// 필터로 원하는 컬럼값 출력
	var filterClickCnt 	= 0;
	
	$("#filter").click(function(){
		if(filterClickCnt%2 == 0){
			$("#filter_contents").show();
			filterClickCnt++;
		}
		else{
			$("#filter_contents").hide();
			filterClickCnt++;
		}
	});
	
	$("#chkVochrCode").change(function(){
		if($("#chkVochrCode").is(":checked")){
			$(".vochrCode").show();
		}
		else {
			$(".vochrCode").hide();
		}
	});
	
	$("#chkSelerCode").change(function(){
		if($("#chkSelerCode").is(":checked")){
			$(".selerCode").show();
		}
		else {
			$(".selerCode").hide();
		}
	});
	
	$("#chkMberNcnm").change(function(){
		if($("#chkMberNcnm").is(":checked")){
			$(".mberNcnm").show();
		}
		else {
			$(".mberNcnm").hide();
		}
	});
	
	$("#chkMberRlnm").change(function(){
		if($("#chkMberRlnm").is(":checked")){
			$(".mberRlnm").show();
		}
		else {
			$(".mberRlnm").hide();
		}
	});
	
	$("#chkMberEmail").change(function(){
		if($("#chkMberEmail").is(":checked")){
			$(".mberEmail").show();
		}
		else {
			$(".mberEmail").hide();
		}
	});
	
	$("#chkMberTel").change(function(){
		if($("#chkMberTel").is(":checked")){
			$(".mberTel").show();
		}
		else {
			$(".mberTel").hide();
		}
	});
	
	$("#chkVochrPrice").change(function(){
		if($("#chkVochrPrice").is(":checked")){
			$(".vochrPrice").show();
		}
		else {
			$(".vochrPrice").hide();
		}
	});
	
	$("#chkMealPrearngeDt").change(function(){
		if($("#chkMealPrearngeDt").is(":checked")){
			$(".mealPrearngeDt").show();
		}
		else {
			$(".mealPrearngeDt").hide();
		}
	});
	
	$("#chkMealTime").change(function(){
		if($("#chkMealTime").is(":checked")){
			$(".mealTime").show();
		}
		else {
			$(".mealTime").hide();
		}
	});
	
	$("#chkDelngAt").change(function(){
		if($("#chkDelngAt").is(":checked")){
			$(".delngAt").show();
		}
		else {
			$(".delngAt").hide();
		}
	});
	
	$("#chkVochrRegistDt").change(function(){
		if($("#chkVochrRegistDt").is(":checked")){
			$(".vochrRegistDt").show();
		}
		else {
			$(".vochrRegistDt").hide();
		}
	});
	
	$("#chkBankCode").change(function(){
		if($("#chkBankCode").is(":checked")){
			$(".bankCode").show();
		}
		else {
			$(".bankCode").hide();
		}
	});
	
	$("#chkMberAcountNo").change(function(){
		if($("#chkMberAcountNo").is(":checked")){
			$(".mberAcountNo").show();
		}
		else {
			$(".mberAcountno").hide();
		}
	});
	
	/* 버튼 처리 */
	// 검색 버튼 처리
	$("input[name='searchBtn']").click(function(){
		$("input[name='start']").val("1");
		$("input[name='cnt']").val("8");
	});
	// 상세보기 버튼 처리
	$("input[name='vochrMngrDetail']").each(function(i, e){
		$(this).click(function(){
			$("input[name='vochrCode']").val($(".vochrCode").eq(i+1).text());
			$("input[name='start']").val(conditionParam.start);
			$("input[name='cnt']").val(conditionParam.cnt);
		});
	});
	
	/* 식사권 블라인드 처리 */
	var result = "";
	var vochrMngrBlindUrl = "vochrMngrBlind.do";
	$("input[name='vochrMngrBlind']").each(function(i, e){
		$(this).click(function(){
			if($(".delngAt").eq(i+1).text() == "Y"){
				result = confirm("블라인드 하시겠습니까?");
			}
			else {
				result = confirm("블라인드 해제 하시겠습니까?");
			}
			console.log(result);
			if(result){
				var vochrCode = $(".vochrCode").eq(i+1).text();
				console.log(vochrCode);
				//vochrMngrBlindUrl = vochrMngrBlindUrl + "?vochrCode=" + vochrCode;
				$.getJSON(vochrMngrBlindUrl, {
					"vochrCode" : vochrCode
				}, function(json){
					var delngAt = "";
					if(json.delngAt == 'Y'){
						delngAt = "Y";
					}
					else{
						delngAt = "N";
					}
					$(".delngAt").eq(i+1).text(delngAt);
					alert(json.MSG);
				});
			}
		});
	});
	
	/* 페이지 처리 */
	var pageHtml = {
			firstHtml: "",
			beforeHtml: "",
			pagesHtml: "",
			nextHtml: "",
			lastHtml: ""
	};
	page("vochrMngr", total, conditionParam, pageHtml);
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
	            		<h2>식사권 관리</h2>
	            	</div>
	            	<div class="search box">
	            		<div class="home s_box">
	            			<a href="adminMain.do">홈으로</a>
	            		</div>
	            		<div class="combo s_box">
	            			<select name="conditionType">
	            				<option value="VOCHR_CODE" selected="selected">식사권코드</option>
	            				<option value="MBER_CODE">판매자코드</option>
	            				<option value="MBER_NCNM">닉네임</option>
	            				<option value="MBER_RCNM">실명</option>
	            			</select>
	            		</div>
	            		<div class="search_text s_box">
	            			<input type="text" name="condition" value="" placeholder="@검색어를 입력하세요" size="80">
	            		</div>
	            		<div class="search_btn s_box">
	            			<input type="submit" name="searchBtn" value="검색" formaction="vochrMngrCondition.do">
	            		</div>
	            		<div class="search_option s_box">
	            			<input type="button" id="filter" value="필터">
	            		</div>
	            		<div id="filter_contents">
							<div>
								<input type="checkbox" id="chkVochrCode" checked>식사권코드 
								<input type="checkbox" id="chkSelerCode">판매자코드 
								<input type="checkbox" id="chkMberNcnm" checked>판매자 닉네임 
								<input type="checkbox" id="chkMberRlnm" checked>판매자 실명
								<input type="checkbox" id="chkMberEmail">판매자 이메일  
								<input type="checkbox" id="chkMberTel">판매자 전화번호
								<input type="checkbox" id="chkVochrPrice" checked>식사권 가격 
								<input type="checkbox" id="chkMealPrearngeDt" checked>식사예정일
								<input type="checkbox" id="chkMealTime" checked>식사시간 
								<input type="checkbox" id="chkDelngAt" checked>판매여부
								<input type="checkbox" id="chkVochrRegistDt">식사권등록일시
								<input type="checkbox" id="chkBankCode">은행코드 
								<input type="checkbox" id="chkMberAcountNo">계좌번호
							</div>
						</div>
	            	</div>
	            	<div class="list box">
	            		<div class="l_title l_box">
	            			<div class="vochrCode l_column">식사권 코드</div>
	            			<div class="selerCode l_column">판매자 코드</div>
	            			<div class="mberNcnm l_column">판매자 닉네임</div>
	            			<div class="mberRlnm l_column">판매자 실명</div>
	            			<div class="mberEmail l_column">판매자 이메일</div>
	            			<div class="mberTel l_column">판매자 전화번호</div>
	            			<div class="vochrPrice l_column">식사권 가격</div>
	            			<div class="mealPrearngeDt l_column">식사예정일</div>
	            			<div class="mealTime l_column">식사시간</div>
	            			<div class="delngAt l_column">판매여부</div>
	            			<div class="vochrRegistDt l_column">식사권등록일시</div>
	            			<div class="bankCode l_column">은행코드</div>
	            			<div class="mberAcountNo l_column">계좌번호</div>
	            			<div class="etc2 l_column">비고</div>
	            		</div>
	            		<c:if test="${fn:length(LIST) == 0}">
	            		    <div class="l_row l_box">
	            		        <div class="no_data">조회된 데이터가 없습니다</div>
	            		    </div>
	            		</c:if>
	            		<c:forEach var="vochrMngr" items="${LIST}">
	            			<div class="l_row l_box">
	            			    <div class="vochrCode l_column">${vochrMngr.vochrCode}</div>
	            			    <div class="selerCode l_column">${vochrMngr.mberCode}</div>
	            			    <div class="mberNcnm l_column">
	            			        <c:set var="textMberNcnm" value="${vochrMngr.mberNcnm}" />
									<c:if test="${fn:length(textMberNcnm) > 10}">
									    ${fn:substring(textMberNcnm, 0, 8)}..
									</c:if>
									<c:if test="${fn:length(textMberNcnm) <= 10}">
									    ${vochrMngr.mberNcnm}
									</c:if>
								</div>
	            			    <div class="mberRlnm l_column">
	            			        <c:set var="textMberRlnm" value="${vochrMngr.mberRlnm}" />
									<c:if test="${fn:length(textMberRlnm) > 10}">
									    ${fn:substring(textMberRlnm, 0, 8)}..
									</c:if>
									<c:if test="${fn:length(textMberRlnm) <= 10}">
									    ${vochrMngr.mberRlnm}
									</c:if>
	            			    </div>
	            			    <div class="mberEmail l_column">${vochrMngr.mberEmail }
	            			    </div>
	            			    <div class="mberTel l_column">${vochrMngr.mberTel}</div>
	            			    <div class="vochrPrice l_column">${vochrMngr.vochrPrice}</div>
	            			    <div class="mealPrearngeDt l_column">${vochrMngr.mealPrearngeDt}</div>
	            			    <div class="mealTime l_column">${vochrMngr.mealTime}</div>
	            			    <div class="delngAt l_column">${vochrMngr.delngAt}</div>
	            			    <div class="vochrRegistDt l_column">${vochrMngr.vochrRegistDt}</div>
	            			    <div class="bankCode l_column">${vochrMngr.bankCode}</div>
	            			    <div class="mberAcountNo l_column">
	            			        <c:set var="textMberAcountNo" value="${ vochrMngr.mberAcountNo }" />
									${fn:substring(textMberAcountNo, 0, 2)}**
	            			    </div>
	            			    <div class="etc2 l_column">
	            			        <input type="submit" name="vochrMngrDetail" value="결제정보" formaction="vochrMngrDetail.do">
	            			        <input type="button" name="vochrMngrBlind" value="블라인드">
	            			    </div>
	            		    </div>
	            		</c:forEach>
	            		<div>
						    <input type="hidden" name="vochrCode" value="">
						    <input type="hidden" name="start" value=""> 
							<input type="hidden" name="cnt" value="">
						</div>
	            	</div>
	            	<div class="page_no l_box">
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