<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 판매자 정보</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${path}/resources/js/logheader.js"></script>
<script type="text/javascript" src="${path}/resources/js/seller/myinfo.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="${path}/resources/css/common.css" rel="stylesheet" type="text/css">
<link href="${path}/resources/css/seller/myinfo.css" rel="stylesheet" type="text/css">
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
					<c:if test="${ existence == true }">
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
						<div id="career_container">
							<div id="career_btn">
							<input type="button" class="cBtns" id="sc" value="경력사항">
							<input type="button" class="cBtns" id="ac" value="학력사항">
							</div>
							<div id="career">
								<div id="seller_career">${ seler.selerCareer }</div> 
								<div id="seller_acdmcr">${ seler.selerAcdmcr }</div> 
							</div>
						</div>
						<div id="detail_container">
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
										${ seler.selerAge }
									</td>
								</tr>
								<tr>
									<td>
										직업 :
									</td>
									<td>
										${ seler.selerOccp }
									</td>
								</tr>
								<tr>
									<td>
										거주지 :
									</td>
									<td>
										${ seler.selerResdnc }
									</td>
								</tr>
								<tr>
									<td>
										태그 : 
									</td>
									<td>
										<c:forEach var="tag" items="${ tagList }">
										${ tag.tagNm }
										</c:forEach>
									</td>
								</tr>
								<tr>
									<td>
										명언 :
									</td>
									<td>
										${ seler.selerAprsm }
									</td>
								</tr>
								<tr>
									<td>
										자기소개 :
									</td>
									<td id="selfIntroduction">
										${ seler.selerSelfIntrcn }
									</td>
								</tr>
							</table>
						</div>
						<input type="button" value="수정하기" id="modify_btn"
							onclick="location.href='/LifeMenu/seller/modify'" />
						<input type="button" value="판매하기" id="sell_btn"
							onclick="location.href='/LifeMenu/voucher/mylist'" />
					</c:if>

					<c:if test="${ existence == false }">
					<div id="rcomment">
					<h1>이런.. 정보가 없으시군요?</h1>
					</div>
					<input type="button" value="판매자 등록하기" id="rbtn"
							onclick="location.href='/LifeMenu/seller/register'" />
					</c:if>
				</div>
			</div>
			<footer id="footer">
			<jsp:include page="${request.contextPath}/footer"></jsp:include>
        </footer>
		</div>
	</div>
</body>
</html>