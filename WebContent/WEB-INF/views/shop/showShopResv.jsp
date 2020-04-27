<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./../../../include/header.jsp" %>
<%@ include file="./../../../include/left_frm.jsp" %>
<link href="./css/showShopResv.css" rel="stylesheet">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css'>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">

<div class="cusSec_right">

<div class="cusSec_tableWrap">
<ul class="mind_menu">
<li data-cat="item1">미용 예약 내역</li>
</ul>
<div class="mind_wrap">
  
 <c:forEach items="${showShopList }" var="showList">
 <input type="hidden" value="${showList.shop_resv_tel}" id="h_user_tel">
 <input type="hidden" value="${showList.shop_tel}" id="h_shop_tel">
  <ul class="mind_booking_listings">
    <li>
      <div class="booking_list1">
      <c:if test="${showList.shop_photo == 'default' }">
							<img 
								src="./images/shopImg/default.png" alt="">
						</c:if>
						<c:if test="${showList.shop_photo != 'default' }">
							<img 
								src="<%=request.getContextPath() %>/images/shopImg/${showList.shop_photo }" alt="">
						</c:if>
  </div><!-- List 1 -->
  <div class="booking_list2">
    <div class="child1">
      <h2>${showList.shop_name }<i class="fa fa-angle-down" aria-hidden="true"></i>
 </h2>
      <h5> </h5>
    </div>
    <div class="child2" style="display:none;">
     <ul class="child_ul_1">
    	<li>예약자 명: ${showList.shop_resv_name}</li>
    	<li id="userTel" h_user_tel="${showList.shop_resv_tel}">예약자 연락처: ${showList.shop_resv_tel}</li>
    	<li>예약시간 : ${showList.shop_resv_time }</li>
    	<li>예약날짜 : ${showList.shop_resv_rday }</li>
    	<li>예상 비용 : <fmt:formatNumber value="${showList.shop_resv_price }" pattern="###,###,###"/> 원</li>
    	<li>미용 받을 견종:
    	<c:choose>
							<c:when test="${showList.shop_resv_size == 0 }">
								소형견
							</c:when>
							
							<c:when test="${showList.shop_resv_size == 1 }">
								중형견
							</c:when>
							
							<c:when test="${showList.shop_resv_size == 2 }">
								대형견
							</c:when>
						
						</c:choose>
    	</li>
    </ul>
    <ul class="child_ul_2">
    	<li>가게 주소: ${showList.shop_addr}</li>
    	<li id="tel" h_shop_tel="${showList.shop_tel}">가게 전화: ${showList.shop_tel}</li>
    	<li>영업 시간: ${showList.shop_time}</li>
    </ul>
   <%--  <p> 예약자 명: ${showList.shop_resv_name}  예약시간 : ${showList.shop_resv_time }
    </p> --%>
      <%-- <span>예약자 명: ${showList.shop_resv_name}</span>
      <span>예약시간 : ${showList.shop_resv_time }</span> --%>
      <span></span>
    </div>   
  </div> <!-- List 2 -->
   <div class="booking_list3">    
     <a href="#"><button>Book Now</button></a>
   </div>
   <div class="booking_list3">
   <a href="#"><input type="button" pool_seq="9" class="btn_line_s modifyPoolBtn" value="예약변경"></a>
     <a href="#"><input type="button" shop_seq="${showList.shop_seq }" shop_resv_auth="${showList.shop_resv_auth}" shop_resv_seq="${showList.shop_resv_seq }"  class="btn_line_s cancelShopResv" value="취소"></a>
   </div>
    </li>
  </ul>
</c:forEach>
  
</div>
</div>
</div>
 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
 <script src="<%=request.getContextPath() %>/js/showShopResv.js"></script>

<script>
var tel = $("#h_shop_tel").val();
var userTel = $("#h_user_tel").val();
//var tel = $('li').attr('h_shop_tel');

tel = tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
userTel = userTel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
document.querySelector("#tel").innerText = '가게전화: '+ tel;
document.querySelector("#userTel").innerText = '예약자 연락처: '+userTel;

</script>
<script>
$(".cancelShopResv").click(function(){
	var shop_seq = $(this).attr("shop_seq");
	var shop_resv_auth = $(this).attr("shop_resv_auth");
	var shop_resv_seq = $(this).attr("shop_resv_seq");

	alert("shop_seq: " + shop_seq);
	
	
})

</script>



<%@ include file="./../../../include/footer.jsp" %>