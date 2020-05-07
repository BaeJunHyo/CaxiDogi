<%@page import="cd.com.a.model.shopDesignerDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="./../../../include/header.jsp"%>
<link href="./css/shop_detail.css" rel="stylesheet">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link href="./css/calstyle2.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
<style>
.cant{
	opacity: 0.65; 
   cursor: not-allowed; 

} 

</style>  
<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>ACTIVE</li>
		<li>미용</li>
	</ul>
</div>



<!-- container S : -->
<div class="container_subWrap sub_detail">
	<div class="prd_infoWrap">
		<div class="prdName_section clearfix">
			<div class="prd_name">
				<p class="prd_flag clearfix">
					<!-- <img src="" alt="BEST 상품">
					<img src="" alt="SALE 상품"> -->
				</p>
				${shopDetail.shop_name}
			</div>

		</div>
		<!--// prdName_section -->
		<div class="prdInfo_section clearfix">
			<div class="col1">
				<div class="thumb">
					<!-- <div class="prdImg easyzoom easyzoom--adjacent easyzoom--with-thumbnails">
						<a href="images/img_prdBigThumb_zoom_1.jpg">
							<img src="images/img_prdBigThumb_1.jpg">
						</a>
					</div> -->
					<div class="easyzoom easyzoom--adjacent easyzoom--with-thumbnails" align="center">
					<c:if test="${shopDetail.shop_photo == 'default' }">
							<img class="MS_prod_img_m"
								src="./images/shopImg/default.png" alt="">
						</c:if>
						<c:if test="${shopDetail.shop_photo != 'default' }">
							<img class="MS_prod_img_m"
								src="<%=request.getContextPath() %>/images/shopImg/${shopDetail.shop_photo }" alt="">
						</c:if>
					</div>

					<!-- <ul class="prdThumb thumbnails">
						<li class="current">
							<a href="./images/img_prdBigThumb_zoom_1.jpg" data-standard="./images/img_prdBigThumb_1.jpg">
								<img src="./images/img_prdBigThumb_1.jpg">
							</a>
						</li>
						<li>
							<a href="./images/img_prdBigThumb_zoom_2.jpg" data-standard="./images/img_prdBigThumb_2.jpg">
								<img src="./images/img_prdBigThumb_2.jpg">
							</a>
						</li>
						<li>
							<a href="./images/img_prdBigThumb_zoom_3.jpg" data-standard="./images/img_prdBigThumb_3.jpg">
								<img src="./images/img_prdBigThumb_3.jpg">
							</a>
						</li>
					</ul> -->
				</div>
			</div>
			<!--// col1 -->

		  <form action="shopResvWrite.do" id="frm" method="post">
			<div class="col2">
				<div class="info">
				<input type="hidden" name="shop_seq" id="shop_seq" value="${shopDetail.shop_seq }">
				<input type="hidden" name="shop_name" id="shop_name" value="${shopDetail.shop_name }">
				
					<ul>

						<li class="shop_li">
							<dl class="shop_dl">
								<dt class="shop_dt">소개글</dt>
								<dd class="c_green shop_dd">
									${shopDetail.shop_etc}
								</dd>
							</dl>
						</li>
						<li class="shop_li">
							<dl class="shop_dl">
								<dt class="shop_dt">기본미용 가격</dt>
								<dd class="price-red shop_dd">
									<span>소형 : <fmt:formatNumber value="${shopDetail.shop_small_price}" pattern="###,###,###"/>원</span>
									<span>중형 : <fmt:formatNumber value="${shopDetail.shop_medium_price}" pattern="###,###,###"/></span>원
									<span>대형 : <fmt:formatNumber value="${shopDetail.shop_large_price}" pattern="###,###,###"/></span>원
								</dd>
							</dl>
						</li>
						
						<li class="shop_li">
							<dl class="shop_dl">
								<dt class="shop_dt">영업시간</dt>
								<dd class="shop_dd">
									${shopDetail.shop_time}
								</dd>
							</dl>
						</li>
						
						<li class="shop_li">
							
							<dl class="shop_dl">
								<dt class="shop_dt">전화번호</dt>
								<dd class="shop_dd" id="tel">
									
								</dd>
							</dl>
						</li>
						
						<li class="shop_li">
							<dl class="shop_dl">
								<dt class="shop_dt">주소</dt>
								<dd class="shop_dd">
									${fn:split(shopDetail.shop_addr, '/')[1]}
							
								</dd>
							</dl>
							<hr class="mt15">
						</li>

						<li>
						
						<div  id="datepicker" align="center"></div>
						<input type="hidden" id="shop_resv_rday" name="shop_resv_rday">
						</li>
						<li class="desginerName">
						<div id="desginerName">
						
						<input type="hidden" name="">
							<dl class="desname">
								<%-- <dt id="desName">${desList.design_name}</dt> --%>
								<dt>
								<select id="sel" name="selDesigner">
								<option class="selDes" value="-1" selected="selected">디자이너 선택</option>
								<c:forEach items="${designerList }" var="desList" varStatus="des">
									<option class="selDes" design_time="${desList.design_time }"  design_seq="${desList.design_seq}" value="${desList.design_seq }">${desList.design_name} +${desList.design_price }원</option>
									
								</c:forEach>
								</select>
								 <input type="hidden" name="design_seq" value="${desList.design_seq}" id="dsseq">
								<input type="hidden" name="shop_resv_time" id="shop_resv_time">
								<input type="hidden" name="mem_seq" value="${loginUser.mem_seq }" id="mem_seq">
								<%-- <span id="getTime" design_time="${desList.design_time }"  design_seq="${desList.design_seq}" class="getTime">${desList.design_name}</span> --%></dt>
								<dd></dd>
							</dl>
						</div>
						</li>
						<li class="desginerName destime">
							<div id="desginerTime">
							<%-- <c:forEach items="${designerList }" var="desList" varStatus="des"> --%>
						
								<ul id="dtime" style="display: none">
								
								</ul>
							<%-- </c:forEach> --%>
							</div>
						</li>
							<li style="clear: both;">
							
								<hr class="mt15">
							</li>
					</ul>
				</div>
					<p class="prdBtns clearfix">
						<a href="#" class="btn_dark_l p0" id="resvwriteBtn">예약하기</a>
						<!-- <span class="sign_soldout">일시품절인 상품입니다.</span> -->
						<a href="#n" class="btn_line_l p0 btn_wishlist" alt="위시리스트"></a>
					</p>
				
				</div>
				</form>
			</div>
			<!--// col2 -->
		</div>
		<!--// prdInfo_section -->
	</div>
	<div class="prd_detail_infoWrap">
		<ul class="detailTab">
			<li><a href=".move01" class="current">상품설명<img
					src="./images/ico_arrow_prdDetail.gif"></a></li>
			<li><a href=".move02">상품정보<img
					src="./images/ico_arrow_prdDetail.gif"></a></li>
			<li><a href=".move03">상품평(0)<img
					src="./images/ico_arrow_prdDetail.gif"></a></li>
			<li><a href=".move04">상품Q&amp;A<img
					src="./images/ico_arrow_prdDetail.gif"></a></li>
			<li><a href=".move05">배송/교환/반품<img
					src="./images/ico_arrow_prdDetail.gif"></a></li>
		</ul>
	<%-- 	<div class="detailView move01">
			<span>
				${shopDetail.shop_content }
			</span>
		</div> --%>

	<!--// prdInfo_section -->
		<div class="detailView move05">
			<table class="basic_tableStyle">
				<colgroup>
					<col width="190px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<td>${shopDetail.shop_content }</td>
					</tr>
					<tr>
						<td>
							<div id="map" style="width:100%;height:350px;"></div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 상품 옵션 선택 하단 레이어 E : -->
	</div>
	<!--// prd_detail_infoWrap -->

</div>
<!-- container E : -->
 <script>
	var tel = "${shopDetail.shop_tel}";
	tel = tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	document.querySelector("#tel").innerText = tel;
 
 $(document).ready(function(){
	$("#desginerName").hide();
	

});
 	var index = $('input[name="shop_seq"]').val();
	var shop_seq = Number(index);
  $( function() {
	
    $( "#datepicker" ).datepicker({
    	minDate : "+2D",
		maxDate : "+21D",
    	dateFormat: 'yy-mm-dd',
		onSelect: function(date){
				//alert(date);
		$("#shop_resv_rday").val(date);
		//alert("누른값"+$("#shop_resv_rday").val());
		
		$("#desginerName").show();
		$("#sel option:eq(0)").prop("selected", true);

		$("#dtime *").remove();
	}
		
   });
 });
  
$(document).ready(function(){

	
$("#sel").on('change', function(){
	//alert("seq" + $("#sel").val());
	var design_time = $('option:selected', this).attr('design_time');
	//alert("design_time:" + design_time);
	var design_seq = $('option:selected', this).attr('design_seq');
	//alert("design_seq:" + design_seq);
	var sTime = design_time.split("/");
	//alert("stime"+sTime);
	
	if($('#sel > option:selected').val()== -1){
		 $("#dtime").hide();
	}
	
	$("#dtime *").remove();

	 

	
	for(var i=0; i<sTime.length; i++){
			$("#dtime").append("<li class='timeBtn'><button type='button' class='btn' id='sbtn' value='"+sTime[i]+"' sTime='"+sTime[i]+"'>"+sTime[i]+"</button></li>");
	}

	var shop_seq = $("#shop_seq").val();
	//alert("shop_seq: " + shop_seq);
	var shop_resv_rday = $("#shop_resv_rday").val();
	//alert("shop_resv_rday: " + shop_resv_rday);
	var allData = {"design_seq":design_seq, "shop_seq":shop_seq, "shop_resv_rday":shop_resv_rday};

	$("#dtime").show();
	$.ajax({
		url: 'getResvTime.do',
		type:'post',
		data: allData,
		success: function(data){
			//alert("data: " +data);
			str = JSON.stringify(data);
			str = JSON.parse(str);
			//alert("str: " + str);
			
			var obj_length = Object.keys(str).length;
			//alert("length:" + obj_length);
			
			//sTime == str[key]
			
			var v = new Array();
			

			
			for( key in str){
				//var v = str[key];
				//alert("제발"+v);
				v[key]= str[key];
				//alert("val[]: " + v[key]);
			}

			
			//alert("포문밖 브이: " + v);


			 for(var j=0; j<v.length; j++){
				//$('button:contains("'+v[j]+'")').css('disabled');
				$('button:contains("'+v[j]+'")').addClass('cant');
				$('button:contains("'+v[j]+'")').attr("disabled","disabled");
			 }

			 
			
			 
			 $(document).on('click','.btn',function(){
					var pcode = $(this).val(); //이거는 해당 element의 id value값을 가져오는것.
					//var test = txt;
					$(this).attr("name", "shop_resv_time");
					$("#shop_resv_time").val(pcode);
					//alert("pcode:" + pcode);
				});

			
			/* for(var j=0; j<sTime.length; j++){
				if(sTime.indexOf(v)){
					$( 'li:has( v )' ).css( 'border', '1px solid red' );
				}
			} */
			
			
		},
		error: function(){
			alert('err');
		}

	});
	
})



});

$("#resvwriteBtn").click(function(){
	if($('#sel > option:selected').val()== -1){
		alert("디자이너 선택을 안하셨습니다.");
		
	}else if($('#shop_resv_time').val() == ""){
		alert("시간 선택을 안하셨습니다.");
	}else if($("#mem_seq").val() == ""){
		alert("로그인 후 이용 가능합니다.");
	}
	else{
		$("#dsseq").val($("#sel option:selected").val());
		//alert("click"+$("#dsseq").val());
		$("#frm").submit();

	}
	
	
});
  
</script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b6d03d1753756cedf57a2334d3164d8&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch("${fn:split(shopDetail.shop_addr, '/')[1] }", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${shopDetail.shop_name}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>



<%@ include file="./../../../include/footer.jsp"%>

