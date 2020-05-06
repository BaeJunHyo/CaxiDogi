<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 로그인 시 -->

<%@ include file="./../../../include/bo_header.jsp" %>

<div class="lnbWrap">
	<h2>회원관리</h2>
	<ul class="lnb">
		<li class="lnb_sbj">
			<a href="#n">회원관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n">회원통합리스트</a></li>
				<li><a href="#n">회원수정</a></li>
			</ul>
		</li>
	</ul>
</div><!--// lnbWrap -->

<div class="containerWrap">
	<ul class="gnb">
		<li><a href="#n">환경설정</a></li>
		<li><a href="#n">상품관리</a></li>
		<li><a href="#n">주문/배송</a></li>
		<li><a href="#n" class="current">회원관리</a></li>
		<li><a href="#n">게시판관리</a></li>
		<li><a href="#n">통계관리</a></li>
	</ul><!--// gnb -->

	<div class="container">
		<div class="top clearfix">
			<ul class="menu_dept clearfix">
				<li>회원관리</li>
				<li>회원통합리스트</li>
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
				<span class="table_sbj">회원관리 통합리스트</span>
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
						<option>20개 보기</option>
					</select>
				</p>
			</div><!--// table_top -->
			<div class="table_selected clearfix mb7">
				<p class="fl_right">
					<a href="#n" class="btn_r02_navy">인쇄하기</a>
				</p>
			</div>
			<table>
				<colgroup>
					<col width="55px">
					<col width="55px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="102px"><!-- 10 -->
					<col width="102px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="83px">
					<col width="102px">
					<col width="83px">
					<col width="135px">
					<col width="83px">
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>번호</th>
						<th>ID</th>
						<th>회원명</th>
						<th>등급</th>
						<th>추천ID</th>
						<th>분양금액</th>
						<th>B POINT</th>
						<th>B CASH</th>
						<th>회원가입일</th>
						<th>최종로그인</th>
						<th>구매금액</th>
						<th>98마켓상태</th>
						<th>98마켓<br/>B CASH상태</th>
						<th>B CASH출금</th>
						<th>가입승인</th>
						<th>승인일시</th>
						<th>승인자</th>
						<th>메일/SMS발송</th>
						<th>정보수정</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>6</td>
						<td class="tbl_link"><a href="#n">AAABBB</a></td>
						<td>Hong Kildong</td>
						<td>일반회원</td>
						<td>Kim.Min</td>
						<td>0</td>
						<td>0</td>
						<td>-</td>
						<td>2016-11-03</td>
						<td>2016-11-04</td>
						<td>240,000</td>
						<td>사용중</td>
						<td>-</td>
						<td>-</td>
						<td>(일반)승인</td>
						<td>2016-11-03<br/>16:20:00</td>
						<td>박문수</td>
						<td>
							<a href="#n" class="btn_r_navy m0">메일</a>
							<a href="#n" class="btn_r_navy m0">SMS</a>
						</td>
						<td><a href="#n" class="btn_r_navy">수정</a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>5</td>
						<td class="tbl_link"><a href="#n">CCCDDD</a></td>
						<td>Hong Kildong</td>
						<td>일반회원</td>
						<td>Kim.Min</td>
						<td>0</td>
						<td>0</td>
						<td>140,000</td>
						<td>2016-11-03</td>
						<td>2016-11-04</td>
						<td>240,000</td>
						<td><span class="c_red">사용정지</span></td>
						<td><span class="c_red">출금정지</span></td>
						<td><span class="c_blue">출금요청신청</span></td>
						<td><span class="c_blue">(일반)대기</span></td>
						<td>-</td>
						<td>-</td>
						<td>
							<a href="#n" class="btn_r_navy m0">메일</a>
							<a href="#n" class="btn_r_navy m0">SMS</a>
						</td>
						<td><a href="#n" class="btn_r_navy">수정</a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>4</td>
						<td class="tbl_link"><a href="#n">EEEFFF</a></td>
						<td>Hong Kildong</td>
						<td>일반회원</td>
						<td>Kim.Min</td>
						<td>0</td>
						<td>0</td>
						<td>140,000</td>
						<td>2016-11-03</td>
						<td>2016-11-04</td>
						<td>240,000</td>
						<td><span class="c_blue">대기</span></td>
						<td><span class="c_red">출금정지</span></td>
						<td><span class="c_blue">출금요청신청</span></td>
						<td><span class="c_blue">(일반)대기</span></td>
						<td>-</td>
						<td>-</td>
						<td>
							<a href="#n" class="btn_r_navy m0">메일</a>
							<a href="#n" class="btn_r_navy m0">SMS</a>
						</td>
						<td><a href="#n" class="btn_r_navy">수정</a></td>
					</tr>
					<tr>
						<td colspan="20">조회 내역이 없습니다.</td>
					</tr>
				</thead>
			</table>
			<p class="table_optionBtn clearfix">
				<a href="#n" class="btn_r_navy">선택 가입승인</a>
				<a href="#n" class="btn_r_navy">선택 탈퇴처리</a>
				<a href="#n" class="btn_r_navy">선택 사용정지</a>
				<a href="#n" class="btn_r02_green fr">엑셀 다운로드</a>
			</p>
		</div>
	</div><!--// container -->
</div><!--// containerWrap -->

<div class="lp_box lp_w500 ">
	<a href="#n" class="btn_close"><img src="../images/ico_close_lp.png" alt="팝업창 닫기"></a>
	<h3>개별/전체 메일 발송</h3>
	<a href="#n" class="btn_r_red fr mr20 mb10">SMS발송</a>
	<table class="horizon_tbl">
		<colgroup>
			<col width="170px">
			<col width="*">
		</colgroup>
		<tr>
			<th>제목</th>
			<td><input type="text"></td>
		</tr>
		<tr>
			<th>발송자 이메일</th>
			<td><input type="email"></td>
		</tr>
		<tr>
			<th>대상회원 선택</th>
			<td class="tbl_link">
				<p class="select_wrap">
					<input type="radio">
					<label>회원직접선택</label>
					<span class="fs12 dis_ib pl10">Hong Kil Dong <a href="#n">(aaa@abc.com></a></span>
				</p>
				<p class="select_wrap">
					<input type="radio">
					<label>회원등급선택</label>
					<select class="ml10">
						<option>회원등급선택</option>
					</select>
				</p>
				<p class="select_wrap">
					<input type="radio">
					<label>전체회원</label>
				</p>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea></textarea>
			</td>
		</tr>
		<tr>
			<th>수신동의</th>
			<td>
				<p class="select_wrap">
					<input type="checkbox">
					<label>수신동의문구를 메일에 포함합니다.</label>
				</p>
				<span class="fs12 box_gray p5 c_gray">
					본 메일은 2016년 11월 07일 기준,<br/>
					메일 수신에 동의하신 회원님께 발송한 메일입니다.
				</span>
			</td>
		</tr>
	</table>
</div>


<div class="lp_box lp_w500 dis_none">
	<a href="#n" class="btn_close"><img src="../images/ico_close_lp.png" alt="팝업창 닫기"></a>
	<h3>SMS 발송</h3>
	<a href="#n" class="btn_r_red fr mr20 mb10">SMS발송</a>
	<table class="horizon_tbl">
		<colgroup>
			<col width="128px">
			<col width="*">
			<col width="128px">
			<col width="*">
		</colgroup>
		<tr>
			<th>발신번호<span class="c_red">*</span></th>
			<td colspan="3"><input type="text" placeholder="000-0000-0000"></td>
		</tr>
		<tr>
			<th>회원 ID</th>
			<td>AAA1234</td>
			<th>회원명</th>
			<td>HONG KILDONG</td>
		</tr>
		<tr>
			<th>발송 용량</th>
			<td colspan="3">
				<input type="number" style="width:50px"> byte / 2000byte
				<span class="c_red pt5 fs12">* 80byte이상은 MMS로 발송됩니다.</span>
			</td>
		</tr>
		<tr>
			<th>내용<span class="c_red">*</span></th>
			<td colspan="3">
				<textarea></textarea>
			</td>
		</tr>
	</table>
</div>

</body>
</html>