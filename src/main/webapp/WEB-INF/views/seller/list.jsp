<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/seller/list.css" rel="stylesheet" type="text/css">
<title>판매자 목록</title>
<script>
$(document).ready(function() {
	$('#toTheMoon').hide();

	var availableList = new Array();

	<c:forEach items="${tagNameList}" var="tagName">
	availableList.push("${tagName}");
	</c:forEach>

	$("#search_input").autocomplete({
		source : availableList,
		focus : function(event, ui) {
			return false;
		}
	});

	$('#age_slider').slider({
		min : 0,
		max : 100,
		step : 1,
		values : [ 0, 100 ],
		slide : function(event, ui) {
			var text = '<h5>' + ui.value + '</h5>';
			$(ui.handle).html(text);
			$("input[name='ageMin']").val(ui.values[0]);
			$("input[name='ageMax']").val(ui.values[1]);
		}
	});

	$('#price_slider').slider({
		min : 0,
		max : 10000,
		step : 100,
		values : [ 0, 10000 ],
		slide : function(event, ui) {
			var text = '<h5>' + ui.value + '</h5>';
			$(ui.handle).html(text);
			$("input[name='priceMin']").val(ui.values[0]);
			$("input[name='priceMax']").val(ui.values[1]);
		}
	});

	$("#filter_btn").click(function() {
				var filtermenu = $(document).find("#filter_container");
				if (filtermenu.is(":visible")) {
					filtermenu.slideUp(250);
				} else {
					filtermenu.slideDown(250);
				}

			})

	var img;

	var selerImgAll = document
			.querySelectorAll(".seler_img");

	function imageChange() {
		let count = 2;
		let mberCode = this.querySelector("#code").value;
		let maxCount = parseInt(this.querySelector("#imgListSize").value);
		let imgId = '#img' + mberCode;
		img = this.querySelector(imgId);

		srcArray = new Array(parseInt(maxCount));

		for (var i = 1; i <= srcArray.length; i++) {
			srcArray[i - 1] = this.querySelector("input[id='" + i + "']").value;
		}

		interval = setInterval(function() {
			if (count == (maxCount + 1)) {count = 1;}
			img.src = "/LifeMenu/display?fileName=" + srcArray[count - 1];
			count++;
		}, 800);

	}
	;
	function imageChangeStop() {
		clearInterval(interval);
		img.src = "/LifeMenu/display?fileName=" + srcArray[0];
	}

	for (var i = 0; i < selerImgAll.length; i++) {
		selerImgAll[i].addEventListener("mouseover", imageChange);
		selerImgAll[i].addEventListener("mouseout", imageChangeStop);
	}

	function downScroll() {
		let scroll = $('#result_list');
		let height = document.querySelector("#result_list").scrollHeight;

		scroll.animate({scrollTop : height}, 900);
	}

	function upScroll() {
		let scroll = $('#result_list');
		scroll.animate({scrollTop : 0}, 300);
	}

	$('#toTheMoon').click(function() {
		upScroll();
	})

	$('#add_btn').click(function() {

		// criteria
		var pageNum = parseInt($(
				"input[name='changedPageNum']")
				.val()) + 1;
		var amount = "<c:out value='${criteria.amount}'/>";
		//sellerConditionDto
		var tagName = "<c:out value='${con.tagName}'/>";
		var ageMax = "<c:out value='${con.ageMax}'/>";
		var ageMin = "<c:out value='${con.ageMin}'/>";
		var priceMax = "<c:out value='${con.priceMax}'/>";
		var priceMin = "<c:out value='${con.priceMin}'/>";
	
		var data = "pageNum=" + pageNum
				 + "&amount=" + amount
				 + "&tagName=" + tagName
				 + "&ageMax=" + ageMax
				 + "&ageMin=" + ageMin
				 + "&priceMax=" + priceMax
				 + "&priceMin=" + priceMin;
	
		$.ajax({
			url : "/LifeMenu/seller/listByAjax?"
					+ data,
			type : "get",
			success : function(data) {
				var obj = JSON.parse(data);
				$("input[name='changedPageNum']").val(obj.pageNum);
				var list = obj.sellerList;
				var result = $('#result tbody');
				var blockSet = "<tr>";
				for (var i = 0; i < list.length; i++) {
					let block = "";
					if (i == 5) {
						block += "</tr><tr>";
					}
					var seler = list[i];
					block += "<td>";
		
					if (seler.selerImageList.length > 0) {
						block  += "<div class='seler_img'>"
								+ "<input type='hidden' id='code' value='" + seler.mberCode + "'>"
								+ "<a href='/LifeMenu/seller/show/" + seler.mberCode + "'>"
								+ "<img id='img"
								+ seler.mberCode
								+ "' src='/LifeMenu/display?fileName="
								+ seler.selerImageList[0]
								+ "'>"
								+ "</a>"
								+ "<input id='imgListSize' type='hidden' value='" + seler.selerImageList.length + "'>";
						for (var j = 0; j < seler.selerImageList.length; j++) {
							block  += "<input id='"
									+ (j + 1)
									+ "'"
									+ "type='hidden' value='"
									+ seler.selerImageList[j]
									+ "'>";
						}
						block += "</div>";
					}
		
					block  += "<div class='subtitle'><div class='firstSub'>"
							+ seler.mberNcnm
							+ "("
							+ seler.selerAge
							+ ")"
							+ "</div><div class='secondSub'>"
							+ seler.selerOccp
							+ "</div><div class='thirdSub'>"
							+ seler.avgPrice
							+ " <span class='money'><i class='far fa-copyright'></i></span></div></div></td>";
		
					blockSet += block;
				}
				blockSet += "</tr>";
				result.append(blockSet);
		
				selerImgAll = document.querySelectorAll(".seler_img");
		
				for (var i = 0; i < selerImgAll.length; i++) {
					selerImgAll[i].addEventListener("mouseover",imageChange);
					selerImgAll[i].addEventListener("mouseout",imageChangeStop);
				}
		
				if (list.length != 10) {
					$('#add_btn').hide();
					$('#toTheMoon').show();
				}
		
				let scroll = document.querySelector("#result_list");
		
				downScroll();
			},
		error : function() {
			alert("error!");
		}
		});
	});
});
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
				<div id="search_box">
					<div><input type="hidden" name="changedPageNum" value="${ criteria.pageNum }"></div>
					<div>
						<form method="get" name="search" action="/LifeMenu/seller/result">
							<div id="input_box">
								<input type="text" name="tagName" placeholder="검색어를 입력하세요" id="search_input" value="" /> 
								<input type="hidden" name="searchedTagName" value="${ con.tagName }"> 
								<input type="hidden" name="pageNum" value="1">
								<input type="hidden" name="amount" value="${ criteria.amount }">
								<input type="hidden" name="ageMax" value="${ con.ageMax }">
								<input type="hidden" name="ageMin" value="${ con.ageMin }">
								<input type="hidden" name="priceMax" value="${ con.priceMax }">
								<input type="hidden" name="priceMin" value="${ con.priceMin }">
								<button type="button" id="filter_btn">
									<i class="fas fa-filter"></i>
								</button>
								<button type="submit" id="search_btn">
									<i class="fas fa-search"></i>
								</button>
							</div>
							<div id="filter_container">
								<table>
									<tr>
										<td>나이 :</td>
										<td><div id="age_slider" class="slider"></div></td>
									</tr>
									<tr>
										<td>가격 :</td>
										<td><div id="price_slider" class="slider"></div></td>
									</tr>
								</table>
							</div>
						</form>
					</div>
					<div></div>
				</div>
				<div id="result_list">
					<c:if test="${ not empty sellerList }">
						<table id="result">
							<c:forEach var="seller" items="${ sellerList }"
								varStatus="sellerStatus">
								<c:if test="${ 0 == (sellerStatus.count % 6) || 1 == sellerStatus.count}">
									<tr>
								</c:if>
								<td>
									<div class="seler_img">
										<input type="hidden" id="code" value="${ seller.mberCode }">
										<c:if test="${ fn:length(seller.selerImageList) > 0}">
											<a href="/LifeMenu/seller/show/${ seller.mberCode }">
											<img id="img${ seller.mberCode }" src="/LifeMenu/display?fileName=${ seller.selerImageList[0] }">
											</a>
											<input id="imgListSize" type="hidden" value="${fn:length(seller.selerImageList)}">
											<c:forEach var="sellerImage" items="${ seller.selerImageList }" varStatus="status">
												<input id="${ status.count }" type="hidden" value="${ sellerImage }">
											</c:forEach>
										</c:if>
									</div>
									<div class="subtitle">
										<div class="firstSub">${ seller.mberNcnm }(${ seller.selerAge })</div>
										<div class="secondSub">${ seller.selerOccp }&nbsp</div>
										<div class="thirdSub">${ seller.avgPrice } <span class="money"><i class="far fa-copyright"></i></span></div>
									</div>
								</td>
							</c:forEach>
						</table>
						<c:if test="${ 10 == sellerList.size() }">
							<div id="add_list">
								<i class="fas fa-chevron-circle-down add_list_btns" id="add_btn"></i>
								<i class="fas fa-chevron-circle-up add_list_btns" id="toTheMoon"></i>
							</div>
						</c:if>
					</c:if>
					<c:if test="${ empty sellerList }">
						<h4>검색 결과가 없습니다.</h4>
					</c:if>
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