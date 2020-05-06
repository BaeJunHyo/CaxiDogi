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


<!-- container S : -->
<div class="container container_subWrap" id="fixNextTag">
	
	<div style="margin-top: 100px; padding: 20px;">
		<ul class="prdSubMenu" id="product_sub_group"> <!-- #BEF781 -->
			<li><a href="prdList.do" class="product_sub_group" value="-1">전체</a></li>
			<li><a href="prdListFeed.do" class="product_sub_group" value="1">사료</a></li>
			<li><a href="prdListSnack.do" class="product_sub_group" value="2">간식</a></li>
			<li><a href="prdListBowel.do" class="product_sub_group" value="3">배변용품</a></li>
			<li><a href="prdListPlay.do" class="product_sub_group selectMenu" value="4">놀이용품</a></li>
			<li><a href="prdListBeuty.do" class="product_sub_group" value="5">미용용품</a></li>
			<input type="hidden" value="product_sub_group">
		</ul><!--// gnb -->
	</div>
	
	<div class="prdlist_default" style="margin-top: 20px;">

		<!-- 상품추출 -->
		<div class="mproduct_area">
			<ul>
				<c:forEach items="${prdlist }" var="prd" varStatus="pr">
					<c:if test="${prd.product_hidden == 0 && prd.product_sub_group == 4 }">
						
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

<script>

$(".product_sub_group").click(function(){
	$(".product_sub_group").removeClass('selectMenu');
	$(this).addClass('selectMenu');

	// a태그 value 갖고 오기
	var product_sub_group = $(this).attr('value');  

	//alert("product_sub_group : "+product_sub_group);
	
	location.href="prdList.do?product_sub_group="+product_sub_group;
});

function goPage(pageNumber){
	var product_sub_group = $(".selectMenu").val();
	location.href="prdListPlay.do?pageNumber="+pageNumber;
}

</script>

<%@ include file="./../../../include/footer.jsp"%>