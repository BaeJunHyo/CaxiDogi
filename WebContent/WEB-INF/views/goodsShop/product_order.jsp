<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp"%>

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
				
				<table class="product_info">
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
					
					<tbody>
						<tr style="border: 1px solid #c8c8c8;">
							<td><%-- 상품 이미지와 이름 정보 --%>
								<div style="padding: 10px 10px 10px 10px;">
									<div class="이미지" style="width:30%; height:100%; float:left; margin-bottom: 10px;">
										<a>
											<img alt="" src="<%=request.getContextPath() %>/images/사막사막01.jpg" width="70" height="50">
										</a>
									</div>
									<div style="width:70%; float:left; text-align: left; align-content: center; padding-top: 12px;">
										<strong>[hit]</strong>사막사막
									</div>
								</div>
							</td>
							<td>
								<span class="counter">
                              <input type="text" value="${acount }" id="count" class="tCount" readonly="readonly">
                              <span class="counterBtn">
                                 <a href="#n" class="btnPlus" onclick="plus()"></a>
                                 <a href="#n" class="btnMinus" onclick="minus()"></a>
                             	 </span> 
                           		</span>
							</td>
							<td><strong>${prdPrice}  원</strong></td>
							<td>5%</td>
							<td><strong>지역에 맞게</strong></td>
							<td><strong>${prdPrice * 5 } 원</strong></td>
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
								<input type="radio" value="기본 배송지">기본 배송지 정보
								&nbsp;&nbsp;
								<input type="radio">직접 작성
							</td>
						</tr>
						<tr><%-- 수령인/배송지명 --%>
							<td>수령인/배송지명</td>
							<td>
								<input type="text">
							</td>
						</tr>
						<tr><%-- 휴대전화  --%>
							<td>휴대전화</td>
							<td>
								<select>
									<option>선택하세요</option>
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
								</select>
								<font> -</font>&nbsp; 
								<input type="text">
								<font> -</font>&nbsp;
								<input type="text">
							</td>
						</tr>
						<tr><%-- 전화번호 --%>
							<td>전화번호</td>
							<td>
								<select>
									<option>선택하세요</option>
									<option>02</option>
									<option>031</option>
									<option>032</option>
									<option>033</option>
									<option>041</option>
									<option>042</option>
									<option>043</option>
									<option>051</option>
									<option>052</option>
									<option>053</option>
									<option>054</option>
									<option>055</option>
									<option>061</option>
									<option>062</option>
									<option>063</option>
									<option>064</option>
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
								</select>
								<font> -</font>&nbsp; 
								<input type="text">
								<font> -</font>&nbsp;
								<input type="text">
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
								<input type="radio">카카오페이 &nbsp; <input type="radio">무통장입금    
							</td>
						</tr>
						<tr>
							<td>결제 안내</td>
							<td>
								수단 선택에 따른 다른 창
							</td>
						</tr>
						<tr>
							<td>주문자 동의 <br><br>
								<input type="checkbox"><span>전체 동의</span>
							</td>
							<td>
								<p>
									<input type="checkbox"> <strong>개인정보 제 3 자 제공 동의  </strong><strong style="color: red;">(필수)</strong>
								</p><br>
								<p style="color: #c8c8c8;">배송 등 거래를 위해 판매자에게 개인정보가 공유됩니다. <a><span><b>자세히</b></span></a></p>
								<p style="display:none;">
									무신사의 회원계정으로 상품 및 서비스를 구매하고자 할 경우, (주)무신사는 거래 당사자간 원활한 의사소통 및 배송, 상담 등 거래이행을 위하여 필요한 최소한의 개인정보만을 무신사 입점업체 판매자 및 배송업체에 아래와 같이 공유하고 있습니다.
									1. (주)무신사는 귀하께서 무신사 입점업체 판매자로부터 상품 및 서비스를 구매하고자 할 경우, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 제 24조의 2(개인정보 공유동의 등)에 따라 아래와 같은 사항은 안내하고 동의를 받아 귀하의 개인정보를 판매자에게 공유합니다. "개인정보 제3자 공유 동의"를 체크하시면 개인정보 공유에 대해 동의한 것으로 간주합니다.
									2. 개인정보를 공유받는자 : (주)부림상사
									3. 공유하는 개인정보 항목
									- 구매자 정보: 성명, 전화번호, ID, 휴대전화 번호, 메일주소, 상품 구매정보
									- 수령자 정보: 성명, 전화번호, 휴대전화 번호, 배송지 주소
									4. 개인정보를 공유받는 자의 이용 목적 : 판매자와 구매자의 거래의 원활한 진행, 본인의사의 확인, 고객 상담 및 불만처리, 상품과 경품 배송을 위한 배송지 확인 등
									5. 개인정보를 공유받는 자의 개인정보 보유 및 이용 기간 : 개인정보 수집 및 이용 목적 달성 시까지 보관합니다.
									6. 동의 거부 시 불이익 : 본 개인정보 공유에 동의하지 않으시는 경우, 동의를 거부할 수 있으며, 이 경우 거래가 제한됩니다.
								</p><br>
								<p>
									<input type="checkbox"><strong>위 상품 정보 및 거래 조건을 확인하였으며, 구매 진행에 동의합니다.  </strong><strong style="color: red;">(필수)</strong>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="button_Wrap" style="text-align: center;">
				<a class="button_Wrap_a" onclick="">Product <span class="button_span">결제 하기</span></a>
			</div>
		</div>
	</div>
	
	<div class="kakao_pop_Wrap">
		<iframe id="" src=""></iframe>
	</div>
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
	

<%@ include file="./../../../include/footer.jsp"%>