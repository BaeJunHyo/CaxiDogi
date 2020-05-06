<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<title>98market_BO_03회원_lp2입금</title>
<meta charset="utf-8">
<link href="../css/reset.css" rel="stylesheet">
<link href="../css/bo_common.css" rel="stylesheet">
<link href="../css/bo_style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="   crossorigin="anonymous"></script>
<script src="../js/bo_common.js" type="text/javascript"></script>

<!-- favicon 16, 24, 32, 64, 152 -->
<link rel="shortcut icon" href="../images/ico/favicon.ico">
<link rel="apple-touch-icon" href="../images/ico/icon_57.png">
<link rel="apple-touch-icon" sizes="72x72" href="../images/ico/icon_72.png">
<link rel="apple-touch-icon" sizes="114x114" href="../images/ico/icon_114.png">
<link rel="apple-touch-icon" sizes="144x144" href="../images/ico/icon_144.png">

</head>
<body>

<div class="containerWrap_popup">
	<div class="container">
		<div class="top windowpop_top clearfix">
			<div class="t_left">
				<h3>회원관리</h3>
				<input type="text" style="width: 258px" placeholder="회원검색">
				<a href="#n" class="btn_r_navy">초기화</a>
			</div>
			<div class="B-list">
				<span>
					B-POINT<br/>
					<span class="c_red">500,000</span>
				</span>
				<span>
					B-CASH<br/>
					<span class="c_red">30,000</span>
				</span>
			</div>
		</div><!--// top -->

		<div class="cn_wrap">
			<div class="table_selected clearfix mb7">
				<ul class="total_number clearfix">
					<li>
						총 구매금액
						<span class="c_red">2,300,000</span>
					</li>
					<li>
						총 구매건수
						<span>15</span>
					</li>
					<li>
						총 상품평
						<span>13</span>
					</li>
				</ul>
			</div>
			<div class="tabWrap">
				<ul class="tabNav clearfix">
					<li><a href="#n">요약보기</a></li>
					<li><a href="#n">회원정보</a></li>
					<li><a href="#n">주문내역</a></li>
					<li><a href="#n">B-POINT</a></li>
					<li><a href="#n">B-CASH</a></li>
					<li class="current"><a href="#n">SMS/메일발송</a></li>
					<li><a href="#n">수당내역</a></li>
					<li><a href="#n">조직도</a></li>
					<li><a href="#n">문의내역</a></li>
				</ul>
				<div class="tabCnWrap">
					<div class="tabCn tabCn1 dis_none">
						<div class="cn_wrap">
							<div class="table_top">
								<span class="table_sbj">회원정보</span>
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
										<th>회원구분</th>
										<td>분양회원 (예:일반회원/일반회원(대기)</td>
										<th>회원 ID</th>
										<td>HONG2016</td>
									</tr>
									<tr>
										<th>이름</th>
										<td>HONG KIL-DONG</td>
										<th>이메일</th>
										<td>HONG1234@CHINATELECOM.COM</td>
									</tr>
									<tr>
										<th>회원가입읻</th>
										<td>2016-11-03</td>
										<th>휴대폰</th>
										<td>88-010-1234-0987</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>(13587) 서울 강남구 삼성2동 143-9</td>
										<th>분양 URL</th>
										<td class="tbl_link"><a href="#n">98mk.in/qkKR19</a></td>
									</tr>
								</tbody>
							</table>
						</div><!--// cn_wrap -->
						<div class="cn_wrap srch_result">
							<div class="table_top">
								<span class="table_sbj">주문내역</span>
								<a href="#n" class="btn_r_navy fr">더보기</a>
							</div><!--// table_top -->
							<table>
								<colgroup>
									<col width="55px">
									<col width="107px">
									<col width="107px">
									<col width="*">
									<col width="55px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>주문일자</th>
										<th>주문번호</th>
										<th>주문상품</th>
										<th>수량</th>
										<th>금액</th>
										<th>총 결제금액</th>
										<th>처리상태</th>
										<th>결제방법</th>
										<th>송장번호</th>
									</tr>
									<tr>
										<td>2</td>
										<td>2016-11-02</td>
										<td>832589234</td>
										<td>상품명1</td>
										<td>2</td>
										<td>9,000,000</td>
										<td>18,000,000</td>
										<td>배송완료</td>
										<td>PG B</td>
										<td>123450000</td>
									</tr>
									<tr>
										<td>1</td>
										<td>2016-11-02</td>
										<td>832589234</td>
										<td>상품명1</td>
										<td>2</td>
										<td>9,000,000</td>
										<td>18,000,000</td>
										<td>배송완료</td>
										<td>PG B</td>
										<td>123450000</td>
									</tr>
								</thead>
							</table>
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
							</div>
						</div><!--// cn_wrap -->

						<div class="cn_wrap srch_result">
							<div class="table_top">
								<span class="table_sbj">문의내역</span>
								<a href="#n" class="btn_r_navy fr">더보기</a>
							</div><!--// table_top -->
							<table>
								<colgroup>
									<col width="55px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="*">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>등록일</th>
										<th>등록자</th>
										<th>상담수단</th>
										<th>상담구분</th>
										<th>상담내용</th>
									</tr>
									<tr>
										<td colspan="6">등록된 문의내역이 없습니다.</td>
									</tr>
								</thead>
							</table>
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
							</div>
						</div><!--// cn_wrap -->
					</div>
					<div class="tabCn tabCn2 dis_none">
						<div class="cn_wrap">
							<div class="table_top">
								<span class="table_sbj">기본정보</span>
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
										<th>회원구분</th>
										<td>
											<span class="select_wrap">
												<input type="radio">
												<label>일반회원(대기)</label>
											</span>
											<span class="select_wrap">
												<input type="radio">
												<label>분양회원</label>
											</span>
										</td>
										<th>회원구분</th>
										<td>
											<span class="select_wrap">
												<input type="radio">
												<label>승인</label>
											</span>
											<span class="select_wrap">
												<input type="radio">
												<label>미승인</label>
											</span>
										</td>
									</tr>
									<tr>
										<th>아이디</th>
										<td>test_id_2</td>
										<th>이름</th>
										<td><input type="text" value="Hong Kil Dong"></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><a href="#n" class="btn_r_navy">초기화</a></td>
										<th>이메일</th>
										<td>
											<input type="text" class="input_w03">@<input type="text" class="input_w03 ml3">
											<select class="input_w02">
												<option>직접입력</option>
											</select>
											<a href="#n" class="btn_r_navy">중복확인</a>
										</td>
									</tr>
									<tr>
										<th>휴대폰 번호</th>
										<td>
											<input type="text" placeholder="국가번호" class="input_w03">
											<input type="text" placeholder="000-000-0000" class="input_w02">
										</td>
										<th>분양 URL</th>
										<td class="tbl_link"><a href="#n">98mk.in/qkKR19</a></td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="3">
											<input type="text" placeholder="우편번호" class="input_w03">
											<input type="text" placeholder="주소1" class="input_w01">
											<input type="text" placeholder="주소2" class="input_w01">
										</td>
									</tr>
									<tr>
										<th>분양금액</th>
										<td>
											<select>
												<option>$5,000</option>
											</select>
										</td>
										<th>구매금액</th>
										<td>1,000,000원</td>
									</tr>
									<tr>
										<th>B-POINT</th>
										<td>500,000</td>
										<th>B-CASH</th>
										<td>50,000</td>
									</tr>
									<tr>
										<th>회원가입일</th>
										<td>2016-11-01</td>
										<th>최종로그인</th>
										<td>2016-11-05</td>
									</tr>
									<tr>
										<th>B-CASH 출금상태</th>
										<td class="tbl_link"><a href="#n">출금요청 신청</a></td>
										<th>출금요청금액</th>
										<td>50,000</td>
									</tr>
									<tr>
										<th>98마켓 상태</th>
										<td>사용중</td>
										<th>98마켓 B-CASH 상태</th>
										<td class="c_red">사용중지</td>
									</tr>
									<tr>
										<th>승인일시</th>
										<td>2016-11-05</td>
										<th>승인자</th>
										<td>박문수</td>
									</tr>
									<tr>
										<th>최종수정일</th>
										<td>2016-11-06</td>
										<th>수정자</th>
										<td>심청이</td>
									</tr>
								</tbody>
							</table>
						</div><!--// cn_wrap -->
						<div class="cn_wrap srch_result">
							<div class="table_top">
								<span class="table_sbj">회원정보 수정 이력</span>
							</div><!--// table_top -->
							<table>
								<colgroup>
									<col width="55px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>변경일자</th>
										<th>처리자</th>
										<th>IP주소</th>
										<th>변경항목</th>
										<th>변경내용</th>
									</tr>
									<tr>
										<td>2</td>
										<td>2016-11-02</td>
										<td>박문수</td>
										<td>201.12.0.123</td>
										<td>비밀번호</td>
										<td>비밀번호 초기화</td>
									</tr>
									<tr>
										<td>1</td>
										<td>2016-11-02</td>
										<td>박문수</td>
										<td>201.12.0.123</td>
										<td>비밀번호</td>
										<td>비밀번호 초기화</td>
									</tr>
									<tr>
										<td colspan="6">검색된 주문이 없습니다.</td>
									</tr>
								</thead>
							</table>
						</div><!--// cn_wrap -->
					</div>
					<div class="tabCn tabCn3 dis_none">
						<div class="cn_wrap">
							<div class="table_top">
								<span class="table_sbj">주문리스트</span>
							</div><!--// table_top -->
							<table class="horizon_tbl">
								<colgroup>
									<col width="162px">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>검색어</th>
										<td>
											<select>
												<option>통합검색</option>
											</select>
											<input type="text">
										</td>
									</tr>
									<tr>
										<th>기간검색</th>
										<td>
											<select>
												<option>등록일</option>
											</select>
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
								</tbody>
							</table>
						</div><!--// cn_wrap -->
						<div class="cn_wrap srch_result">
							<div class="table_top clearfix">
								<p class="count">
									검색
									<span class="c_red">10</span>개
									<img src="../images/ico_bar02.gif" class="bar">
									전체
									<span class="c_red">10</span>개
								</p>
							</div><!--// table_top -->
							<table>
								<colgroup>
									<col width="55px">
									<col width="107px">
									<col width="107px">
									<col width="*">
									<col width="55px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>주문일자</th>
										<th>주문번호</th>
										<th>주문상품</th>
										<th>수량</th>
										<th>금액</th>
										<th>총 결제금액</th>
										<th>처리상태</th>
										<th>결제방법</th>
										<th>송장번호</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2</td>
										<td>2016-11-02</td>
										<td>8232457865</td>
										<td>상품명1</td>
										<td>2</td>
										<td>100,00,000</td>
										<td>200,000,000</td>
										<td>배송완료</td>
										<td>PG B</td>
										<td>123450000</td>
									</tr>
									<tr>
										<td>1</td>
										<td>2016-11-02</td>
										<td>8232457865</td>
										<td>상품명1</td>
										<td>2</td>
										<td>100,00,000</td>
										<td>200,000,000</td>
										<td>배송완료</td>
										<td>PG B</td>
										<td>123450000</td>
									</tr>
									<tr>
										<td colspan="10">검색된 주문이 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tabCn tabCn4 dis_none">
						<div class="cn_wrap">
							<div class="table_top">
								<span class="table_sbj">B-POINT 내역</span>
							</div><!--// table_top -->
							<table class="horizon_tbl">
								<colgroup>
									<col width="162px">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>검색어</th>
										<td>
											<select>
												<option>처리자</option>
											</select>
											<input type="text" value="홍길동">
										</td>
									</tr>
									<tr>
										<th>기간검색</th>
										<td>
											<select>
												<option>등록일</option>
											</select>
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
										<th>금액 범위</th>
										<td><input type="number" value="1000" class="tc" style="width:64px;">~<input type="number" value="9000" class="ml3 tc" style="width:64px;"></td>
									</tr>
								</tbody>
							</table>
						</div><!--// cn_wrap -->
						<div class="cn_wrap srch_result">
							<div class="table_top clearfix">
								<p class="count">
									검색
									<span class="c_red">10</span>개
									<img src="../images/ico_bar02.gif" class="bar">
									전체
									<span class="c_red">10</span>개
								</p>
							</div><!--// table_top -->
							<table>
								<colgroup>
									<col width="55px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="*">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>입금일</th>
										<th>입금액</th>
										<th>처리자</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2</td>
										<td>2016-11-02</td>
										<td>3,500,000</td>
										<td>박문수</td>
									</tr>
									<tr>
										<td>1</td>
										<td>2016-11-02</td>
										<td>3,500,000</td>
										<td>박문수</td>
									</tr>
									<tr>
										<td colspan="10">입금 내역이 없습니다.</td>
									</tr>
								</tbody>
							</table>
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
							</div>
						</div>
					</div>
					<div class="tabCn tabCn5 dis_none">
						<div class="cn_wrap">
							<div class="table_top">
								<span class="table_sbj">B-CASH 내역</span>
							</div><!--// table_top -->
							<table class="horizon_tbl">
								<colgroup>
									<col width="162px">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>처리자</th>
										<td>
											<input type="text" value="홍길동">
										</td>
									</tr>
									<tr>
										<th>B포인트 입금일</th>
										<td>
											<select>
												<option>등록일</option>
											</select>
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
										<th>금액 범위</th>
										<td><input type="number" value="1000" class="tc" style="width:64px;">~<input type="number" value="9000" class="ml3 tc" style="width:64px;"></td>
									</tr>
								</tbody>
							</table>
						</div><!--// cn_wrap -->
						<div class="cn_wrap srch_result">
							<div class="table_top clearfix">
								<p class="count">
									검색
									<span class="c_red">0</span>개
									<img src="../images/ico_bar02.gif" class="bar">
									전체
									<span class="c_red">0</span>개
								</p>
							</div><!--// table_top -->
							<table>
								<colgroup>
									<col width="55px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="*">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>출금일</th>
										<th>출금액</th>
										<th>출금상태</th>
										<th>출금처리</th>
										<th>처리자</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2</td>
										<td>2016-11-02</td>
										<td>3,500,000</td>
										<td>출금신청</td>
										<td><a href="#n" class="btn_r_navy">수정</a></td>
										<td>박문수</td>
										<td></td>
									</tr>
									<tr>
										<td>1</td>
										<td>2016-11-02</td>
										<td>3,500,000</td>
										<td>출금신청</td>
										<td><a href="#n" class="btn_r_navy">수정</a></td>
										<td>박문수</td>
										<td></td>
									</tr>
									<tr>
										<td colspan="7">입금 내역이 없습니다.</td>
									</tr>
								</tbody>
							</table>
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
							</div>
						</div>
					</div>
					<div class="tabCn tabCn6">
						<div class="cn_wrap">
							<div class="table_top">
								<span class="table_sbj">B-CASH 내역</span>
							</div><!--// table_top -->
							<table class="horizon_tbl">
								<colgroup>
									<col width="162px">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>처리자</th>
										<td>
											<input type="text" value="홍길동">
										</td>
									</tr>
									<tr>
										<th>B포인트 입금일</th>
										<td>
											<select>
												<option>등록일</option>
											</select>
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
										<th>금액 범위</th>
										<td><input type="number" value="1000" class="tc" style="width:64px;">~<input type="number" value="9000" class="ml3 tc" style="width:64px;"></td>
									</tr>
								</tbody>
							</table>
						</div><!--// cn_wrap -->
						<div class="cn_wrap srch_result">
							<div class="table_top clearfix">
								<p class="count">
									검색
									<span class="c_red">0</span>개
									<img src="../images/ico_bar02.gif" class="bar">
									전체
									<span class="c_red">0</span>개
								</p>
							</div><!--// table_top -->
							<table>
								<colgroup>
									<col width="55px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="107px">
									<col width="*">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>출금일</th>
										<th>출금액</th>
										<th>출금상태</th>
										<th>출금처리</th>
										<th>처리자</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>2</td>
										<td>2016-11-02</td>
										<td>3,500,000</td>
										<td>출금신청</td>
										<td><a href="#n" class="btn_r_navy">수정</a></td>
										<td>박문수</td>
										<td></td>
									</tr>
									<tr>
										<td>1</td>
										<td>2016-11-02</td>
										<td>3,500,000</td>
										<td>출금신청</td>
										<td><a href="#n" class="btn_r_navy">수정</a></td>
										<td>박문수</td>
										<td></td>
									</tr>
									<tr>
										<td colspan="7">입금 내역이 없습니다.</td>
									</tr>
								</tbody>
							</table>
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
							</div>
						</div>
					</div>
				</div><!--// tabCnWrap -->
			</div><!--// tabWrap -->
		</div><!--// cn_wrap -->
	</div><!--// container -->
</div><!--// containerWrap_popup -->


<div class="lp_box">
	<a href="#n" class="btn_close"><img src="../images/ico_close_lp.png" alt="팝업창 닫기"></a>
	<h3>B-POINT 충전</h3>
	<table class="horizon_tbl">
		<colgroup>
			<col width="170px">
			<col width="*">
		</colgroup>
		<tr>
			<th>입금 여부</th>
			<td>충전(+)</td>
		</tr>
		<tr>
			<th>B-POINT 설정</th>
			<td>
				<input type="number" class="input_w02">
				<a href="#n" class="btn_r_navy">확인</a>
			</td>
		</tr>
		<tr>
			<th>회원안내</th>
			<td>
				<span class="select_wrap">
					<input type="checkbox">
					<label>SMS발송</label>
				</span>
				<span class="select_wrap">
					<input type="checkbox">
					<label>이메일발송</label>
				</span>
			</td>
		</tr>
		<tr>
			<th>비고</th>
			<td><textarea></textarea></td>
		</tr>
	</table>
	<a href="#n" class="btn_lp_c lp_w50">확인</a>
	<a href="#n" class="btn_lp_r lp_w50">취소</a>
</div>

</body>
</html>