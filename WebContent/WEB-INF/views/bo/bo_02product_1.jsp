<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--

<!DOCTYPE html>
<html>
<head>
<title>98market_BO_02상품</title>
<meta charset="utf-8">
<link href="css/reset.css" rel="stylesheet">
<link href="css/common.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<script   src="https://code.jquery.com/jquery-3.1.1.min.js"   integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="   crossorigin="anonymous"></script>
<script src="js/common.js" type="text/javascript"></script>
</head>
<body>

<div class="header">
	<h1><a href="#n" class="logo"><img src="../images/img_logo_bo.png"></a></h1>
	<a href="#n" class="btn_menu"><img src="../images/ico_hamburger.png"></a>
	<div class="m_right">
		<span class="user_name">
			<strong>홍길동</strong>
			님 (gildong16)
		</span>
		<a href="#n" class="btn_user">로그아웃</a>
		<ul>
			<li><a href="#n">사이트맵</a></li>
			<li><a href="#n">회원가입</a></li>
			<li><a href="#n">메뉴얼</a></li>
			<li><a href="#n">마이쇼핑몰</a></li>
		</ul>
	</div>
</div>// header
-->

<%@ include file="./../../../include/bo_header.jsp" %>

<div class="lnbWrap">
	<h2>상품관리</h2>
	<ul class="lnb">
		<li class="lnb_sbj">
			<a href="#n">상품관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n">상품리스트</a></li>
				<li><a href="#n">상품 등록</a></li>
				<li><a href="#n">상품 일괄 등록</a></li>
				<li><a href="#n">상품 이미지 일괄 처리</a></li>
				<li><a href="#n">삭제 상품 관리</a></li>
			</ul>
		</li>
		<li class="lnb_sbj">
			<a href="#n">상품 설정 관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n">옵션 관리</a></li>
				<li><a href="#n">상품 아이콘 관리</a></li>
				<li><a href="#n">상품 필수정보 관리</a></li>
				<li><a href="#n">상품 가격 관리</a></li>
				<li><a href="#n">상품 품절/노출/재고 관리</a></li>
				<li><a href="#n">상품 이동/복사/삭제 관리</a></li>
				<li><a href="#n">상품 배송비 관리</a></li>
			</ul>
		</li>
		<li class="lnb_sbj">
			<a href="#n">카테고리 관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n">카테고리 관리</a></li>
				<li><a href="#n">브랜드 관리</a></li>
			</ul>
		</li>
	</ul>
</div><!--// lnbWrap -->

<div class="containerWrap">
	<ul class="gnb">
		<li><a href="#n">기본설정</a></li>
		<li><a href="#n" class="current">상품관리</a></li>
		<li><a href="#n">주문/배송</a></li>
		<li><a href="#n">회원</a></li>
		<li><a href="#n">게시판</a></li>
		<li><a href="#n">프로모션</a></li>
		<li><a href="#n">디자인</a></li>
		<li><a href="#n">통계</a></li>
	</ul><!--// gnb -->

	<div class="container">
		<div class="top clearfix">
			<ul class="menu_dept clearfix">
				<li>상품관리</li>
				<li>상품리스트</li>
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
				<span class="table_sbj">상품검색</span>
				<a href="bo_02product_2_regi.jsp" class="btn_r_red">+ 상품등록</a>
			</div><!--// table_top -->
			
			
			<table class="product_srchTable">
				<colgroup>
					<col width="162px">
					<col width="*">
					<col width="162px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>검색어</th>
						<td colspan="3">
							<select>
								<option>통합검색</option>
							</select>
							<input type="text">
						</td>
					</tr>
					<tr class="click_hide">
						<th>기간검색</th>
						<td colspan="3">
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
						<th>카테고리</th>
						<td colspan="3">
							<select>
								<option>카테고리 선택</option>
							</select>
							<select>
								<option>카테고리 선택</option>
							</select>
							<select>
								<option>카테고리 선택</option>
							</select>
							<select>
								<option>카테고리 선택</option>
							</select>
							<span class="select_wrap">
								<input type="checkbox">
								<label>카테고리 미지정 상품</label>
							</span>
						</td>
					</tr>
					<tr>
						<th>브랜드</th>
						<td colspan="3">
							<a href="#n" class="btn_r_navy">브랜드선택</a>
							<span class="select_wrap">
								<input type="checkbox">
								<label>브랜드 미지정 상품</label>
							</span>
						</td>
					</tr>
					<tr>
						<th>상품 재고</th>
						<td><input type="number" class="input_w02"> 개 이상 ~ <input type="number" class="input_w02"> 개 이하</td>
						<th>판매가</th>
						<td><input type="number" class="input_w02"> 이상 ~ <input type="number" class="input_w02"> 이하</td>
					</tr>
					<tr>
						<th>상품노출 상태</th>
						<td>
							<span class="select_wrap">
								<input type="radio">
								<label>전체</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>노출</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>미노출</label>
							</span>
						</td>
						<th>상품판매 상태</th>
						<td>
							<span class="select_wrap">
								<input type="radio">
								<label>전체</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>사용함</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>판매안함</label>
							</span>
						</td>
					</tr>
					<tr>
						<th>판매 재고</th>
						<td></td>
						<th>품절 상태</th>
						<td>
							<span class="select_wrap">
								<input type="radio">
								<label>전체</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>품절</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>정상</label>
							</span>
						</td>
					</tr>
					<tr>
						<th>배송비 조건</th>
						<td colspan="3">
							<span class="select_wrap">
								<input type="radio">
								<label>전체</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>배송비무료</label>
							</span>
							<span class="select_wrap">
								<input type="radio">
								<label>배송비유료</label>
							</span>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="table_optionBtn">
				<a href="#n" class="btn_r_navy btn_detailsrch">상세검색 닫힘</a>
			</p>
			<a href="#n" class="btn_c dis_b">검 색</a>
		</div>

		<div class="cn_wrap srch_result">
			<div class="table_top clearfix">
				<p class="count">
					검색
					<span class="c_red">10</span>개
					<img src="../images/ico_bar02.gif" class="bar">
					전체
					<span class="c_red">10</span>개
				</p>
				<p class="pageUnit">
					<select>
						<option>등록일 (오름차순)</option>
					</select>
					<select>
						<option>10개 보기</option>
					</select>
				</p>
			</div><!--// table_top -->
			<table>
				<colgroup>
					<col width="55px">
					<col width="107px">
					<col width="107px">
					<col width="107px">
					<col width="25%">
					<col width="107px">
					<col width="107px">
					<col width="107px">
					<col width="107px">
					<col width="107px">
					<col width="107px">
					<col width="107px">
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>번호</th>
						<th>상품코드</th>
						<th>이미지</th>
						<th>상품명</th>
						<th>판매가</th>
						<th>공급사</th>
						<th>노출상태</th>
						<th>판매상태</th>
						<th>재고</th>
						<th>등록일</th>
						<th>수정</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>8</td>
						<td>1000007</td>
						<td><img src="../images/img_replace.gif"></td>
						<td>클럽모나코 모던 블라우스</td>
						<td>9,999,999</td>
						<td>파나소니코리아</td>
						<td>노출함</td>
						<td>판매함</td>
						<td>999,999</td>
						<td>2016-10-10<br/>2016-10-21</td>
						<td><a href="#n" class="btn_r_navy">수정</a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>7</td>
						<td>1000007</td>
						<td><img src="../images/img_replace.gif"></td>
						<td>클럽모나코 모던 블라우스</td>
						<td>9,999,999</td>
						<td>파나소니코리아</td>
						<td>노출함</td>
						<td>판매함</td>
						<td>999,999</td>
						<td>2016-10-10<br/>2016-10-21</td>
						<td><a href="#n" class="btn_r_navy">수정</a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>6</td>
						<td>1000007</td>
						<td><img src="../images/img_replace.gif"></td>
						<td>클럽모나코 모던 블라우스</td>
						<td>9,999,999</td>
						<td>파나소니코리아</td>
						<td>노출함</td>
						<td>판매함</td>
						<td>999,999</td>
						<td>2016-10-10<br/>2016-10-21</td>
						<td><a href="#n" class="btn_r_navy">수정</a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>5</td>
						<td>1000007</td>
						<td><img src="../images/img_replace.gif"></td>
						<td>클럽모나코 모던 블라우스</td>
						<td>9,999,999</td>
						<td>파나소니코리아</td>
						<td>노출함</td>
						<td>판매함</td>
						<td>999,999</td>
						<td>2016-10-10<br/>2016-10-21</td>
						<td><a href="#n" class="btn_r_navy">수정</a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>4</td>
						<td>1000007</td>
						<td><img src="../images/img_replace.gif"></td>
						<td>클럽모나코 모던 블라우스</td>
						<td>9,999,999</td>
						<td>파나소니코리아</td>
						<td>노출함</td>
						<td>판매함</td>
						<td>999,999</td>
						<td>2016-10-10<br/>2016-10-21</td>
						<td><a href="#n" class="btn_r_navy">수정</a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>3</td>
						<td>1000007</td>
						<td><img src="../images/img_replace.gif"></td>
						<td>클럽모나코 모던 블라우스</td>
						<td>9,999,999</td>
						<td>파나소니코리아</td>
						<td>노출함</td>
						<td>판매함</td>
						<td>999,999</td>
						<td>2016-10-10<br/>2016-10-21</td>
						<td><a href="#n" class="btn_r_navy">수정</a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>2</td>
						<td>1000007</td>
						<td><img src="../images/img_replace.gif"></td>
						<td>클럽모나코 모던 블라우스</td>
						<td>9,999,999</td>
						<td>파나소니코리아</td>
						<td>노출함</td>
						<td>판매함</td>
						<td>999,999</td>
						<td>2016-10-10<br/>2016-10-21</td>
						<td><a href="#n" class="btn_r_navy">수정</a></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>1000007</td>
						<td><img src="../images/img_replace.gif"></td>
						<td>클럽모나코 모던 블라우스</td>
						<td>9,999,999</td>
						<td>파나소니코리아</td>
						<td>노출함</td>
						<td>판매함</td>
						<td>999,999</td>
						<td>2016-10-10<br/>2016-10-21</td>
						<td><a href="#n" class="btn_r_navy">수정</a></td>
					</tr>
				</thead>
			</table>
			<p class="table_optionBtn clearfix">
				<a href="#n" class="btn_r_navy">상품 품절처리</a>
				<a href="#n" class="btn_r_navy">선택 복사</a>
				<a href="#n" class="btn_r_navy">선택 삭제</a>
				<a href="#n" class="btn_r02_green">엑셀 다운로드</a>
			</p>

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
	</div><!--// container -->
</div><!--// containerWrap -->



</body>
</html>