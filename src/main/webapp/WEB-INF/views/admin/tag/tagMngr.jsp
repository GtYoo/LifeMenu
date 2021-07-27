<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- ver.1.0.5 -->

<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/img/logoD.png" rel="shortcut icon" type="image/x-icon">
<link href="${path}/resources/css/common.css?ver=1" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin/admin-menu-ver.1.1.0.css?ver=2" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin/admin-tag-ver.1.0.0.css?ver=3" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/admin/column-width.css?ver=4" rel="stylesheet" type="text/css">

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
	// 태그 등록 버튼
	var insertTagToggle = 0;
	$('.insertTagForm').hide();
	$("input[name='insertTag']").click(function(){
		if (insertTagToggle%2 == 0){
			$('.insertTagForm').show();
			insertTagToggle++;
		}
		else {
			$('.insertTagForm').hide();
			insertTagToggle++;
		}
	});
	// 초기화(리셋) 버튼
	$("#resetTagBtn").click(function(){
		$("input[name='tagName']").val("");
		$("input[name='uploadFile']").val("");
		$("#preview-image").attr("src", "resources/tagImg/noImage.png");
	});
	// 태그 이미지 등록 버튼
	$("input[name='uploadFile']").change(function(){
		var i = 0;
		if(this.files[i]){
			var reader = new FileReader();
			reader.onload = function(e){
				var img = $('#preview-image');
				img.attr('src', e.target.result);
			}
			reader.readAsDataURL(this.files[i]);
		}
	});
/*	// 수정 버튼 처리
	$(".modifyBtn").each(function(i, e){
		$(this).click(function(){
			$(".updateBtn").eq(i).show();
			$(".cancelBtn").eq(i).show();
			$(".deleteBtn").eq(i).hide();
			$(".tagNm-data").eq(i).attr("readonly", false);
			$(".imageAdres-data").eq(i).attr("disabled", false);
			$(this).hide();
		});
	});
	// 취소 버튼 처리
	$(".cancelBtn").each(function(i, e){
		$(this).click(function(){
			$(".updateBtn").eq(i).hide();
			$(".deleteBtn").eq(i).show();
			$(".modifyBtn").eq(i).show();
			$(".tagNm-data").eq(i).attr("readonly", true);
			$(".imageAdres-data").eq(i).val("");
			$(".imageAdres-data").eq(i).attr("disabled", true);
			$(".imageIcon").src("resources/tagImg/noImage.png");
			$(this).hide();
		});
	});
	// 수정 확인 버튼 처리
	$(".updateBtn").each(function(i, e){
		$(this).click(function(){
			$("input[name='tagCode']").val($(".tagCode-data").eq(i).val());
			$("input[name='tagNm']").val($(".tagNm-data").eq(i).val());
		});
	});
*/
	// 삭제 버튼 처리
	$(".deleteBtn").each(function(i, e){
		$(this).click(function(){
			
			var tagCode = $(".tagCode-data").eq(i).val();
			var tagNm = $(".tagNm-data").eq(i).val();
			
			$("input[name='tagCode']").val(tagCode);
			$("input[name='tagNm']").val(tagNm);
			
			console.log("tagCode = "+$("input[name='tagCode']").val());
			console.log("tagNm = "+$("input[name='tagCode']").val());
			
		});
	});
	$(".imageAdres-data").each(function(i, e){
		$(this).change(function(){
			if(this.files[i]){
				var reader = new FileReader();
				reader.onload = function(e){
					var img = $(".imageIcon").eq(i);
					img.attr('src', e.target.result);
				}
			}
			reader.readAsDataURL(this.files[i]);
		});
	});
	$(".updateBtn").hide();
	$(".cancelBtn").hide();
	
	/* 페이지 처리 */
	var pageHtml = {
			firstHtml: "",
			beforeHtml: "",
			pagesHtml: "",
			nextHtml: "",
			lastHtml: ""
	};
	page("tagMngr", total, conditionParam, pageHtml);
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
        	<form method="POST" enctype="multipart/form-data">
	            <div class="box-wrap">
	            	<div class="title box">
	            		<h2>태그 관리</h2>
	            	</div>
	            	<div class="search box">
	            		<div class="home s_box">
	            			<a href="adminMain.do">홈으로</a>
	            		</div>
	            		<div class="combo s_box">
	            			<select name="conditionType">
	            				<option value="TAG_CODE" selected="selected">태그코드</option>
	            				<option value="TAG_NM">태그명</option>
	            			</select>
	            		</div>
	            		<div class="search_text s_box">
	            			<input type="text" name="condition" value="" placeholder="@검색어를 입력하세요" size="80">
	            		</div>
	            		<div class="search_btn s_box">
	            			<input type="submit" name="searchBtn" value="검색" formaction="tagMngrCondition.do">
	            		</div>
	            		<div class="insert_btn s_box">
	            			<input type="button" name="insertTag" value="태그등록">
	            		</div>
	            	</div>
	            	<div class="insertTagForm box">
	            		<div class="tagNmTitle f_box">태그명</div>
	            		<div class="tagNmInput f_box"><input type="text" name="tagName" value="" size="20"></div>
	            		<div class="imageAdresTitle f_box">태그이미지</div>
	            		<div class="f_box">
	            		    <div class="fileRegist">
		            			<input type="file" name="uploadFile" accept="image/*">
		            			<div id="imagePreview">
		            			    <img style="width:40px; height:40px;" id="preview-image" src="${path}/resources/tagImg/noImage.png">
		            			</div>
	            			</div>
	            		</div>
	            		<div class="f_box"><input type="submit" id="insertTagBtn" value="등록" formaction="insertTagMngr.do"></div>
	            		<div class="f_box"><input type="button" id="resetTagBtn" value="취소"></div>
	            	</div>
	            	<div class="list box">
	            		<div class="l_title l_box">
	            			<div class="tagCode l_column">태그 번호</div>
	            			<div class="tagNm l_column">태그명</div>
	            			<div class="imageAdres l_column">이미지</div>
	            			<div class="tagReadCnt l_column">조회수</div>
	            			<div class="etc2 l_column">비고</div>
	            		</div>
	            		<c:if test="${fn:length(LIST) == 0}">
	            		    <div class="l_row l_box">
	            		        <div class="no_data">조회된 데이터가 없습니다</div>
	            		    </div>
	            		</c:if>
	            		<c:forEach var="tag" items="${LIST}" varStatus="status">
	            			<div class="l_row l_box">
	            			    <div class="tagCode l_column">
	            			        <input type="text" class="tagCode-data" value="${tag.tagCode}" readonly />
	            			    </div>
	            			    <div class="tagNm l_column">
	            			        <input type="text" class="tagNm-data" value="${tag.tagNm}" readonly />
	            			    </div>
	            			    <div class="imageAdres l_column">
	            			        <div class="fileRegist">
	            			            <input type="file" class="imageAdres-data" name="imageAdres" value="${tag.imageAdres}" disabled>
	            			            <c:if test="${fn:substring(tag.imageAdres, 0, 9) == 'resources'}">
	            			                <img class="imageIcon" src="${tag.imageAdres}" width="40" height="40">
	            			            </c:if>
	            			            <c:if test="${fn:substring(tag.imageAdres, 0, 9) != 'resources'}">
	            			                <img class="imageIcon" src="${path}/display?fileName=${tag.imageAdres}" width="40" height="40">
	            			            </c:if>
	            			        </div>
	            			    </div>
	            			    <div class="tagReadCnt l_column">${tag.tagReadCnt}</div>
	            			    <div class="etc2 l_column">
	            			    	<!-- 
	            			        <input type="button" class="modifyBtn" value="수정">
	            			        <input type="submit" class="updateBtn" value="수정완료" formaction="updateTagMngr.do">
	            			         -->
	            			        <input type="submit" class="deleteBtn" value="삭제" formaction="deleteTagMngr.do">
	            			        <!-- 
	            			        <input type="button" class="cancelBtn" value="취소">
	            			         -->
	            			    </div>
	            		    </div>
	            		</c:forEach>
	            		<div>
	            		    <input type="hidden" name="tagCode" value="">
	            		    <input type="hidden" name="tagNm" value="">
	            		    <input type="hidden" name="imageAdresIndex" value=""><!-- 수정 처리용(사용x) -->
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