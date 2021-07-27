<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ver.1.0.10 -->

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
	var filterClickCnt 	= 0;
	$("#filter_contents").hide();
	$(".mberPw").hide();
	$(".mberRlnm").hide();
	$(".bankCode").hide();
	$(".mberAcountNo").hide();
	$(".mberTel").hide();
	$(".mberBrthdy").hide();
	$(".srbde").hide();
	
	// 필터로 원하는 컬럼값 출력
	// ----필터 on/off
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
	// ----회원아이디 on/off
	$("#chkMberId").change(function(){
		if($("#chkMberId").is(":checked")){
			$(".mberId").show();
		}
		else {
			$(".mberId").hide();
		}
	});
	// ----회원비밀번호 on/off
	$("#chkMberPw").change(function(){
		if($("#chkMberPw").is(":checked")){
			$(".mberPw").show();
		}
		else {
			$(".mberPw").hide();
		}
	});
	// ----회원닉네임 on/off
	$("#chkMberNcnm").change(function(){
		if($("#chkMberNcnm").is(":checked")){
			$(".mberNcnm").show();
		}
		else {
			$(".mberNcnm").hide();
		}
	});
	// ----회원실명 on/off
	$("#chkMberRlnm").change(function(){
		if($("#chkMberRlnm").is(":checked")){
			$(".mberRlnm").show();
		}
		else {
			$(".mberRlnm").hide();
		}
	});
	// ----회원이메일 on/off
	$("#chkMberEmail").change(function(){
		if($("#chkMberEmail").is(":checked")){
			$(".mberEmail").show();
		}
		else {
			$(".mberEmail").hide();
		}
	});
	// ----은행코드 on/off
	$("#chkBankCode").change(function(){
		if($("#chkBankCode").is(":checked")){
			$(".bankCode").show();
		}
		else {
			$(".bankCode").hide();
		}
	});
	// ----회원계좌번호 on/off
	$("#chkMberAcountNo").change(function(){
		if($("#chkMberAcountNo").is(":checked")){
			$(".mberAcountNo").show();
		}
		else {
			$(".mberAcountNo").hide();
		}
	});
	// ----회원전화번호 on/off
	$("#chkMberTel").change(function(){
		if($("#chkMberTel").is(":checked")){
			$(".mberTel").show();
		}
		else {
			$(".mberTel").hide();
		}
	});
	// ----회원생년월일 on/off
	$("#chkMberBrthdy").change(function(){
		if($("#chkMberBrthdy").is(":checked")){
			$(".mberBrthdy").show();
		}
		else {
			$(".mberBrthdy").hide();
		}
	});
	// ----회원권한레벨 on/off
	$("#chkMberAuthorLevel").change(function(){
		if($("#chkMberAuthorLevel").is(":checked")){
			$(".mberAuthorLevel").show();
		}
		else {
			$(".mberAuthorLevel").hide();
		}
	});
	// ----가입일 on/off
	$("#chkSrbde").change(function(){
		if($("#chkSrbde").is(":checked")){
			$(".srbde").show();
		}
		else {
			$(".srbde").hide();
		}
	});
	// ----회원탈퇴여부 on/off
	$("#chkMberSecsnAt").change(function(){
		if($("#chkMberSecsnAt").is(":checked")){
			$(".mberSecsnAt").show();
		}
		else {
			$(".mberSecsnAt").hide();
		}
	});
	
	/* 버튼 처리 */
	// 검색 버튼 처리
	$("input[name='searchBtn']").click(function(){
		$("input[name='start']").val("1");
		$("input[name='cnt']").val("8");
	});
	// 상세보기 버튼 처리
	$("input[name='mberMngrDetail']").each(function(i, e){
		$(this).click(function(){
			$("input[name='mberCode']").val($(".mberCode").eq(i+1).text());
			$("input[name='start']").val(conditionParam.start);
			$("input[name='cnt']").val(conditionParam.cnt);
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
	page("mberMngr", total, conditionParam, pageHtml);
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
							<h2>회원 관리</h2>
						</div>
						<div class="search box">
							<div class="home s_box">
								<a href="adminMain.do">홈으로</a>
							</div>
							<div class="combo s_box">
								<select name="conditionType">
									<option value="MBER_CODE" selected="selected">회원코드</option>
									<option value="MBER_ID">아이디</option>
									<option value="MBER_NCNM">닉네임</option>
									<option value="MBER_RLNM">실명</option>
									<option value="MBER_EMAIL">이메일</option>
									<option value="MBER_TEL">전화번호</option>
								</select>
							</div>
							<div class="search_text s_box">
								<input type="text" name="condition" value="" placeholder="@검색어를 입력하세요" size="80">
							</div>
							<div class="search_btn s_box">
								<input type="submit" name="searchBtn" value="검색" formaction="mberMngrCondition.do"> 
							</div>
							<div class="search_option s_box">
								<input type="button" id="filter" value="필터">
							</div>
							<div id="filter_contents">
								<div>
									<input type="checkbox" id="chkMberId" checked>아이디 
									<input type="checkbox" id="chkMberPw">비밀번호 
									<input type="checkbox" id="chkMberNcnm" checked>닉네임 
									<input type="checkbox" id="chkMberRlnm">실명 
									<input type="checkbox" id="chkMberEmail" checked>이메일 
									<input type="checkbox" id="chkBankCode">은행코드 
									<input type="checkbox" id="chkMberAcountNo">계좌번호 
									<input type="checkbox" id="chkMberTel">전화번호 
									<input type="checkbox" id="chkMberBrthdy">생년월일 
									<input type="checkbox" id="chkMberAuthorLevel" checked>권한레벨 
									<input type="checkbox" id="chkSrbde">가입일 
									<input type="checkbox" id="chkMberSecsnAt" checked>탈퇴여부
								</div>
							</div>
						</div>
						<div class="list box">
							<div class="l_title l_box">
								<div class="mberCode l_column">회원코드</div>
								<div class="mberId l_column">아이디</div>
								<div class="mberPw l_column">비밀번호</div>
								<div class="mberNcnm l_column">닉네임</div>
								<div class="mberRlnm l_column">실명</div>
								<div class="mberEmail l_column">이메일</div>
								<div class="bankCode l_column">은행코드</div>
								<div class="mberAcountNo l_column">계좌번호</div>
								<div class="mberTel l_column">전화번호</div>
								<div class="mberBrthdy l_column">생년월일</div>
								<div class="mberAuthorLevel l_column">권한레벨</div>
								<div class="srbde l_column">가입일</div>
								<div class="mberSecsnAt l_column">탈퇴여부</div>
								<div class="etc l_column">비고</div>
							</div>
							<c:if test="${fn:length(LIST) == 0}">
		            		    <div class="l_row l_box">
		            		        <div class="no_data">조회된 데이터가 없습니다</div>
		            		    </div>
		            		</c:if>
		            		<c:if test="${!empty MSG and fn:length(MSG) < 0}">
		            		    <script type="text/javascript">alert("${MSG}");</script>
		            		</c:if>
							<c:forEach var="mber" items="${LIST}">
								<div class="l_row l_box">
									<div class="mberCode l_column">${mber.mberCode}</div>
									<div class="mberId l_column">
									    <c:set var="textMberId" value="${mber.mberId}" />
									    <c:if test="${fn:length(textMberId) > 10}">
									        ${fn:substring(textMberId, 0, 8)}..
									    </c:if>
									    <c:if test="${fn:length(textMberId) <= 10}">
									        ${mber.mberId}
									    </c:if>
									</div>
									<div class="mberPw l_column">
										<c:set var="textMberPw" value="${mber.mberPw}" />
										${fn:substring(textMberPw, 0, 2)}**
									</div>
									<div class="mberNcnm l_column">
										<c:set var="textMberNcnm" value="${mber.mberNcnm}" />
										<c:if test="${fn:length(textMberNcnm) > 10}">
									        ${fn:substring(textMberNcnm, 0, 8)}..
									    </c:if>
									    <c:if test="${fn:length(textMberNcnm) <= 10}">
									        ${mber.mberNcnm}
									    </c:if>
									</div>
									<div class="mberRlnm l_column">
										<c:set var="textMberRlnm" value="${mber.mberRlnm}" />
										<c:if test="${fn:length(textMberRlnm) > 10}">
									        ${fn:substring(textMberRlnm, 0, 8)}..
									    </c:if>
									    <c:if test="${fn:length(textMberRlnm) <= 10}">
									        ${mber.mberRlnm}
									    </c:if>
									</div>
									<div class="mberEmail l_column">
									    <c:set var="textMberEmail" value="${mber.mberEmail}" />
										<c:if test="${fn:length(textMberEmail) > 20}">
									        ${fn:substring(textMberEmail, 0, 18)}..
									    </c:if>
									    <c:if test="${fn:length(textMberEmail) <= 20}">
									        ${mber.mberEmail}
									    </c:if>
									</div>
									<div class="bankCode l_column">${mber.bankCode}</div>
									<div class="mberAcountNo l_column">
										<c:set var="textMberAcountNo" value="${mber.mberAcountNo}" />
										${fn:substring(textMberAcountNo, 0, 2)}**
									</div>
									<div class="mberTel l_column">${mber.mberTel}</div>
									<div class="mberBrthdy l_column">${mber.mberBrthdy}</div>
									<div class="mberAuthorLevel l_column">${mber.mberAuthorLevel}</div>
									<div class="srbde l_column">${mber.srbde}</div>
									<div class="mberSecsnAt l_column">${mber.mberSecsnAt}</div>
									<div class="etc l_column">
										<input type="submit" name="mberMngrDetail" value="상세보기" formaction="mberMngrDetail.do">
									</div>
								</div>
							</c:forEach>
							<div>
							    <input type="hidden" name="mberCode" value="">
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