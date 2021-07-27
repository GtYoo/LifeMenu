<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 정보</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<script type="text/javascript" src="${path}/resources/js/seller/show.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/seller/show.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script>
	google.charts.load('current', {
		'packages' : [ 'line', 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	google.charts.setOnLoadCallback(drawChart2);
	
	function drawChart2() {
        var data2 = google.visualization.arrayToDataTable([
          ['ageGroup', 'amount'],
          <c:forEach var="i" items="${ageGroupMap}">
          ['${i.key}', parseInt('${i.value}')],
		  </c:forEach>
        ]);

      var options2 = {
        legend: 'none',
        pieSliceText: 'label',
        pieStartAngle: 100,
        backgroundColor: 'transparent',
        chartArea: {width:'80%',height:'80%'},
        fontSize: 17,
        fontName:'Arial',
        bold: true
      };

        var chart2 = new google.visualization.PieChart(document.getElementById('age_group_chart'));
        chart2.draw(data2, options2);
      }

	function drawChart() {

		var chartDiv = document.getElementById('chart_div');

		var data = new google.visualization.DataTable();
		data.addColumn('date', '식사 일시');
		data.addColumn('number', "가격");

		let mealDtList = new Array();
		let priceList = new Array();
		let pLength = "${sellersVoucherPrice.size()}";

		<c:forEach var="price" items="${sellersVoucherPrice}">
		mealDtList.push("${price.mealPrearngeDt}");
		priceList.push(parseInt("${price.vochrPrice}"));
		</c:forEach>

		let rows = new Array();

		for (let i = 0; i < pLength; i++) {
			rows.push([new Date(mealDtList[i].substring(0, 4),
							parseInt(mealDtList[i].substring(4, 6)) - 1,
							mealDtList[i].substring(6, 8), mealDtList[i].substring(8, 10), mealDtList[i].substring(10, 12)), priceList[i] ]);
		}

		data.addRows(rows);

		var materialOptions = {
			chart : {},
			series : {
				// Gives each series an axis name that matches the Y-axis below.
				0 : {
					axis : 'Temps',
					color : 'darkorange'
				}
			},
			axes : {
				// Adds labels to each axis; they don't have to match the axis names.
				y : {
					Temps : {
						label : '가격'
					},
				}
			}
		};

		function drawMaterialChart() {
			var materialChart = new google.charts.Line(chartDiv);
			materialChart.draw(data, materialOptions);
		}

		drawMaterialChart();

	}
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
					<div id="image_container">
						<c:forEach var="sellerImage" items="${ sellerImageList }" varStatus="sellerStatus">
							<img class="sellerImg" src="/LifeMenu/display?fileName=${ sellerImage }">
							<c:if test="${ sellerStatus.count == 1 }">
								<br>
							</c:if>
						</c:forEach>
						<br> <br>
						<div id="aprsm">
							<h1>"${ seller.selerAprsm }"</h1>
						</div>
					</div>
					<div id="detail_container">
						<h1 id="topDetail">${ mberNcnm }( ${ seller.selerAge } ) / ${ seller.selerOccp }</h1>
						<div id="resdnc">거주지 : ${ seller.selerResdnc }</div>
						<div class="img-with-text">
						<c:forEach var="tag" items="${ tagList }">
						<table>
							<tr>
								<td><img class="tagImg" src="/LifeMenu/display?fileName=${ tag.imageAdres }"></td>
							</tr>
							<tr>
								<td><p>${ tag.tagNm }</p></td>
							</tr>
						</table>
						</c:forEach>
						</div>
						<span id="selfIntroduction">${ seller.selerSelfIntrcn }</span>
						<input type="button" value="예약하기" id="reserve_btn" onclick="location.href='/LifeMenu/voucher/list/${ seller.mberCode }'">
					</div>
					<div id="history_container">
						<c:if test="${sellersVoucherPrice.size() == 0}">
								<div id="didntsold">아직 판매된 내역이 없습니다.</div>
						</c:if>
						<h3 id="priceh3">${ mberNcnm } 님의 식사권 가격 변동 차트</h3>
						<div id="chart_div" style="width: 680px; height: 250px;">
						</div>
						<div id="career_btn">
							<input type="button" class="cBtns" id="sc" value="경력사항">
							<input type="button" class="cBtns" id="ac" value="학력사항">
						</div>
						<div id="career">
							<div id="seller_career">${ seller.selerCareer }</div>
							<div id="seller_acdmcr">${ seller.selerAcdmcr }</div>
						</div>
						<h3 id="ageh3">구매자 연령층 분포 차트</h3>
						<div id="age_group_chart" style="width: 280px; height: 280px;"></div>
					</div>
					<div id="review_container">
					<h2>리뷰</h2>
					<c:if test="${ reviewList.size() == 0 }">
						아직 리뷰가 없습니다.
					</c:if>
					<table id="review_table">
					<c:forEach var="review" items="${ reviewList }">
						<tr>
							<td>
								<table class="review_box">
									<tr>
										<td>${ review.reviewCn }</td>
									</tr>
									<tr>
										<td>
											*** 님 / <fmt:formatDate value="${ review.reviewDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
					</table>
					</div>
				</div>
				<i class="fas fa-chevron-circle-down scroll" id="scrollDown"></i> 
				<i class="fas fa-chevron-circle-up scroll" id="scrollUp"></i>
			</div>
			<footer id="footer">
			<jsp:include page="${request.contextPath}/footer"></jsp:include>
        </footer>
		</div>
	</div>
</body>
</html>