<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="./../../../include/header.jsp"%>
<link href="<%=request.getContextPath()%>/css/pool.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/calstyle2.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>Active</li>
		<li>수영장</li>
	</ul>
</div>
<!-- container S : -->
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
								src="<%=request.getContextPath()%>/images/poolImg/grooming.png" alt="">
						</c:if>
						<c:if test="${pool.pool_photo != 'default' }">
							<img class="MS_prod_img_m"
								src="<%=request.getContextPath() %>/images/poolImg/${pool.pool_photo }" width="500"  height = "500" alt="">
						</c:if>
					</div>
				</div>
			</div>
			<!--// col1 -->
			<div class="col2">
				<div class="info">
					<h3 style = "font-weight: bold; font-size: 19pt">${pool.pool_name }</h3>
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
								<dd class="price-red">
									${pool.pool_addr }
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>연락처</dt>
								<dd>
									${pool.pool_tel }
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>대형견 이용</dt>
								<dd>
								<c:if test="${pool.pool_large == 1 }">
									이용가능
								</c:if>
								<c:if test="${pool.pool_large == 0 }">
								<span class="c_red">이용불가</span>
									이용불가
								</c:if>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>샤워실</dt>
								<dd>
								<c:if test="${pool.pool_shower == 1 }">
									이용가능
								</c:if>
								<c:if test="${pool.pool_shower == 0 }">
									<span class="c_red">없음</span>
								</c:if>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>주차장</dt>
								<dd>
								<c:if test="${pool.pool_parking == 1 }">
									이용가능
								</c:if>
								<c:if test="${pool.pool_parking == 0 }">
									<span class="c_red">없음</span>
								</c:if>
								</dd>
							</dl>
						</li>

						<li>
							<dl>
								<dt>시간당 가격</dt>
								<dd>
									${pool.pool_price }
								</dd>
							</dl>
							<hr class="mt15">

						</li>
						<li>
							<div  id="datepicker"></div>
							<input type = "hidden" id ="pool_resv_sdate">
						</li>
						<li>
							<dl>
								<dt>인원</dt>
								<dd>
									<select id="pool_resv_user">
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
									<select id="pool_resv_pet">
										<c:forEach var="petNum" begin ="1" end = "10">
											<option value="${petNum }">${petNum } 마리</option>
										</c:forEach>
									</select>
								</dd>
							</dl>
							
						</li>

					</ul>

					<p class="total_price clearfix pt20 pb15">
						<span class="fl pt5">총 합계금액</span>
						<span class="fr"><strong class="c_red">1,000,000</strong>원</span>
					</p>

					<p class="poolBtns clearfix">
						<a href="#n" class="btn_dark_l p0">장바구니</a>
					</p>
				</div>
			</div>
			<!--// col2 -->
		</div>
	
	</div>
</div>
<!-- container E : -->
 <script>

  $( function() {
   
    $( "#datepicker" ).datepicker({
       minDate : 0,
      maxDate : "+21D",
       dateFormat: 'yy-mm-dd',
      onSelect: function(date){

   }
      
   });
 
 });

  </script>

<%@ include file="./../../../include/footer.jsp"%>