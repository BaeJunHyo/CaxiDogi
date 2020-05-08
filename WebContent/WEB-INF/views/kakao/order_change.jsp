<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 교환 요청</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<style type="text/css">
.header{width: 550px; height:60px; margin: auto;border-bottom: 1px solid #c8c8c8; background-color: #323232;}
.header_title{margin: auto; padding-top: 3px; }
.content{padding-left: 40px;}
.content_title{width: 500px; height:40px;border-bottom: 1px solid #c2c2c2;}
.btn_close{ margin-top:60px; margin-bottom: 40px; display: inline-block; height: 50px; padding: 0 40px; text-align: center; font-size: 12px; line-height: 50px; font-weight: bold; color: #fff; background: #646464; text-decoration:none;}
.btn_cancel{ margin-top:60px; margin-bottom: 40px; display: inline-block; height: 50px; padding: 0 40px; text-align: center; font-size: 12px; line-height: 50px; font-weight: bold; color: #fff; background: #EB0000; text-decoration:none;}
.molla{width: 550px; height:10px; background-color: #c2c2c2; margin: auto; margin-top: 40px;}
ol{list-style-type: disc;}
li{margin-top: 10px;}
table{border-top: 2px solid #c2c2c2;
    border-collapse: collapse;
  border-spacing: 0 20px; width:500px;}
tr{border-bottom: 2px solid #c2c2c2;
    padding: 10px;}
td{padding:15px;}
.massge_select{width: 100px;height: 30px;}

</style>
</head>

<body>
<c:set var="Amount" value="${kakao.Amount.total }"></c:set>

<div class="header">
	<div class="header_title" align="center">
		<p style="font-size: 24px; font-family: arial, helvetica, sans-serif; font-weight: bold; color:#fff; margin-top: 10px;">결제 상세 정보<p>
	</div>
</div>
<div class="content">
	<div class="content_title">
		<p style="font-size: 18px; font-family: arial, helvetica, sans-serif; font-weight: bold;">주문정보</p>
	</div>
	<div class="ListWrap">
		<table>
			<colgroup>
				<col width="200px">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<td><strong style="color: #5a5a5a">결제번호</strong></td>
					<td><font style="color: #3c3c3c;">${saleing_num }</font></td>
				</tr>
				<tr>
					<td><strong style="color: #5a5a5a">제품명</strong></td>
					<td><strong style="color: #3c3c3c;">${kakaoDto.item_name }</strong></td>
				</tr>
				<tr>
					<td><strong style="color: #5a5a5a">수량</strong></td>
					<td><font style="color: #3c3c3c;">${kakaoDto.quantity } 개</font></td>
				</tr>
				<tr>
					<td><strong style="color: #5a5a5a;">결재금액</strong></td>
					<td><strong style="color: #282828;"><fmt:formatNumber type="number" value="${kakaoDto.totalPrice }"/> 원</strong></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="molla"></div>
<div class="footer" style="margin-top: 30px; padding-left: 40px;">
	<div>
		<p style="font-size: 15px; font-family: arial, helvetica, sans-serif; font-weight: bold;">교환사유</p>
		<div style="width: 450px;">
			<ol>
				<li>
					<select class="massge_select" name="Reason">
						<option>제품이상</option>
						<option>기타</option>
					</select>
				</li>
				<li>상세:<input class="ccc" type="text" name="massage"></li>
			</ol>
		</div>
	</div>	
</div>
<div>
	
</div>

<div class="closeSpace" align="center" style="margin-top: 30px;">
	<a id="close" class="btn_close" href="javascript:void(0)"><span>취소</span></a>
	<a id="orderCancelBtn" class="btn_cancel" href="javascript:void(0)"><span>교환요청</span></a>
</div>

<input>

<script>
	$("#close").click(function (){
		close();
	})
	
	$("#orderCancelBtn").click(function (){
		//alert("누름");
		/*
		$.ajax({
			url:"kakaoOrderCancel.do",
			type:"post",
			data:{
				tid:"${kakaoDto.tid}",
				cancel_amount:"${kakaoDto.totalPrice}",
				cancel_vat_amount:"${kakaoDto.vat}",
				saleing_num: "${saleing_num}"
				},
			success: function (data){//alert("통신 성공");},
			error: function (){//alert("통신실패");}
		})*/
	})	
</script>


</body>
</html>