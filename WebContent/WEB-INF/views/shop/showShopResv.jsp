<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./../../../include/header.jsp" %>
<%@ include file="./../../../include/left_frm.jsp" %>
<div>
<c:forEach items="${showShopList }" var="showList">
<span>
${showList.shop_resv_time }
</span>
<span>
${showList.shop_resv_name }
</span>
</c:forEach>
</div>



<%@ include file="./../../../include/footer.jsp" %>