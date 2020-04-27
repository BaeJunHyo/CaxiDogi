<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="cusSec_tableWrap tw_wFull">
	<h3>
		<span class="t_sbj">최근 구매내역</span>
		<span class="c_gray">(최근 주문 5건 / 1개월 내)</span>
		<a href="#n" class="btn_dark_s fr">더보기</a>
	</h3>
	<table class="basic_tableStyle">
		<colgroup>
			<col width="115px">
			<col width="*">
			<col width="115px">
			<col width="115px">
			<col width="115px">
		</colgroup>
		<thead>
			<tr>
				<th>주문일/주문번호</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>진행상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>2020.05.23<a href="#n" class="prdNum">12456789</a></td>
				<td class="tl">
					<a href="#n" class="tableThumb_small"><img src="./images/mypage/img_prdBigThumb.jpg"></a>
					<div class="prdInfo">
						<a href="#n">
							<p class="c_gray">[123]</p>
							123 / ㄱㄴㄷㄹㅁ
							<p class="pt5">판매가 9,000원</p>
						</a>
					</div>
				</td>
				<td>2</td>
				<td>9,000원</td>
				<td>
					<p>발송완료</p>
					<a href="#n" class="btn_line_s">상품평작성</a>
				</td>
			</tr>
				
			<tr>
				<td colspan="5">최근 1개월 동안 구매하신 내역이 없습니다.</td>
			</tr>
		</tbody>
	</table>
</div> 