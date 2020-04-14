<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../../../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="./css/layout.css" rel="stylesheet">
<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>Active</li>
		<li>수영장</li>
	</ul>
</div>
<div class="container container_subWrap" id="fixNextTag">
<!-- 	<div class="total-sort">
		<p class="total" style="color: #a2a2a2;">
			In this category are <strong>29</strong> products.
		</p>
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
 -->

	<div class="prdlist_default">
		<!-- 상품추출 -->
		<div class="mproduct_area">
			<ul>
				<c:forEach items="${poolList }" var="pool" varStatus="sp">
					<%-- 		<c:if test="${pool.pool_auth == 1 }"> --%>
					<li><a href="poolDetail.do?pool_seq=${pool.pool_seq }" class="box">
							<div class="img">
								<c:if test="${pool.pool_photo == 'default' }">
									<img class="MS_prod_img_m"
										src="<%=request.getContextPath()%>/images/poolImg/grooming.png"
										alt="">
								</c:if>
								<c:if test="${pool.pool_photo != 'default' }">
									<img class="MS_prod_img_m"
										src="<%=request.getContextPath() %>/images/poolImg/${pool.pool_photo }"
										alt="">
								</c:if>
							</div>
							<dl>
								<dt>${pool.pool_name }</dt>
								<dd class="txt">${pool.pool_addr }</dd>
								<dd class="price_box">
									<p>
										<span class="price">시간당 : <strong>${pool.pool_price }</strong>원</span>
									</p>
									<span class="rev">더보기</span>
								</dd>
							</dl>
					</a></li>
					<%--  </c:if>--%>
				</c:forEach>
			</ul>
		</div>
		<!-- //상품추출 -->


		<ol class="paging">

			<li class="now"><a
				href="/pool/poolbrand.html?type=X&amp;xcode=012&amp;sort=&amp;page=1"></a></li>


		</ol>

	</div>



	<!--// brandFilter -->


	<!--// new_product -->


</div>
<!-- container E : -->
<%@ include file="./../../../include/footer.jsp"%>