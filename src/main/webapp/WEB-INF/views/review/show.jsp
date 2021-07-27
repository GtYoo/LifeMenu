<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	body {
	font-family: 'Noto Sans KR', sans-serif;
	}
	#reviewCn {
		position: relative;
    	left: 77px;
    	top: 16px;
    	width: 289px;
    	height: 272px;
    	box-shadow: 2px 2px 5px #999;
	}
	.btn1 {
		position: relative;
	    top: 37px;
	    left: 32px;
	    width: 169px;
	    height: 39px;
	    box-shadow: 2px 2px 5px #999;
	    font-size: 20px;
		font-weight: bold;
		cursor: pointer;
		border: 2px solid;
		border-color: black;
		border-radius: 13px;
		background: black;
		color: #fff;
	    margin: 6px;
	}
	
	.btn1:hover, .btn2:hover {
		background: #fff;
		color: black;
	}
	
	.btn2 {
		position: relative;
	    top: 37px;
	    left: 32px;
	    width: 169px;
	    height: 39px;
	    box-shadow: 2px 2px 5px #999;
	   	font-size: 20px;
		font-weight: bold;
		cursor: pointer;
		border: 2px solid;
		border-color: black;
		border-radius: 13px;
		background: black;
		color: #fff;
	    margin: 6px;
	}
	#taReviewCn {
		width: 283px;
    	height: 266px;
	}
</style>
<script>
	$(document).ready(function() {
		var txt;
		$('.btn2').hide();
		
		let text = $('#cn').val();
		
		$('#modify').click(function() {
			txt = document.getElementById("reviewCn").innerText;
			$('#reviewCn').empty();
			$('#reviewCn').append("<textarea id='taReviewCn'>" + txt + "</textarea>");
			$(".btn1").hide();
			$(".btn2").show();
		})
		
		$('#remove').click(function() {
			let setleCode = $("input[name='setleCode']").val();
			let result = confirm("정말 삭제하시겠습니까?!!");
			
			if(result) {
				$.ajax({
					url: "/LifeMenu/review/remove/" + setleCode,
					type: "get",
					contentType: "application/json",
					success: function(data) {
						alert("삭제 되었습니다.");
						window.location.reload();
					},
					error: function() {
						alert("error!");
					}
				})
			}
			
		})
		
		$('#modifyDo').click(function() {
			let setleCode = $("input[name='setleCode']").val();
			let mberCode  = $("input[name='mberCode']").val();
			let reviewCn  = document.getElementById("taReviewCn").value;
			
			if(reviewCn.length > 30) {
				alert("리뷰는 30자를 초과 할 수 없습니다.");
				return;
			}
			
			let json = {"setleCode" : setleCode, "mberCode" : mberCode, "reviewCn" : reviewCn};
			
			$.ajax({
				url: "/LifeMenu/review/modify/" + setleCode,
				type: "post",
				data: JSON.stringify(json),
				contentType: "application/json",
				success: function(data) {
					location.reload();
				},
				error: function() {
					alert("error!");
				}
			})
		})
		
		$('#cansel').click(function() {
			$('#reviewCn').empty();
			document.getElementById('reviewCn').innerHTML = text;
			$(".btn2").hide();
			$(".btn1").show();
		})
	})
</script>
</head>
<body>
	<input type="hidden" name="setleCode" value="${ review.setleCode }">
	<input type="hidden" name="mberCode"  value="${ review.mberCode }"> 
	<input type="hidden" id="cn" value="${ review.reviewCn }">
	<div id="reviewCn">${ review.reviewCn }</div>
	<input class="btn1" id="remove" type="button" value="삭제">
	<input class="btn1" id="modify" type="button" value="수정">
	<input class="btn2" id="cansel" type="button" value="취소">
	<input class="btn2" id="modifyDo" type="button" value="수정완료">
</body>
</html>