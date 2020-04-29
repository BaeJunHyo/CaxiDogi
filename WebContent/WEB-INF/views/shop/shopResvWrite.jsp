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
			<form  id="frmShopResv" name = "poolResv" method="post" >
		<div class="info">
		<h3>예약확인</h3>
			<ul>
				<li>
					<dl>
						<dt>상호명</dt>
						<dd class="c_green">${shopdto.shop_name}</dd>
					</dl>
						<input type = "hidden" name="shop_seq" value ="${shopdto.shop_seq }">
				</li>
				<li>
					<dl>
						<dt>주소</dt>
						<dd>${fn:split(shopdto.shop_addr, '/')[1] }</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>연락처</dt>
						<dd id="tel"></dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>디자이너</dt>
						<dd>
						${desdto.design_name}
						<input type="hidden" value="${desdto.design_price }" id="design_price">
						<input type="hidden" name="design_seq" value="${desdto.design_seq }">
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>예약일</dt>
						<dd>${shopResvdto.shop_resv_rday }</dd>
					</dl>
					<input type ="hidden" name ="shop_resv_rday" value ="${shopResvdto.shop_resv_rday }">
				</li>
				<li>
					<dl>
						<dt>예약 시간</dt>
						<dd>${shopResvdto.shop_resv_time}</dd>
					</dl>
					<input type ="hidden" name ="shop_resv_time" value ="${shopResvdto.shop_resv_time }">
				</li>
				
				<li>
					<dl>
						<dt>반려견</dt>
						<dd>
<!-- 							<select id="dogPrice" onchange="document.getElementById('totalPrice').value = this.options[this.selectedIndex].value"> -->
							<select id="dogPrice" >
							<option  value="-1">견종을 선택해주세요</option>
								<option size ='0' value="${shopdto.shop_small_price }">소형견  <fmt:formatNumber value="${shopdto.shop_small_price }" pattern="###,###,###"/>원</option>
								<option size ='1' value="${shopdto.shop_medium_price }">중형견  <fmt:formatNumber value="${shopdto.shop_medium_price }" pattern="###,###,###"/>원</option>
								<option size ='2' value="${shopdto.shop_large_price }">대형견  <fmt:formatNumber value="${shopdto.shop_large_price }" pattern="###,###,###"/>원</option>
							</select>
							<input type="hidden" name="shop_resv_size" id='size'>
						</dd>
					
					</dl>
				</li>
				<li>
					<dl>
						<dt>예상 총 금액</dt>
						<dd id="price">
						<input type="text" id="shop_resv_price" name="shop_resv_price" readonly="readonly" class="shopinput">
						<span>금액의 변동사항이 있을 수 있습니다. </span>
						</dd>
					</dl>
					
					<hr class="mt15">
				</li>
				<li>
					<dl>
						<dt>예약자명</dt>
						<dd>
							<input type ="text" id="shop_resv_name" class="shopinput" name ="shop_resv_name" value ="${shopResvdto.shop_resv_name}" placeholder="예약자명을 입력해주세요">
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>연락처</dt>
						<dd>
							<input type ="text" id="shop_resv_tel" class="shopinput" name ="shop_resv_tel" value ="${shopResvdto.shop_resv_tel}" placeholder="연락처를 입력해주세요">
							<input type ="hidden" name ="mem_seq" value = "${shopResvdto.mem_seq }">
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>요청사항</dt>
						<dd>
							<input type ="text" id="shop_resv_comment" class="shopinput" name ="shop_resv_comment" value ="${shopResvdto.shop_resv_comment}" placeholder="요청사항이 있으시면 적어주세요">
						</dd>
					</dl>
				</li>

			</ul>
			<p class="poolBtns clearfix" align="center">
				<a href="#" class="btn_dark_l" onclick="location.href='shopDetail.do?shop_seq=${shopResvdto.shop_seq }'">수정하기</a>
				<a href="#" class="btn_dark_l" id = "resvBtn">예약하기</a>
			</p>
		</div>
		</form>
</div>
</div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	var tel = "${shopdto.shop_tel }";
	tel = tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	document.querySelector("#tel").innerText = tel;

	
	$('#dogPrice').on('change', function(){
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
		
	})

	$("#resvBtn").click(function(){
		var rgEx = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
		if($('#dogPrice > option:selected').val()== -1){
			alert("견종 선택해주세요");
		}else if($("#shop_resv_name").val()==""){
			alert("예약자명을 적어주세요");
		}else if((!rgEx.test($("#shop_resv_tel").val())) || $("#shop_resv_tel").val()==""){
			alert("올바른 전화번호가 아닙니다.");
			$("#shop_resv_tel").val("");
			$("#shop_resv_tel").focus();
		}

		else{
			var formData = $("#frmShopResv").serialize();

			$.ajax({
				url:"./shopResv.do",
				type:'post',
				data: formData,
				success: function(data){
					if(data.status == "ok"){
						alert("미용 예약이 되었습니다.");
						location.href="shopResvAf.do?shop_resv_seq="+data.rnum;
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