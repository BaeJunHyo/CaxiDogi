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

<style>
label{font-weight: bold; color: #000;}
p{color: #7d7d7d;}
.btn_1{display: inline-block; height: 50px; padding: 0 35px; text-align: center; font-size: 18px; line-height: 50px; font-weight: normal; color: #000; background: #ffeb00;text-decoration:none;}
</style>

<div class="payment" style="">
	<div class="kakao_header" style="background: #ffeb00;">
		<img alt="" src="<%=request.getContextPath() %>/images/payment_icon_yellow.png"/>
	</div>
	<div class="kakao_body" style="margin-top: 30px; border-top: 1px solid #ccc; padding: 0 15px;">
		<p style="color: #000; font-size: 20px; font-weight: bold;">결제가 취소되었습니다.</p>
		<p><label>결제요청시간</label>: ${kakaoDto.created_at }</p>
		<p><label>결제상태:</label> ${kakaoDto.status }</p>
		<p><label>상품명:</label> ${kakaoDto.item_name }</p>
		<p><label>취소금액:</label> ${kakaoDto.totalPrice }</p>
	</div>
</div>
<div align="center" style="margin-top: 50px;">
	<a href="javascript:void(0)" class="btn_1" id="closeBtn">
		<span>확인</span>
	</a>
</div>

<script type="text/javascript">
	$("#closeBtn").click(function () {
		opener.parent.paymentConfirm(2);
		close();
	});
	
</script>
</body>
</html>