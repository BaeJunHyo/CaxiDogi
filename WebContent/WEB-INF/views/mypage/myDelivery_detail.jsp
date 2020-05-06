<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../../../include/header.jsp" %>


<%@ include file="./../../../include/left_frm.jsp" %>

<div class="cusSec_right">

	<div class="cusSec_tableWrap pt0">
		<h3>
			<span class="t_sbj">주문배송조회 상세</span>
		</h3>
		<table class="basic_tableStyle basic_tableStyle_vert">
			<colgroup>
				<col width="113px">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>주문번호</th>
					<td class="tl">O00000001886</td>
				</tr>
			</tbody>
		</table>
	
		<table class="basic_tableStyle td_fs12 td_p0 mt10">
			<colgroup>
				<col width="*">
				<col width="*">
				<col width="*">
				<col width="*">
				<col width="*">
				<col width="*">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th>상품명</th>
					<th>수량</th>
					<th>주문금액</th>
					<th>추가금액</th>
					<th>배송비</th>
					<th>배송정보</th>
					<th>진행상태</th>
				</tr>
			</thead>
			<tbody>
			<!-- 배송지변경가능상태 -->
				<!-- 배송지변경불가상태 -->
				<tr>
					<td class="tl">
						<a href="#n" class="tableThumb_small"><img src="../images/img_prdBigThumb.jpg" onerror="this.src='/images/loaderror/noimg_261-261.jpg' "></a>
						<div class="prdInfo">
							<a onclick="goDetailIndex('GC00000035617')">
								<p class="c_gray">TISSOT</p>
								<p>Men's Sport Watch&nbsp;
								
									[밴드타입&nbsp;(메탈(Gold))]
								</p>
								155,000원
							</a>
						</div>
					</td>
					<td><strong>1</strong>개</td>
					<td><strong>155,000</strong>원</td>
					<td>
						<strong>
							0</strong>원
					</td>
					<td rowspan="1">
							<strong>0</strong>원
							</td>
					<td class="fs11" style="line-height: normal;" rowspan="1">
							<a class="btn_line_s dis_block mt3" style="width: 40px; margin: 0 auto 4px;">배송추적</a>
							<span class="fs11">결제 후 3~5일<br>
							(영업일 기준)</span>
						</td>
					<td class="fs11" style="line-height: normal;" id="state">
						상품준비중
						<a class="btn_dark_s dis_block mt3" style="border-radius: 15px;">구매확정</a>
						<a class="btn_line_s dis_block mt3">교환신청</a>
						<a class="btn_line_s dis_block mt3">반품신청</a>
					</td>
				</tr>
				<tr>
					<th colspan="7" style="text-align: right;">
						주문금액 합계 155,000원  + 배송비 0원 =<span class="fs22 dis_num ml10">
						155,000원</span>
					</th>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="cusSec_tableWrap">
		<h3>
			<span class="t_sbj">고객정보</span>
		</h3>
		
		<div class="td_fs12 td_p0 clearfix payInfo">
			<table class="basic_tableStyle basic_tableStyle_vert">
				<colgroup>
					<col width="113px">
					<col width="*">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>배송정보<!-- <br/><strong>[회사]</strong> --></th>
						<td class="tl">
							<ul class="dot_list">
								<li class="dis_inline pr50">쇼핑몰사용자</li>
								<li class="dis_inline pr50">01012341234</li>
								<li>[04117] 서울 마포구 굴레방로 1 (아현동)개나리아파트 101호</li>
								<li>배송 메시지 :
									
											없음
										</li>
							</ul>
						</td>
						<td>
							</td>
					</tr>
					<tr>
						<th>주문고객정보</th>
						<td colspan="2" class="tl">
							<ul class="dot_list">
								<li class="dis_inline pr50">쇼핑몰사용자</li>
								<li class="dis_inline pr50">01012341234</li>
								<li class="dis_inline pr50">test@naver.com</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="cusSec_tableWrap">
		<h3>
			<span class="t_sbj">결제정보</span>
		</h3>
		<div class="td_fs12 td_p0 clearfix payInfo">
			<table class="basic_tableStyle fl" style="width: 50%;">
				<colgroup>
					<col width="115px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<td class="tl">무통장입금</td>
						<td class="c_red"><strong class="fs15">155,000</strong>원</td>
					</tr>
				</tbody>
			</table>
			<table class="basic_tableStyle fl bg_gray" style="width: 50%;">
				<colgroup>
					<col width="115px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<td class="tl"><strong>총 상품금액</strong></td>
						<td class="tr"><strong class="fs15">155,000</strong>원</td>
					</tr>
					<tr>
						<td class="tl"><strong>배송비무료</strong></td>
								<td class="tr"><strong class="fs15">(+) 0</strong>원</td>
							</tr>
					<!-- <tr>
						<td class="tl">배송비무료</td>
						<td class="tr">-0원</td>
					</tr> -->
						<tr>
							<td class="tl"><strong>최종결제금액</strong></td>
							<td class="tr c_red"><strong class="fs15">155,000</strong>원</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

<%@ include file="./../../../include/footer.jsp" %>