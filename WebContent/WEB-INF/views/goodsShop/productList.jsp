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
			<li><a href="#n" class="subMenuBtn">전체</a></li>
			<li><a href="#n" class="subMenuBtn">사료</a></li>
			<li><a href="#n" class="subMenuBtn">놀이용품</a></li>
			<li><a href="#n" class="subMenuBtn">간식</a></li>
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
					<li><a href="javascript:sendsort('readcount')">인기순</a></li>
					<li><a href="javascript:sendsort('regi_date')">최신순</a></li>
					<li><a href="javascript:sendsort('row_price')">낮은가격순</a></li>
				</ul>
			</dd>
		</dl>
	</div>


	<div class="prdlist_default">


		<!-- 상품추출 -->
		<div class="mproduct_area">
			<ul id="prdListWrap">
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
									<img src="<%=request.getContextPath() %>/images/goodsImg/${prd.product_img }" alt="" class="MS_prod_img_m"/>
									<%-- <img src="${path}/boUpload/${prd.product_img}" alt="" class="MS_prod_img_m"/> --%>
								</div>
								<dl>
									<dt>${prd.product_name }</dt>
									<!-- <dd class="txt"># 아침7시 당일주문 마감</dd> -->
									<dd class="price_box">
										<p>
											<span class="price"><fmt:formatNumber value="${prd.product_price}" pattern="###,###,###"/>원</span>
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
<%-- 인기순 / 최신순 / 낮은 가격순 클릭시 List바꿔 가져오기 --%>
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