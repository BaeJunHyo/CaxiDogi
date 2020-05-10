<%@page import="cd.com.a.model.adminShopParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<%@ include file="/include/bo/bo_header.jsp" %>



<%-- <%
String category = (String)request.getAttribute("s_category");
if(category == null) category = "";
	
String keyword = (String)request.getAttribute("s_keyword");
if(keyword == null) keyword = "";
%>

<script>
var category = "<%=category %>";
var keyword = "<%=keyword %>";
$(document).ready(function () {
	$("#_s_category").val( category );
	
	document.prdSrchFrm.s_keyword.value = keyword;
});
</script> --%>

<%@ include file="./../../../../include/bo/bo_leftNav_product.jsp"%>
<%
	adminShopParam param = (adminShopParam)request.getAttribute("param");
%>


<div class="containerWrap">

	<ul class="gnb">
		<li><a href="productList.do">상품관리</a></li>
		<li><a href="sellerAccessMgmt.do" class="current">액티브 관리</a></li>
	</ul><!--// gnb -->
	
	<div class="container">
	<div class="top clearfix">
		<ul class="menu_dept clearfix">
			<li>액티브 관리</li>
			<li>Shop 관리</li>
		</ul>
	</div><!--// top -->

		<select id ="shop_auth" style ="margin-bottom: 10px">
			<option value ="100">전체</option>
			<option value ="0">승인대기</option>
			<option value ="1">승인</option>
			<option value ="2">반려</option>
			<option value ="3">정지(삭제)</option>
			<option value ="4">재요청</option>
		</select>
	<div class="cn_wrap">
	<table class="prdlist">
		<colgroup>
			<col width="55px">
			<col width="55px">
			<col width="107px">
			<col width="150px">
			<col width="150px">
			<col width="25%">
			<col width="107px">
			<col width="107px">
			<col width="107px">
		</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" name="chBox" class="chBox" ></th>
				<th>번호</th>
				<th>대표자명</th>
				<th>사업자등록번호</th>
				<th>사업장명</th>
				<th>주소</th>
				<th>연락처</th>
				<th>영업시간</th>
				<th>작업</th>
			</tr>
		</thead>
		
		<tbody>
			 <c:if test="${empty shopList }">
				<tr>
					<td colspan="9">Shop이 되지 않았습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty shopList }">
				<c:forEach items="${shopList }" var="shop" >
					<tr class ="shopTr" shop_seq = "${shop.shop_seq }">
						<td><input type="checkbox" name="chBox" class="chBox" ></td>
						<td>${shop.shop_seq }</td>
						<td>${shop.shop_owner }</td>
						<td>${shop.shop_number }</td>
						<td>${shop.shop_name }</td>
						<td>${shop.shop_addr }</td>
						<td>${shop.shop_tel }</td>
						<td>${shop.shop_time }</td>
						<td>
							<c:if test ="${shop.shop_auth == 0}">
								<span style="color:red">승인대기</span>
							</c:if>
							<c:if test ="${shop.shop_auth == 1}">
								<span>승인</span>
							</c:if>
							<c:if test ="${shop.shop_auth == 2}">
								<span style="color:red">반려</span>
							</c:if>
							<c:if test ="${shop.shop_auth == 3}">
								<span style="color:red">정지</span>
							</c:if>
							<c:if test ="${shop.shop_auth == 4}">
								<span style="color:red">재요청</span>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>
 	<jsp:include page="/include/paging.jsp" flush="false">
		<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
		<jsp:param name="pageNumber" value="${pageNumber }" />
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
	</jsp:include>
			</div>
	
	
</div><!--// containerWrap -->

<script>
function goPage( pageNumber ){
	var shop_auth = $("#shop_auth option:selected").val();
	location.href = "adminShopList.do?pageNumber="+pageNumber+"&shop_auth="+shop_auth;
}

$("#shop_auth").val(<%=param.getShop_auth()%>).prop("selected", true);

$("#shop_auth").change(function(){
	var shop_auth = $("#shop_auth option:selected").val();
	location.href = "adminShopList.do?shop_auth="+shop_auth;
		
});

$(".shopTr").click(function(){
	var shop_seq = $(this).attr("shop_seq");
	location.href = "adminShopDetail.do?shop_seq="+shop_seq;
});
</script>

</body>
</html>