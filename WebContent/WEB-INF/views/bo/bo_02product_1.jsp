<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<%@ include file="./../../../include/bo_header.jsp" %>

<%
String category = (String)request.getAttribute("s_category");
if(category == null) category = "";
	
String keyword = (String)request.getAttribute("s_keyword");
if(keyword == null) keyword = "";
%>

<script>
var category = "<%=category %>";
var keyword = "<%=keyword %>";
$(document).ready(function () {
	$("#_s_category").val( category );
	
	document.prdSrchFrm.s_keyword.value = keyword;
});
</script>

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
				<li><img src="./images/bo/img_colorInfo_01.gif">입력정보</li>
				<li><img src="./images/bo/img_colorInfo_02.gif">조회정보</li>
				<li><img src="./images/bo/img_colorInfo_03.gif">링크</li>
				<li><img src="./images/bo/img_colorInfo_04.gif">신규/수정</li>
				<li><img src="./images/bo/img_colorInfo_05.gif">삭제</li>
			</ul>
		</div><!--// top -->

		<div class="cn_wrap">
			<div class="table_top">
				<span class="table_sbj">상품검색</span>
				<a href="productInsert.do" class="btn_r_red">+ 상품등록</a>
			</div><!--// table_top -->
			
			<!-- 검색 -->
			<form name="prdSrchFrm" id="_prdSrchFrm" method="post">
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
								<select id="_s_category" name="s_category">
									<option value="" selected="selected">통합검색</option>
									<option value="product_name">상품명</option>
									<option value="product_code">상품코드</option>
									<option value="product_brand">공급사</option>
								</select>
								<input type="text" id="_s_keyword" name="s_keyword">
							</td>
						</tr>
						
						<!-- <tr class="click_hide">
							<th>기간검색</th>
							<td colspan="3">
								<select>
									<option>등록일</option>
								</select>
								<span class="input_cal input_w02">
									<input type="text" value="2020-05-07">
									<a href="#n"><img src="./images/bo/ico_cal.gif"></a>
								</span>
								~
								<span class="input_cal input_w02 mr10">
									<input type="text" value="2020-05-11">
									<a href="#n"><img src="./images/bo/ico_cal.gif"></a>
								</span>
								
								<a href="#n" class="btn_r_navy">오늘</a>
								<a href="#n" class="btn_r_navy">7일</a>
								<a href="#n" class="btn_r_navy">15일</a>
								<a href="#n" class="btn_r_navy">1개월</a>
								<a href="#n" class="btn_r_navy">3개월</a>
								<a href="#n" class="btn_r_navy">전체</a> 
								
							</td>
						</tr> -->
						
						<tr>
							<th>카테고리</th>
							<td colspan="3">
								<select id="_s_product_group" name="s_product_group">
									<option value="" selected="selected">카테고리 선택</option>
									<option value="1" name="dogGoods">강아지 용품</option>
									<option value="2" name="catGoods">고양이 용품</option>
									<option value="3" name="public">공용</option>
								</select>
								
								<select id="_s_product_sub_group" name="s_product_sub_group">
									<option value="" selected="selected">카테고리 선택</option>
									<option value="1" name="feed">사료</option>
									<option value="2" name="snack">간식</option>
									<option value="3" name="toilet">배변용품</option>
									<option value="4" name="play">놀이용품</option>
									<option value="5" name="beauty">미용용품</option>
								</select>
								<!-- <span class="select_wrap">
									<input type="checkbox">
									<label>카테고리 미지정 상품</label>
								</span> -->
							</td>
						</tr>
						<!-- <tr>
							<th>브랜드</th>
							<td colspan="3">
								<a href="#n" class="btn_r_navy">브랜드선택</a>
								<span class="select_wrap">
									<input type="checkbox">
									<label>브랜드 미지정 상품</label>
								</span>
							</td>
						</tr> -->
						<!-- <tr>
							<th>상품 재고</th>
							<td>
								<input type="number" class="input_w02" name="minStorage" value="minStorage"> 개 이상 ~ 
								<input type="number" class="input_w02" name="maxStorage" value="maxStorage"> 개 이하
							</td>
							
							<th>판매가</th>
							<td>
								<input type="number" class="input_w02" name="minPrice" value="minPrice"> 이상 ~ 
								<input type="number" class="input_w02" name="maxPrice" value="maxPrice"> 이하
							</td>
						</tr> -->
						<!-- <tr>
							<th>상품노출 상태</th>
							<td>
								<span class="select_wrap">
									<input type="radio" name="product_hidden" value="" checked="checked">
									<label>전체</label>
								</span>
								<span class="select_wrap">
									<input type="radio"  name="product_hidden" value="0">
									<label>노출</label>
								</span>
								<span class="select_wrap">
									<input type="radio"  name="product_hidden" value="1">
									<label>미노출</label>
								</span>
							</td>
							
							<th>상품판매 상태</th>
							<td>
								<span class="select_wrap">
									<input type="radio"  name="product_sale" value="sellState" checked="checked">
									<label>전체</label>
								</span>
								<span class="select_wrap">
									<input type="radio" name="product_sale" value="0">
									<label>사용함</label>
								</span>
								<span class="select_wrap">
									<input type="radio" name="product_sale" value="1">
									<label>판매안함</label>
								</span>
							</td>
						</tr> -->
						<tr>
							<!-- 
							<th>판매 재고</th>
							<td></td> 
							-->
							
							<th>품절 상태</th>
							<td>
								<span class="select_wrap">
									<input type="radio" name="soldState" value="0" checked="checked">
									<label>전체</label>
								</span>
								<span class="select_wrap">
									<input type="radio" name="soldState" value="1">
									<label>품절</label>
								</span>
								<span class="select_wrap">
									<input type="radio" name="soldState" value="2">
									<label>정상</label>
								</span>
							</td>
						</tr>
						<!-- <tr>
							<th>배송비 조건</th>
							<td colspan="3">
								<span class="select_wrap">
									<input type="radio" name="deliverCondition" value="deliverCondition">
									<label>전체</label>
								</span>
								<span class="select_wrap">
									<input type="radio" name="deliverCondition" value="deliverCondition">
									<label>배송비무료</label>
								</span>
								<span class="select_wrap">
									<input type="radio" name="deliverCondition" value="deliverCondition">
									<label>배송비유료</label>
								</span>
							</td>
						</tr> -->
					</tbody>
				</table>
			
				<!-- <p class="table_optionBtn">
					<a href="#n" class="btn_r_navy btn_detailsrch">상세검색 닫기</a>
				</p> -->
				
				<a href="#n" id="_btnSearch" class="btn_c dis_b">검 색</a>
			</form>
		</div>
		<!-- //cn_wrap -->

		<div class="cn_wrap srch_result">
			<div class="table_top clearfix">
				<p class="count">
					검색
					<span class="c_red">10</span>개
					<img src="./images/bo/ico_bar02.gif" class="bar">
					전체
					<span class="c_red">10</span>개
				</p>
				<p class="pageUnit">
					<select name="">
						<option value="" selected="selected">등록일 (오름차순)</option>
					</select>
					<select name="">
						<option value="10" selected="selected">10개 보기</option>
						<option value="5">5개 보기</option>
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
						<th><input type="checkbox" name="chk" onclick="deletechecks(this.checked)"></th>
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
				</thead>
				
				<tbody>
					<c:if test="${empty prdlist }">
						<tr>
							<td colspan="12">상품등록이 되지 않았습니다.</td>
						</tr>
					</c:if>
					
					<c:forEach items="${prdlist }" var="pr" varStatus="vs">
					<tr>
						<td><input type="checkbox" name="chk"></td>
						<td>${pr.product_num }</td>
						<td>${pr.product_code }</td>
						<td><img src="<%=request.getContextPath() %>/images/goodsImg/${pr.product_img }" width="40" height="40"></td>
						<td>${pr.product_name }</td>
						<td><fmt:formatNumber value="${pr.product_price}" pattern="###,###,###"/>원</td>
						<td>${pr.product_brand }</td>
						<td>${pr.product_hidden }</td>
						<td>${pr.product_sale }</td>
						<td>${pr.product_stock }</td>
						<td>${fn:split(pr.product_regi_date, ' ')[0] }</td>
						<td><a href="productUpdate.do?product_num=${pr.product_num }" class="btn_r_navy">수정</a></td>
					</tr>
					</c:forEach>
				</tbody>
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

<script>
//-- 다중 선택 삭제
function deletechecks( ch ){
// alert(ch);
	var arrCheck = document.getElementsByName("chk");  
	  
	// -- true로 들어왔을 때 (체크되었을 때)
	for(i = 0; i < arrCheck.length; i++){
	    // -- 클릭하면 전체 선택되게 해줌
	    arrCheck[i].checked = ch; 
	}
}

/* 
function goPage( pageNumber ){
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").attr("action", "bbslist.do").submit();	
}
 */
$("#_btnSearch").click(function(){
//	alert("_btnSearch");
	$("#_prdSrchFrm").attr("action", "productList.do").submit();
});

</script>

</body>
</html>