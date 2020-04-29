<%@page import="cd.com.a.model.shopSellerPagingParam"%>
<%@page import="cd.com.a.model.poolParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../../../../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
shopSellerPagingParam param = (shopSellerPagingParam)request.getAttribute("param");
memberDto sessionUser = (memberDto)request.getSession().getAttribute("loginUser");
if(sessionUser == null){
%>
<script>
	if(confirm("세션이 만료되었습니다.\n 다시 로그인 하시겠습니까?")){
		location.href="login.do";
	}else{
		location.href="main.do";
	}
</script>
<%
}
%>
<%@ include file="./../../../../include/left_frm_seller.jsp" %>
		<!-- 마이페이지 메인 -->
	<div class="cusSec_right">
		<div class="cusSec_tableWrap tw_wFull">
			<h3>
				<span class="t_sbj">미용샵 예약 리스트</span>
			</h3>
		</div>
		<div style ="margin-bottom : 10px;">
			<c:if test = "${fn:length(shoplist) == 0 }">
				등록된 수영장이 없습니다
			</c:if>
			<c:if test = "${fn:length(shoplist) != 0 }">
			<select id ="shop_seq">
				<option value="-1" >샵 선택</option>
				<c:forEach items="${shoplist }" var="shop" varStatus="shops">
					<c:if test ="${shop.shop_auth == 1 }">
						<option value = "${shop.shop_seq }" >${shop.shop_name }</option>
					</c:if>
				</c:forEach>
			</select>
			<%-- <select id ="design_seq">
				<option value="-1" >디자이너 선택</option>
				<c:forEach items="${shopresvlist }" var="shopresv" varStatus="shops">
						<option value = "${shopresv.design_seq }" >${shopresv.design_name }</option>
				</c:forEach>
			</select> --%>
			
			<select id ="shop_resv_auth">
				<option value ="-1">전체</option>
				<option value ="0">예약</option>
				<option value ="1">예약취소</option>
				<option value ="2">이용완료</option>
			</select>
			</c:if>
		</div>
		<div class="clearfix">
		<table class ="basic_tableStyle" width = "100%">
		<tr>
			<th>업체 번호</th>
			<th>샵이름</th>
			<th>예약 이용일</th>
			<th>시간</th>
			<th>예약자 이름</th>
			<th>견종</th>
			<th>디자이너</th>
			<th>상태</th>
		</tr>
		<c:if test = "${fn:length(shopresvlist) == 0 }">
		<tr align="center">
			<td colspan="9" >내역이 없습니다</td>
		</tr>
		</c:if>
		<c:if test="${fn:length(shopresvlist) !=0 }">
			<c:forEach items="${shopresvlist }" var="resv" varStatus="sp">
			<tr shop_resv_seq = "${resv.shop_resv_seq  }" class = "shopResv">
				<th>${resv.shop_seq }</th>
				<td>${resv.shop_name }</td>
				<td>${resv.shop_resv_rday }</td>
				<td>${resv.shop_resv_time }</td>
				<td>${resv.shop_resv_name }</td>
				
				<td>
					<c:if test="${resv.shop_resv_size == 0}">
						<span>소형견</span>
					</c:if>
					<c:if test="${resv.shop_resv_size == 1}">
						<span>중형견</span>
					</c:if>
					<c:if test="${resv.shop_resv_size == 2}">
						<span>대형견</span>
					</c:if>
				</td>
				
				<td>${resv.design_name }</td>
				<td>
				<c:if test = "${resv.shop_resv_auth == 0}">
						<span style="color : blue;">예약</span>
					</c:if>
					<c:if test = "${resv.shop_resv_auth == 1 }">
						<span style="color : red;">예약취소</span>
					</c:if>
					<c:if test = "${resv.shop_resv_auth == 2 }">
						<span>이용완료</span>
					</c:if>
					
				</td>
			
			</tr>
			</c:forEach>
		</c:if>
	</table>
	
		</div>
 <jsp:include page="/include/paging.jsp" flush="false">
      <jsp:param name="totalRecordCount" value="${totalRecordCount }" />
      <jsp:param name="pageNumber" value="${pageNumber }" />
      <jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
      <jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
</jsp:include> 
	</div><!--// contents -->

</div><!--container E : -->
<script type="text/javascript">
$(document).on("click",".shopResv", function(){
	var shop_resv_seq = $(this).attr("shop_resv_seq");
	location.href="shopSellerResvDetail.do?shop_resv_seq="+shop_resv_seq;
});

$("#shop_seq").change(function(){
	var shopSeq = $("#shop_seq option:selected").val();
	var shopResvAuth = $("#shop_resv_auth option:selected").val();
	var shopDesignerSeq = $("#design_seq option:selected").val();

	location.href = "shopSellerResvList.do?shopSeq="+shopSeq+"&shopResvAuth="+shopResvAuth;
		
});

$("#shop_resv_auth").change(function(){
	var shopSeq = $("#shop_seq option:selected").val();
	var shopResvAuth = $("#shop_resv_auth option:selected").val();
	
	location.href = "shopSellerResvList.do?shopSeq="+shopSeq+"&shopResvAuth="+shopResvAuth;
		
});

$("#shop_seq").val("<%=param.getShopSeq()%>").prop("selected", true);
$("#shop_resv_auth").val("<%=param.getShopResvAuth()%>").prop("selected", true);

function goPage( pageNumber ){
	//alert(pageNumber);
	var shopSeq = $("#shop_seq option:selected").val();
	var shopResvAuth = $("#shop_resv_auth option:selected").val();
	
	location.href = "shopSellerResvList.do?shopSeq="+shopSeq+"&shopResvAuth="+shopResvAuth+"&pageNumber="+pageNumber;
}

</script>

<%@ include file="./../../../../include/footer.jsp" %>