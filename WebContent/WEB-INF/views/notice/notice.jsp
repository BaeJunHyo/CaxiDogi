<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>


<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>Q&A</li>
	</ul>
</div>

<!-- container S : -->
<div class="container_subWrap clearfix">
	<div class="cusSec_left">
		<div class="customerMenu">
			<h3>Q&A</h3>
			<ul class="csSubmenu">
				<!-- <li>
					<a href="#n">FAQ</a>
					<ul>
						<li><a href="#n">주문/결제</a></li>
						<li><a href="#n">취소/교환/반품</a></li>
						<li><a href="#n">회원안내</a></li>
					</ul>
				</li> -->
				<li><a href="notice.do">Q&A</a></li>
			</ul>
		</div>
		<div class="customerMenu">
			<h4>온라인 고객센터</h4>
			<p class="csNumber">123-4567<img src="<%=request.getContextPath() %>/images/ico_phone.gif" class="pl5"></p>
			<ul class="csTime">
				<li>
					평일
					<span class="c_gray">09:00 ~ 19:00</span>
				</li>
				<li>
					토/일요일 및 공휴일
					<span class="c_gray">09:00 ~ 17 :00</span>
				</li>
			</ul>
		</div>
	</div>

	<div class="cusSec_right">
		<h2 class="cs_sbj">
			Q&A
		</h2>

		<div class="cusSec_tableWrap">
			<h3>
				<span class="t_sbj">문의건수</span>
				<span class="fs12 c_red">3
					<span class="c_gray">개의 문의한 상품 Q&amp;A가 있습니다.</span>
				</span>
				<a href="#n" class="btn_gray fr btnHover">상품 Q&amp;A 안내</a>
				<div class="btnHover_cn">
					<p class="h_tit">
						상품 Q&amp;A 안내
						<a href="#n" class="btn_close_h">
							<img src="<%=request.getContextPath() %>/images/btn_close_m.png" alt="닫기">
						</a>
					</p>	
					<ul class="dot_list">
						<li>상품과 관련없는 내용, 비방, 광고, 불건전한 내용의 글은 사전 동의 없이 삭제될 수 있습니다.</li>
						<li>회원님께서 작성하신 질문의 답변이 작성된 후에는 수정 하실 수 없습니다.</li>
					</ul>
				</div>
			</h3>


			<table class="basic_tableStyle">
				<colgroup>
					<col width="115px">
					<col width="*">
					<col width="115px">
					<col width="115px">
				</colgroup>
				<thead>
					<tr>
						<th>문의유형</th>
						<!-- <th>상품명</th> -->
						<th>제목</th>
						<th>답변상태</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr class="view_tableTit">
						<td>상품</td>
						<td class="tl">
							<a href="#n">
								<p class="c_gray">송아지목뼈껌(100G)</p>
								소화가 잘 되나요?
							</a>
						</td>
						<td class="c_red">등록</td>
						<td>2020-04-27</td>
					</tr>
					<tr class="view_tableCn view_tableCn02" style="display: none;">
						<td></td>
						<td colspan="4">
							<span class="Qsec">
								소화가 잘 되나요?
								<!-- <span class="fr"><a href="#n" class="btn_line_s">삭제</a></span> -->
							</span>
							<span class="Asec">
								안녕하세요. 고객님<br>
								caxidogi 고객센터 입니다.<br>
								추가 문의 사항은 고객센터나 문의하기를 이용해주시면 빠른 시간 내에 답변 드리겠습니다.<br>
								감사합니다.
								<span class="fr">2020-04-27</span>
							</span>
						</td>
					</tr>
					
					<tr class="view_tableTit">
						<td>상품</td>
						<td class="tl">
							<a href="#n">
								<p class="c_gray">송아지목뼈껌(100G)</p>
								소화가 잘 되나요?
							</a>
						</td>
						<td class="c_red">등록</td>
						<td>2020-04-27</td>
					</tr>
					<tr class="view_tableCn view_tableCn02" style="display: none;">
						<td></td>
						<td colspan="4">
							<span class="Qsec">
								소화가 잘 되나요?
								<!-- <span class="fr"><a href="#n" class="btn_line_s">삭제</a></span> -->
							</span>
							<span class="Asec">
								안녕하세요. 고객님<br>
								caxidogi 고객센터 입니다.<br>
								추가 문의 사항은 고객센터나 문의하기를 이용해주시면 빠른 시간 내에 답변 드리겠습니다.<br>
								감사합니다.
								<span class="fr">2020-04-27</span>
							</span>
						</td>
					</tr>
					
					<tr class="view_tableTit">
						<td>상품</td>
						<td class="tl">
							<a href="#n">
								<p class="c_gray">송아지목뼈껌(100G)</p>
								소화가 잘 되나요?
							</a>
						</td>
						<td class="c_red">등록</td>
						<td>2020-04-27</td>
					</tr>
					<tr class="view_tableCn view_tableCn02" style="display: none;">
						<td></td>
						<td colspan="4">
							<span class="Qsec">
								소화가 잘 되나요?
								<!-- <span class="fr"><a href="#n" class="btn_line_s">삭제</a></span> -->
							</span>
							<span class="Asec">
								안녕하세요. 고객님<br>
								caxidogi 고객센터 입니다.<br>
								추가 문의 사항은 고객센터나 문의하기를 이용해주시면 빠른 시간 내에 답변 드리겠습니다.<br>
								감사합니다.
								<span class="fr">2020-04-27</span>
							</span>
						</td>
					</tr>
					
					<tr>
						<td colspan="4">등록된 Q&amp;A가 없습니다.</td>
					</tr>
				</tbody>
			</table>

		</div>
	</div><!--// contents -->
</div>
<!-- container E : -->


<%@ include file="./../../../include/footer.jsp" %>