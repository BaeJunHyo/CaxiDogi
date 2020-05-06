<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="cusSec_tableWrap tw_wFull">
	<h3>
		<span class="t_sbj">최근 구매내역</span>
		<span class="c_gray">(최근 주문 5건 / 1개월 내)</span>
		<a href="myBuyListAll.do" class="btn_dark_s fr">더보기</a>
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
		<tbody id="myOrderList">
			<c:if test="${myBuyList ne null }">
				<c:forEach var="myBuyParam" items="${myBuyList }" varStatus="status">
				<tr>
					<td>${myBuyParam.order_date.split("/")[0] }<a href="javascript:openPopup(${myBuyParam.order_number })" class="prdNum">${myBuyParam.order_date.split("/")[1] }</a></td>
					<td class="tl">
						<a href="javascript:openPopup('${myBuyParam.order_number }')" class="tableThumb_small"><img src="./images/mypage/img_prdBigThumb.jpg"></a>
						<div class="prdInfo">
							<a href="javascript:openPopup(${myBuyParam.order_number })">
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

<script>
	function openPopup( StrNum ){
		//console.log(StrNum);
		window.open("myBuyDetail.do?index="+ StrNum, "주문 상세보기", "top:200px, left:400px, height=600px, width=600px, scrollbar= yes");
	}
	
</script>


