<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<div class="lnbWrap">
	<h2>상품관리</h2>
	<ul class="lnb">
		<li class="lnb_sbj"><a href="#n">상품관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="productList.do">상품리스트</a></li>
				<li><a href="productInsert.do">상품 등록</a></li>
				<!-- 
				<li><a href="#n">상품 일괄 등록</a></li>
				<li><a href="#n">상품 이미지 일괄 처리</a></li> 
				<li><a href="#n">삭제 상품 관리</a></li>
				-->
			</ul>
		</li>
		<!-- 
		<li class="lnb_sbj"><a href="#n">상품 설정 관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n">옵션 관리</a></li>
				<li><a href="#n">상품 아이콘 관리</a></li>
				<li><a href="#n">상품 필수정보 관리</a></li>
				<li><a href="#n">상품 가격 관리</a></li>
				<li><a href="#n">상품 품절/노출/재고 관리</a></li>
				<li><a href="#n">상품 이동/복사/삭제 관리</a></li>
				<li><a href="#n">상품 배송비 관리</a></li>
			</ul></li>
		<li class="lnb_sbj"><a href="#n">카테고리 관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n">카테고리 관리</a></li>
				<li><a href="#n">브랜드 관리</a></li>
			</ul>
		</li> 
		-->
		<li class="lnb_sbj"><a href="#n">액티브 관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="testBJH.do">셀러 관리</a></li>
				<li><a href="adminShopList.do">Shop 관리</a></li>
				<li><a href="adminPoolList.do">수영장 관리</a></li>
			</ul></li>
			
		<li class="lnb_sbj"><a href="#n">주문 관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="adminOrderList.do">교환/반품/환불</a></li>
			</ul></li>	
		<li class="lnb_sbj"><a href="adminNotice.do"  style="display: block;">공지 관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="adminOrderList.do">관리자공지</a></li>
				<li><a href="adminOrderList.do">셀러공지</a></li>
			</ul></li>		
	</ul>
</div>
<!--// lnbWrap -->