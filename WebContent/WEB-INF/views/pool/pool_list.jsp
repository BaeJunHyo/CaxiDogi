<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../../../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="./css/layout.css" rel="stylesheet">
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
<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>Active</li>
		<li>수영장</li>
	</ul>
</div>
<div class="container container_subWrap" id="fixNextTag">
	<div class="prdlist_default">
	
	<select id="pool_sel">
		<option value="-1" >지역 검색</option>
		<option value="1">서울</option>
		<option value="2">경기</option>
		<option value="3">기타</option>
	</select>
		<!-- 상품추출 -->
		<div class="mproduct_area">
			<ul>
		<c:forEach items="${poollist }" var="pool" varStatus="sp">
		<c:if test="${pool.pool_auth == 1 }">
				<li><a
					href="poolDetail.do?pool_seq=${pool.pool_seq }"
					class="box">
						<div class="img">
						<c:if test="${pool.pool_photo == 'default' }">
							<img class="MS_prod_img_m"
								src="./images/poolImg/default.png" alt="">
						</c:if>
						<c:if test="${pool.pool_photo != 'default' }">
							<img class="MS_prod_img_m"
								src="<%=request.getContextPath() %>/images/poolImg/${pool.pool_photo }" alt="">
						</c:if>
						</div>
						<dl>
							<dt>${pool.pool_name }</dt>
							<dd class="txt">${fn:split(pool.pool_addr, '/')[1] }</dd>
							<dd class="price_box">
								<p>
									<span class="price">시간당 : ${pool.pool_price }</span>
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


	</div>
	 <jsp:include page="/include/paging.jsp" flush="false">
		<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
		<jsp:param name="pageNumber" value="${pageNumber }" />
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
	</jsp:include> 

</div>
<!-- container E : -->
<script>
$("#pool_sel").change(function(){
	var poolAddr = $("#pool_sel option:selected").val();

	location.href="getPoolList.do?poolAddr="+poolAddr;
});


$("#pool_sel").val(${param.poolAddr}).prop("selected", true);

function goPage(pageNumber){
	var poolAddr = $("#pool_sel option:selected").val();
	location.href="getPoolList.do?poolAddr="+poolAddr+"&pageNumber="+pageNumber;
}
</script>
<%@ include file="./../../../include/footer.jsp"%>