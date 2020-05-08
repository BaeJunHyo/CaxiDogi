<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<style type="text/css">
.header{width: 550px; height:60px; margin: auto;}
.header_title{margin: auto;}
.content{padding-left: 40px;}
.content_title{width: 500px; height:40px;}
.btn_close{ margin-top:60px; margin-bottom: 40px; display: inline-block; height: 50px; padding: 0 40px; text-align: center; font-size: 12px; line-height: 50px; font-weight: bold; color: #fff; background: #000; text-decoration:none;}	
</style>


</head>
<body>
<div class="header" style="border-bottom: 1px solid #c8c8c8;">
	<div class="header_title" align="center">
		<p style="font-size: 24px; font-family: arial, helvetica, sans-serif; font-weight: bold;">주문 상세정보<p>
	</div>
</div>
<div class="content">
	<div class="content_title">
		<p style="font-size: 18px; font-family: arial, helvetica, sans-serif; font-weight: bold;">주문내역</p>
	</div>
	<div class="ListWrap">
		<table>
			<colgroup>
				<col width="150px">
				<col width="*">
			</colgroup>
			<tbody>
				<c:set var="totalPrice" value="0"></c:set>
				<c:set var="totalAmount" value="0"></c:set>
				<c:forEach var="orderDetail" items="${detailList }" varStatus="status">
					<tr>
						<td>
							<img alt="" src="<%=request.getContextPath() %>/images/goodsImg/${orderDetail.product_img }" width="70" height="50">
						</td>
						<td>
							<p style="font-size: 12px; color: #999">[주문번호 : ${orderDetail.saleing_group } ]</p>
							<p><strong>${orderDetail.product_name} / </strong><font class="amount" style="color:#999">${orderDetail.saleing_amount }개</font></p>
							<p style="font-size: 13px;">${orderDetail.product_brand }</p>
							<p>
								<strong class="orderPrice"><fmt:formatNumber type="number" value="${orderDetail.product_price * orderDetail.saleing_amount }"/>원</strong>
							</p>
						</td>	
					</tr>
					<c:set var="totalPrice" value="${totalPrice + orderDetail.product_price * orderDetail.saleing_amount }"/>
					<c:set var="totalAmount" value="${totalAmount + orderDetail.saleing_amount }"/>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<div class="footer" style="margin-top: 30px; padding-left: 40px;">
	<table>
		<colgroup>
			<col width="200">
			<col width="150">
			<col width="200">
		</colgroup>
		<tbody>
			<tr>
				<td>
					<strong>합계금액</strong>
				</td>
				<td>
					<strong class="totalAmount" style="color: #999;">${totalAmount }개</strong>
				</td>
				<td>
					<strong class="totalPrice"><fmt:formatNumber type="number" value="${totalPrice }"/>원</strong>
				</td>
			</tr>
		</tbody>
	</table>	
</div>
<div class="closeSpace" align="center" style="margin-top: 30px;">
<a id="close" class="btn_close" href="javascript:void(0)"><span>닫기</span></a>	
</div>

<script>
	$("#close").click(function (){
		close();
	})	
</script>


</body>
</html>