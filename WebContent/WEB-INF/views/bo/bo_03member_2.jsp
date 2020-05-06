<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="./../../../include/bo_header.jsp" %>

<!-- 로그인 시 -->

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
				<li>회원수정</li>
			</ul>
		</div><!--// top -->

		<div class="cn_wrap">
			<div class="table_top">
				<span class="table_sbj">기본정보</span>
				<a href="#n" class="btn_r_red">저장</a>
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
								<label>일반회원</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>분양회원</label>
							</span>
						</td>
						<th>승인</th>
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
						<td>text_id_2</td>
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
						<th>성별</th>
						<td>남자</td>
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
						<th>분약금액</th>
						<td>$5,000</td>
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
						<th>B-CASH 출근</th>
						<td class="c_blue">출금요청 신청</td>
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
		</div>

		<div class="cn_wrap srch_result">
			<div class="table_top">
				<span class="table_sbj">회원정보 수정 이력</span>
			</div><!--// table_top -->
			<table>
				<colgroup>
					<col width="55px">
					<col width="208px">
					<col width="208px">
					<col width="208px">
					<col width="208px">
					<col width="208px">
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
		</div>
	</div><!--// container -->
</div><!--// containerWrap -->



</body>
</html>