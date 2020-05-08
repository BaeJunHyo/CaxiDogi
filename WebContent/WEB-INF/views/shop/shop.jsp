<%@page import="cd.com.a.model.shopListParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<%@ include file="./../../../include/header.jsp"%>
<link href="./css/layout.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet">
<%
if(loginUser != null){
	if(loginUser.getUser_api()!=0){
		if(loginUser.getUser_name() == null || loginUser.getUser_name().equals("") ||
			loginUser.getNick_name() == null || loginUser.getNick_name().equals("") ||
			loginUser.getPhone() == null || loginUser.getPhone().equals("") ||
			loginUser.getBirthday()== null || loginUser.getBirthday().equals("") ||
			loginUser.getAddress()== null || loginUser.getAddress().equals("")){
%>
<script>
location.href="myPageMove.do";
</script>
<%
		}
	}
}
%>	
<!-- container S : -->
<div class="container container_subWrap" id="fixNextTag">



	<div class="prdlist_default">
	
	<select id="shop_sel">
		<option value="-1" >지역 검색</option>
		<option value="1">서울</option>
		<option value="2">경기</option>
		<option value="3">기타</option>
	</select>

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
								<span class="rev">더보기</span>
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
		
	

	</div>



	<!--// brandFilter -->


	<!--// new_product -->
	 <jsp:include page="/include/paging.jsp" flush="false">
		<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
		<jsp:param name="pageNumber" value="${pageNumber }" />
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
</jsp:include> 


</div>
<!-- container E : -->
<script>
$("#shop_sel").change(function(){
	var shopAddr = $("#shop_sel option:selected").val();

	location.href="getShopList.do?shopAddr="+shopAddr;
});
<%-- $("#shop_sel option:selected").val(<%=param.getShopAddrSeo()%>).prop('selected',true); --%>


$("#shop_sel").val(${param.shopAddr}).prop("selected", true);

<%-- $("#shop_sel").val("<%=param.getShopAddrSeo()%>").prop("selected", true);
$("#shop_sel").val("<%=param.getShopAddrKyeong()%>").prop("selected", true);
$("#shop_sel").val("<%=param.getShopAddrEtc()%>").prop("selected", true); --%>

<%-- $("#shop_sel").val(<%=param.getShopAddrSeo() %>).prop('selected',true);
$("#shop_sel").val(<%=param.getShopAddrKyeong()%>).prop('selected',true);
$("#shop_sel").val(<%=param.getShopAddrEtc()%>).prop('selected',true); --%>

function goPage(pageNumber){
	var shopAddr = $("#shop_sel option:selected").val();
	location.href="getShopList.do?shopAddr="+shopAddr+"&pageNumber="+pageNumber;
	
}
</script>

<%@ include file="./../../../include/footer.jsp"%>
