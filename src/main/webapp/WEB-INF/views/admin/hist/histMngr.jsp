<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ver.1.0.1 -->

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
	
	// 필터 기본 설정(리스트 출력 제외 항목)
	var filterClickCnt 	= 0;
	$("#filter_contents").hide();
	$(".vochrCode").hide();
	$(".delngCode").hide();
	$(".setleCode").hide();
	$(".mberCode").hide();
	$(".delngDt").hide();
	$(".delngSe").hide();
	$(".delngAmount").hide();
	$(".repositoryCoinCo").hide();
	$(".rcppayDt").hide();
	$(".rcppayCl").hide();
	$(".rcppayAmount").hide();
	$(".excngCoinCo").hide();
	$(".coinCo").hide();
	$(".vochrPrice").hide();
	$(".mealPrearngeDt").hide();
	$(".vochrRegistDt").hide();
	$(".mealTime").hide();
	$(".delngAt").hide();
	$(".setlePc").hide();
	$(".setleDt").hide();
	$(".setleAt").hide();
	$(".purchsDcsnAt").hide();
	$(".refndReqstAt").hide();
	$(".refndPc").hide();
	$(".refndDt").hide();
	$(".refndAt").hide();
	$(".refndResn").hide();
	
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
	// ----전체 on/off
	$("#chkAll").change(function(){
		if($("#chkAll").is(":checked")){
			$("#chkVochrHist").prop("checked", true);
			$("#chkSetleHist").prop("checked", true);
			$("#chkRefndHist").prop("checked", true);
			$("#chkWalletDtlsHist").prop("checked", true);
			$("#chkCoinRepositoryHist").prop("checked", true);
			$(".rcordDt").show();
			$(".histSe").show();
			$(".code").show();
			$(".history").show();
			$(".vochrCode").hide();
			$(".delngCode").hide();
			$(".setleCode").hide();
			$(".mberCode").hide();
			$(".delngDt").hide();
			$(".delngSe").hide();
			$(".delngAmount").hide();
			$(".repositoryCoinCo").hide();
			$(".rcppayDt").hide();
			$(".rcppayCl").hide();
			$(".rcppayAmount").hide();
			$(".excngCoinCo").hide();
			$(".coinCo").hide();
			$(".vochrPrice").hide();
			$(".mealPrearngeDt").hide();
			$(".vochrRegistDt").hide();
			$(".mealTime").hide();
			$(".delngAt").hide();
			$(".setlePc").hide();
			$(".setleDt").hide();
			$(".setleAt").hide();
			$(".purchsDcsnAt").hide();
			$(".refndReqstAt").hide();
			$(".refndPc").hide();
			$(".refndDt").hide();
			$(".refndAt").hide();
			$(".refndResn").hide();
		}
		else {
			$(".l_column").hide();
			$("#chkVochrHist").prop("checked", false);
			$("#chkSetleHist").prop("checked", false);
			$("#chkRefndHist").prop("checked", false);
			$("#chkWalletDtlsHist").prop("checked", false);
			$("#chkCoinRepositoryHist").prop("checked", false);
		}
	});
	// ----식사권이력 on/off
	$("#chkVochrHist").change(function(){
		if($("#chkVochrHist").is(":checked")){
			$(".vochrCode").show();
			$(".mberCode").show();
			$(".vochrPrice").show();
			$(".mealPrearngeDt").show();
			$(".vochrRegistDt").show();
			$(".mealTime").show();
			$(".delngAt").show();
		}
		else {
			$(".vochrCode").hide();
			$(".mberCode").hide();
			$(".vochrPrice").hide();
			$(".mealPrearngeDt").hide();
			$(".vochrRegistDt").hide();
			$(".mealTime").hide();
			$(".delngAt").hide();
		}
	});
	// ----예약 및 결제이력 on/off
	$("#chkResveSetleHist").change(function(){
		if($("#chkResveSetleHist").is(":checked")){
			$(".setleCode").show();
			$(".mberCode").show();
			$(".vochrCode").show();
			$(".resvePc").show();
			$(".resveDt").show();
			$(".setlePc").show();
			$(".setleDt").show();
			$(".setleAt").show();
			$(".refndReqstAt").show();
			$(".purchsDcsnAt").show();
		}
		else {
			$(".setleCode").hide();
			$(".mberCode").hide();
			$(".vochrCode").hide();
			$(".resvePc").hide();
			$(".resveDt").hide();
			$(".setlePc").hide();
			$(".setleDt").hide();
			$(".setleAt").hide();
			$(".refndReqstAt").hide();
			$(".purchsDcsnAt").hide();
		}
	});
	// ----환불이력 on/off
	$("#chkRefndHist").change(function(){
		if($("#chkRefndHist").is(":checked")){
			$(".setleCode").show();
			$(".refndPc").show();
			$(".refndDt").show();
			$(".refndAt").show();
			$(".refndResn").show();
		}
		else {
			$(".setleCode").hide();
			$(".refndPc").hide();
			$(".refndDt").hide();
			$(".refndAt").hide();
			$(".refndResn").hide();
		}
	});
	// ----지갑내역 on/off
	$("#chkWalletDtlsHist").change(function(){
		if($("#chkWalletDtlsHist").is(":checked")){
			$(".mberCode").show();
			$(".rcppayDt").show();
			$(".rcppayCl").show();
			$(".rcppayAmount").show();
			$(".excngCoinCo").show();
			$(".coinCo").show();
		}
		else {
			$(".mberCode").hide();
			$(".rcppayDt").hide();
			$(".rcppayCl").hide();
			$(".rcppayAmount").hide();
			$(".excngCoinCo").hide();
			$(".coinCo").hide();
		}
	});
	// ----코인저장소이력 on/off
	$("#chkCoinRepositoryHist").change(function(){
		if($("#chkCoinRepositoryHist").is(":checked")){
			$(".delngCode").show();
			$(".mberCode").show();
			$(".setleCode").show();
			$(".delngDt").show();
			$(".delngSe").show();
			$(".delngAmount").show();
			$(".repositoryCoinCo").show();
		}
		else {
			$(".delngCode").hide();
			$(".mberCode").hide();
			$(".setleCode").hide();
			$(".delngDt").hide();
			$(".delngSe").hide();
			$(".delngAmount").hide();
			$(".repositoryCoinCo").hide();
		}
	});
	
	// ----도움말 보기 on/off
	var helpClickCnt 	= 0;
	$(".help").hide();
	$("#helpBtn").click(function(){
		if(helpClickCnt%2 == 0){
			$(".help").show();
			helpClickCnt++;
		}
		else{
			$(".help").hide();
			helpClickCnt++;
		}
	});
	
	/* 버튼 처리 */
	// 검색 버튼 처리
	$("input[name='searchBtn']").click(function(){
		$("input[name='start']").val("1");
		$("input[name='cnt']").val("5");
		
		var condition = $("input[name='condition']").val();
		console.log("condition = "+condition);
	});
	
	/* 페이지 처리 */
	var pageHtml = {
			firstHtml: "",
			beforeHtml: "",
			pagesHtml: "",
			nextHtml: "",
			lastHtml: ""
	};
	page("histMngr", total, conditionParam, pageHtml);
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
            		    <h2>히스토리 관리</h2>
            	    </div>
            	    <div class="search box">
            	        <div class="home s_box">
	            			<a href="adminMain.do">홈으로</a>
	            		</div>
            		    <div class="combo s_box">
            			    <select name="conditionType">
            				    <option value="RCORD_DT" selected="selected">히스토리 일시</option>
            			    </select>
            		    </div>
            		    <div class="search_text s_box">
            			    <input type="text" name="condition" value="" placeholder="@YYYYMMDDHHMISS-YYYYMMDDHHMISS" size="80">
            		    </div>
            		    <div class="search_btn s_box">
            			    <input type="submit" name="searchBtn" value="검색" formaction="histMngrCondition.do">
            		    </div>
            		    <div class="search_option s_box">
							<input type="button" id="filter" value="필터">
						</div>
						<div id="filter_contents">
							<div>
								<input type="checkbox" id="chkAll" checked>전체 이력 
								<input type="checkbox" id="chkVochrHist" checked>식사권 이력 
								<input type="checkbox" id="chkSetleHist" checked>예약 및 결제 이력 
								<input type="checkbox" id="chkRefndHist" checked>환불 
								<input type="checkbox" id="chkWalletDtlsHist" checked>지갑내역 이력 
								<input type="checkbox" id="chkCoinRepositoryHist" checked>코인 저장소 이력 
							</div>
						</div>
            		    <div class="help_btn s_box">
            			    <input type="button" id="helpBtn" value="도움말">
            		    </div>
            	    </div>
            	    <div class="help box">
            	        <p>
            	            'YYYYMMDD[HH][MI][SS]'로 검색시 해당 날짜의 히스토리만 검색됩니다.<br>
            	            'YYYYMMDDHHMISS-YYYYMMDDHHMISS'로 검색시 해당 범위의 히스토리가 검색됩니다.
            	        </p>
	            	</div>
            	    <div class="list box">
            		    <div class="l_title l_box">
            			    <div class="rcordDt l_column">히스토리 등록일시</div>
            			    <div class="histSe l_column">히스토리 구분</div>
            			    <div class="code l_column">전체코드</div>
            			    <div class="history l_column">히스토리</div>
            			    <div class="vochrCode l_column">식사권코드</div>
            			    <div class="delngCode l_column">거래 코드</div>
            			    <div class="setleCode l_column">결제코드</div>
            			    <div class="mberCode l_column">회원코드</div>
            			    <div class="delngDt l_column">거래 일시</div>
            			    <div class="delngSe l_column">거래 분류</div>
            			    <div class="delngAmount l_column">거래 금액</div>
            			    <div class="repositoryCoinCo l_column">저장 코인 수</div>
            			    <div class="rcppayDt l_column">입출금 일자</div>
            			    <div class="rcppayCl l_column">입출금 분류</div>
            			    <div class="rcppayAmount l_column">입출금 금액</div>
            			    <div class="excngCoinCo l_column">환전 코인 수</div>
            			    <div class="coinCo l_column">코인 수</div>
            			    <div class="vochrPrice l_column">식사권 가격</div>
            			    <div class="mealPrearngeDt l_column">식사 예정 일시</div>
            			    <div class="vochrRegistDt l_column">식사권 등록 일시</div>
            			    <div class="mealTime l_column">식사 시간</div>
            			    <div class="delngAt l_column">거래 가능 여부</div>
            			    <div class="setlePc l_column">결제 가격</div>
            			    <div class="setleDt l_column">결제 일시</div>
            			    <div class="setleAt l_column">결제 완료 여부</div>
            			    <div class="purchsDcsnAt l_column">구매 확정 여부</div>
            			    <div class="refndReqstAt l_column">환불 신청 여부</div>
            			    <div class="refndPc l_column">환불 가격</div>
            			    <div class="refndDt l_column">환불 일시</div>
            			    <div class="refndAt l_column">환불 완료 여부</div>
            			    <div class="refndResn l_column">환불 사유</div>
            		    </div>
						<c:if test="${fn:length(LIST) == 0}">
		            	    <div class="l_row l_box">
		            	        <div class="no_data">조회된 데이터가 없습니다</div>
		            	    </div>
		            	</c:if>
		            	<c:if test="${!empty MSG and fn:length(MSG) < 0}">
		            	    <script type="text/javascript">alert("${MSG}");</script>
		            	</c:if>
            		    <c:forEach var="hist" items="${LIST}" varStatus="status">
            		        <div class="l_row l_histBox">
            			        <div class="rcordDt l_column">${hist.rcordDt}</div>
            			        <div class="histSe l_column">${hist.histSeTable}-${hist.histSeExec}</div>
            			        <div class="code l_column">${hist.seCode}</div>
            			        <div class="history l_column">${hist.histBrief}</div>
            			        <div class="vochrCode l_column">
            			            <c:if test="${hist.histSeTable == 'VOCHR'}">
            			                ${hist.contents.vochrCode}
            			            </c:if>
            			            <c:if test="${hist.histSeTable == 'SETLE'}">
            			                ${hist.contents.vochrCode}
            			            </c:if>
            			        </div>
            			        <div class="delngCode l_column">
            			            <c:if test="${hist.histSeTable == 'COIN_REPOSITORY'}">
            			                ${hist.contents.delngCode}
            			            </c:if>
            			        </div>
            			        <div class="setleCode l_column">
            			            <c:if test="${hist.histSeTable == 'SETLE'}">
            			                ${hist.contents.resveSetleCode}
            			            </c:if>
            			            <c:if test="${hist.histSeTable == 'COIN_REPOSITORY'}">
            			                ${hist.contents.setleCode}
            			            </c:if>
            			            <c:if test="${hist.histSeTable == 'REFND'}">
            			                ${hist.contents.setleCode}
            			            </c:if>
            			        </div>
            			        <div class="mberCode l_column">
            			            <c:if test="${hist.histSeTable == 'VOCHR'}">
            			                ${hist.contents.mberCode}
            			            </c:if>
            			            <c:if test="${hist.histSeTable == 'RESVE_SETLE'}">
            			                ${hist.contents.mberCode}
            			            </c:if>
            			            <c:if test="${hist.histSeTable == 'COIN_REPOSITORY'}">
            			                ${hist.contents.mberCode}
            			            </c:if>
            			            <c:if test="${hist.histSeTable == 'WALLET_DTLS'}">
            			                ${hist.contents.mberCode}
            			            </c:if>
            			        </div>
            			        <div class="delngDt l_column">
            			            <c:if test="${hist.histSeTable == 'COIN_REPOSITORY'}">
            			                ${hist.contents.delngDt}
            			            </c:if>
            			        </div>
            			        <div class="delngSe l_column">
            			            <c:if test="${hist.histSeTable == 'COIN_REPOSITORY'}">
            			                ${hist.contents.delngSe}
            			            </c:if>
            			        </div>
            			        <div class="delngAmount l_column">
            			            <c:if test="${hist.histSeTable == 'COIN_REPOSITORY'}">
            			                ${hist.contents.delngAmount}
            			            </c:if>
            			        </div>
            			        <div class="repositoryCoinCo l_column">
            			            <c:if test="${hist.histSeTable == 'COIN_REPOSITORY'}">
            			                ${hist.contents.repositoryCoinCo}
            			            </c:if>
            			        </div>
            			        <div class="rcppayDt l_column">
            			            <c:if test="${hist.histSeTable == 'WALLET_DTLS'}">
            			                ${hist.contents.rcppayDt}
            			            </c:if>
            			        </div>
            			        <div class="rcppayCl l_column">
            			            <c:if test="${hist.histSeTable == 'WALLET_DTLS'}">
            			                ${hist.contents.rcppayCl}
            			            </c:if>
            			        </div>
            			        <div class="rcppayAmount l_column">
            			            <c:if test="${hist.histSeTable == 'WALLET_DTLS'}">
            			                ${hist.contents.rcppayAmount}
            			            </c:if>
            			        </div>
            			        <div class="excngCoinCo l_column">
            			            <c:if test="${hist.histSeTable == 'WALLET_DTLS'}">
            			                ${hist.contents.excngCoinCo}
            			            </c:if>
            			        </div>
            			        <div class="coinCo l_column">
            			            <c:if test="${hist.histSeTable == 'WALLET_DTLS'}">
            			                ${hist.contents.coinCo}
            			            </c:if>
            			        </div>
            			        <div class="vochrPrice l_column">
            			            <c:if test="${hist.histSeTable == 'VOCHR'}">
            			                ${hist.contents.vochrPrice}
            			            </c:if>
            			        </div>
            			        <div class="mealPrearngeDt l_column">
            			            <c:if test="${hist.histSeTable == 'VOCHR'}">
            			                ${hist.contents.mealPrearngeDt}
            			            </c:if>
            			        </div>
            			        <div class="vochrRegistDt l_column">
            			            <c:if test="${hist.histSeTable == 'VOCHR'}">
            			                ${hist.contents.vochrRegistDt}
            			            </c:if>
            			        </div>
            			        <div class="mealTime l_column">
            			            <c:if test="${hist.histSeTable == 'VOCHR'}">
            			                ${hist.contents.mealTime}
            			            </c:if>
            			        </div>
            			        <div class="delngAt l_column">
            			            <c:if test="${hist.histSeTable == 'VOCHR'}">
            			                ${hist.contents.delngAt}
            			            </c:if>
            			        </div>
            			        <div class="setlePc l_column">
            			            <c:if test="${hist.histSeTable == 'SETLE'}">
            			                ${hist.contents.setlePc}
            			            </c:if>
            			        </div>
            			        <div class="setleDt l_column">
            			            <c:if test="${hist.histSeTable == 'SETLE'}">
            			                ${hist.contents.setleDt}
            			            </c:if>
            			        </div>
            			        <div class="setleAt l_column">
            			            <c:if test="${hist.histSeTable == 'SETLE'}">
            			                ${hist.contents.setleDt}
            			            </c:if>
            			        </div>
            			        <div class="purchsDcsnAt l_column">
            			            <c:if test="${hist.histSeTable == 'SETLE'}">
            			                ${hist.contents.purchsDcsnAt}
            			            </c:if>
            			        </div>
            			        <div class="refndReqstAt l_column">
            			            <c:if test="${hist.histSeTable == 'SETLE'}">
            			                ${hist.contents.refndReqstAt}
            			            </c:if>
            			        </div>
            			        <div class="refndPc l_column">
            			            <c:if test="${hist.histSeTable == 'REFND'}">
            			                ${hist.contents.refndPc}
            			            </c:if>
            			        </div>
            			        <div class="refndDt l_column">
            			            <c:if test="${hist.histSeTable == 'REFND'}">
            			                ${hist.contents.refndDt}
            			            </c:if>
            			        </div>
            			        <div class="refndAt l_column">
            			            <c:if test="${hist.histSeTable == 'REFND'}">
            			                ${hist.contents.refndAt}
            			            </c:if>
            			        </div>
            			        <div class="refndResn l_column">
            			            <c:if test="${hist.histSeTable == 'REFND'}">
            			                ${hist.contents.refndResn}
            			            </c:if>
            			        </div>
            		        </div>
            		    </c:forEach>
            		    <div>
						    <input type="hidden" name="start" value=""> 
							<input type="hidden" name="cnt" value="">
							<input type="hidden" name="startRcordDt" value="">
							<input type="hidden" name="endRcordDt" value="">
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