<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>


<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>공지사항</li>
	</ul>
</div>

<!-- container S : -->
<div class="container_subWrap clearfix">
	<div class="cusSec_left">
		<div class="customerMenu">
			<h3>공지사항</h3>
			<ul class="csSubmenu">
				<!-- <li>
					<a href="#n">FAQ</a>
					<ul>
						<li><a href="#n">주문/결제</a></li>
						<li><a href="#n">취소/교환/반품</a></li>
						<li><a href="#n">회원안내</a></li>
					</ul>
				</li> -->
				<li><a href="notice.do">공지사항</a></li>
			</ul>
		</div>
		<div class="customerMenu">
			<h4>온라인 고객센터</h4>
			<p class="csNumber">123-4567<img src="../images/ico_phone.gif" class="pl5"></p>
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
			공지사항
		</h2>

		<table class="basic_tableStyle mt30">
			<colgroup>
				<col width="90px">
				<col width="*">
				<col width="90px">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>질문 제목</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<tr class="view_tableTit">
					<td>3</td>
					<td class="tl"><a href="#n">시스템 점검 사항</a></td>
					<td>2020-05-08</td>
				</tr>
				<tr class="view_tableCn02">
					<td></td>
					<td class="tl">
						아래와 같이 98마켓 시스템을 점검 하오니 이용에 착오 없으시기 바랍니다.<br/><br/>
						<span class="sub_t_sbj"><시스템 점검 일자></span><br/>
						2020년 4월 10일 ~ 24:00 ~ 07:00
					</td>
					<td></td>
				</tr>
				<tr class="view_tableTit">
					<td>2</td>
					<td class="tl"><a href="#n">시스템 점검 사항</a></td>
					<td>2020-05-08</td>
				</tr>
				<tr class="view_tableCn02">
					<td></td>
					<td class="tl">
						아래와 같이 98마켓 시스템을 점검 하오니 이용에 착오 없으시기 바랍니다.<br/><br/>
						<span class="sub_t_sbj"><시스템 점검 일자></span><br/>
						2020년 4월 10일 ~ 24:00 ~ 07:00
					</td>
					<td></td>
				</tr>
				<tr class="view_tableTit">
					<td>1</td>
					<td class="tl"><a href="#n">시스템 점검 사항</a></td>
					<td>2020-05-08</td>
				</tr>
				<tr class="view_tableCn02">
					<td></td>
					<td class="tl">
						아래와 같이 98마켓 시스템을 점검 하오니 이용에 착오 없으시기 바랍니다.<br/><br/>
						<span class="sub_t_sbj"><시스템 점검 일자></span><br/>
						2020년 4월 10일 ~ 24:00 ~ 07:00
					</td>
					<td></td>
				</tr>
			</tbody>
		</table>

		<!-- <p class="pagination">
			<a href="#n" class="btn_table_prev">
			</a><a href="#n" class="current">
			1</a><a href="#n">
			2</a><a href="#n" class="btn_table_next">
			</a>
		</p> -->
	</div><!--// contents -->
</div>
<!-- container E : -->


<%@ include file="./../../../include/footer.jsp" %>