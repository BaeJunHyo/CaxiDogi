<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../../../../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
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
				<span class="t_sbj">수영장 예약 리스트</span>
			</h3>
		</div>
		
		<div class="clearfix">
		<table class ="basic_tableStyle" width = "100%">
		<tr>
			<th>업체 번호</th>
			<th>수영장이름</th>
			<th>예약일</th>
			<th>시간</th>
			<th>이름</th>
			<th>인원</th>
			<th>마리</th>
			<th>상태</th>
			<th>결제여부</th>
		</tr>
		<c:if test = "${fn:length(poolSellerResvList) == 0 }">
		<tr align="center">
			<td colspan="9" >예약내역이 없습니다</td>
		</tr>
		</c:if>
		<c:if test="${fn:length(poolSellerResvList) !=0 }">
			<c:forEach items="${poolSellerResvList }" var="resv" varStatus="sp">
			<tr pool_resv_seq = "${resv.pool_resv_seq  }" class = "poolResv">
				<th>${resv.pool_seq }</th>
				<td>${resv.pool_name }</td>
				<td>${resv.pool_resv_sdate }</td>
				<td>${resv.pool_resv_time }</td>
				<td>${resv.pool_resv_name }</td>
				<td>${resv.pool_resv_user }</td>
				<td>${resv.pool_resv_pet }</td>
				<td>
				
				<c:if test = "${resv.pool_resv_auth == 0}">
						<span style="color : red;">예약신청</span>
					</c:if>
					<c:if test = "${resv.pool_resv_auth == 1 }">
						<span style="color : blue;">결제대기</span>
					</c:if>
					<c:if test = "${resv.pool_resv_auth == 2 }">
						<span>예약완료</span>
					</c:if>
					<c:if test = "${resv.pool_resv_auth == 3 }">
						<span style="color : red;">취소</span>
					</c:if>
				</td>
				<td>
					<c:if test = "${resv.pool_resv_payment == 0}">
						<span style="color : red;">X</span>
					</c:if>
					<c:if test = "${resv.pool_resv_payment == 1 }">
						<span >O</span>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
	
		</div>

	</div><!--// contents -->

</div><!--container E : -->
<script type="text/javascript">
$(document).on("click",".poolResv", function(){

	alert($(this).attr("pool_resv_seq"));
	
});
</script>

<%@ include file="./../../../../include/footer.jsp" %>