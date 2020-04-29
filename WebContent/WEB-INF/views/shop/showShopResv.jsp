<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./../../../include/header.jsp" %>
<%@ include file="./../../../include/left_frm.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

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
    	<li id="tel" class="tel" value="${showList.shop_tel}">${showList.shop_tel}</li>
    	 <%-- <input type="hidden" value="${showList.shop_tel}" id="h_shop_tel"> --%>
    	 <%-- <input type="text" value="${showList.shop_tel}" id="h_shop_tel" class="h_shop_tel"> --%>
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
<form name="frmForm1" id="_frmFormSearch" method="post">

 <input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
 <input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">
</form>
 <jsp:include page="/include/paging.jsp" flush="false">
		<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
		<jsp:param name="pageNumber" value="${pageNumber }" />
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
</jsp:include> 

</div>
</div>
</div>
</div>
 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
 <script src="<%=request.getContextPath() %>/js/showShopResv.js"></script>

<script>
// 전화번호들 수정해야함 ---------------------------------------------------------------------------
//var tel = $(".tel").val();
var tel ="${showList.shop_tel}"
var userTel = $("#h_user_tel").val();
//var tel = $('li').attr('h_shop_tel');
//var tel = $("li#tel").val();


tel = tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
userTel = userTel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
document.querySelector("#tel").innerText = '가게전화: '+ tel;
document.querySelector("#userTel").innerText = '예약자 연락처: '+userTel;

</script>
<script>
/* $(".cancelShopResv").click(function(){
	var shop_seq = $(this).attr("shop_seq");
	var shop_resv_auth = $(this).attr("shop_resv_auth");
	var shop_resv_seq = $(this).attr("shop_resv_seq");
	//alert("li!+" +tel);
	alert("shop_seq: " + shop_seq);
	if(confirm('정말 취소하시겠습니까?')== true){
		//location.href="getShopList.do";
		 $.ajax({
				url:"./cancelShopResv.do",
				type:'post',
				data:{"shop_seq" : shop_seq, 
					 "shop_resv_auth" : shop_resv_auth,
					 "shop_resv_seq" : shop_resv_seq},
				success: function(data){
					//alert("success");
					if(data == 'ok'){
						alert("취소되었습니다");
						location.href="getShopList.do";
					}else if(data == 'no'){
						alert("예약 날짜로부터 이틀전은 취소가 불가능합니다");
					}
				},
				error: function(e){
					alert("err");
				}
			});


		
	}else {
		return false;
	}
	/* $.ajax({
		url:"./cancelShopResv.do",
		type:'post',
		data:{"shop_seq" : shop_seq, 
			 "shop_resv_auth" : shop_resv_auth,
			 "shop_resv_seq" : shop_resv_seq},
		success: function(data){
			alert("success");
			if(data == 'ok'){
				if(confirm('정말 취소하시겠습니까?') ==true){
					alert('취소되었습니다');
					location.href="getShopList.do";
				}else{
					return false;
				}
			}else{
				alert("예약 날짜로부터 이틀전은 취소가 불가능합니다");
			}
		},
		error: function(e){
			alert("err");
		}
	}); 
	
	
}) */



$(".cancelShopResv").click(function(){
	var shop_seq = $(this).attr("shop_seq");
	var shop_resv_auth = $(this).attr("shop_resv_auth");
	var shop_resv_seq = $(this).attr("shop_resv_seq");
	Swal.fire({
		  title: 'Are you sure?',
		  text: "You won't be able to revert this!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		  if (result.value) {
			  $.ajax({
					url:"./cancelShopResv.do",
					type:'post',
					data:{"shop_seq" : shop_seq, 
						 "shop_resv_auth" : shop_resv_auth,
						 "shop_resv_seq" : shop_resv_seq},
					success: function(data){
						//alert("success");
						if(data == 'ok'){
							Swal.fire(
								      'Deleted!',
								      'Your file has been deleted.',
								      'success'
								   ).then(function(){
							        	  window.location="getShopList.do"});
						}else if(data == 'no'){
							
							alert("예약 날짜로부터 이틀전은 취소가 불가능합니다");
						}
					},
					error: function(e){
						alert("err");
					}
				});
		    
		  }


		  
		})
})

</script>
<script>
function goPage( pageNumber ){
	alert(pageNumber);
	
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").attr("action", "showShopResv.do").submit();	
}
</script>



<%@ include file="./../../../include/footer.jsp" %>