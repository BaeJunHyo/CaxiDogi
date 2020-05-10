<%@page import="cd.com.a.model.AdminPoolParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<%@ include file="/include/bo/bo_header.jsp" %>

<%@ include file="/include/bo/bo_leftNav_product.jsp"%>
<%
	AdminPoolParam param = (AdminPoolParam)request.getAttribute("param");
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
			<li>수영장 관리</li>
		</ul>
	</div><!--// top -->

		<select id ="pool_auth" style ="margin-bottom: 10px">
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
			 <c:if test="${empty poolList }">
				<tr>
					<td colspan="9">수영장이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty poolList }">
				<c:forEach items="${poolList }" var="pool" >
					<tr class ="poolTr" pool_seq = "${pool.pool_seq }">
						<td><input type="checkbox" name="chBox" class="chBox" ></td>
						<td>${pool.pool_seq }</td>
						<td>${pool.pool_owner }</td>
						<td>${pool.pool_number }</td>
						<td>${pool.pool_name }</td>
						<td>${pool.pool_addr }</td>
						<td>${pool.pool_tel }</td>
						<td>${pool.pool_time }</td>
						<td>
							<c:if test ="${pool.pool_auth == 0}">
								<span style="color:red">승인대기</span>
							</c:if>
							<c:if test ="${pool.pool_auth == 1}">
								<span>승인</span>
							</c:if>
							<c:if test ="${pool.pool_auth == 2}">
								<span style="color:red">반려</span>
							</c:if>
							<c:if test ="${pool.pool_auth == 3}">
								<span style="color:red">정지</span>
							</c:if>
							<c:if test ="${pool.pool_auth == 4}">
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
	var pool_auth = $("#pool_auth option:selected").val();
	location.href = "adminPoolList.do?pageNumber="+pageNumber+"&pool_auth="+pool_auth;
}

$("#pool_auth").val(<%=param.getPool_auth()%>).prop("selected", true);

$("#pool_auth").change(function(){
	var pool_auth = $("#pool_auth option:selected").val();
	location.href = "adminPoolList.do?pool_auth="+pool_auth;
		
});

$(".poolTr").click(function(){
	var pool_seq = $(this).attr("pool_seq");
	location.href = "adminPoolDetail.do?pool_seq="+pool_seq;
});
</script>

</body>
</html>