<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../../../../include/bo/bo_header.jsp" %>

<div class="lnbWrap">
	<h2>주문/배송</h2>
	<ul class="lnb">
		<li class="lnb_sbj">
			<a href="#n">주문관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n">주문통합리스트</a></li>
				<li><a href="#n">송장일괄등록</a></li>
			</ul>
		</li>
		<li class="lnb_sbj">
			<a href="#n">취소/교환/반품/환불 관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n">취소리스트</a></li>
				<li><a href="#n">교환리스트</a></li>
				<li><a href="#n">반품리스트</a></li>
				<li><a href="#n">환불리스트</a></li>
			</ul>
		</li>
	</ul>
</div><!--// lnbWrap -->

<div class="containerWrap">
	<ul class="gnb">
		<li><a href="#n">환경설정</a></li>
		<li><a href="#n">상품관리</a></li>
		<li><a href="#n" class="current">주문/배송</a></li>
		<li><a href="#n">회원관리</a></li>
		<li><a href="#n">게시판관리</a></li>
		<li><a href="#n">통계관리</a></li>
	</ul><!--// gnb -->

	<div class="container">
		<div class="top clearfix">
			<ul class="menu_dept clearfix">
				<li>주문/배송</li>
				<li>주문관리</li>
				<li>주문통합리스트</li>
			</ul>
			<ul class="color_info clearfix">
				<li><img src="../images/img_colorInfo_01.gif">입력정보</li>
				<li><img src="../images/img_colorInfo_02.gif">조회정보</li>
				<li><img src="../images/img_colorInfo_03.gif">링크</li>
				<li><img src="../images/img_colorInfo_04.gif">신규/수정</li>
				<li><img src="../images/img_colorInfo_05.gif">삭제</li>
			</ul>
		</div><!--// top -->

		<div class="cn_wrap">
			<div class="table_top">
				<span class="table_sbj">주문통합리스트</span>
			</div><!--// table_top -->
			<table class="horizon_tbl">
				<colgroup>
					<col width="162px">
					<col width="*">
					<col width="162px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>주문상태</th>
						<td>
							<select>
								<option>전체</option>
							</select>
							<input type="text">
						</td>
						<th>검색어</th>
						<td>
							<select>
								<option>통합검색</option>
							</select>
							<input type="text">
						</td>
					</tr>
					<tr class="click_hide">
						<th>기간검색</th>
						<td colspan="3">
							<span class="input_cal input_w02">
								<input type="text" value="2016-08-07">
								<a href="#n"><img src="../images/ico_cal.gif"></a>
							</span>
							~
							<span class="input_cal input_w02 mr10">
								<input type="text" value="2016-08-11">
								<a href="#n"><img src="../images/ico_cal.gif"></a>
							</span>
							<a href="#n" class="btn_r_navy">오늘</a>
							<a href="#n" class="btn_r_navy">7일</a>
							<a href="#n" class="btn_r_navy">15일</a>
							<a href="#n" class="btn_r_navy">1개월</a>
							<a href="#n" class="btn_r_navy">3개월</a>
							<a href="#n" class="btn_r_navy">전체</a>
						</td>
					</tr>
					<tr>
						<th>결제수단</th>
						<td colspan="3">
							<span class="select_wrap">
								<input type="checkbox">
								<label>전체</label>
							</span>
							<span class="select_wrap">
								<input type="checkbox">
								<label>ALI-PAY</label>
							</span>
							<span class="select_wrap">
								<input type="checkbox">
								<label>ANB-PAY</label>
							</span>
						</td>
					</tr>
					<tr>
						<th>송장번호</th>
						<td colspan="3">
							<span class="select_wrap">
								<input type="radio">
								<label>전체</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>송장번호 등록</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>송장번호 미등록</label>
							</span>
						</td>
					</tr>
					<tr>
						<th>회원검색</th>
						<td>
							<span class="select_wrap">
								<input type="radio">
								<label>전체</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>분양회원</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>일반회원</label>
							</span>
						</td>
						<th>결제금액</th>
						<td><input type="number" class="input_w02"> 원 ~ <input type="number" class="input_w02"> 원</td>
					</tr>
				</tbody>
			</table>
			<a href="#n" class="btn_c dis_b">검 색</a>
		</div>

		<div class="cn_wrap srch_result">
			<div class="table_top clearfix">
				<p class="count">
					검색
					<span class="c_red">0</span>개
					<img src="../images/ico_bar02.gif" class="bar">
					전체
					<span class="c_red">0</span>개
				</p>
				<p class="pageUnit">
					<select>
						<option>주문일 (오름차순)</option>
					</select>
					<select>
						<option>20개 보기</option>
					</select>
				</p>
			</div><!--// table_top -->
			<div class="table_selected clearfix mb7">
				<p>
					선택한 주문을
					<select>
						<option>주문상태</option>
					</select>
					<a href="#n" class="btn_r_navy">일괄처리</a>
				</p>
				<p class="fl_right">
					<select>
						<option>인쇄선택</option>
					</select>
					<a href="#n" class="btn_r02_navy">인쇄하기</a>
				</p>
			</div>
			<table>
				<colgroup>
					<col width="55px">
					<col width="55px">
					<col width="106px">
					<col width="83px">
					<col width="83px">
					<col width="106px">
					<col width="120px">
					<col width="55px">
					<col width="106px">
					<col width="106px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>번호</th>
						<th>주문일시</th>
						<th>주문번호</th>
						<th>주문자</th>
						<th>상품주문번호</th>
						<th>주문상품</th>
						<th>수량</th>
						<th>금액</th>
						<th>총 결제금액</th>
						<th>처리상태</th>
						<th>배송번호</th>
						<th>송장번호</th>
						<th>물류창고</th>
						<th>공급사</th>
						<th>수령자</th>
						<th>결제방법</th>
						<th>관리자메모</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>2</td>
						<td>2016-08-08</td>
						<td class="tbl_link"><a href="#n">000012</a></td>
						<td>홍길동</td>
						<td class="tbl_link"><a href="#n">001</a></td>
						<td class="prd_name"><img src="../images/img_replace02.gif"><span class="ellipsis">[갤럭시] 갤럭시 S7-64G 색상:dfdfdfdfdf루</span></td>
						<td>1</td>
						<td>90,000,000</td>
						<td>90,000,000</td>
						<td>결제중단</td>
						<td>7894561</td>
						<td>1234567</td>
						<td>CN</td>
						<td>LG전자</td>
						<td>박문수</td>
						<td>ANB</td>
						<td><a href="#n" class="btn_r_navy">메모</a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>2016-08-08</td>
						<td class="tbl_link"><a href="#n">000012</a></td>
						<td>홍길동</td>
						<td class="tbl_link"><a href="#n">001</a></td>
						<td class="prd_name"><img src="../images/img_replace02.gif"><span class="ellipsis">[갤럭시] 갤럭시 S7-64G 색상:dfdfdfdfdf루</span></td>
						<td>1</td>
						<td>90,000,000</td>
						<td>90,000,000</td>
						<td>결제실패</td>
						<td>7894561</td>
						<td>1234567</td>
						<td>KR</td>
						<td>LG전자</td>
						<td>박문수</td>
						<td>ALI</td>
						<td><a href="#n" class="btn_r_navy">메모</a></td>
					</tr>
				</thead>
			</table>
			<div class="table_selected clearfix mt7">
				<p>
					선택한 주문을
					<select>
						<option>주문상태</option>
					</select>
					<a href="#n" class="btn_r_navy">일괄처리</a>
				</p>
				<p class="fl_right">
					<a href="#n" class="btn_r02_green">엑셀 다운로드</a>
				</p>
			</div>
<!--
			<div class="pagingWrap">
				<p class="paging">
					<a href="#n" class="btn_first"></a>
					<a href="#n" class="btn_prev"></a>
					<a href="#n" class="current">1</a>
					<a href="#n">2</a>
					<a href="#n">3</a>
					<a href="#n">4</a>
					<a href="#n" class="btn_next"></a>
					<a href="#n" class="btn_last"></a>
				</p>
			</div> -->
		</div>
	</div><!--// container -->
</div><!--// containerWrap -->



</body>
</html>