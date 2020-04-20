<%@page import="cd.com.a.model.shopDesignerDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ include file="./../../../include/header.jsp"%>
<link href="./css/shopresv.css" rel="stylesheet">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link href="./css/calstyle2.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
<style>
.cant{
	opacity: 0.65; 
   cursor: not-allowed; 

} 

</style>  
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
					<!-- <img src="" alt="BEST 상품">
					<img src="" alt="SALE 상품"> -->
				</p>
				${shopDetail.shop_name}
			</div>

		</div>
		<!--// prdName_section -->
		<div class="prdInfo_section clearfix">
			<div class="col1">
				<div class="thumb">
					<!-- <div class="prdImg easyzoom easyzoom--adjacent easyzoom--with-thumbnails">
						<a href="images/img_prdBigThumb_zoom_1.jpg">
							<img src="images/img_prdBigThumb_1.jpg">
						</a>
					</div> -->
					<div class="easyzoom easyzoom--adjacent easyzoom--with-thumbnails" align="center">
					<c:if test="${shopDetail.shop_photo == 'default' }">
							<img class="MS_prod_img_m"
								src="./images/shopImg/default.png" alt="">
						</c:if>
						<c:if test="${shopDetail.shop_photo != 'default' }">
							<img class="MS_prod_img_m"
								src="<%=request.getContextPath() %>/images/shopImg/${shopDetail.shop_photo }" alt="">
						</c:if>
					</div>

					<!-- <ul class="prdThumb thumbnails">
						<li class="current">
							<a href="./images/img_prdBigThumb_zoom_1.jpg" data-standard="./images/img_prdBigThumb_1.jpg">
								<img src="./images/img_prdBigThumb_1.jpg">
							</a>
						</li>
						<li>
							<a href="./images/img_prdBigThumb_zoom_2.jpg" data-standard="./images/img_prdBigThumb_2.jpg">
								<img src="./images/img_prdBigThumb_2.jpg">
							</a>
						</li>
						<li>
							<a href="./images/img_prdBigThumb_zoom_3.jpg" data-standard="./images/img_prdBigThumb_3.jpg">
								<img src="./images/img_prdBigThumb_3.jpg">
							</a>
						</li>
					</ul> -->
				</div>
			</div>
			<!--// col1 -->

		  <form action="">
			<div class="col2">
				<div class="info">
				<input type="hidden" name="shop_seq" id="shop_seq" value="${shopDetail.shop_seq }">
				
					<strong>${shopDetail.shop_name}</strong>
					<ul>

						<li>
							<dl>
								<dt>소개글</dt>
								<dd class="c_green">
									<span class="fs20">${shopDetail.shop_etc}</span>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>기본미용 가격</dt>
								<dd class="price-red">
									<span>소형 : ${shopDetail.shop_small_price}</span>원
									<span>중형 : ${shopDetail.shop_medium_price}</span>원
									<span>대형 : ${shopDetail.shop_large_price}</span>원
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>영업시간</dt>
								<dd>
									<strong>${shopDetail.shop_time}</strong>
								</dd>
							</dl>
						</li>
							<li>
							<dl>
								<dt>전화번호</dt>
								<dd>
									<strong>${shopDetail.shop_tel}</strong>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>주소</dt>
								<dd>
									<strong>${fn:split(shopDetail.shop_addr, '/')[1]}</strong>
							
								</dd>
							</dl>
							<hr class="mt15">

						</li>
						<li>
						
						<div  id="datepicker" align="center"></div>
						<input type="hidden" id="shop_resv_rday" name="shop_resv_rday">
						</li>
						<li class="desginerName">
						<div id="desginerName">
						
						<input type="hidden" name="">
							<dl class="desname">
								<%-- <dt id="desName">${desList.design_name}</dt> --%>
								<dt>
								<select id="sel">
								<option class="selDes" value="-1" selected="selected">디자이너 선택</option>
								<c:forEach items="${designerList }" var="desList" varStatus="des">
									<option class="selDes" design_time="${desList.design_time }"  design_seq="${desList.design_seq}" value="${desList.design_seq }">${desList.design_name}</option>
								</c:forEach>
								</select>
								<input type="hidden" name="design_seq" value="${desList.design_seq}">
								<input type="hidden" name="design_seq" value="${desList.design_seq}">
								
								<%-- <span id="getTime" design_time="${desList.design_time }"  design_seq="${desList.design_seq}" class="getTime">${desList.design_name}</span> --%></dt>
								<dd></dd>
							</dl>
						</div>
						</li>
						<li class="desginerName destime">
							<div id="desginerTime">
							<%-- <c:forEach items="${designerList }" var="desList" varStatus="des"> --%>
						
								<ul id="dtime" style="display: none">
								
								</ul>
							<%-- </c:forEach> --%>
							</div>
						</li>
							<li style="clear: both;">
							
								<hr class="mt15">
							</li>
					</ul>
				</div>
					<p class="prdBtns clearfix">
						<a href="#n" class="btn_green_l p0">바로구매</a>
						<a href="#n" class="btn_dark_l p0">예약하기</a>
						<!-- <span class="sign_soldout">일시품절인 상품입니다.</span> -->
						<a href="#n" class="btn_line_l p0 btn_wishlist" alt="위시리스트"></a>
					</p>
				
				</div>
				</form>
			</div>
			<!--// col2 -->
		</div>
		<!--// prdInfo_section -->
	</div>
	<!--// prd_infoWrap -->
	<div class="prd_detail_infoWrap">
		<ul class="detailTab">
			<li><a href=".move01" class="current">상품설명<img
					src="./images/ico_arrow_prdDetail.gif"></a></li>
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
			<img src="./images/img_prdInfo.jpg">
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
		</div>
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
 <script>
 $(document).ready(function(){
	$("#desginerName").hide();
	

});
 	var index = $('input[name="shop_seq"]').val();
	var shop_seq = Number(index);
  $( function() {
	
    $( "#datepicker" ).datepicker({
    	minDate : "+2D",
		maxDate : "+21D",
    	dateFormat: 'yy-mm-dd',
		onSelect: function(date){
				//alert(date);
		$("#shop_resv_rday").val(date);
		//alert("누른값"+$("#shop_resv_rday").val());
		
		$("#desginerName").show();
		$("#sel option:eq(0)").prop("selected", true);

		$("#dtime *").remove();

		
		
		
		/* $.ajax({
			type:'post',
			url:"resv.do?shop_seq=" + shop_seq,
			data: 'date='+date,
			dataType: 'json',
			success: function(data){
				alert("success");
				alert(data.desgine_name);
	
				var jObj = JSON.stringify(data.resvDesList)
				alert(jObj);
				
				//alert(data.resvDesList.design_name);
				
				//var pObj = JSON.parse(data);
				//console.log("pObj", pObj);
				
				
				//alert(JSON.strigify(data.resvDesList));
				//console.log(data);
				//var jObj = JSON.stringify(data);
				//console.log("jObj" + jObj);
			 /* for(var i = 0; i< data.length; i++){
				$(".desname").append(
						//<dt>epdxj</dt>
						"<dt>"+data.resvDesList+"</dt>"
					);
				} 
				여기까지 주석있었음.
				
				//$(".desname").empty();
				// $('.desname').remove();
				$.each(data, function(key, value){
					
					$(".desname").append(JSON.stringify(key+':'+value) + '<br>');
				
					});
			},
			error: function(){
				alert("err");
			}
	
		}) */
	}
		
   });
 });
  
$(document).ready(function(){
$("#sel").on('change', function(){
	alert("seq" + $("#sel").val());
	var design_time = $('option:selected', this).attr('design_time');
	alert("design_time:" + design_time);
	var design_seq = $('option:selected', this).attr('design_seq');
	alert("design_seq:" + design_seq);
	var sTime = design_time.split("/");
	alert("stime"+sTime);

	$("#dtime *").remove();
	
	
	for(var i=0; i<sTime.length; i++){
			$("#dtime").append("<li class='timeBtn'><button type='button' class='btn' id='sbtn' value='"+sTime[i]+"' sTime='"+sTime[i]+"'>"+sTime[i]+"</button></li>");
	}

	
	
	
	var shop_seq = $("#shop_seq").val();
	alert("shop_seq: " + shop_seq);
	var shop_resv_rday = $("#shop_resv_rday").val();
	alert("shop_resv_rday: " + shop_resv_rday);
	var allData = {"design_seq":design_seq, "shop_seq":shop_seq, "shop_resv_rday":shop_resv_rday};

	$("#dtime").show();
	$.ajax({
		url: 'getResvTime.do',
		type:'post',
		data: allData,
		success: function(data){
			alert("data: " +data);
			str = JSON.stringify(data);
			str = JSON.parse(str);
			alert("str: " + str);
			
			var obj_length = Object.keys(str).length;
			alert("length:" + obj_length);
			
			//sTime == str[key]
			
			var v = new Array();
			

			// 어펜드를 미리 시켜놓고 가져온 값을 비교해서 비지블 안비지블
			
			for( key in str){
				//var v = str[key];
				//alert("제발"+v);
				v[key]= str[key];
				alert("val[]: " + v[key]);
			}

			
			alert("포문밖 브이: " + v);


			 for(var j=0; j<v.length; j++){
				//$('button:contains("'+v[j]+'")').css('disabled');
				$('button:contains("'+v[j]+'")').addClass('cant');
				$('button:contains("'+v[j]+'")').attr("disabled","disabled");
			 }

			 
			 $(document).on('click','.btn',function(){
					var pcode = $(this).val(); //이거는 해당 element의 id value값을 가져오는것.
					//var test = txt;
					$(this).attr("name", "shop_resv_time");
					$("#shop_resv_time").val(pcode);
					alert("pcode:" + pcode);
				});

			
			/* for(var j=0; j<sTime.length; j++){
				if(sTime.indexOf(v)){
					$( 'li:has( v )' ).css( 'border', '1px solid red' );
				}
			} */
			
			
		},
		error: function(){
			alert('err');
		}

	});
	
})


	
$(".getTime").on('click', function(e){
	//alert("되나요?");
	e.preventDefault();
	var design_seq = $(this).attr('design_seq');
	var design_time = $(this).attr('design_time');
	var sTime = design_time.split("/");
	var getStime = $(this).attr('sTime');
	//alert("designtime: " + design_time);
	//alert("stime"+sTime);
	alert("stime.len" + sTime.length);
	//alert(design_time);
	
    for(var i=0; i<sTime.length; i++){
		$("#dtime").append("<li class='timeBtn'><button type='button' class='btn' id='sbtn' sTime='"+sTime[i]+"'>"+sTime[i]+"</button></li>");
	}

	//var getStime = $(this).attr('sTime');
	//var getStime = $('.btn').html();
	//var getStime = document.getElementByClassName('timeBtn').innerText;
	//alert('getTime!!: ' + getStime);

	var liEl = document.getElementById('dtime');
	var txt = liEl["innerText" in liEl ? "innerText" : "textContent"];
	alert('txt: '+txt);

	alert("누르고:" + design_seq);
	var shop_seq = $("#shop_seq").val();
	var shop_resv_rday = $("#shop_resv_rday").val();
	var allData = {"design_seq":design_seq, "shop_seq":shop_seq, "shop_resv_rday":shop_resv_rday};

	var str;
	var strArr = [];
	
	$.ajax({
		url: 'resv1.do',
		type:'post',
		data: allData,
		success: function(data){
		alert("data: " +data);
		
		str = JSON.stringify(data);
		str = JSON.parse(str);
		strArr.push(str);
		//alert(str);
		var obj_length = Object.keys(str).length;
		alert("length:" + obj_length);
		
		//sTime == str[key]
		
		var v = new Array();
		

		// 어펜드를 미리 시켜놓고 가져온 값을 비교해서 비지블 안비지블
		
		for( key in str){
			//var v = str[key];
			//alert("제발"+v);
			v[key]= str[key];
			alert("val[]: " + v[key]);
	}


/* 		for(var i=0; i<sTime.length; i++){
			$("#dtime").append("<li class='timeBtn'><button type='button' class='btn' sTime='"+sTime[i]+"'>"+sTime[i]+"</button></li>");
			
		}  */

		$(document).on('click','.btn',function(){
			var pcode=$(this).attr('sTime'); //이거는 해당 element의 id value값을 가져오는것.
			var test = txt;
			alert("click:" + pcode);
		});


	 
		 //var timeVal = $(this).attr('.btn');
		 var timeVal = $(".btn").val();
		 alert("클릭한 시간 val:" + timeVal);

	
/* 	 	for(var i=0; i<sTime.length; i++){
			for(var j=1; j<v.length; j++){
				if(sTime[i] == v[i]){
				$("#dtime").append("<li class='timeBtn'><button type='button'>"+sTime[i]+"</button></li>");
				}
			}
		}  */
		
		

  		for(var i=1; i<v.length; i++){
			if(obj_length > 0){
					if(sTime.indexOf(v)){
						$("#dtime").append("<li class='timeBtn'><button type='button' disabled>"+v[i]+"</button></li>");
				}
					
			}
			
		}  

	
		

/* 		for(var i=0; i<v.length; i++){
			$("")
		} */

/* 		 $(document).on("click", '.getTime', function(){
			
			$("#dtime").append('<li>v</li>');
		}) */
			
/* 			for(var i=0; i<sTime.length; i++){
			var ddd;
			if(sTime[i] == v){
				ddd = sTime[i];
				alert('비교ddd:'+ddd );
			}
		} */

		
		
	alert("포문밖 브이: " + v);


		



		
/* 		for(i=0; i<obj_length; i++){
		var plz = (sTime.indexOf(str[key]));
		alert("plz...."+plz);
		} */
		
/* 		if(obj_length != 0){
			for(i=0; i<obj_length; i++){
				if(v == sTime){
					alert("vvvvv: " + v);
				}
			}
		}else if(obj_length == 0){
			alert("vjvjvj: " + v);
		} */


/* 		for(var i=0; i<sTime.length; i++){
		if()
			
			
		} */
		

	

/* 		if(obj_length > 0 ){
			if(v != sTime){
				alert("sv: " + v);
			}else{
				alert("vv: "+ str[key]);
			}
			//alert("value: " + JSON.stringify(v));
		} */


		
/* 		for(var i=0; i<obj_length; i++){
			
		} */
		
		//alert("value:")
		//var getTime = data
		},
		error: function(){
			alert("err");
			}

		})
	});
});

<%-- 	function getTime(seq){
		
		$("#desgin_time").show();
		<% 
		
		%>
	}); --%>
  
  </script>



<%@ include file="./../../../include/footer.jsp"%>

