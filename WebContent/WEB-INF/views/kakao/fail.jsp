<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오결제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<h1>실패 페이지</h1>
<div class="payment" style="margin-left: 40px; margin-top: 30px;">
	<div class="kakao_header">
		<img alt="" src="<%=request.getContextPath() %>/images/payment_icon.png"/>
	</div>
	<div class="kakao_body">
		<p>카카오페이 결제가 정상적으로 완료되었습니다.</p>
		<p>결제일시:</p>
		<p>상품명:</p>
		<p>결제금액:</p>
	</div>
</div>

<script type="text/javascript">
	$("#closeBtn").click(function () {
		opener.parent.paymentConfirm(2);
		close();
	});
	
</script>
</body>
</html>