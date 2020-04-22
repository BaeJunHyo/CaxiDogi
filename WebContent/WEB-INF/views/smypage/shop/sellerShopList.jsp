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
				<span class="t_sbj">Shop 리스트</span>
			</h3>
		</div>
		
		<div class="clearfix">
		<table class ="basic_tableStyle" width = "100%">
		<tr>
			<th>번호</th>
			<th>SHOP이름</th>
			<th>SHOP주소</th>
			<th>SHOP영업시간</th>
			<th>상태</th>
			<th>작업</th>
		</tr>
		<c:if test = "${fn:length(shopList) == 0 }">
		<tr align="center">
			<td colspan="6" >등록된 shop이 없습니다</td>
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
					<c:if test = "${shop.shop_auth == 0 || shop.shop_auth == 4}">
						<span style="color : red;">승인대기</span>
					</c:if>
					<c:if test = "${shop.shop_auth == 1 }">
						<span style="color : blue;">승인</span>
					</c:if>
					<c:if test = "${shop.shop_auth == 3 }">
						<span style="color : red;">정지</span>
					</c:if>
					<c:if test = "${shop.shop_auth == 2 }">
						<span style="color : red;">재신청</span>
					</c:if>
				</td>
				<td >
					<c:if test = "${shop.shop_auth == 0 || shop.shop_auth == 4}">
						<input type = "button" shop_seq = "${shop.shop_seq }" class="btn_line_s modifyShopBtn" value ="수정">
					</c:if>
					<c:if test = "${shop.shop_auth == 1 }">
					<input type = "button" shop_seq = "${shop.shop_seq }" class="btn_line_s modifyShopBtn" value ="수정">
					<input type = "button" shop_seq = "${shop.shop_seq }" class="btn_line_s shopDeleteBtn" value ="정지">
					<p style ="margin-top:10px;">				
					<input type = "button" shop_seq = "${shop.shop_seq }" class="btn_line_s modifyDesignBtn" value ="디자이너 관리">					
					</p>
					</c:if>

					<c:if test = "${shop.shop_auth == 2}">
						<input type = "button" shop_seq = "${shop.shop_seq }" class="btn_line_s reModifyShopBtn" value ="수정">
					</c:if>
					
				</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
		</div>
	<div style = "margin-top : 10px;" align = "right">
	<button type="button" class="btn_dark_m" onclick ="location.href='shopRegi.do'">shop 등록</button>
	</div>
	</div><!--// contents -->

</div><!--container E : -->


<script type="text/javascript">
	$(".shopDeleteBtn").click(function(){
		var shop_seq = $(this).attr("shop_seq");
		$.ajax({
	          url:"./shopStop.do",
	          type:'post',
	          data: {"shop_seq" : shop_seq},
	          success: function (data){
	             //alert("성공");
				 if(data == "ok"){
					 alert("해당 shop의 상태를 정지로 변경하였습니다.")
					 location.href="sellerShopList.do";
				 } else {
					 alert("해당 shop의 상태를 변경하지 못하였습니다.");
				}
	          },
	          error: function (e){
	             alert("통신실패");
	     	}
		});
	});

	
	$(".modifyShopBtn").click(function(){
		var shop_seq = $(this).attr("shop_seq");
		location.href = "modifyShop.do?shop_seq="+shop_seq;
	});
	
	$(".reModifyShopBtn").click(function(){
		var shop_seq = $(this).attr("shop_seq");
		location.href = "reModifyShop.do?shop_seq="+shop_seq;
	});
	
	$(".modifyDesignBtn").click(function(){
		var shop_seq = $(this).attr("shop_seq");
		location.href = "shopDesignList.do?shop_seq="+shop_seq;
	});
	
</script>
<%@ include file="./../../../../include/footer.jsp" %>