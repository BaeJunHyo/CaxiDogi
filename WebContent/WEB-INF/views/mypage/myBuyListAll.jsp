<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp"%>
<style>
.btn_1{display: inline-block; height: 40px; padding: 0 35px; text-align: center; font-size: 12px; line-height: 50px; font-weight: bold; color: #fff; background: #000; text-decoration:none;}
.btn_2{display: inline-block; height: 50px; padding: 0 35px; text-align: center; font-size: 20px; line-height: 50px; font-weight: bold; color: #fff; background: #000; text-decoration:none;}
</style>

<%@ include file="/include/left_frm.jsp" %>
<!-- 마이페이지 메인 -->		
<div class="cusSec_right">
	<div class="box_cusMain clearfix">
		<div class="box_leftSec" style="border-right: none;">
			<h5 style="font-weight: normal;">
				${loginUser.user_name }님 안녕하세요
			</h5>
			
			<p>
				<img src="./images/mypage/ico_user_s.gif"><strong class="pl5 pr20">회원유형</strong>
				<c:choose>
					<c:when test="${loginUser.auth eq 1 or loginUser.auth eq 2}">일반회원</c:when>
					<c:when test="${loginUser.auth eq 3}">업체회원</c:when>
					<c:when test="${loginUser.auth eq 4 or loginUser.auth eq 5}">관리자</c:when>
					<c:otherwise>탈퇴회원</c:otherwise>
				</c:choose>
			</p>
		</div>
	</div>
	<div class="cusSec_tableWrap tw_wFull">
		<h3>
			<span class="t_sbj">최근 구매내역</span>
			<span class="c_gray">(나의 모든 주문내역)</span>
		</h3>
		<table class="basic_tableStyle">
			<colgroup>
				<col width="115px">
				<col width="*">
				<col width="115px">
				<col width="115px">
				<col width="115px">
			</colgroup>
			<thead>
				<tr>
					<th>주문일/주문번호</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>주문금액</th>
					<th>진행상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${myBuyList ne null }">
					<c:forEach var="myBuyParam" items="${myBuyList }" varStatus="status">
					<tr>
						<td>${myBuyParam.order_date.split("/")[0] }<a href="javascript:openPopup('${myBuyParam.order_number }')" class="prdNum">${myBuyParam.order_date.split("/")[1] }</a></td>
						<td class="tl">
							<a href="javascript:openPopup('${myBuyParam.order_number }')" class="tableThumb_small">
								<img alt="" src="<%=request.getContextPath() %>/images/goodsImg/${myBuyParam.order_img }" width="70" height="50">
							</a>
							<div class="prdInfo">
								<a href="javascript:openPopup('${myBuyParam.order_number }')">
									<p class="c_gray">[ 주문번호 : ${myBuyParam.order_number } ]</p>
									${myBuyParam.order_name }
									<p class="pt5"></p>
								</a>
							</div>
						</td>
						<td>${myBuyParam.order_amount }</td>
						<td><fmt:formatNumber type="number" value="${myBuyParam.order_price }"/> 원</td>
						<td>
							<p>
								<c:choose>
									<c:when test="${myBuyParam.product_delivery_state eq 0 }">
										발송중
									</c:when>
									<c:otherwise>
										발송완료
									</c:otherwise>
								</c:choose>
							</p>
							<c:if test="${myBuyParam.product_delivery_state eq 1 }">
								<br><a href="productReview.do?order_num=${myBuyParam.order_number }" class="btn_line_s">상품평작성</a><br><br>
								<a href="#" class="btn_line_s">교환</a>
								<a href="#" class="btn_line_s">반품</a>
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</c:if>
				<c:if test="${myBuyList eq null }">
					<tr>
						<td colspan="5">최근 구매하신 내역이 없습니다.</td>
					</tr>
				</c:if>	
			</tbody>
		</table>
	</div>
</div>
<script>
	function openPopup( StrNum ){
		//console.log(StrNum);
		window.open("myBuyDetail.do?index="+ StrNum, "주문 상세보기", "top:200px, left:400px, height=600px, width=600px, scrollbar= yes");
	}
	
</script>		
<%@ include file="/include/footer.jsp"%>	