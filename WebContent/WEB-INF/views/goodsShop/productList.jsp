<%@page import="cd.com.a.model.productDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp"%>

<link href="./css/layout.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet">

<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>PET GOODS</li>
		<c:if test="${prdlistparam.product_group == -1}">
			<li>전체</li>
		</c:if>
		<c:if test="${prdlistparam.product_group == 1}">
			<li>강아지</li>
		</c:if>
		<c:if test="${prdlistparam.product_group == 2}">
			<li>고양이</li>
		</c:if>
		<c:if test="${prdlistparam.product_group == 3}">
			<li>공용</li>
		</c:if>
		<c:if test="${prdlistparam.product_sub_group == -1}">
			<li>전체</li>
		</c:if>
		<c:if test="${prdlistparam.product_sub_group == 1}">
			<li>사료</li>
		</c:if>
		<c:if test="${prdlistparam.product_sub_group == 2}">
			<li>간식</li>
		</c:if>
		<c:if test="${prdlistparam.product_sub_group == 3}">
			<li>배변용품</li>
		</c:if>
		
		<c:if test="${prdlistparam.product_sub_group == 4}">
			<li>놀이용품</li>
		</c:if>
		<c:if test="${prdlistparam.product_sub_group == 5}">
			<li>미용용품</li>
		</c:if>
	</ul>
</div>

<!-- container S : -->
<div class="container container_subWrap" id="fixNextTag">
	
	<div style="margin-top: 43px; margin-bottom: 50px; padding: 20px;">
		<ul class="prdSubMenu"> <!-- #BEF781 -->
			<li><a href="#none" class="product_sub_group ${prdlistparam.product_sub_group == -1?'selectMenu': '' }" value="-1">전체</a></li>
			<li><a href="#none" class="product_sub_group ${prdlistparam.product_sub_group == 1?'selectMenu': '' }" value="1">사료</a></li>
			<li><a href="#none" class="product_sub_group ${prdlistparam.product_sub_group == 2?'selectMenu': '' }" value="2">간식</a></li>
			<li><a href="#none" class="product_sub_group ${prdlistparam.product_sub_group == 3?'selectMenu': '' }" value="3">배변용품</a></li>
			<li><a href="#none" class="product_sub_group ${prdlistparam.product_sub_group == 4?'selectMenu': '' }" value="4">놀이용품</a></li>
			<li><a href="#none" class="product_sub_group ${prdlistparam.product_sub_group == 5?'selectMenu': '' }" value="5">미용용품</a></li>
		</ul><!--// gnb -->
		<input type="hidden" value="${prdlistparam.product_group }" id="product_group">
		<input type="hidden" value="${prdlistparam.product_sub_group }" id="product_sub_group">
	</div>
	
	<%-- 
	<div class="total-sort" style="margin-top: 100px;">
		<!--<dl class="total">
                                    <dt>total:</dt>
                                    <dd>29</dd>
                                </dl>-->
		<p class="total" style="color: #a2a2a2;">
			In this category are <strong>${totalRecordCount }</strong> products.
		</p>						<!-- 여기에 제품 수량 넣어줘야됨  -->
		<dl class="sort">
			<dt class="blind">검색결과 정렬</dt>
			<dd>
				<ul>
					<li><a href="javascript:sendsort('readcount')">인기순</a></li>
					<li><a href="javascript:sendsort('regi_date')">최신순</a></li>
					<li><a href="javascript:sendsort('row_price')">낮은가격순</a></li>
				</ul>
			</dd>
		</dl>
	</div> 
	--%>


	<div class="prdlist_default" style="margin-top: 20px;">

		<!-- 상품추출 -->
		<div class="mproduct_area">
			<ul id="prdListWrap">
				<c:forEach items="${prdlist }" var="prd" varStatus="pr">
					<c:if test="${prd.product_hidden == 0 }">
						<li>
							<!-- 상품 재고가 없을 때 -->
							<c:if test="${prd.product_stock == 0 }">
								<a href="#none" class="box" onclick="alert('품절된 상품입니다.')" style="cursor: auto;">
								
									<div class="img">
										<div class="MS_prod_img_m" style="position: relative;">
											<img src="<%=request.getContextPath() %>/images/goodsImg/${prd.product_img }" alt="${prd.product_name }" title="${prd.product_name }"/>
										</div>
									</div>
								
									<dl>
										<dt><strike>${prd.product_name }</strike><span style="font-size: 12px; margin-left: 5px; color:red;">(품절)</span></dt>
										<!-- <dd class="txt"># 아침7시 당일주문 마감</dd> -->
										<dd class="price_box">
											<p>
												<span class="price"><fmt:formatNumber value="${prd.product_price}" pattern="###,###,###"/>원</span>
											</p>
											<span class="rev">상세보기</span>
										</dd>
									</dl>
								</a>
							</c:if>
							
							<!-- 상품 재고가 있을 때 -->
							<c:if test="${prd.product_stock > 0 }">
								<a href="productDetail.do?product_num=${prd.product_num }" class="box">
								
									<div class="img">
										<div class="MS_prod_img_m" style="position: relative;">
											<img src="<%=request.getContextPath() %>/images/goodsImg/${prd.product_img }" alt="${prd.product_name }" title="${prd.product_name }"/>
										</div>
									</div>
								
									<dl>
										<dt>${prd.product_name }</dt>
										<!-- <dd class="txt"># 아침7시 당일주문 마감</dd> -->
										<dd class="price_box">
											<p>
												<span class="price"><fmt:formatNumber value="${prd.product_price}" pattern="###,###,###"/>원</span>
											</p>
											<span class="rev">상세보기</span>
										</dd>
									</dl>
								</a>
							</c:if>
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<!-- //상품추출 -->


		<!-- 
		<ol class="paging">
			<li class="now">
				<a href="/shop/shopbrand.html?type=X&amp;xcode=012&amp;sort=&amp;page=1"></a>
			</li>
		</ol> 
		-->
		<jsp:include page="/include/paging.jsp" flush="false">
           <jsp:param name="totalRecordCount" value="${totalRecordCount }" />
           <jsp:param name="pageNumber" value="${pageNumber }" />
           <jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
           <jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
        </jsp:include>

	</div>

	<form id="pagingFrm">
		<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
		<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">   
	</form>

	<!--// brandFilter -->

	<!--// new_product -->

</div>
<!-- container E : -->
<%-- 인기순 / 최신순 / 낮은 가격순 클릭시 List바꿔 가져오기 --%>
<script>

var product_group = $(this).attr('value');


/* 
$(".product_group").click(function(){
	location.href="prdList.do?product_group="+product_group;
}); 
*/

$(".product_sub_group").click(function(){
	//$(".product_sub_group").removeClass('selectMenu');
	//$(this).addClass('selectMenu');
	//alert("product_sub_group : "+product_sub_group);
	
	var product_group = $("#product_group").val();
	var product_sub_group = $(this).attr('value');  // a value 갖고 오기
	location.href="prdList.do?product_sub_group="+product_sub_group+"&product_group="+product_group;
});

function goPage(pageNumber){
	var product_group = $("#product_group").val();
	var product_sub_group = $("#product_sub_group").val();
	location.href="prdList.do?product_group="+product_group+"&product_sub_group="+product_sub_group+"&pageNumber="+pageNumber;  
}

</script>
	
<script>

	function sendsort(sortsend){
		//console.log(sortsend);
		location.href="option_prdList.do?option=" + sortsend;
	}
</script>
<%-- 인기순 / 최신순 / 낮은 가격순 클릭 후 새로고침시 화면 이동 처리  --%>
<script>
	if(${sortSend ne null}){
		var offset = $(".prdSubMenu").offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
	}else{}
</script>

<%@ include file="./../../../include/footer.jsp"%>