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


	<c:set var="total_Price_Sum" value="0"></c:set>
	<div class="cusSec_tableWrap tw_wFull">	
		<h3>
		<span class="t_sbj">장바구니</span>
		<span class="c_gray">상품 목록 정보</span>
		</h3>
		<%-- 디테일 화면 / 장바구니 에서 넘어온 구매 정보를 보여주는 테이블 --%>
		<div>	
			<div>
				<div style="padding: 20px 20px 20px 20px">
					
					<table class="basic_tableStyle">
						<colgroup>
							<!-- 1100 -->
							<col width="80px">
							<col width="350px">
							<col width="100px">
							<col width="150px">
							<col width="120px">
							<col width="120px">
							<col width="200px">
						</colgroup>
						
						<thead>
							<tr style="border: 1px solid #c8c8c8;">
								<th>
									<input type="checkbox" id="all_check">
									<strong>전체</strong>
								</th>
								<th><strong>상품 정보</strong></th>
								<th><strong>수량</strong></th>
								<th><strong>상품 금액</strong></th>
								<th><strong>적립금</strong></th>
								<th><strong>배송비</strong></th>
								<th><strong>주문금액</strong></th>
							</tr>
						</thead>
						
						<tbody id="prd_list">
							<c:if test="${basketList eq null }">
								<tr style="border: 1px solid #c8c8c8;">
									<td colspan="7">
										현재 고객님의  장바구니는 비어있습니다.
									</td>
								</tr>
							</c:if>
							<c:forEach var="basketDto" items="${basketList }" varStatus="status">
								<tr style="border: 1px solid #c8c8c8;">
									<td><input type="checkbox" class="basketCheck" value="${basketDto.basket_num }"></td>
									<td><%-- 상품 이미지와 이름 정보 --%>
										<div style="padding: 10px 10px 10px 10px;">
											<div class="이미지" style="width:30%; height:100%; float:left; margin-bottom: 10px;">
												<a href="productDetail.do?product_num=${basketDto.product_num }">
													<img alt="" src="<%=request.getContextPath() %>/images/goodsImg/${basketDto.product_img }" width="70" height="70">	
												</a>
											</div>
											<div style="width:70%; float:left; text-align: left; align-content: center; padding-top: 12px;">
												&nbsp;&nbsp;<a href="productDetail.do?product_num=${basketDto.product_num }">${basketDto.product_name }</a>
											</div>
										</div>
									</td>
									<td>
										<span class="counter" id="counter">
		                              		<input type="text" value="${basketDto.basket_amount}" class="tCount" readonly="readonly">
		                              		<span class="counterBtn">
		                                 		<a href="javascript:void(0)" index="${basketDto.basket_num }" class="btnPlus"></a>
		                                 		<a href="javascript:void(0)" index="${basketDto.basket_num }" class="btnMinus"></a>
		                             	 	</span>
		                           		</span>
									</td>
									<td>
										<strong class="prd_Price">
											${basketDto.product_price}
										</strong>
										<strong>원</strong>
									</td>
									<td>5%</td>
									<td><strong>지역에 맞게</strong></td>
									<td>
										<strong class="total_Price">
											${basketDto.product_price * basketDto.basket_amount}
										</strong>
										<strong>원</strong>
									</td>
								</tr>
								<c:set var="total_Price_Sum" value="${total_Price_Sum + basketDto.product_price * basketDto.basket_amount }"/>
							</c:forEach>
							<tr>
								<th colspan="6" style="background-color: #FAFAFA"><p id="test">합계 금액</p></th>
								<td>
									<strong class="total_Price_Sum">0</strong>
									<strong>원</strong>
								</td>
							</tr>
						</tbody>
					</table>
					
					<div style="margin-top: 30px;">
						<a class="btn_1" href="javascript:void(0)" id="delBtn"><span>선택삭제</span></a>	
					</div>
				</div>
			</div>
			
		
			
				
			<div class="button_Wrap" style="text-align: center;margin-top: 100px; margin-bottom: 200px;">
				<a class="btn_2" id="btn_payment">Choice <span class="button_span">주문 하기</span></a>
			</div>
		</div>
	</div>
</div>

<form id="orderForm" name="orderForm" method="post" action="productOrder.do">

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
			Swal.fire({ icon: 'info', title: '최대 수량입니다', text: '대량구매는 관리자에게 문의 부탁드립니다.',})
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
		var checkbox = $(tr).children().first().children();

		if($(checkbox).is(":checked")){
			//합계 금액 처리 
			var total_price_sum = $('#prd_list').children().last().children('td').children('.total_Price_Sum').text();
			total_price_sum = Number(total_price_sum) + price;

			$('#prd_list').children().last().children('td').children('.total_Price_Sum').text(total_price_sum);					
		}
		
		//DB 업데이트 
		//alert($(this).attr('index'));
		
		$.ajax({
			url:"amountUpdate.do",
			type:"post",
			data:{
				basket_num:$(this).attr('index'),
				state:"+"
			},
			success: function ( result ){
				//alert("연결성공");
				//alert(result);
			},
			error: function (){
				//alert("연결실패");
			}
		})
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
		
		//console.log($(tr).children().last().children('.total_Price').html()); //총가격 

		//console.log("버튼 의 tr == ");
		var checkbox = $(tr).children().first().children();

		if($(checkbox).is(":checked")){
			//합계 금액 처리 
			var total_price_sum = $('#prd_list').children().last().children('td').children('.total_Price_Sum').text();
			total_price_sum = Number(total_price_sum) - price;

			$('#prd_list').children().last().children('td').children('.total_Price_Sum').text(total_price_sum);					
		}
		
				
		//DB 업데이트 
		//alert($(this).attr('index'));
		
		$.ajax({
			url:"amountUpdate.do",
			type:"post",
			data:{
				basket_num:$(this).attr('index'),
				state:"-"
			},
			success: function ( result ){
				//alert("연결성공");
				//alert(result);
			},
			error: function (){
				//alert("연결실패");
			}
		})
		
		
	});

</script>

<%-- 버튼 동작 처리  --%>
<script type="text/javascript">
		
	$(document).on("click", "#all_check", function (){
		if($(this).is(":checked")){
			var checkbox = $("input[type='checkbox']");
			
			for(i = 1; i <= checkbox.length; i++){
				
				if($(checkbox[i]).is(":checked")){		
				}else{
					//console.log($(this).parent().parent().children().last().children().text());
					var totalPrice = $(checkbox[i]).parent().parent().children().last().children('.total_Price').text();
					console.log($.trim(totalPrice));
					//합계 금액 처리 
					var total_price_sum = $('#prd_list').children().last().children('td').children('.total_Price_Sum').text();
					total_price_sum = Number(total_price_sum) + Number(totalPrice);

					$('#prd_list').children().last().children('td').children('.total_Price_Sum').text(total_price_sum);
				}
				
			}
			
			
			$("input[type='checkbox']").prop('checked',true);
			//모든자식제거
			$("#orderForm").empty();
			
			var index = 0;
			for(i=1; i <= checkbox.length-1; i++){
				if($(checkbox[i]).is(":checked")){
					//alert("체크");
					//alert($(checkbox[i]).val());
					$.ajax({
						url:"getBasketDto.do",
						type:"post",
						data:{
							basket_num:$(checkbox[i]).val()
						},
						success: function ( dto ){
							//alert("통신성공");
							console.log(dto);
							//여기서 form 내에 input 태그 생성 
							var inputStr = "<input type='hidden'";
							inputStr += " name='orderList[" + index + "].product_num'";
							inputStr += " value='" + dto.product_num + "'>";
						
							$("#orderForm").append(inputStr);
							
							inputStr = "<input type='hidden'";
							inputStr += " name='orderList[" + index + "].acount'";
							inputStr += " value='" + dto.basket_amount + "'>";
							
							$("#orderForm").append(inputStr);
							
							index++;
						},
						error: function (){
							//alert("통신실패");
						}
					})//ajax	
				}//if
			}//for
		}else{
			
			//모든자식제거
			$("#orderForm").empty();

			var checkbox = $("input[type='checkbox']");
			
			for(i = 1; i <= checkbox.length-1; i++){

				if($(checkbox[i]).is(":checked")){
					//console.log($(this).parent().parent().children().last().children().text());
					var totalPrice = $(checkbox[i]).parent().parent().children().last().children('.total_Price').text();
					console.log($.trim(totalPrice));
					//합계 금액 처리 
					var total_price_sum = $('#prd_list').children().last().children('td').children('.total_Price_Sum').text();
					total_price_sum = Number(total_price_sum) - Number(totalPrice);

					$('#prd_list').children().last().children('td').children('.total_Price_Sum').text(total_price_sum);
				}	
				
			}
			
			$("input[type='checkbox']").prop('checked',false);
		}
	})
	
	
	//form 안에 데이터 동적생성
	$(document).on("click",".basketCheck", function (){

		if($(this).is(":checked")){
			//console.log($(this).parent().parent().children().last().children().text());
			var totalPrice = $(this).parent().parent().children().last().children('.total_Price').text();
			console.log($.trim(totalPrice));
			//합계 금액 처리 
			var total_price_sum = $('#prd_list').children().last().children('td').children('.total_Price_Sum').text();
			total_price_sum = Number(total_price_sum) + Number(totalPrice);

			$('#prd_list').children().last().children('td').children('.total_Price_Sum').text(total_price_sum);
		}else{
			//console.log($(this).parent().parent().children().last().children().text());
			var totalPrice = $(this).parent().parent().children().last().children('.total_Price').text();
			console.log($.trim(totalPrice));
			//합계 금액 처리 
			var total_price_sum = $('#prd_list').children().last().children('td').children('.total_Price_Sum').text();
			total_price_sum = Number(total_price_sum) - Number(totalPrice);

			$('#prd_list').children().last().children('td').children('.total_Price_Sum').text(total_price_sum);
		}
		
		

		
		//모든자식제거
		$("#orderForm").empty();
		
		var checkbox = $("input[type='checkbox']");
		var index = 0;
		
		
		for(i=1; i <= checkbox.length-1; i++){
			if($(checkbox[i]).is(":checked")){
				//alert("체크");
				//alert($(checkbox[i]).val());
				$.ajax({
					url:"getBasketDto.do",
					type:"post",
					data:{
						basket_num:$(checkbox[i]).val()
					},
					success: function ( dto ){
						//alert("통신성공");
						console.log(dto);
						//여기서 form 내에 input 태그 생성 
						var inputStr = "<input type='hidden'";
						inputStr += " name='orderList[" + index + "].product_num'";
						inputStr += " value='" + dto.product_num + "'>";
					
						$("#orderForm").append(inputStr);
						
						inputStr = "<input type='hidden'";
						inputStr += " name='orderList[" + index + "].acount'";
						inputStr += " value='" + dto.basket_amount + "'>";
						
						$("#orderForm").append(inputStr);
						
						index++;
					},
					error: function (){
						//alert("통신실패");
					}
				})//ajax	
			}//if
		}//for
	})

</script>

<%-- 삭제 처리  --%>
<script>
	//선택삭제 클릭시
	$("#delBtn").click(function (){
		//	alert("삭제 클릭");
		Swal.fire({
		  title: '선택한 장바구니를 삭제하시겠습니까?',
		  text: "",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제하기',
		  cancelButtonText: '뒤로가기',	  	  
		}).then((result) => {

			if (result.value) {

				var checkboxTag = $("input[type='checkbox']");

				for(i=1; i < checkboxTag.length; i++){

					if($(checkboxTag[i]).is(":checked")){
						//선택되어 있으면 
						var seq = $(checkboxTag[i]).val();
						//alert(seq); 
						console.log($(checkboxTag[i]).parent().parent());
						var target = $(checkboxTag[i]).parent().parent();
						//$(checkboxTag[i]).parent().parent().remove();

						$.ajax({
							url:"deleteBasket.do",
							type:"post",
							data:{
								basket_num:seq
							},
							success: function (result){
								console.log("deleteBasket.do 성공");
								//alert(result);
								if(result == 'true'){
									//alert("실행");
									console.log(target);
									$(target).remove();
								}else{
									//alert("안실행");
									return;
								}
							},
							error: function (){
								console.log("deleteBasket.do 실패");
							}	
						})	
					}
				}
			Swal.fire({
				  icon: 'success',
				  title: '선택 삭제처리가 완료되었습니다',
				  showConfirmButton: false,
				  timer: 1000
			})
		  }
		})
		
		
	});
</script>





<%-- 결재 처리   --%>
<script>

$(document).on('click', "#btn_payment", function (){
	//alert("주");
	var order = $("#orderForm").children();
	//console.log(order.length);
	if(order.length == 0){
		Swal.fire({
			  icon: 'warning',
			  title: '선택된 제품이 없습니다',
			  showConfirmButton: false,
			  timer: 1000
		})
	}else{
		Swal.fire({
			  title: '선택 상품으로 주문을 하시겠습니까?',
			  text: "주문 페이지에서 수량은 변경이 가능합니다",
			  icon: 'info',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '주문하기',
			  cancelButtonText: '뒤로가기'
			}).then((result) => {
			  if (result.value) {
				  $("#orderForm").submit();	
			  }
		})	
	}
})

</script>






<%@ include file="/include/footer.jsp"%>