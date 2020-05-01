<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp"%>


<c:set var="total_Price_Sum" value="0"></c:set>
<div class="container_subWrap">
	<div class="prd_infoWrap">
		<div class="prdName_section clearfix">
			<div class="prd_name">
				장바구니 페이지
			</div>
		</div><!--// prdName_section -->
	</div><!-- prd_infoWrap -->
	
	<%-- 디테일 화면 / 장바구니 에서 넘어온 구매 정보를 보여주는 테이블 --%>
	<div>	
		<div>
			<div class="section_title">
				Product List Info <span style="font-size: 12px; color: #c8c8c8;">상품 목록 정보</span>
			</div>
			
			<div style="padding: 20px 20px 20px 20px">
				
				<table class="basic_tableStyle">
					<colgroup>
						<!-- 1100 -->
						<col width="400px">
						<col width="100px">
						<col width="150px">
						<col width="120px">
						<col width="120px">
						<col width="200px">
					</colgroup>
					
					<thead>
						<tr style="border: 1px solid #c8c8c8;">
							<th><strong>상품 정보</strong></th>
							<th><strong>수량</strong></th>
							<th><strong>상품 금액</strong></th>
							<th><strong>적립금</strong></th>
							<th><strong>배송비</strong></th>
							<th><strong>주문금액</strong></th>
						</tr>
					</thead>
					
					<tbody id="prd_list">
						<c:forEach var="productDto" items="${prd_list }" varStatus="status">
							<tr style="border: 1px solid #c8c8c8;">
								<td><%-- 상품 이미지와 이름 정보 --%>
									<div style="padding: 10px 10px 10px 10px;">
										<div class="이미지" style="width:30%; height:100%; float:left; margin-bottom: 10px;">
											<a>
												<img alt="" src="${productDto.product_img }" width="70" height="50">
											</a>
										</div>
										<div style="width:70%; float:left; text-align: left; align-content: center; padding-top: 12px;">
											${productDto.product_name }
										</div>
									</div>
								</td>
								<td>
									<span class="counter" id="counter">
	                              		<input type="text" value="${PrdParamList.getOrderList().get(status.index).acount }" class="tCount" readonly="readonly">
	                              		<span class="counterBtn">
	                                 		<a href="javascript:void(0)" class="btnPlus"></a>
	                                 		<a href="javascript:void(0)" class="btnMinus"></a>
	                             	 	</span>
	                           		</span>
								</td>
								<td>
									<strong class="prd_Price">
										${productDto.product_price}
									</strong>
									<strong>원</strong>
								</td>
								<td>5%</td>
								<td><strong>지역에 맞게</strong></td>
								<td>
									<strong class="total_Price">
										${productDto.product_price * PrdParamList.getOrderList().get(status.index).acount  }
									</strong>
									<strong>원</strong>
								</td>
							</tr>
							<c:set var="total_Price_Sum" value="${total_Price_Sum + productDto.product_price * PrdParamList.getOrderList().get(status.index).acount }"/>
						</c:forEach>
						<tr>
							<th colspan="5" style="background-color: #FAFAFA"><p id="test">합계 금액</p></th>
							<td>
								<strong class="total_Price_Sum">
										${total_Price_Sum }
								</strong>
								<strong>원</strong>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</div>
		
		
			
		<div class="button_Wrap" style="text-align: center;">
			<a class="button_Wrap_a" id="btn_payment">Choice <span class="button_span">주문 하기</span></a>
		</div>
	</div>
</div>

<form>

</form>



<script>
	/* 수량&총가격 의 동적 변환 처리  */
	$(document).on("click",".btnPlus", function (){

		//alert("플러스 클릭");
		var tr = $(this).parent().parent().parent().parent();
		var acountTag = $(this).parent().prev();
		
		//console.log(tr);
		//console.log($(acountTag).val()); //input Tag (수량)

		//수량 ++
		var acount = Number($(acountTag).val());
		acount++;

		//예외처리
		if(acount > 99){
			acount = 99;
			alert("최대 수량입니다. 대량구매는 관리자에게 문의 부탁드립니다.");
			return;
		}
		
		$(acountTag).val(acount);

		//이 제품의 가격 찾기 
		var td = $(this).parent().parent().parent();
		//console.log($(td).next().children('.prd_Price').text());//제품 가격
		//현재 a태그 위치에서 td까지 올라간 후  다음 형재 td로 이동한 다음 
		//그 자식노드인  strong.prd_Price 를 찾는다.
		
		//price 구분해서 가져오기 
		var price =$(td).next().children('.prd_Price').text();
		//console.log($(td).next().children('.prd_Price').text());
	
		price = price.replace(",","");
		price = Number(price);
		//console.log(price);

		var total_price = (acount * price);
		
		//총가격 처리 
		$(tr).children().last().children('.total_Price').text(total_price);
		
		console.log($(tr).children().last().children('.total_Price').html()); //총가격 

		//합계 금액 처리 
		var total_price_sum = $('#prd_list').children().last().children('td').children('.total_Price_Sum').text();
		total_price_sum = Number(total_price_sum) + price;

		$('#prd_list').children().last().children('td').children('.total_Price_Sum').text(total_price_sum);
		
	});
	
	$(document).on("click",".btnMinus", function (){

		//alert("마이너스 클릭");
		var tr = $(this).parent().parent().parent().parent();
		var acountTag = $(this).parent().prev();
		
		//console.log(tr);
		//console.log($(acountTag).val()); //input Tag (수량)

		//수량 --
		var acount = Number($(acountTag).val());
		acount--;

		//예외처리
		if(acount < 1){
			acount = 1;
			return;
		}
		
		$(acountTag).val(acount);

		//이 제품의 가격 찾기 
		var td = $(this).parent().parent().parent();
		//console.log($(td).next().children('.prd_Price').text());//제품 가격
		//현재 a태그 위치에서 td까지 올라간 후  다음 형재 td로 이동한 다음 
		//그 자식노드인  strong.prd_Price 를 찾는다.
		
		//price 구분해서 가져오기 
		var price =$(td).next().children('.prd_Price').text();
		//console.log($(td).next().children('.prd_Price').text());
	
		price = price.replace(",","");
		price = Number(price);
		//console.log(price);

		var total_price = (acount * price);
		
		//총가격 처리 
		$(tr).children().last().children('.total_Price').text(total_price);
		
		console.log($(tr).children().last().children('.total_Price').html()); //총가격 

		//합계 금액 처리 
		var total_price_sum = $('#prd_list').children().last().children('td').children('.total_Price_Sum').text();
		total_price_sum = Number(total_price_sum) - price;

		$('#prd_list').children().last().children('td').children('.total_Price_Sum').text(total_price_sum);
		
	});

</script>







<%@ include file="/include/footer.jsp"%>