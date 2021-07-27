<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- ver.1.0.0 -->

<title>구매확정 확인</title>
</head>
<body>

    <form action="" method="POST">
	 	<div>
	 	 	<div>
	 	 	 	<span>식사권코드</span>
	 	 	 	<span>${ VOCHR_CODE }</span>
	 	 	</div>
	 	 	<div>
	 	 	 	<span>판매자코드</span>
	 	 	 	<span>${ SELER_CODE }</span>
	 	 	 	<span>판매자명</span>
	 	 	 	<span>${ SELER_RLNM }</span>
	 	 	</div>
	 	 	<div>
	 	 	 	<span>구매자코드</span>
	 	 	 	<span>${ MBER_CODE }</span>
	 	 	 	<span>구매자명</span>
	 	 	 	<span>${ MBER_RLNM }</span>
	 	 	</div>
	 	 	<div>
	 	 	 	<span>결제코드</span>
	 	 	 	<span>${ SETLE_CODE }</span>
	 	 	 	<span>환불금액</span>
	 	 	 	<span>${ REFND_PC }</span>
	 	 	</div>
	 	 	<div>
	 	 	 	<span>환불사유</span>
	 	 	 	<span>${ REFNDRESN }</span>
	 	 	</div>
	 	</div>
	 	<div>
	 	 	<span><input type="submit" value="환불"></span>
	 	 	<span><input type="button" value="취소"></span>
	 	</div>
 	</form>

</body>
</html>