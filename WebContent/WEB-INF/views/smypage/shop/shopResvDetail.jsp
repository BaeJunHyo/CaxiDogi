<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../../../../include/header.jsp" %>
<link href="<%=request.getContextPath()%>/css/pool.css" rel="stylesheet">
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
				<span class="t_sbj">샵 예약 상세</span>
			</h3>
		</div>
			<div class="poolInfo_section">
				<div class="info">
			<ul>
				<li>
					<dl>
						<dt>상호명</dt>
						<dd class="c_green">${shopresv.shop_name}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>예약일</dt>
						<dd>${shopresv.shop_resv_day }</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>사용일</dt>
						<dd>${shopresv.shop_resv_rday }</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>예약 시간</dt>
						<dd>${shopresv.shop_resv_time}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>디자이너</dt>
						<dd>
						${shopresv.design_name}
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>견종</dt>
						<dd>
						<c:choose>
							<c:when test="${shopresv.shop_resv_size == 0 }">
								소형견
							</c:when>
							
							<c:when test="${shopresv.shop_resv_size == 1 }">
								중형견
							</c:when>
							
							<c:when test="${shopresv.shop_resv_size == 2 }">
								대형견
							</c:when>
						
						</c:choose>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>이름</dt>
						<dd>${shopresv.shop_resv_name }</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>연락처</dt>
						<dd>${shopresv.shop_resv_tel }</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>코멘트</dt>
						<dd>
						${shopresv.shop_resv_comment }
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>예약상태</dt>
						<dd>
							<c:if test = "${shopresv.shop_resv_auth == 0}">
						<span style="color : blue;">예약</span>
					</c:if>
					<c:if test = "${shopresv.shop_resv_auth == 1 }">
						<span style="color : red;">예약취소</span>
					</c:if>
					<c:if test = "${shopresv.shop_resv_auth == 2 }">
						<span>이용완료</span>
					</c:if>
					
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>총 금액</dt>
						<dd>
							<c:if test = "${shopresv.shop_resv_price==0}">
								<input type="number" id = "pool_total_price" > 
							</c:if>
							<c:if test = "${shopresv.shop_resv_price!=0}">
								${shopresv.shop_resv_price }
							</c:if>
							
							</dd>
					</dl>
				</li>
			</ul>
			<p class="poolBtns clearfix" align="center">
				
				<a href="#" class="btn_dark_l" onclick="location.href='shopSellerResvList.do'">예약리스트</a>
			</p>
		</div>
		
	</div><!--// contents -->

</div><!--container E : -->
</div>
<script type="text/javascript">
$("#priceBtn").click(function(){
	if($("#pool_total_price").val()==''){
		Swal.fire({
			  icon: 'warning',
			  title: '최종 결제 금액을 입력해 주세요',
			  showConfirmButton: true
		});
		$("#pool_total_price").focus();
	} else {
	      $.ajax({
	          url:"./setTotalPrice.do",
	          type:'post',
	          data: {
					"pool_resv_total_price":$("#pool_total_price").val(),
					"pool_resv_seq" : "${poolResv.pool_resv_seq}"
		          },
	          success: function (data){
	             Swal.fire({
	            	  icon: 'success',
	            	  title: '최종 결제 금액 입력하셨습니다.',
	            	  showConfirmButton: true
	            	}).then(function(){
	        	  window.location="poolList.do";});
	          },
	          error: function (e){
	             alert("통신실패");
	     	}
		});
	}
});

$("#paymentBtn").click(function(){
    $.ajax({
        url:"./setPayment.do",
        type:'post',
        data: {
				"pool_resv_seq" : "${poolResv.pool_resv_seq}"
	          },
        success: function (data){
           Swal.fire({
          	  icon: 'success',
          	  title: '해당 예약을 확정하셨습니다.',
          	  showConfirmButton: true
          	}).then(function(){
      	  window.location="poolList.do";});
        },
        error: function (e){
           alert("통신실패");
   	}
	});	
});
</script>

<%@ include file="./../../../../include/footer.jsp" %>