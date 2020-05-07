<%@page import="cd.com.a.model.poolDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./../../../include/header.jsp"%>
<link href="<%=request.getContextPath()%>/css/pool.css" rel="stylesheet">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/calstyle2.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<%
	poolDto pool = (poolDto)request.getAttribute("pool");
	String time[] = pool.getPool_time().split("~");
	String startTime[] = time[0].trim().split(":");
	String endTime[] = time[1].trim().split(":");
	
	String str = "24시 동물병원";
	String address = "서울 강남구 ";
%>
<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>Active</li>
		<li>수영장</li>
	</ul>
</div>
<!-- container S : -->
<form id = "poolResvForm" name = "poolResvForm" action="poolResvView.do" method="post">
<div class="container_subWrap sub_detail">
	<div class="pool_infoWrap">
		<div class="poolName_section clearfix">
				<div class="pool_name">
					${pool.pool_name }
				</div>
	
			</div>
	<div class="poolInfo_section clearfix">
			<div class="col1">
				<div class="thumb">
					<!-- <div class="prdImg easyzoom easyzoom--adjacent easyzoom--with-thumbnails">
						<a href="images/img_prdBigThumb_zoom_1.jpg">
							<img src="images/img_prdBigThumb_1.jpg">
						</a>
					</div> -->
					<div class="easyzoom easyzoom--adjacent easyzoom--with-thumbnails">
						<c:if test="${pool.pool_photo == 'default' }">
							<img class="MS_prod_img_m"
								src="<%=request.getContextPath()%>/images/poolImg/pool.png" alt="">
						</c:if>
						<c:if test="${pool.pool_photo != 'default' }">
							<img class="MS_prod_img_m"
								src="<%=request.getContextPath() %>/images/poolImg/${pool.pool_photo }" width="500"  height = "500" alt="">
						</c:if>
					</div>
				</div>
			</div>
			<!--// col1 -->
			<input type="hidden" id="pool_seq" name = "pool_seq" value="${pool.pool_seq }">
			<div class="col2">
				<div class="info">
					<ul>
						<li>
							<dl>
								<dt>영업시간</dt>
								<dd class="c_green">
									${pool.pool_time }
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>주소</dt>
								<dd>
									${fn:split(pool.pool_addr, '/')[1] }
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>연락처</dt>
								<dd id ="tel">
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>대형견 이용</dt>
								<dd>
								<c:if test="${pool.pool_large == 1 }">
								<span class="c_red">이용불가</span>
								</c:if>
								<c:if test="${pool.pool_large == 0 }">
									이용가능

								</c:if>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>샤워실</dt>
								<dd>
								<c:if test="${pool.pool_shower == 1 }">
									<span class="c_red">없음</span>
								</c:if>
								<c:if test="${pool.pool_shower == 0 }">
									<span>이용가능</span>
								</c:if>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>주차장</dt>
								<dd>
								<c:if test="${pool.pool_parking == 1 }">
									<span  class="c_red">없음</span>
								</c:if>
								<c:if test="${pool.pool_parking == 0 }">
									<span>이용가능</span>
								</c:if>
								</dd>
							</dl>
						</li>

						<li>
							<dl>
								<dt>시간당 가격</dt>
								<dd id ="price">
								</dd>
							</dl>
							<hr class="mt15">

						</li>
						<li>
							<div  id="datepicker" align = "center"></div>
							<input type = "hidden" id ="pool_resv_sdate" name="pool_resv_sdate">
						</li>
						<li>
							<dl>
								<dt>시간</dt>
								<dd>
									<select id="pool_resv_time" name="pool_resv_time">
										<c:forEach var="resvTime" begin ="<%=Integer.parseInt(startTime[0]) %>" end = "<%=Integer.parseInt(endTime[0])-1 %>">
											<option>${resvTime }:00~${resvTime+1 }:00 </option>
										</c:forEach>
									</select>
								</dd>
							</dl>
							
						</li>
						<li>
							<dl>
								<dt>인원</dt>
								<dd>
									<select id="pool_resv_user" name ="pool_resv_user">
										<c:forEach var="userNum" begin ="1" end = "10">
											<option value="${userNum }">${userNum } 명</option>
										</c:forEach>
									</select>
								</dd>
							</dl>
							
						</li>
												<li>
							<dl>
								<dt>반려견</dt>
								<dd>
									<select id="pool_resv_pet" name="pool_resv_pet">
										<c:forEach var="petNum" begin ="1" end = "10">
											<option value="${petNum }">${petNum } 마리</option>
										</c:forEach>
									</select>
								</dd>
							</dl>
						</li>
					</ul>
					<input type = "hidden" name = "mem_seq" value="${loginUser.mem_seq}">
					<p class="total_price clearfix pt20 pb15">
						<span class="fl pt5">예상 총 금액</span>
						<span class="fr"><strong id="totalPrice"></strong> 원</span>
					</p>

						<p class="poolBtns clearfix" align="center">
				<a href="#" class="btn_dark_l" id = "poolResv">예약하기</a>
			</p>
				</div>
			</div>
			<!--// col2 -->
		</div>
		<!--// prdInfo_section -->
		<div class="detailView move05">
			<table class="basic_tableStyle">
				<colgroup>
					<col width="190px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<td>${pool.pool_content }</td>
					</tr>
					<tr>
						<td>
							<div id="map" style="width:100%;height:350px;"></div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</form>
<!-- container E : -->
 <script type="text/javascript">
 	//1,000단위 콤마
 	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	 document.querySelector("#price").innerText = numberWithCommas(${pool.pool_price});
	 document.querySelector("#totalPrice").innerText = numberWithCommas($("#pool_resv_user").val()*${pool.pool_price});
	 
	$("#pool_resv_user").change(function(){
		var total = $("#pool_resv_user").val() * ${pool.pool_price};
		document.querySelector("#totalPrice").innerText = numberWithCommas(total);
	});


	var tel = "${pool.pool_tel}";
	tel = tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	document.querySelector("#tel").innerText = tel;

	
  $( function() {  
    $( "#datepicker" ).datepicker({
       minDate : "+1D",
       maxDate : "+21D",
       dateFormat: 'yy-mm-dd',
       onSelect: function(date){
			$("#pool_resv_sdate").val(date);
       }
   	});
   });

  $("#poolResv").click(function(){
	if('<%=request.getSession().getAttribute("loginUser")%>'=='null'){
		alert("로그인해주세요");
		location.href="loginView.do";
	} else if ('<%=request.getSession().getAttribute("loginUser")%>'!='null'){
		if($("#pool_resv_sdate").val()==''){
			alert("예약 날짜를 선택해 주세요");
		} else {
			$("#poolResvForm").submit();
		}
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
geocoder.addressSearch("${fn:split(pool.pool_addr, '/')[1] }", function(result, status) {

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
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${pool.pool_name}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<%@ include file="./../../../include/footer.jsp"%>