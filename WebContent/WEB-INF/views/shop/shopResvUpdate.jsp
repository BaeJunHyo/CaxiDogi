<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="./../../../include/header.jsp"%>
<link href="<%=request.getContextPath()%>/css/pool.css" rel="stylesheet">
<style>
.shopinput{
	width: 216px !important;
    height: 33px;
    padding: 0 10px;
    line-height: 33px;
    box-sizing: border-box;
    border: 1px solid #232a32;
}
.shopcomment{
	width: 500px !important;
}
</style>
<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>Active</li>
		<li>미용</li>
		<li>예약</li>
	</ul>
</div>
<div class="container_subWrap sub_detail">
	<div class="pool_infoWrap">
	<div class="poolInfo_section clearfix">
			<form  id="frmShopResv" name ="poolResv" method="post" >
		<div class="info">
		<h3>예약수정</h3>
			<ul>
				
			
				<li>
					<dl>
						<dt>예약자명</dt>
						<dd>
							<input type ="text" id="shop_resv_name" class="shopinput" name ="shop_resv_name" placeholder="예약자명을 입력해주세요">
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>연락처</dt>
						<dd>
							<input type ="text" id="shop_resv_tel" class="shopinput" name ="shop_resv_tel" placeholder="연락처를 입력해주세요">
							<input type ="hidden" name ="shop_resv_seq" value = "${shop_resv_seq }">
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>요청사항</dt>
						<dd>
							<input type ="text" id="shop_resv_comment" class="shopcomment" name ="shop_resv_comment"  placeholder="요청사항이 있으시면 적어주세요">
						</dd>
					</dl>
				</li>

			</ul>
			<p class="poolBtns clearfix" align="center">
				<a href="#" class="btn_dark_l" onclick="location.href='showShopResv.do'">예약 리스트로 돌아가기</a>
				<a href="#" class="btn_dark_l" id ="updateBtn">수정하기</a>
			</p>
		</div>
		</form>
</div>
</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	

	
	/* $('#dogPrice').on('change', function(){
		//alert("change");
		var getPrice = dogPrice.options[dogPrice.selectedIndex].value;
		//alert("getPrice =" + getPrice);
		var numGetPrice = Number(getPrice);
		var desPrice = $("#design_price").val();
		var numDesPrice = Number(desPrice);


		//alert("get" + getPrice);
		var pulsPrice = numGetPrice + numDesPrice;

		//$("#price").append("<input type='text' readonly='readonly' value='"+pulsPrice+"'>")

		$("#shop_resv_price").val(pulsPrice);

		if($('#dogPrice > option:selected').val()== ${shopdto.shop_small_price }){
			$("#size").val(0);
			//alert("size: " + $("#size").val())
			
		}else if($('#dogPrice > option:selected').val() ==${shopdto.shop_medium_price }){
			$("#size").val(1);
			//alert("size1111111111: " + $("#size").val())
			
		}else if($('#dogPrice > option:selected').val() ==${shopdto.shop_large_price }){
			$("#size").val(2);
			//alert("size2: " + $("#size").val())
		}
		
	}) */

	$("#updateBtn").click(function(){
		
		var rgEx = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
		if($("#shop_resv_name").val()==""){
			alert("예약자명을 적어주세요");
		}else if((!rgEx.test($("#shop_resv_tel").val())) || $("#shop_resv_tel").val()==""){
			alert("올바른 전화번호가 아닙니다.");
			$("#shop_resv_tel").val("");
			$("#shop_resv_tel").focus();
		}

		else{
			var formData = $("#frmShopResv").serialize();

			$.ajax({
				url:"./shopResvUpdateAf.do",
				type:'post',
				data: formData,
				success: function(data){
					if(data == "ok"){
						Swal.fire({
		                       icon: 'success',
		                       title: '수정되었습니다.',
		                       showConfirmButton: true
		                     }).then(function(){
		                   window.location="showShopResv.do";});
					}
				},
				error: function(e){
					alert('err');
				}

			});
		}
	})
})



 	
  </script>

<%@ include file="./../../../include/footer.jsp"%>