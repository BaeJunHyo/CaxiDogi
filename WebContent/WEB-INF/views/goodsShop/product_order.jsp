<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp"%>



<c:set var="total_Price_Sum" value="0"></c:set>
<div class="container_subWrap">
	<div class="prd_infoWrap">
		<div class="prdName_section clearfix">
			<div class="prd_name">
				상품 주문/결제 페이지
			</div>
		</div><!--// prdName_section -->
	</div><!-- prd_infoWrap -->
	
	<%-- 디테일 화면 / 장바구니 에서 넘어온 구매 정보를 보여주는 테이블 --%>
	<div>	
		<div>
			<div class="section_title">
				Product Info <span style="font-size: 12px; color: #c8c8c8;">상품 정보</span>
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
											<a href="productDetail.do?product_num=${productDto.product_num }">
												<img alt="" src="<%=request.getContextPath() %>/images/goodsImg/${productDto.product_img }" width="70" height="70">
											</a>
										</div>
										<div style="width:70%; float:left; text-align: left; align-content: center; padding-top: 12px;">
											<a href="productDetail.do?product_num=${productDto.product_num }">${productDto.product_name }</a>
										</div>
									</div>
									<input type="hidden" value="${productDto.product_num }"> 
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
		
		<%-- 주소 입력 div --%>
		<div class="">
			<%-- 소제목 --%>
			<div class="section_title">
				Recipient info <span style="font-size: 12px; color: #c8c8c8;">수령자 정보</span>
			</div>
			
			<%-- 주소지 입력 테이블 --%>
			<div style="padding: 20px 20px 20px 20px">
				<table class="address_info">
					<colgroup>
						<col width="200px">
						<col width="600px">
					</colgroup>
					<tbody>
						<tr><%-- 배송지 선택 --%>
							<td>배송지 선택</td>
							<td>
								<input type="radio" value="1" name="sale_address">기본 배송지 정보
								&nbsp;&nbsp;
								<input type="radio" value="0" name="sale_address" checked>직접 작성
							</td>
						</tr>
						<tr><%-- 수령인/배송지명 --%>
							<td>수령인/배송지명</td>
							<td>
								<input type="text" id="sale_name">
							</td>
						</tr>
						<tr><%-- 전화번호 --%>
							<td>연락가능번호</td>
							<td>
								<select id="phone_top">
									<option value="0">선택하세요</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="053">053</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
								</select>
								<font> -</font>&nbsp; 
								<input type="text" id="phone_middle">
								<font> -</font>&nbsp;
								<input type="text" id="phone_bottom">
							</td>
						</tr>
						<tr><%-- 배송지 주소 --%>
							<td>배송지 주소</td>
							<td>
								<input type="text" id="address_number" placeholder="우편번호">&nbsp;
								<button type="button" onclick="DaumPostcode()">우편번호 찾기</button>
								<br>
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="address_string" placeholder="도로명주소"><br>
								<input type="text" id="address_detail" placeholder="상세주소">
								<input type="text" id="address_extra"  placeholder="참고주소">
								
							</td>
						</tr>
						<tr><%-- 배송 메모 --%>
							<td>배송 메모</td>
							<td>
								<textarea rows="" cols="" style="width: 540px; height: 70px;"></textarea>
								<p>※ 택배기사님께 전할 말씀을 남겨주세요</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div>
			<div class="section_title">
				Payment info / Agreement  <span style="font-size: 12px; color: #c8c8c8;">결재 정보 / 주문자 동의</span> 
			</div>
			
			<div style="padding: 20px 20px 20px 20px">
				<table class="payment_info">
					<colgroup>
						<col width="200">
						<col width="600">
					</colgroup>
					<tbody>
						<tr>
							<td>결제 수단</td>
							<td>
								<input type="radio" name="sel_payment" value="kakaopay" checked>카카오페이 &nbsp; <input type="radio" name="sel_payment" value="moo">무통장입금    
							</td>
						</tr>
						<tr>
							<td>결제 안내</td>
							<td>
								원활한 서비스를 위해서 아래의 동의를 필수로 받고 있습니다. 
							</td>
						</tr>
						<tr>
							<td>주문자 동의 <br><br>
								<input type="checkbox" id="all_Agreement"><span>전체 동의</span>
							</td>
							<td>
								<p>
									<input type="checkbox" id="Agreement_01"> <strong>개인정보 제 3 자 제공 동의  </strong><strong style="color: red;">(필수)</strong>
								</p><br>
								<p style="border: 1px solid #ddd; background-color: #f3f3f3; padding: 10px;font-family: '굴림', 'Gulim';font-size: 12px;color: #b2b2b2;">배송 등 거래를 위해 판매자에게 개인정보가 공유됩니다. <a href="javascript:void(0)" id="btn_tt"><span><b>자세히</b></span></a></p>
								<p id="p_tt" style="display:none;border: 1px solid #ddd; border-top: none; background-color: #f3f3f3; padding: 10px;font-family: '굴림', 'Gulim';font-size: 12px;color: #b2b2b2;">
									CaxiDogi 의 회원계정으로 상품 및 서비스를 구매하고자 할 경우, (주)CaxiDogi 는 거래 당사자간 원활한 의사소통 및 배송, 상담 등 거래이행을 위하여 필요한 최소한의 개인정보만을 CaxiDogi 입점업체 판매자 및 배송업체에 아래와 같이 공유하고 있습니다.<br><br>
									1. (주)CaxiDogi 는 귀하께서 CaxiDogi 입점업체 판매자로부터 상품 및 서비스를 구매하고자 할 경우, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 24조의 2(개인정보 공유동의 등)에 따라 아래와 같은 사항은 안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다.<br> "개인정보 제3자 공유 동의"를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다.<br><br>
									2. 개인정보를 공유받는자 : (주)비트캠프<br><br>
									3. 공유하는 개인정보 항목<br>
									- 구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보<br>
									- 수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지 주소<br><br>
									4. 개인정보를 공유받는 자의 이용 목적 : 판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등<br><br>
									5. 개인정보를 공유받는 자의 개인정보 보유 및 이용 기간 : 개인정보 수집 및 이용 목적 달성 시까지 보관합니다.<br><br>
									6. 동의 거부 시 불이익 : 본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 거래가 제한됩니다.<br><br>
								</p><br>
								<p>
									<input type="checkbox" id="Agreement_02"><strong>위 상품 정보 및 거래 조건을 확인하였으며, 구매 진행에 동의합니다.  </strong><strong style="color: red;">(필수)</strong>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="button_Wrap" style="text-align: center;">
				<a class="button_Wrap_a" id="btn_payment">Product <span class="button_span">결제 하기</span></a>
			</div>
		</div>
	</div>
</div>

<div class="kakao_pop_Wrap" style="display:none;">
	<iframe id="kakaopay_iframe" src="" width="400" height="400"></iframe>
</div>
<%-- 주소 api 연결 --%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address_number').value = data.zonecode;
                document.getElementById("address_string").value = roadAddr;
                /* document.getElementById("").value = data.jibunAddress;   지번 주소를 가져올 수 있다. */
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("address_extra").value = extraRoadAddr;
                } else {
                    document.getElementById("address_extra").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

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

<%-- 버튼 동작 --%>
<script>


	function phone_util( phone ){
		var addNumber = [ "010", "011", "016", "017", "018", "019", "02", "031", "032", "033",
			 "041", "042", "043", "051", "052", "053", "054", "055", "061", "062", "063", "064" ];

		var R_phone = "";
		var findIndex = -1;

		console.log("들어온값 = " + phone);
		
		for(i =0; i < addNumber.length; i++){
			if(phone.includes(addNumber[i])){
				findIndex = i;
				break;
			}	
		}
		
		R_phone += addNumber[findIndex];
		R_phone += "-";
		var strlength = addNumber[findIndex].length;
		//작업지 
		phone = phone.substr(strlength); 
		console.log("잘라낸 값 = " + phone);
		if(phone.length == 7){

			R_phone += phone.substr(0, 3);
			R_phone += "-";
			
			R_phone += phone.substr(3);
		}else{
			R_phone += phone.substr(0, 4);
			R_phone += "-";
			
			R_phone += phone.substr(4);
		}
		
		return R_phone;
	}	

	//배송지 동작 처리 
	$("input[name='sale_address']").on("change", function(){
		//alert("g");
		//alert($(this).val());

		if($(this).val() == 1){

			$.ajax({

				url:"getDefultAddress.do",
				type:"GET",
				data:{
						mem_seq:${loginUser.getMem_seq()}
				},
				success: function (data){
					//alert("통신성공");

					//이름
					$('#sale_name').val(data.user_name);
					
					//번호
					var phone = phone_util(data.phone);
					
					console.log("반환값 = " + phone);
					phone = phone.split("-");

					$('#phone_top').val(phone[0]).attr('selected','selected');
					$('#phone_middle').val(phone[1]);
					$('#phone_bottom').val(phone[2]);

					//주소
					var address = data.address;
					address = address.split("/");
					
					// address[0] 우편번호
					$('#address_number').val(address[0]);
					$('#address_string').val(address[1]);
					$('#address_detail').val(address[2]);
					
				},
				errer: function (){
					//alert("통신 실패");
				}

			});	

		}else{
			//초기화
			//이름
			$('#sale_name').val("");
			//번호
			$('#phone_top').val('0').attr('selected','selected');
			$('#phone_middle').val("");
			$('#phone_bottom').val("");
			//주소
			$('#address_number').val("");
			$('#address_string').val("");
			$('#address_detail').val("");
		}							
	})
	
	//Payment info / Agreement 자세히 클릭 동작
	$("#btn_tt").click(function (){
		
		//alert($('#p_tt').is(":visible"));

	
		if($('#p_tt').is(":visible")){
			$('#p_tt').css("display","none");
			//alert($(this).children().children().text("자세히"));
		}else{
			$('#p_tt').css("display","block");
			//alert($(this).children().children().text("닫기"));
		}
	});

	
	$("input[name='sel_payment']").on("change", function (){
		
		//alert("ㄱ");
		if($(this).val() == 'kakaopay'){
			//alert("카카오 클릭");
		}else{
			//alert("무통장 클릭");
		}
	});

	/*  Agreement 전체 동의 처리  */
	$('#all_Agreement').click(function (){
		
		if($(this).is(":checked")){
			$("#Agreement_01").prop('checked',true);
			$("#Agreement_02").prop('checked',true);
		}else{
			$("#Agreement_01").prop('checked',false);
			$("#Agreement_02").prop('checked',false);
		}
	});

	$('#btn_payment').click(function () {
		var middle = /^[0-9]{3,4}$/gm;
		var bottom = /^[0-9]{4}$/gm;	
		//예외처리 
		
		//이름
		if($('#sale_name').val() == ""){ Swal.fire({ icon: 'error', title: '수령지/배송지명이 공백입니다', text: '빈칸을 채워주세요',})	}

		//연락처
		else if($('#phone_top').val() == 0){ Swal.fire({ icon: 'error', title: '연락처를 확인해주세요', text: '빈칸을 채워주세요',})	}
		else if(!middle.test($('#phone_middle').val()) || $('#phone_middle').val() == ""){ Swal.fire({ icon: 'error', title: '연락처를 확인해주세요', text: '빈칸을 채워주세요',})	}	
		else if(!bottom.test($('#phone_bottom').val()) || $('#phone_bottom').val() == ""){ Swal.fire({ icon: 'error', title: '연락처를 확인해주세요', text: '빈칸을 채워주세요',})	}

		//주소
		else if($('#address_number').val()==""){ Swal.fire({ icon: 'error', title: '주소를 확인해주세요', text: '빈칸을 채워주세요',})	}
		else if($('#address_string').val()==""){ Swal.fire({ icon: 'error', title: '주소를 확인해주세요', text: '빈칸을 채워주세요',})	}
		else if($('#address_detail').val()==""){ Swal.fire({ icon: 'error', title: '주소를 확인해주세요', text: '빈칸을 채워주세요',})	}

		//동의 
		else if($("#Agreement_01").is(":checked") == false){ Swal.fire({ icon: 'error', title: '개인정보 동의 체크가 안되어있습니다.', text: '동의사항을 체크해주세요',})	}
		else if($("#Agreement_02").is(":checked") == false){ Swal.fire({ icon: 'error', title: '상품정보/거래조건 확인 체크가 안되어있습니다.', text: '동의사항을 체크해주세요',})	}
	
		else{
			//alert("통과");

			var acount = $("#prd_list input[type='text']");
			var prdNum = $("#prd_list input[type='hidden']");
			var acountArr = new Array();
			var prdArr = new Array();
			for(i=0; i < acount.length; i++){
				acountArr[i] = $(acount[i]).val();
				prdArr[i] = $(prdNum[i]).val();
				//console.log(prdArr[i]);
			}

			var phoneNum = "" + $('#phone_top').val() +"-"+ $('#phone_middle').val() +"-"+ $('#phone_bottom').val();
			var addr = "" + $('#address_number').val() + "/"+ $('#address_string').val() + "/" + $('#address_detail').val();
			var totalPrice = $('#prd_list').children().last().children('td').children('.total_Price_Sum').text();
					 
			//이제 ajax로 카카오페이 결제준비를 한다.
			$.ajax({
				url:"kakaoReady.do",
				type:"post",
				traditional : true,
				data: {
					acount:acountArr,
					productSeq:prdArr,
					saleing_name:$('#sale_name').val(),
					saleing_tel:phoneNum,
					saleing_addr:addr,
					totalPrice:totalPrice,	
				},
				success: function ( result ){
					//alert("통신성공");
					//alert(result);
					var popupWidth = 450;
					var popupHeight = 500;

					var popupX = (window.screen.width / 2) - (popupWidth / 2);
					// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

					var popupY= (window.screen.height / 2) - (popupHeight / 2);
					// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
					window.open(result,"카카오페이 결제","width="+popupWidth+",height="+popupHeight+",top="+popupY+",left="+popupX);

				},
				error: function (){
					//alert("통신실패");
				}
			})

			
		}
	});
	
</script>

<script>
	function paymentConfirm( index ){
		if(index == 1){
			location.href="myPageMove.do";	
		}else{
			location.href="prdList.do";
		}
	}
</script>


<%@ include file="./../../../include/footer.jsp"%>