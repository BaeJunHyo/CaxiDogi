<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../../../include/header.jsp" %>
<%
memberDto sessionUser = (memberDto)request.getSession().getAttribute("loginUser");
if(sessionUser == null){
%>
<script>
	if(confirm("세션이 만료되었습니다.\n 다시 로그인 하시겠습니까?")){
		location.href="login.do";
	}else{
		location.href="main.do";
	}
</script>
<%
}
String memberAuth ="";
if(loginUser.getAuth()==1 || loginUser.getAuth()==2){
	memberAuth = "일반회원";
}else if(loginUser.getAuth()==3){
	memberAuth = "업체회원";
}else if(loginUser.getAuth()==4 || loginUser.getAuth()==5){
	memberAuth = "관리자";
}else{
	memberAuth = "탈퇴회원";
}
%>

<%@ include file="./../../../include/left_frm.jsp" %>
		<!-- 마이페이지 메인 -->
	<div class="cusSec_right">
		<div class="box_cusMain clearfix">
			<div class="box_leftSec" style="border-right: none;">
				<h5 style="font-weight: normal;">
					<%=loginUser.getUser_name() %>님 안녕하세요
				</h5>
				
				<p><img src="./images/mypage/ico_user_s.gif"><strong class="pl5 pr20">회원유형</strong><%=memberAuth %></p>
			</div>
		</div>
	
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
	
		<div class="cusSec_tableWrap tw_wHalf fl">
			<h3>
				<span class="t_sbj">나의 상품 Q&amp;A</span>
				<a href="#n" class="btn_dark_s fr">더보기</a>
			</h3>
			<table class="basic_tableStyle">
				<colgroup>
					<col width="90px">
					<col width="*">
					<col width="90px">
				</colgroup>
				<tbody>
					<tr>
						<td class="c_gray">2020.05.10</td>
						<td class="tl"><a href="#n">이 상품의 사이즈는 어떻게 되나요?</a></td>
						<td class="c_red">답변완료</td>
					</tr>
					<tr>
						<td class="c_gray">2020.05.10</td>
						<td class="tl"><a href="#n">이 상품의 사이즈는 어떻게 되나요?</a></td>
						<td>답변대기</td>
					</tr>
					<tr>
						<td class="c_gray">2020.05.10</td>
						<td class="tl"><a href="#n">이 상품의 사이즈는 어떻게 되나요?</a></td>
						<td class="c_red">답변완료</td>
					</tr>
					<tr>
						<td class="c_gray">2020.05.10</td>
						<td class="tl"><a href="#n">이 상품의 사이즈는 어떻게 되나요?</a></td>
						<td class="c_red">답변완료</td>
					</tr>
					<tr>
						<td colspan="3">등록하신 상품 Q&amp;A가 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	
		<div class="cusSec_tableWrap tw_wHalf fr">
			<h3>
				<span class="t_sbj">나의 상품평</span>
				<a href="#n" class="btn_dark_s fr">더보기</a>
			</h3>
			<table class="basic_tableStyle">
				<colgroup>
					<col width="90px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<td class="c_gray">2020.05.10</td>
						<td class="tl"><a href="#n">이 상품의 사이즈는 어떻게 되나요?</a></td>
					</tr>
					<tr>
						<td class="c_gray">2020.05.10</td>
						<td class="tl"><a href="#n">이 상품의 사이즈는 어떻게 되나요?</a></td>
					</tr>
					<tr>
						<td class="c_gray">2020.05.10</td>
						<td class="tl"><a href="#n">이 상품의 사이즈는 어떻게 되나요?</a></td>
					</tr>
					<tr>
						<td class="c_gray">2020.05.10</td>
						<td class="tl"><a href="#n">이 상품의 사이즈는 어떻게 되나요?</a></td>
					</tr>
					<tr>
						<td colspan="2">등록하신 상품평이 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	
		<div class="cusSec_tableWrap tw_wFull" style="clear: both;">
			<h3>
				<span class="t_sbj">1:1 답변확인</span>
				<a href="#n" class="btn_dark_s fr">더보기</a>
			</h3>
			<table class="basic_tableStyle">
				<colgroup>
					<col width="115px">
					<col width="*">
					<col width="115px">
				</colgroup>
				<tbody>
					<tr>
						<td class="c_gray">2020.05.10</td>
						<td class="tl"><a href="#n">주문한지 2주일이 됐는데 언제 발송 주문한지 2주일이 됐는데 언제 발송되나요?</a></td>
						<td class="c_red">답변완료</td>
					</tr>
					<tr>
						<td class="c_gray">2020.05.10</td>
						<td class="tl"><a href="#n">주문한지 2주일이 됐는데 언제 발송 주문한지 2주일이 됐는데 언제 발송되나요?</a></td>
						<td class="c_red">답변완료</td>
					</tr>
					<tr>
						<td class="c_gray">2020.05.10</td>
						<td class="tl"><a href="#n">주문한지 2주일이 됐는데 언제 발송 주문한지 2주일이 됐는데 언제 발송되나요?</a></td>
						<td>답변대기</td>
					</tr>
					<tr>
						<td class="c_gray">2020.05.10</td>
						<td class="tl"><a href="#n">주문한지 2주일이 됐는데 언제 발송 주문한지 2주일이 됐는데 언제 발송되나요?</a></td>
						<td>답변대기</td>
					</tr>
					<tr>
						<td colspan="3">등록된 1:1 문의 내역이 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	
	</div><!--// contents -->

</div><!--container E : -->

<%@ include file="./../../../include/footer.jsp" %>

