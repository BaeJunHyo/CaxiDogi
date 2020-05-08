<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../../../include/header.jsp" %>

<!-- container S : -->
<div class="container" id="fixNextTag">
  <div class="promotionSlide">
    <ul class="promotionView clearfix bxslider">
      <li style="">
        <a href="#n">
          <img src="images/slide01.jpg">
        </a>
      </li>
      <li style="">
        <a href="#n">
          <img src="images/slide02.jpg">
        </a>
      </li>
      <li style="">
        <a href="#n">
          <img src="images/slide03.jpg">
        </a>
      </li>
      <li style="">
        <a href="#n">
          <img src="images/slide04.jpg">
        </a>
      </li>
    </ul>
    <div id="bx-pager">
      <ul class="slideNav bx-pager bx-default-pager">
        <li class="bx-pager-link"><a href="#n" class="active" data-slide-index="0"></a></li>
        <li class="bx-pager-link"><a href="#n" data-slide-index="1"></a></li>
        <li class="bx-pager-link"><a href="#n" data-slide-index="2"></a></li>
        <li class="bx-pager-link"><a href="#n" data-slide-index="3"></a></li>
      </ul>
    </div>
  </div>
  <!--// promotionSlide -->
  <script type="text/javascript">
    $(function() {
      $('.bxslider').bxSlider({
        mode: 'horizontal', //default : 'horizontal', options: 'horizontal', 'vertical', 'fade'
        speed: 2000, //default:500 이미지변환 속도
        auto: true, //default:false 자동 시작
        captions: true, // 이미지의 title 속성이 노출된다.
        autoControls: true, //default:false 정지,시작 콘트롤 노출, css 수정이 필요
        pagerCustom: '#bx-pager'
      });

    })
  </script>
  
    <!--// 상품 -->
  <div class="bigCate new_product w1100">
    <h3 class="objTit"><span class="font_noto">PRODUCT</span></h3>
    <ul class="prdArea prdView clearfix">
    <c:forEach items="${prdlist }" var="prd" begin="0" end="3" varStatus="status">
      <li>
        <a href="productDetail.do?product_num=${prd.product_num }">
          <span class="prdImg_section">
            <img src="<%=request.getContextPath() %>/images/goodsImg/${prd.product_img }">
          </span>
          <span class="prdInfo_section">
            <span class="prdInfo_name">${prd.product_name }</span>
            <%-- <span class="prdInfo_name">${fn:split(pool.pool_addr, '/')[1] }</span> --%>
            <span class="prdInfo_price"><fmt:formatNumber value="${prd.product_price}" pattern="###,###,###"/>원</span>
          </span>
        </a>
      </li>
      </c:forEach>
    </ul>
  </div><!--// 상품 끝-->

    <!--// SHOP -->
  <div class="bigCate new_product w1100">
    <h3 class="objTit"><span class="font_noto">SHOP</span></h3>
    <ul class="prdArea prdView clearfix">
    <c:forEach items="${shopList }" var="shop">
      <li>
        <a href="poolDetail.do?pool_seq=${shop.shop_seq }">
          <span class="prdImg_section">
            <img src="<%=request.getContextPath() %>/images/shopImg/${shop.shop_photo}">
          </span>
          <span class="prdInfo_section">
            <strong>${shop.shop_name }</strong>
            <span class="prdInfo_name">${fn:split(shop.shop_addr, '/')[1] }</span>
          </span>
        </a>
      </li>
      </c:forEach>
    </ul>
  </div><!--// SHOP 끝-->

  <!--// 수영장 -->
  <div class="bigCate new_product w1100">
    <h3 class="objTit"><span class="font_noto">POOL</span></h3>
    <ul class="prdArea prdView clearfix main">
    <c:forEach items="${poolList }" var="pool">
      <li>
        <a href="poolDetail.do?pool_seq=${pool.pool_seq }">
          <span class="prdImg_section">
            <img src="<%=request.getContextPath() %>/images/poolImg/${pool.pool_photo}">
          </span>
          <span class="prdInfo_section">
            <strong>${pool.pool_name }</strong>
            <span class="prdInfo_name">${fn:split(pool.pool_addr, '/')[1] }</span>
            <span class="prdInfo_price"><fmt:formatNumber value="${pool.pool_price}" pattern="###,###,###"/>원</span>
          </span>
        </a>
      </li>
      </c:forEach>
    </ul>
  </div><!--// 수영장 끝-->
</div>
<!-- container E : -->

<%@ include file="./../../../include/footer.jsp" %>
