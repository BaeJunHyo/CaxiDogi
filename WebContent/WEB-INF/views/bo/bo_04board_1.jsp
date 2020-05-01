<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="./../../../include/bo/bo_header.jsp" %>

<!-- 로그인 시  -->

<div class="lnbWrap">
	<h2>주문/배송</h2>
	<ul class="lnb">
		<li class="lnb_sbj">
			<a href="#n">게시판관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n" class="current">문의답변(가상 메뉴명입니다)</a></li>
				<li><a href="#n">문의답변2</a></li>
				<li><a href="#n">문의답변3</a></li>
			</ul>
		</li>
	</ul>
</div><!--// lnbWrap -->

<div class="containerWrap">
	<ul class="gnb">
		<li><a href="#n">환경설정</a></li>
		<li><a href="#n">상품관리</a></li>
		<li><a href="#n">주문/배송</a></li>
		<li><a href="#n">회원관리</a></li>
		<li><a href="#n" class="current">게시판관리</a></li>
		<li><a href="#n">통계관리</a></li>
	</ul><!--// gnb -->

	<div class="container">
		<div class="top clearfix">
			<ul class="menu_dept clearfix">
				<li>게시판관리</li>
				<li>문의답변</li>
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
				<span class="table_sbj">문의답변리스트</span>
			</div><!--// table_top -->
			<table class="horizon_tbl">
				<colgroup>
					<col width="162">
					<col width="300">
					<col width="162">
					<col width="300">
				</colgroup>
				<tbody>
					<tr>
						<th colspan="4" class="tc">여기는 질문 제목입니다.</th>
					</tr>
					<tr>
						<th>상품명</th>
						<td>NX500 패키지</td>
						<th>이름</th>
						<td>HONG KIL DONG</td>
					</tr>
					<tr>
						<th>문의분류</th>
						<td>
							<select>
								<option>상품</option>
								<option>배송</option>
								<option>반품/환불/취소</option>
							</select>
							<select>
								<option>상품</option>
								<option>배송</option>
								<option>반품/환불/취소</option>
							</select>
						</td>
						<th>휴대폰</th>
						<td>01045677897</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3"><a href="#n" class="attach_file"><img src="../images/ico_save.png">첨부파일사진.jpg</a></td>
					</tr>
					<tr>
						<td colspan="4" class="viewWrite lh_20">
							질문 내용입니다.
						</td>
					</tr>
				</tbody>
			</table>

			<!-- 쓴 답변 보는 칸 -->
			<div class="viewReply">
				<p class="wrtDate"><strong>홍길동</strong> 2016.12.12 16:05:58</p>
				<p class="tl">관리자의 답변 창입니다.</p>
				<div class="tr">
					<a href="#n" class="btn_r_navy">수정</a>
					<a href="#n" class="btn_r_navy">삭제</a>
				</div>
			</div><!--// viewReply -->

			<!-- 답변 쓰는 칸 -->
			<div class="writeReply">
				<p class="writeWrap">
					<textarea></textarea>
				</p>
				<a href="#n" class="btn_r_navy fr mt5">등 록</a>
			</div><!--// writeReply -->
		</div>
		<div class="cn_wrap srch_result">
			<table>
				<colgroup>
					<col width="55px">
					<col width="210px">
					<col width="210px">
					<!-- <col width="210px"> -->
					<col width="*">
					<col width="210px">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>휴대폰</th>
						<!-- <th>주문번호</th> -->
						<th>문의제목</th>
						<th>날짜</th>
					</tr>
					<tr>
						<td>2</td>
						<td>갑순이</td>
						<td>010-4567-4567</td>
						<!-- <td>2456454545</td> -->
						<td class="tbl_link"><a href="#n">문의 제목입니다.</a></td>
						<td>2016-08-08</td>
					</tr>
					<tr>
						<td>1</td>
						<td>갑순이</td>
						<td>010-4567-4567</td>
						<!-- <td>2456454545</td> -->
						<td class="tbl_link"><a href="#n">문의 제목입니다.</a></td>
						<td>2016-08-08</td>
					</tr>
				</thead>
			</table>
		</div>
	</div><!--// container -->
</div><!--// containerWrap -->



</body>
</html>