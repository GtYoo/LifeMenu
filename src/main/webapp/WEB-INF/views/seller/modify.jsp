<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 정보 수정</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/seller/modify.css" rel="stylesheet" type="text/css">
<script>
var imageCnt = 0;
var thumCnt = 0;

function checkDupl() {
	let temp	= [];
	let obj		= $('select[name="tagList"]');
	let result	= false;
	var x = 0;
	
	$(obj).each(function(i) {
		temp[i] = $(this).val();
	});
	
	$(temp).each(function(i) {
		$(obj).each(function(j) {
			if(temp[i] == $(this).val()) {
				if( i != j ){
					x++;
				}
			}
		});
	});
	
	if(x > 1) {
		alert('동일한 태그가 존재합니다.');
		result = false;
	}
	else {
		result = true;
	}
	
	return result;
}

function setThumbnail(event) {
	var reader = new FileReader();
	reader.onload = function(event) {
		if(thumCnt == 3) {
			document.querySelector("#thum_box").appendChild(document.createElement("br"));
		} 
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "thumbnail");
		document.querySelector("#thum_box").appendChild(img);
		thumCnt++;
	};
	reader.readAsDataURL(event.target.files[0]);
}

$(document).ready(function() {
	
	document.getElementById("seller_career").value = document.getElementById("seller_career").value.replaceAll("<br>", "");
	document.getElementById("seller_acdmcr").value = document.getElementById("seller_acdmcr").value.replaceAll("<br>", "");
	document.getElementById("selfint").value = document.getElementById("selfint").value.replaceAll("<br>", "");
	
	$('#seller_acdmcr').hide();
	$('#img_box').hide();
	
	$('#ac').click(function() {
		$('#seller_career').hide();
		$('#ac').css("background-color", "black");
		$('#sc').css("background-color", "lightgray");
		$('#seller_acdmcr').show();
	});
	
	$('#sc').click(function() {
		$('#seller_acdmcr').hide();
		$('#sc').css("background-color", "black");
		$('#ac').css("background-color", "lightgray");
		$('#seller_career').show();
	})
	
	$('#sc').css("background-color", "black");
	
	$('#plus').click(function() {
		$('#img_box').show();
		$('.slider').hide();
		
		if (imageCnt == 6) {
			alert("이미지는 최대 6개 까지만 업로드 가능합니다.")
			return;
		}
		let input = document.createElement("input");
		input.setAttribute("type", "file");
		input.setAttribute("name", "uploadFile");
		input.setAttribute("class", "imgfile");
		input.setAttribute("accept", "image/*");
		input.setAttribute("onchange", "setThumbnail(event);");
		document.querySelector("#img_box").appendChild(input);
		imageCnt++;
	})
	
	$('#minus').click(function() {
		$('#img_box').empty();
		$('#thum_box').empty();
		thumCnt = 0;
		imageCnt = 0;
	})
	
	$('#reset').click(function() {
		$('.slider').show();
		$('#img_box').empty();
		$('#thum_box').empty();
		thumCnt = 0;
		imageCnt = 0;
	})
	
	var tagCount = "${tagList.size()}";
	
	$('#tagAdd').click(function() {
		if (tagCount == 3) {
			alert("태그는 최대 3개까지만 가능합니다");
			return;
		}
		tagCount++;
		
		let tagCodeList = new Array();
		let tagNameList = new Array();
		
		<c:forEach var="tag" items="${existentTagList}">
		tagCodeList.push("${tag.tagCode}");
		tagNameList.push("${tag.tagNm}");
		</c:forEach>
		
		let select = document.createElement("select");
		select.setAttribute("name","tagList");
		document.querySelector("#tag_box").appendChild(select);
		
		for (let i = 0; i < tagCodeList.length; i++) {
			let option = document.createElement("option");
			option.setAttribute("value",tagCodeList[i]);
			option.setAttribute("id",tagCount+ "option"+ tagCodeList[i]);
			document.querySelector("#tag_box select:last-child").appendChild(option);
			document.getElementById(tagCount + "option" + tagCodeList[i]).innerText = tagNameList[i];
		}
	})
})	
</script>
</head>
<body>
	<div id="frameOut">
		<div id="frameIn">
			<div class="sub_logo">
				<a href="/LifeMenu/seller/list">
				<img src="${path}/resources/img/logoB.png" class="mlogo" alt=""></a>
			</div>
			<header id="header">
				<jsp:include page="${request.contextPath}/header"></jsp:include>
			</header>
			<div id="content">
				<div id="content_container">
						<h1>판매자 정보</h1>
						<div class="slider">
							<c:forEach var="i" begin="1" end="${ sellerImageList.size() }">
								<c:if test="${ i==1 }">
									<input class="radio" type="radio" name="slide" id="slide1"
										checked>
								</c:if>
								<c:if test="${ i!=1 }">
									<input class="radio" type="radio" name="slide" id="slide${ i }">
								</c:if>
							</c:forEach>
							<ul id="imgholder" class="imgs">
								<c:forEach var="image" items="${ sellerImageList }">
									<li><img src="/LifeMenu/display?fileName=${ image }"></li>
								</c:forEach>
							</ul>
							<div class="bullets">
								<c:forEach var="i" begin="1" end="${ sellerImageList.size() }">
									<label for="slide${ i }">&nbsp;</label>
								</c:forEach>
							</div>
						</div>
						<form method="post" action="/LifeMenu/seller/modify" enctype="multipart/form-data" onsubmit="return checkDupl();"
							onkeydown="return captureReturnKey(event)">
						<div id="career_container">
							<div id="career_btn">
							<input type="button" class="cBtns" id="sc" value="경력사항">
							<input type="button" class="cBtns" id="ac" value="학력사항">
							</div>
							<div id="career">
								<textarea id="seller_career" name="selerCareer">${ seler.selerCareer }</textarea> 
								<textarea id="seller_acdmcr" name="selerAcdmcr">${ seler.selerAcdmcr }</textarea> 
							</div>
						</div>
						<div id="detail_container">
							<button type="button" id="tagAdd"><i class="fas fa-plus"></i></button>
							<div id="img_container">
								<div id="thum_box">
								</div>
								<div id="img_box">
								</div>
								<div id="img_btns">
								<div id="reset"><button type="button"><i class="fas fa-undo-alt"></i></button></div>
								<div id="plus"><button type="button"><i class="fas fa-plus"></i></button></div>
								<div id="minus"><button type="button"><i class="fas fa-minus"></i></button></div>
								</div>
							</div>
							<table>
								<tr>
									<td>
										닉네임 :
									</td>
									<td>
										${ mberNcnm }
									</td>
								</tr>
								<tr>
									<td>
										나이 :
									</td>
									<td>
										<input type="number" name="selerAge" class="det" value="${ seler.selerAge }">
									</td>
								</tr>
								<tr>
									<td>
										직업 :
									</td>
									<td>
										<input type="text" name="selerOccp" class="det" value="${ seler.selerOccp }">
									</td>
								</tr>
								<tr>
									<td>
										거주지 :
									</td>
									<td>
										<input type="text" name="selerResdnc" class="det" value="${ seler.selerResdnc }">
									</td>
								</tr>
								<tr>
									<td>
										태그 : 
									</td>
									<td>
										<div id="tag_box">
										<c:forEach var="tag" items="${ tagList }">
											<select name="tagList">
												<c:forEach var="extag" items="${ existentTagList }">
													<c:if test="${ tag.tagCode == extag.tagCode }">
														<option value="${ extag.tagCode }" selected>${ extag.tagNm }</option>
													</c:if>
													<c:if test="${ !(tag.tagCode == extag.tagCode) }">
														<option value="${ extag.tagCode }">${ extag.tagNm }</option>
													</c:if>
												</c:forEach>
											</select>
										</c:forEach>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										명언 :
									</td>
									<td>
										<input type="text" name="selerAprsm" class="det" value="${ seler.selerAprsm }">
									</td>
								</tr>
								<tr>
									<td>
										자기소개 :
									</td>
									<td>
										<textarea name="selerSelfIntrcn" id="selfint">${ seler.selerSelfIntrcn }</textarea>
									</td>
								</tr>
							</table>
						</div>
						<input type="reset" value="리셋" id="reset_btn"/>
						<input type="submit" value="수정완료" id="modifyDo_btn"/>
						</form>	
				</div>
			</div>
			<footer id="footer">
			<jsp:include page="${request.contextPath}/footer"></jsp:include>
        </footer>
		</div>
	</div>
</body>
</html>