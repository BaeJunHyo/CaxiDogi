<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ include file="./../../../include/header.jsp"%>
<link href="./css/layout.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet">

<!-- container S : -->
<div class="container container_subWrap" id="fixNextTag">
<div class="total-sort">
                                <!--<dl class="total">
                                    <dt>total:</dt>
                                    <dd>29</dd>
                                </dl>-->
                                <p class="total" style="color:#a2a2a2;">In this category are <strong>29</strong> products.</p>
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
		<c:forEach items="${shoplist }" var="shop" varStatus="sp">
		<c:if test="${shop.shop_auth == 1 }">
				<li><a
					href="shopDetail.do?shop_seq=${shop.shop_seq }"
					class="box">
						<div class="img">
						<c:if test="${shop.shop_photo == 'default' }">
							<img class="MS_prod_img_m"
								src="./images/shopImg/default.png" alt="">
						</c:if>
						<c:if test="${shop.shop_photo != 'default' }">
							<img class="MS_prod_img_m"
								src="<%=request.getContextPath() %>/images/shopImg/${shop.shop_photo }" alt="">
						</c:if>
						</div>
						<dl>
							<dt>${shop.shop_name }</dt>
							<dd class="txt">${fn:split(shop.shop_addr, '/')[1] }</dd>
							<dd class="price_box">
								<p>
									<span class="price">${shop.shop_small_price }</span>
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


<!-- 		<ol class="paging">
		<li class="now"><a
				href="/shop/shopbrand.html?type=X&amp;xcode=012&amp;sort=&amp;page=1"></a></li>
		</ol> -->
		
		<div class="shop_section">
		<p class="main_menu">
				<span class="searchArea"> <input type="text"> <a href="#n"><img src="images/ico_h_search.gif" alt="검색버튼"></a>
				</span> 
		</p>
		</div>

	</div>



	<!--// brandFilter -->


	<!--// new_product -->


</div>
<!-- container E : -->

<%@ include file="./../../../include/footer.jsp"%>
