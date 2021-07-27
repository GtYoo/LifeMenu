<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 정보 등록</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/seller/register.css" rel="stylesheet" type="text/css">
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
			thumCnt++;
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "thumbnail");
			if (((thumCnt - 1) % 3) == 0 || thumCnt == 1) {
				document.querySelector("#image_table").appendChild(document.createElement("tr"));
			}
			document.querySelector("#image_table").appendChild(document.createElement("td"));
			document.querySelector("#image_table").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

	function add() {
		if (imageCnt == 6) {
			alert("이미지는 최대 6개 까지만 업로드 가능합니다.")
			return;
		}
		var input = document.createElement("input");
		input.setAttribute("type", "file");
		input.setAttribute("name", "uploadFile");
		input.setAttribute("accept", "image/*");
		input.setAttribute("onchange", "setThumbnail(event);");
		document.querySelector("#upload_container").appendChild(document.createElement("tr"));
		document.querySelector("#upload_container").appendChild(document.createElement("td"));
		document.querySelector("#upload_container").appendChild(input);
		imageCnt++;
	}

	function captureReturnKey(e) {
		if (e.keyCode == 13 && e.srcElement.type != 'textarea')
			return false;
	}

	$(document).ready(function() {
		var tagCount = 1;

		$('#reset').click(function() {
			$("#image_table").empty();
			$('#upload_container').empty();
			imageCnt = 0;
			thumCnt = 0;
		})

		$('#imageReset').click(function() {
			$("#image_table").empty();
			$('#upload_container').empty();
			imageCnt = 0;
			thumCnt = 0;
		})

		$('#addTag').click(function() {
			if (tagCount == 3) {
				alert("태그는 최대 3개까지만 가능합니다");
				return;
			}

			document.querySelector("#tagBox tbody").appendChild(document.createElement("tr"));
			document.querySelector("#tagBox tbody tr:last-child").appendChild(document.createElement("td"));

			tagCount++;

			let tagCodeList = new Array();
			let tagNameList = new Array();

			<c:forEach var="tag" items="${tagList}">
			tagCodeList.push("${tag.tagCode}");
			tagNameList.push("${tag.tagNm}");
			</c:forEach>

			let select = document.createElement("select");
			select.setAttribute("name",
					"tagList");

			document.querySelector("#tagBox tbody tr:last-child td").appendChild(select);

			for (let i = 0; i < tagCodeList.length; i++) {
				let option = document.createElement("option");
				option.setAttribute("value",tagCodeList[i]);
				option.setAttribute("id",tagCount + "option" + tagCodeList[i]);
				document.querySelector("#tagBox tbody tr:last-child td select").appendChild(option);
				document.getElementById(tagCount + "option" + tagCodeList[i]).innerText = tagNameList[i];
			}
	});
});
</script>
</head>
<body>
	<div id="frameOut">
		<div id="frameIn">
			<div class="sub_logo">
				<a href="/LifeMenu/seller/list"><img
					src="${path}/resources/img/logoB.png" class="mlogo" alt=""></a>
			</div>
			<header id="header">
				<jsp:include page="${request.contextPath}/header"></jsp:include>
			</header>
			<div id="content">
				<div id="content_container">
					<div id="regist_container">
						<h1>판매자 등록</h1>
						<form method="post" name="register"
							action="/LifeMenu/seller/register" enctype="multipart/form-data" onsubmit="return checkDupl();"
							onkeydown="return captureReturnKey(event)">
							<table id="image_table">
								<tr>
									<td></td>
								</tr>
							</table>
							<table id="information">
								<tr>
									<td><input type="hidden" name="mberCode"
										value="${ mberCode }"></td>
								</tr>
								<tr>
									<td>직업 :</td>
									<td><input type="text" name="selerOccp"></td>
								</tr>
								<tr>
									<td>자기소개 :</td>
									<td><input type="text" name="selerSelfIntrcn"></td>
								</tr>
								<tr>
									<td>명언 :</td>
									<td><input type="text" name="selerAprsm"></td>
								</tr>
								<tr>
									<td>경력사항 :</td>
									<td><textarea name="selerCareer"></textarea></td>
								</tr>
								<tr>
									<td>학력사항 :</td>
									<td><textarea name="selerAcdmcr"></textarea></td>
								</tr>
								<tr>
									<td>거주지역 :</td>
									<td><input type="text" name="selerResdnc"></td>
								</tr>
							</table>
							<table id="tag_container">
								<tr>
									<td>태그 :</td>
									<td>
										<table id="tagBox">
											<tr>
												<td><select name="tagList">
														<c:forEach var="tag" items="${ tagList }">
															<option value="${ tag.tagCode }">${ tag.tagNm }</option>
														</c:forEach>
												</select></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<input type="button" id="addTag" value="태그 추가하기"> <br>
							<br>
							<br>
							<br>
							<table id="image_btns">
								<tr>
									<td><input type="button" name="imageReset" value="사진 비우기" id="imageReset"> 
									<input type="button" name="addUpload" value="사진추가하기" onclick="add()"></td>
								</tr>
							</table>
							<table id="upload_container">
							</table>
							<table id="btns">
								<tr>
									<td><input type="reset" value="초기화" id="reset" class="btn"></td>
									<td><input type="submit" value="등록" class="btn"></td>
								</tr>
							</table>
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