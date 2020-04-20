<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../../../include/header.jsp" %>
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
<%@ include file="./../../../include/left_frm_seller.jsp" %>
		<!-- 마이페이지 메인 -->
	<div class="cusSec_right">
		<div class="cusSec_tableWrap tw_wFull">
			<h3>
				<span class="t_sbj">디자이너 리스트</span>
			</h3>
		</div>
		
		<div class="clearfix">
		<table class ="basic_tableStyle" width = "100%">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>추가금</th>
			<th>예약시간</th>
			<th>작업</th>
		</tr>
		<c:if test = "${fn:length(designerList) == 0 }">
		<tr align="center">
			<td colspan="5" >등록된 디자이너가 없습니다</td>
		</tr>
		</c:if>
		<c:if test="${fn:length(designerList) !=0 }">
			<c:forEach items="${designerList }" var="designer" varStatus="sp">
			<tr >
				<th>${sp.index+1 }</th>
				<td>${designer.design_name }</td>
				<td>${designer.design_price }</td>
				<td>${designer.design_time }</td>
				<td >
					<input type = "button" design_seq = "${designer.design_seq }" id ="modifydesignBtn" class="btn_line_s" value ="수정">
					<input type = "button" design_seq = "${designer.design_seq }" id = "designDeleteBtn" class="btn_line_s" value ="삭제">
				</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
		</div>
	<div style = "margin-top : 10px;" align = "right">
	<button type="button" class="btn_dark_m" onclick ="location.href='shopRegi.do'">디자이너 등록</button>
	</div>
	</div><!--// contents -->

</div><!--container E : -->


<script type="text/javascript">
	$("#addDesignBtn").click(function(){
		var shop_seq = $("#addDesignBtn").attr("shop_seq");
		location.href = "shopDesignAdd.do?shop_seq="+shop_seq;
	});
	
	$("#modifyShopBtn").click(function(){
		var shop_seq = $("#modifyShopBtn").attr("shop_seq");
		location.href = "modifyShop.do?shop_seq="+shop_seq;
	});
</script>
<%@ include file="./../../../include/footer.jsp" %>