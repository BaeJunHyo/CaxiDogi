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
	
	<div style="margin-top: 100px; background-color: #86B404; padding: 20px;">
		<ul class="prdSubMenu"> <!-- #BEF781 -->
			<li><a href="#n" class="selectMenu">전체</a></li>
			<li><a href="#n">사료</a></li>
			<li><a href="#n">놀이용품</a></li>
			<li><a href="#n">간식</a></li>
		</ul><!--// gnb -->
	</div>
	
	<div class="total-sort" style="margin-top: 100px;">
		<!--<dl class="total">
                                    <dt>total:</dt>
                                    <dd>29</dd>
                                </dl>-->
		<p class="total" style="color: #a2a2a2;">
			In this category are <strong>29</strong> products.
		</p>						<!-- 여기에 제품 수량 넣어줘야됨  -->
		<dl class="sort">
			<dt class="blind">검색결과 정렬</dt>
			<dd>
				<ul>
					<li><a href="javascript:sendsort('sellcnt')">인기순</a></li>
					<li><a href="javascript:sendsort('regdate')">최신순</a></li>
					<li><a href="javascript:sendsort('price')">낮은가격순</a></li>
				</ul>
			</dd>
		</dl>
	</div>


	<div class="prdlist_default">


		<!-- 상품추출 -->
		<div class="mproduct_area">
			<ul>
				<c:forEach items="${prdlist }" var="prd" varStatus="pr">
					<c:if test="${prd.product_hidden == 0 }">
						<li>
							<a href="productDetail.do?product_num=${prd.product_num }" class="box">
								<div class="img">
									<%-- 
									<c:if test="${prd.shop_photo == 'default' }">
										<img class="MS_prod_img_m" src="./images/shopImg/default.png"
											alt="">
									</c:if> 
									--%>
									<%-- <c:if test="${prd.shop_photo != 'default' }">
										<img class="MS_prod_img_m"
											src="<%=request.getContextPath() %>/images/shopImg/${prd.shop_photo }"
											alt="">
									</c:if> --%>
									<img src="${path}/boUpload/${prd.product_img}" alt="" class="MS_prod_img_m"/>
								</div>
								<dl>
									<dt>${prd.product_name }</dt>
									<dd class="price_box">
										<p>
											<span class="price">${prd.product_price }</span>
										</p>
										<span class="rev">Review</span>
									</dd>
								</dl>
						</a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
		<!-- //상품추출 -->


		<ol class="paging">

			<li class="now"><a
				href="/shop/shopbrand.html?type=X&amp;xcode=012&amp;sort=&amp;page=1"></a></li>


		</ol>

	</div>



	<!--// brandFilter -->


	<!--// new_product -->


</div>
<!-- container E : -->

<%@ include file="./../../../include/footer.jsp"%>