<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../../../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- container S : -->
<div class="container" >
	<div class ="container_subWrap">
	<table border =1 width = "100%">
		<tr>
			<th>번호</th>
			<th>SHOP이름</th>
			<th>SHOP주소</th>
			<th>SHOP영업시간</th>
			<th>승인여부</th>
			<th>작업</th>
		</tr>
		<c:if test = "${fn:length(shopList) == 0 }">
		<tr>
			<td colspan="6">등록된 shop이 없습니다</td>
		</tr>
		</c:if>
		<c:if test="${fn:length(shopList) !=0 }">
			<c:forEach items="${shopList }" var="shop" varStatus="sp">
			<tr >
				<th>${sp.index+1 }</th>
				<td>${shop.shop_name }</td>
				<td>${shop.shop_addr }</td>
				<td>${shop.shop_time }</td>
				<td>
					<c:if test = "${shop.shop_auth == 0 }">
						<span style="color : red;">승인대기</span>
					</c:if>
					<c:if test = "${shop.shop_auth == 1 }">
						<span style="color : blue;">승인</span>
					</c:if>
				</td>
				<td >
					<input type = "button" id ="shopUpdateBtn" class="btn_line_s" value ="수정">
					<input type = "button" id = "shopDeleteBtn" class="btn_line_s" value ="삭제">
					<c:if test = "${shop.shop_auth == 1 }">
					<input type = "button" shop_seq = "${shop.shop_seq }" id = "addDesignBtn" class="btn_line_s" value ="디자이너 추가">					
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>
</div>

<script type="text/javascript">
	$("#addDesignBtn").click(function(){
		var shop_seq = $("#addDesignBtn").attr("shop_seq");
		location.href = "shopDesignAdd.do?shop_seq="+shop_seq;
	});
</script>
<%@ include file="./../../../include/footer.jsp" %>