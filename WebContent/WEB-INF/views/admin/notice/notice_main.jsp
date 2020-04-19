<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/admin/bo_header.jsp" %>

<%@ include file="/include/admin/bo_left.jsp" %>

<input type="hidden" id="MenuConfirm" value="3">
<div  class="admin_containerWrap"> 
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
	
	<div class="admin_container">
		<div class="top clearfix">
			<ul class="menu_dept clearfix">
				<li>상품관리</li>
				<li>상품리스트</li>
			</ul>
			
		</div><!--  -->
		
		<div class="search_wrap">
			<div class="table_top">
				<span class="table_sbj">공지사항 검색</span>
				<a href="#n" class="btn_r_red">+ 공지등록</a>
			</div><!--// table_top -->
			<table class="notice_srchTable">
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
								<a href="#n"><img src="<%=request.getContextPath()  %>/images/ico_cal.gif"></a>
							</span>
							~
							<span class="input_cal input_w02 mr10">
								<input type="text" value="2016-08-11">
								<a href="#n"><img src="<%=request.getContextPath()  %>/images/ico_cal.gif"></a>
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
								<option>seller(판매관리자)</option>
								<option>사용자</option>
							</select>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="table_optionBtn">
				<a href="#n" class="btn_r_navy" onclick="search_control()">상세검색 닫힘</a>
			</p>
			<a href="#n" class="btn_c dis_b">검 색</a>
		</div>
		<div class="list_table">
			잉?
		</div> 
	</div>
</div>

<script type="text/javascript">
	function search_control(){
		
		$(".notice_srchTable").hide();
	}
</script>

</body>
</html>