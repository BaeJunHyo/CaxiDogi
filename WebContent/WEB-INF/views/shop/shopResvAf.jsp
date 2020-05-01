<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="./../../../include/header.jsp"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="<%=request.getContextPath()%>/css/pool.css" rel="stylesheet">

<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>Active</li>
		<li>수영장 예약 확인</li>
	</ul>
</div>
<div class="container_subWrap sub_detail">
	<div class="pool_infoWrap">
	<div class="poolInfo_section clearfix">
		<div class="info">
		<h3>나의 예약 확인</h3>
			<ul>
				<li>
					<dl>
						<dt>상호명</dt>
						<dd class="c_green">${shop.shop_name}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>주소</dt>
						<dd>${fn:split(shop.shop_addr, '/')[1] }</dd>
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
						<dt>예약일</dt>
						<dd>${shopResv.shop_resv_rday }</dd>
					</dl>
					<%-- <input type ="hidden" name ="pool_resv_sdate" value ="${shopResv.pool_resv_sdate }"> --%>
				</li>
				<li>
					<dl>
						<dt>예약 시간</dt>
						<dd>${shopResv.shop_resv_time}</dd>
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
						<dt>반려견</dt>
						<dd>
						<c:choose>
							<c:when test="${shopResv.shop_resv_size == 0 }">
								소형견
							</c:when>
							
							<c:when test="${shopResv.shop_resv_size == 1 }">
								중형견
							</c:when>
							
							<c:when test="${shopResv.shop_resv_size == 2 }">
								대형견
							</c:when>
						
						</c:choose>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>예상 총 금액</dt>
						<dd id="price">
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>예약자명</dt>
						<dd>
							${shopResv.shop_resv_name}
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>연락처</dt>
						<dd id="userTel">
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>요청사항</dt>
						<dd>
							${shopResv.shop_resv_comment}
						</dd>
					</dl>
				</li>

			</ul>
			<p class="poolBtns clearfix" align="center">
				<a href="#" class="btn_dark_l" onclick="location.href='main.do'">메인으로</a>
				<a href="showShopResv.do" class="btn_dark_l" id = "mypageBtn">마이페이지</a>
			</p>
		</div>
</div>
</div>
</div>
<script type="text/javascript">
 	//1,000단위 콤마
 	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	 document.querySelector("#price").innerText = numberWithCommas(${shopResv.shop_resv_price});


	var tel = "${shop.shop_tel}";
	var userTel = "${shopResv.shop_resv_tel}"
	tel = tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	userTel = userTel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	document.querySelector("#tel").innerText = tel;
	document.querySelector("#userTel").innerText = userTel;


  </script>
<%@ include file="./../../../include/footer.jsp"%>
