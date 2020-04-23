<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/include/header.jsp"%>

<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>BEST</li>
		<li>사료</li>
	</ul>
</div>

<!-- container S : -->
<div class="container_subWrap sub_detail">
	
	<div class="prd_infoWrap"> 
		
		<div class="prdName_section clearfix">
			<div class="prd_name">
				<p class="prd_flag clearfix">
					<img src="images/img_prdDetail_flag_best.jpg" alt="BEST 상품">
					<img src="images/img_prdDetail_flag_sale.jpg" alt="SALE 상품">
				</p>
				${prddetail.product_name }
			</div>
		</div><!--// prdName_section -->
		
		
		<div class="prdInfo_section clearfix" style="width: 100%;">
			<div style="width: 50%; height:50%; float:left; background-color: #4BAF4B;">사진 들어갈 공간</div>
			<div class="right div" style="width: 50%; float:left;">
				<div class="col2">
					<div class="info">
						<h3>${prddetail.product_name }</h3>
						<ul>
							<li>
								<dl>
									<dt>판매가</dt>
									<dd class="c_green">
										<strong class="fs20">
											<fmt:formatNumber value="${prddetail.product_price}" pattern="###,###,###"/>
											<%--  ${prddetail.product_price}--%>
										</strong>
									</dd>
								</dl>
							</li>
						</ul>
	
						<table class="select_prd_wrap">
							<colgroup>
								<col width="20%">
								<col width="10%">
								<col width="35%">
								<col width="35%">
							</colgroup>
							
							<thead style="background-color:	#c8c8c8;">
							<tr>
								<td>상품선택</td>
								<td colspan="3">
									<select id="prdSelect">
										<option value="0" selected="selected" disabled>상품 상세 선택</option>
										<option value="${prddetail.product_num }">${prddetail.product_name}</option>
										<%-- 조건('/' 자른 문자열이 포함된 이름을 가진 )에 맞는 자기 자신을 제외한 값이 있으면 --%>
										<c:if test="${OptionProduct.size() > 1 }">
											<option disabled>------------------------ 옵션 상품  -------------------------</option>
											<%-- for문을 통해 option 생성  --%>
											<c:forEach var="OptionDto" items="${OptionProduct }">
											<%-- 디테일 뷰의 DTO의 이름과 가져온 값의 이름이 다르면 생성  --%>
											<c:if test="${prddetail.product_name ne OptionDto.product_name }">
												<option value="${OptionDto.product_num }">${OptionDto.product_name }</option>
											</c:if>
											</c:forEach>
										</c:if>
									</select>
								</td>
							</tr>
							</thead>
							<tbody id="select_product">
								
							</tbody>
						</table>
	
						<p class="total_price clearfix pt20 pb15">
							<span class="fl pt5">총 합계금액</span>
							<span class="fr"><strong class="c_red totalPrice">1,000,000</strong>원</span>
						</p>
						<input type="hidden" name="totalPrice">
						
						
						<p class="prdBtns clearfix">
							<a href="#n" class="btn_green_l p0" id="orderBtn">바로구매</a>
							<a href="#n" class="btn_dark_l p0">장바구니</a>
							<!-- <span class="sign_soldout">일시품절인 상품입니다.</span> -->
							<a href="#n" class="btn_line_l p0 btn_wishlist" alt="위시리스트"></a>
						</p>	
						
					</div><!-- info -->
				</div><!-- col2 -->
			</div><!-- right div -->
		</div><!--// prdInfo_section -->
	</div><!--// prd_infoWrap -->	
	
	<div class="prd_detail_infoWrap">
		<ul class="detailTab">
			<li>
				<a href=".move01" class="current">
					상품설명
					<img src="./images/ico_arrow_prdDetail.gif">
				</a>
			</li>
			<li><a href=".move02">상품정보<img
					src="./images/ico_arrow_prdDetail.gif"></a></li>
			<li><a href=".move03">상품평(0)<img
					src="./images/ico_arrow_prdDetail.gif"></a></li>
			<li><a href=".move04">상품Q&amp;A<img
					src="./images/ico_arrow_prdDetail.gif"></a></li>
			<li><a href=".move05">배송/교환/반품<img
					src="./images/ico_arrow_prdDetail.gif"></a></li>
		</ul>
		
		<div class="detailView move01">
			${prddetail.product_content }
			<!-- <img src="./images/img_prdInfo.jpg"> -->
		</div>
		
		<div class="detailView move02">
			<h3>상품정보</h3>
			<table class="basic_tableStyle basic_tableStyle_vert">
				<colgroup>
					<col width="150px">
					<col width="*">
					<col width="150px">
					<col width="*">
					<col width="150px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>소재/순도/밴드재질</th>
						<td>상품 상세 페이지 참조</td>
						<th>소재/순도/밴드재질</th>
						<td>상품 상세 페이지 참조</td>
						<th>소재/순도/밴드재질</th>
						<td>상품 상세 페이지 참조</td>
					</tr>
					<tr>
						<th>소재/순도/밴드재질</th>
						<td>상품 상세 페이지 참조</td>
						<th>소재/순도/밴드재질</th>
						<td>상품 상세 페이지 참조</td>
						<th>소재/순도/밴드재질</th>
						<td>상품 상세 페이지 참조</td>
					</tr>
					<tr>
						<th>소재/순도/밴드재질</th>
						<td>상품 상세 페이지 참조</td>
						<th>소재/순도/밴드재질</th>
						<td>상품 상세 페이지 참조</td>
						<th>소재/순도/밴드재질</th>
						<td>상품 상세 페이지 참조</td>
					</tr>
				</tbody>
			</table>
		</div><!-- detailView move02 -->
		<div class="detailView move03">
			<h3>
				상품평
				<span class="fs12">2<span class="c_gray">개의 상품평이 있습니다.</span></span>
			</h3>
			<div class="reviewStar_view clearfix">
				<div class="fl averageStars">
					<img src="./images/img_review_totalStar_5.png">
					<span class="reviewAverage">5.0</span>
				</div>
				<ul class="eachStars clearfix fs12 fr">
					<li>상품<img src="./images/img_review_smallStar_5.gif"
						class="ml5 mr5">(4.4)</li>
					<li>가격<img src="./images/img_review_smallStar_5.gif"
						class="ml5 mr5">(4.4)</li>
					<li>배송<img src="./images/img_review_smallStar_5.gif"
						class="ml5 mr5">(4.4)</li>
					<li>서비스<img src="./images/img_review_smallStar_5.gif"
						class="ml5 mr5">(4.4)</li>
				</ul>
			</div>
			<div class="table_menu clearfix">
				<ul class="clearfix">
					<li><a href="#n" class="current"><img
							src="./images/ico_review_total.gif">전체(0)</a></li>
					<li><a href="#n"><img src="./images/ico_review_photo.gif">사진상품평(0)</a></li>
					<li><a href="#n"><img src="./images/ico_review_video.gif">동영상 상품평(0)</a></li>
				</ul>
				<a href="#n" class="btn_gray">작성하기</a>
				<a href="#n" class="btn_line_s fr mr5">최신 등록순<img
					src="./images/ico_arrow_s.gif" class="ml5 p0"></a>
			</div>
			<table class="basic_tableStyle">
				<colgroup>
					<col width="128px">
					<col width="*">
					<col width="90px">
					<col width="130px">
				</colgroup>
				<tbody>
					<tr class="view_tableTit">
						<td><strong>전문가 리뷰</strong></td>
						<td class="tl"><a href="#n">전 세계인이 탐내는 그 제품입니다.<img
								src="./images/ico_review_video.gif"></a></td>
						<td class="c_gray02">관리자</td>
						<td class="c_gray02">2020.04.03</td>
					</tr>
					<tr class="view_tableCn">
						<td colspan="4">
							<p class="fl Vsec">
								<span>
									배송 신청일에 아침 일찍 전화주셔서 5분 만에 설치했습니다 설치 후에도 사용 설명 및 as설명까지 친절하게 대해주시고 쓰던 tv버리기 힘들 것같아 수거 요청했는데<br />
									설치끝나고 수거까지 원스탑 이제 가전은 하이마트에서 살것같아요
								</span>
								<img src="./images/img_viewReview.jpg">
							</p>
						</td>
					</tr>
					<tr class="view_tableTit">
						<td><img src="./images/img_review_smallStar_5.gif"></td>
						<td class="tl"><a href="#n">역시 가성비 최고입니다.<img
								src="./images/ico_review_photo.gif"></a></td>
						<td class="c_gray02">abc****</td>
						<td class="c_gray02">2020.04.03</td>
					</tr>
					<tr class="view_tableCn">
						<td colspan="4">
							<ul class="eachStars clearfix">
								<li>상품<img src="./images/img_review_smallStar_5.gif"
									class="ml5"></li>
								<li>가격<img src="./images/img_review_smallStar_5.gif"
									class="ml5"></li>
								<li>배송<img src="./images/img_review_smallStar_5.gif"
									class="ml5"></li>
								<li>서비스<img src="./images/img_review_smallStar_5.gif"
									class="ml5"></li>
								<li class="fr"><a href="#n" class="btn_gray">신고하기</a></li>
							</ul>
							<p class="fl Vsec">
								<span>
									배송 신청일에 아침 일찍 전화주셔서 5분 만에 설치했습니다 설치 후에도 사용 설명 및 as설명까지 친절하게 대해주시고 쓰던 tv버리기 힘들 것같아 수거 요청했는데<br />
									설치끝나고 수거까지 원스탑 이제 가전은 하이마트에서 살것같아요
								</span>
								<img src="./images/img_viewReview.jpg">
							</p>
							<p class="fr" style="padding-right: 13px;">
								<a href="#n" class="btn_dark_s mr5">수정</a>
								<a href="#n" class="btn_line_s">삭제</a>
							</p>
						</td>
					</tr>
					<tr class="view_tableTit">
						<td><img src="./images/img_review_smallStar_5.gif"></td>
						<td class="tl"><a href="#n">역시 가성비 최고입니다.<img
								src="./images/ico_review_photo.gif"></a></td>
						<td class="c_gray02">abc****</td>
						<td class="c_gray02">2020.04.03</td>
					</tr>
					<tr class="view_tableCn">
						<td colspan="4">
							<ul class="eachStars clearfix">
								<li>상품<img src="./images/img_review_smallStar_5.gif"
									class="ml5"></li>
								<li>가격<img src="./images/img_review_smallStar_5.gif"
									class="ml5"></li>
								<li>배송<img src="./images/img_review_smallStar_5.gif"
									class="ml5"></li>
								<li>서비스<img src="./images/img_review_smallStar_5.gif"
									class="ml5"></li>
								<li class="fr"><a href="#n" class="btn_gray">신고하기</a></li>
							</ul>
							<p class="fl Vsec">
								<span>
									배송 신청일에 아침 일찍 전화주셔서 5분 만에 설치했습니다 설치 후에도 사용 설명 및 as설명까지 친절하게 대해주시고 쓰던 tv버리기 힘들 것같아 수거 요청했는데<br />
									설치끝나고 수거까지 원스탑 이제 가전은 하이마트에서 살것같아요
								</span>
								<img src="./images/img_viewReview.jpg">
							</p>
							<p class="fr" style="padding-right: 13px;">
								<a href="#n" class="btn_line_s">삭제</a>
							</p>
							<ul class="answerSec">
								<li>
									<strong class="userNm">관리자</strong>
									마음에 드셨다니 다행입니다. 앞으로도 최선을 다하는 Swatch가 되겠습니다.^^<span
									class="c_gray pl10">2020-04-03</span>
								</li>
								<li>
									<strong class="userNm">관리자</strong>
									마음에 드셨다니 다행입니다. 앞으로도 최선을 다하는 Swatch가 되겠습니다.^^<span
									class="c_gray pl10">2020-04-03</span>
								</li>
								<li>
									<strong class="userNm">관리자</strong>
									마음에 드셨다니 다행입니다. 앞으로도 최선을 다하는 Swatch가 되겠습니다.^^<span
									class="c_gray pl10">2020-04-03</span>
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="pagination">
				<a href="#n" class="btn_table_prev">
				</a><a href="#n" class="current">
				1</a><a href="#n">
				2</a><a href="#n" class="btn_table_next">
				</a>
			</p>
		</div>
		<div class="detailView move04">
			<h3>
				상품Q&amp;A
				<span class="fs12">2<span class="c_gray">개의 Q&amp;A가 있습니다.</span></span>
			</h3>
			<div class="table_menu clearfix">
				<select>
					<option>전체</option>
					<option>상품</option>
					<option>배송</option>
				</select>
				<a href="#n" class="btn_gray">작성하기</a>
			</div>
			<table class="basic_tableStyle">
				<colgroup>
					<col width="128px">
					<col width="*">
					<col width="90px">
					<col width="90px">
					<col width="130px">
				</colgroup>
				<tbody>
					<tr class="view_tableTit">
						<td class="c_gray">상품</td>
						<td class="tl"><a href="#n">비공개글입니다.<img
								src="./images/ico_lock.gif"></a></td>
						<td><strong>답변완료</strong></td>
						<td class="c_gray02">abc****</td>
						<td class="c_gray02">2020.04.03</td>
					</tr>
					<tr class="view_tableCn view_tableCn02">
						<td></td>
						<td colspan="4">
							<span class="Qsec">
								매장에서 봤는데 화이트 말고 메탈색이 있던데 쇼핑몰에서 구입할 수 있나요?
								<span class="fr"><a href="#n" class="btn_line_s">삭제</a></span>
							</span>
							<span class="Asec">
								안녕하세요. 고객님<br />
								에스워치매니악 고객센터 입니다.<br />
								문의하신 상품의 다른 색상을 확인해보았습니다.<br />
								일반 매장에서도 해당 색상은 메탈색이 없고 다른 상품인 UX500323R 제품이 유사모델로 메탈색이<br />
								있습니다. 해당 상품 저희 롯데하이마트 온라인 스토어에서 판매하고 있습니다.<br />
								모델 코드를 검색하시면 상품을 확인하실 수 있습니다.<br />
								추가 문의 사항은 고객센터나 문의하기를 이용해주시면 빠른 시간 내에 답변 드리겠습니다.<br />
								감사합니다.
								<span class="fr">2020-04-20</span>
							</span>
						</td>
					</tr>
					<tr class="view_tableTit">
						<td class="c_gray">상품</td>
						<td class="tl"><a href="#n">비공개글입니다.<img
								src="./images/ico_lock.gif"></a></td>
						<td><strong>답변완료</strong></td>
						<td class="c_gray02">abc****</td>
						<td class="c_gray02">2020.04.03</td>
					</tr>
					<tr class="view_tableCn view_tableCn02">
						<td></td>
						<td colspan="4">
							<span class="Qsec">
								매장에서 봤는데 화이트 말고 메탈색이 있던데 쇼핑몰에서 구입할 수 있나요?
								<span class="fr"><a href="#n" class="btn_line_s">삭제</a></span>
							</span>
							<span class="Asec">
								안녕하세요. 고객님<br />
								에스워치매니악 고객센터 입니다.<br />
								문의하신 상품의 다른 색상을 확인해보았습니다.<br />
								일반 매장에서도 해당 색상은 메탈색이 없고 다른 상품인 UX500323R 제품이 유사모델로 메탈색이<br />
								있습니다. 해당 상품 저희 롯데하이마트 온라인 스토어에서 판매하고 있습니다.<br />
								모델 코드를 검색하시면 상품을 확인하실 수 있습니다.<br />
								추가 문의 사항은 고객센터나 문의하기를 이용해주시면 빠른 시간 내에 답변 드리겠습니다.<br />
								감사합니다.
								<span class="fr">2015-08-08</span>
							</span>
						</td>
					</tr>
					<tr class="view_tableTit">
						<td class="c_gray">상품</td>
						<td class="tl"><a href="#n">비공개글입니다.<img
								src="./images/ico_lock.gif"></a></td>
						<td><strong>답변완료</strong></td>
						<td class="c_gray02">abc****</td>
						<td class="c_gray02">2020.04.03</td>
					</tr>
					<tr class="view_tableCn view_tableCn02">
						<td></td>
						<td colspan="4">
							<span class="Qsec">
								매장에서 봤는데 화이트 말고 메탈색이 있던데 쇼핑몰에서 구입할 수 있나요?
								<span class="fr"><a href="#n" class="btn_line_s">삭제</a></span>
							</span>
							<span class="Asec">
								안녕하세요. 고객님<br />
								에스워치매니악 고객센터 입니다.<br />
								문의하신 상품의 다른 색상을 확인해보았습니다.<br />
								일반 매장에서도 해당 색상은 메탈색이 없고 다른 상품인 UX500323R 제품이 유사모델로 메탈색이<br />
								있습니다. 해당 상품 저희 롯데하이마트 온라인 스토어에서 판매하고 있습니다.<br />
								모델 코드를 검색하시면 상품을 확인하실 수 있습니다.<br />
								추가 문의 사항은 고객센터나 문의하기를 이용해주시면 빠른 시간 내에 답변 드리겠습니다.<br />
								감사합니다.
								<span class="fr">2015-08-08</span>
							</span>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="pagination">
				<a href="#n" class="btn_table_prev">
				</a><a href="#n" class="current">
				1</a><a href="#n">
				2</a><a href="#n" class="btn_table_next">
				</a>
			</p>
		</div>
		<div class="detailView move05">
			<h3>배송/반품/교환안내</h3>
			<p class="table_menu">
				<img src="./images/ico_box.gif">배송안내
			</p>
			<table class="basic_tableStyle">
				<colgroup>
					<col width="190px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>배송안내</th>
						<td class="tl"><strong>전국(일부 도서지역 제외)</strong></td>
					</tr>
					<tr>
						<th>배송비</th>
						<td class="tl">
							전국 무료배송 (일부 도시지역 제외)이 원칙이나 결제금액이 3만원 미만인 경우에는 택배비 2,500원이 부과됩니다.<br />
							동일상품, 동일제조사 상품 3만원 이상 주문시 배송비 무료<br />
							동일상품, 동일제조사 상품 3만원 미만 주문시 묶음배송 2,500원 부과<br />
							기본 택배비는 2,500원이나 일부 지역에 한해 추가 요금이 발생할 수 있습니다. ex) 제주 : 5,500원, 섬지역 7,000원)<br />
							교환 / 반품 배송비 : 단순변심 등 고객님의 귀책사유로 인한 교환/반품시 왕복배송비 고객부담<br />
							  - 소형 박스 상품 : 5,000원(카메라, 전기주전자, 믹서기 등)<br />
							  - 대형 박스 상품 : 8,000원(전기밥솥, 가스레인지, 전자레인지 등)<br />
							※ 단, 일부 지역 추가 요금 발생 (ex) 제주 : 11,000원 , 섬지역 14,000원
						</td>
					</tr>
				</tbody>
			</table>
			<p class="table_menu mt30">
				<img src="./images/ico_box.gif">반품/교환안내
			</p>
			<table class="basic_tableStyle">
				<colgroup>
					<col width="190px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>교환/반품 안내</th>
						<td class="tl">
							<strong>상품 수령일로부터 7일 이내 가능 경우</strong><br />
							- 고객님의 단순변심으로 인한 교환.반품 단, 상품 포장이 미개봉인 경우에 한함 (단, 휴대폰 등 개통이 필요한 상품은 개통 이후 반품불가)<br />
							고객님의 변심으로 인한 교환/반품을 하시는 경우 상품 등의 반환에 필요한 비용은 고객님이 부담하셔야 됩니다.<br />
							(왕복택배비, 배송비, 철거비, 사다리차 비용 등 상품별로 달라질 수 있습니다.)<br /><br />
							<strong>상품 수령일로부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내 가능 경우</strong><br />
							- 배송된 상품이 주문내용과 상이하거나 쇼핑몰이 제공한 정보와 상이한 경우<br />
							- [방문판매등에관한법률]에 의거 광고에 표시하여야 할 사항을 표시하지 아니한 상태에서 이용자의 청약이 이루어진 경우<br /><br />
							<strong>배송받으신 상품이 초기불량 및 하자 사유로 가능 경우</strong><br />
							- 단, 일부 제조사의 경우 자체 AS센터에서 불량제품 판정 받은 후 교환/반품 가능<br />
							(A/S센터 있는 곳 : 삼성, LG, 대우, 만도 외 수입가전브랜드 / SONY, 주연, 캐논, HP, 델, 기타 컴퓨터관련 제조사)
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 상품 옵션 선택 하단 레이어 S : -->
		<div class="bttm_optionLayer">
			<div class="optionBox clearfix">
				<p class="leftSec">
					옵션선택 <img src="./images/ico_arr_open_w.png" class="open_btn"><img
						src="./images/ico_arr_close_w.png" style="display: none;"
						class="close_btn">
				</p>
				<p class="rightSec">
					<a href="#n" class="btn_white_m">바로구매</a>
					<a href="#n" class="btn_dark_m">장바구니</a>
				</p>
			</div>
			<div class="optionView">
				<p class="prd_name">힐링 관절용사료</p>
				<a href="#n" class="btn_close_optionView"><img
					src="./images/btn_close_m.png"></a>
				<!-- 일반상품 선택시 -->
				<div class="prdCounter_wrap normalPrd_option">
					<table class="border_none">
						<tbody>
							<tr>
								<td>
									<span class="counter">
										<input type="text" value="1">
										<span class="counterBtn">
											<a href="#n" class="btnPlus"></a>
											<a href="#n" class="btnMinus"></a>
										</span>
									</span>
								</td>
								<td></td>
								<td class="total_price">1,000,000원</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- 옵션상품 선택시 -->
				<!-- <select class="optionSelector">
					<option>옵션선택</option>
					<option>옵션선택</option>
				</select>
				<div class="prdCounter_wrap">
					<table>
						<colgroup>
							<col width="65%">
							<col width="20%">
							<col width="15%">
						</colgroup>
						<tbody>
							<tr>
								<td class="counter_prdname">[세이코시계 SEIKO] SKS515P1 / 크로노그래프 남성 메탈시계 44mm</td>
								<td>
									<span class="counter">
										<input type="text" value="1">
										<span class="counterBtn">
											<a href="#n" class="btnPlus"></a>
											<a href="#n" class="btnMinus"></a>
										</span>
									</span>
								</td>
								<td class="total_price">1,000,000원</td>
								<td><a href="#n" class="btn_prdDelete"><img src="./images/btn_del.gif"></a></td>
							</tr>
							<tr>
								<td class="counter_prdname">[세이코시계 SEIKO] SKS515P1 / 크로노그래프 남성 메탈시계 44mm</td>
								<td>
									<span class="counter">
										<input type="text" value="1">
										<span class="counterBtn">
											<a href="#n" class="btnPlus"></a>
											<a href="#n" class="btnMinus"></a>
										</span>
									</span>
								</td>
								<td class="total_price">1,000,000원</td>
								<td><a href="#n" class="btn_prdDelete"><img src="./images/btn_del.gif"></a></td>
							</tr>
							<tr>
								<td class="counter_prdname">[세이코시계 SEIKO] SKS515P1 / 크로노그래프 남성 메탈시계 44mm</td>
								<td>
									<span class="counter">
										<input type="text" value="1">
										<span class="counterBtn">
											<a href="#n" class="btnPlus"></a>
											<a href="#n" class="btnMinus"></a>
										</span>
									</span>
								</td>
								<td class="total_price">1,000,000원</td>
								<td><a href="#n" class="btn_prdDelete"><img src="./images/btn_del.gif"></a></td>
							</tr>
						</tbody>
					</table>
				</div> -->

				<p class="total_price tr">
					총 합계금액 <span class="c_red"><strong>1,000,000</strong>원</span>
				</p>
			</div>
		</div>
		<!-- 상품 옵션 선택 하단 레이어 E : -->
	</div>
	<!--// prd_detail_infoWrap -->

</div>
<!-- container E : -->


<!-- <div class="lp_bg"></div>
<div class="lp_box lp_box_s">
	<a href="#n" class="btn_close_lp"><img src="images/btn_close_m.png" alt="팝업창닫기"></a>

	<h3 class="lp_title_center">위시리스트 담기</h3>
	<strong>위시리스트에 담기가 완료되업습니다.</strong><br/>
	<span class="fs14">지금 위시리스트를 확인하시겠습니까?</span>

	<p class="btns_center mt30">
		<a href="#" class="btn_red_m">확인</a>
		<a href="#" class="btn_dark_m">닫기</a>
	</p>
</div> -->


<script>
	alert(${OptionProduct.size()});
	var selectComfirm = new Array(${OptionProduct.size()});
		//선택한 상품 테이블 동적 생성
		$('#prdSelect').on("change", function (){
			//alert($(this).val());
			//동적 생성을 위한 변수
			var selectPrdSeq;
			var createProduct = "<tr>";	 
			//생성조건 판단을 위한 for문 
			for(i = 0; i < selectComfirm.length; i++) {
				if(!selectComfirm[i]){
					//alert(i + "번째에는 값이 없습니다");
					selectComfirm[i] = $(this).children("option:selected").text();
					break;
				}else{
					//배열 내에 값이 있으면 
					//선택된 option 값과 배열내의 값이 같으면 리턴 
					if(selectComfirm[i] == $(this).children("option:selected").text()){
						alert("선택하신 제품은 목록에 이미 있습니다");
						return;
					}		
				}
				
				//모두 돌았는데 다 값이 있으면 
				if(i == selectComfirm.length - 1){
					alert("선택하신 제품은 목록에 이미 있습니다");
					return;
				}
			}
			createProduct += "<td colspan='2'>" + $(this).children("option:selected").text() + "<input class='selectPrdSeq' type='hidden' value='" +  + "'></td>"; //선택 상품 이름
			
			createProduct += "<td colspan='1' style='padding-top: 10px;'>"; // 갯수
			createProduct += "<input class='selectPrdBtn' type='button' value='ㅡ'>";
			createProduct += "<input class='productAcount' type='text' value='1' style='width: 30px; border: 1px solid #eee; border-left: none; border-right: none; text-indent: 0; text-align: center; font-weight: bolder; font-size: 20px;margin-right: 5px; margin-left: 5px; vertical-align: middle; display:inline-block; -webkit-box-sizing: border-box; padding: 0 0px;'>";	
			createProduct += "<input class='selectPrdBtn' type='button' value='+'>";	
			createProduct += "</td>";	
			
			createProduct += "<td colspan='1' style='padding-top: 10px;'>";
			createProduct += "<span>";
			createProduct += "<strong class='c_block totalPrice' style='font-size: 15px;'><fmt:formatNumber value='10000000' pattern='###,###,###'/>  원</strong>";	
			createProduct += "<input class='selectDelBtn' type='button' value='X'>";		
			createProduct += "</span>";		
			createProduct += "</td></tr>";	

			//생성
			$("#select_product").append(createProduct);
		});

		//수량을 + , - 시켜주는 처리 
		$(document).on('click', '.selectPrdBtn', function () {
			//alert($(this).val());
			//alert($(this).siblings('input[type=text]').val());
			if($(this).val() == '+'){
				//alert("+ 클릭");
				var inputValue = Number($(this).siblings('input[type=text]').val());//형변환
				inputValue++;
				if(inputValue === 1000){inputValue = 999}
				
				$(this).siblings('input[type=text]').val(inputValue);
				
			}else{
				//alert("ㅡ 클릭");
				var inputValue = Number($(this).siblings('input[type=text]').val());
				inputValue--;
				if(inputValue == 0){inputValue = 1}
					
				$(this).siblings('input[type=text]').val(inputValue);
							
			}
			
		});

		//값을 에외처리 해주는 로직
		$(document).on('change', '.productAcount', function (){
			var inputValue = Number($(this).val());

			if(inputValue < 0 ){
				inputValue = 1;
			}else if(inputValue > 999){
				inputValue= String(inputValue).substr(0,3);//뒷자리 날리기
			}
			
			$(this).val(inputValue);
		});
		
		$('#orderBtn').on('click', function (){
			//데이터를 가지고 구매페이지로 이동 
			location.href="productOrder.do";
		});
			
		


</script>

<%@ include file="./../../../include/footer.jsp"%>

