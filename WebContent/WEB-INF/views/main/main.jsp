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

  <div class="brandFilter">
    <table class="brandList">
      <colgroup>
        <col width="16%">
        <col width="16%">
        <col width="16%">
        <col width="16%">
        <col width="16%">
        <col width="16%">
      </colgroup>
      <tbody>
        <tr>
          <td>ALL</td>
          <td class="audemars">
            <p class="brandNm">AUDEMARS PIGUET</p>
            <img src="./images/thumb_brand_audemars.jpg">
          </td>
          <td class="current">
            <p class="brandNm">Breguet</p>
            <img src="./images/thumb_brand_breguet.jpg">
          </td>
          <td>
            <p class="brandNm">BREITLING</p>
            <img src="./images/thumb_brand_breitling.jpg">
          </td>
          <td>
            <p class="brandNm">BOUCHERON</p>
            <img src="./images/thumb_brand_boucheron.jpg">
          <td>
            <p class="brandNm">BULGARI</p>
            <img src="./images/thumb_brand_bulgari.jpg">
          </td>
        </tr>
        <tr>
          <td>
            <p class="brandNm">Chopard</p>
            <img src="./images/thumb_brand_chopard.jpg">
          </td>
          <td>
            <p ckass="brandNm">CHRONOSWISS</p>
            <img src="./images/thumb_brand_chronoswiss.jpg">
          </td>
          <td>
            <p class="brandNm">Dior</p>
            <img src="./images/thumb_brand_dior.jpg">
          </td>
          <td>
            <p class="brandNm">FRANCK MULLER</p>
            <img src="./images/thumb_brand_franck.jpg">
          </td>
          <td>
            <p class="brandNm">Fred</p>
            <img src="./images/thumb_brand_fred.jpg">
          </td>
          <td>
            <p class="brandNm">HERMES</p>
            <img src="./images/thumb_brand_hermes.jpg">
          </td>
        </tr>
        <tr>
          <td>
            <p class="brandNm">CHANEL</p>
            <img src="./images/thumb_brand_chanel.jpg">
          </td>
          <td>
            <p class="brandNm">AUDEMARS PIGUET</p>
            <img src="./images/thumb_brand_audemars.jpg">
          </td>
          <td>
            <p class="brandNm">Breguet</p>
            <img src="./images/thumb_brand_breguet.jpg">
          </td>
          <td>
            <p class="brandNm">BREITLING</p>
            <img src="./images/thumb_brand_breitling.jpg">
          </td>
          <td>
            <p class="brandNm">BOUCHERON</p>
            <img src="./images/thumb_brand_boucheron.jpg">
          <td>
            <p class="brandNm">BULGARI</p>
            <img src="./images/thumb_brand_bulgari.jpg">
          </td>
        </tr>
        <tr>
          <td>
            <p class="brandNm">Chopard</p>
            <img src="./images/thumb_brand_chopard.jpg">
          </td>
          <td>
            <p ckass="brandNm">CHRONOSWISS</p>
            <img src="./images/thumb_brand_chronoswiss.jpg">
          </td>
          <td>
            <p class="brandNm">Dior</p>
            <img src="./images/thumb_brand_dior.jpg">
          </td>
          <td>
            <p class="brandNm">FRANCK MULLER</p>
            <img src="./images/thumb_brand_franck.jpg">
          </td>
          <td>
            <p class="brandNm">Fred</p>
            <img src="./images/thumb_brand_fred.jpg">
          </td>
          <td>
            <p class="brandNm">HERMES</p>
            <img src="./images/thumb_brand_hermes.jpg">
          </td>
        </tr>
      </tbody>
    </table>
    <a href="#n" class="brand_moreBtn"><img src="images/btn_more_brand_on.png"></a>

    <ul class="prdArea clearfix">
      <li class="prd_soldout">
        <a href="#n">
          <span class="prdImg_section">
            <img src="images/1000057659_Detail0.jpg">
            <img src="./images/img_sign_prdSoldout.gif" class="sign_prdSoldout">
          </span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF 57mm UBER CHIEF57mm UBER CHIEF</span>
            <span class="prdInfo_price">
              <span class="orgin_price">400,000원</span>
              245,000원
            </span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
    </ul>
    <a href="#n" class="btn_line_more mt50 mb50">더보기</a>


  </div>
  <!--// brandFilter -->


  <div class="bigCate new_product w1100">
    <h3 class="objTit"><span class="font_noto">NEW PRODUCT</span></h3>
    <!-- <p class="prdSlide_btn">
    <a href="#n" class="slidePrev"><img src="images/btn_prev.jpg" alt="이전 상품 보기 버튼"></a>
    <a href="#n" class="slideNext"><img src="images/btn_next.jpg" alt="다음 상품 보기 버튼"></a>
  </p> -->
    <ul class="prdArea prdView clearfix">
      <li class="prd_soldout">
        <a href="#n">
          <span class="prdImg_section">
            <img src="images/img_prd.jpg">
            <img src="./images/img_sign_prdSoldout.gif" class="sign_prdSoldout">
          </span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
          <span class="prdFlag">
            <img src="images/img_flag_best.png" alt="베스트상품">
            <img src="images/img_flag_sale.png" alt="세일상품">
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
          <span class="prdFlag">
            <img src="images/img_flag_sale.png" alt="세일상품">
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
    </ul>
    <!-- <a href="#n" class="btn_line_more mb100">더보기</a> -->
  </div>
  <!--// new_product -->

  <a class="eventBanner">
    <img src="images/img_eventBn.jpg">
  </a>
  <!--// eventBanner -->

  <div class="bigCate md_recommend">
    <h3 class="objTit"><span class="font_noto">MD 추천</span></h3>
    <!-- <ul class="brandList">
    <li><a href="#n"><img src="images/img_brandList_casio.png"></a></li>
    <li><a href="#n"><img src="images/img_brandList_casio.png"></a></li>
    <li><a href="#n"><img src="images/img_brandList_casio.png"></a></li>
    <li><a href="#n"><img src="images/img_brandList_casio.png"></a></li>
    <li><a href="#n"><img src="images/img_brandList_casio.png"></a></li>
  </ul> -->
    <ul class="prdArea clearfix">
      <li class="prd_soldout">
        <a href="#n">
          <span class="prdImg_section">
            <img src="images/1000057659_Detail0.jpg">
            <img src="./images/img_sign_prdSoldout.gif" class="sign_prdSoldout">
          </span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/1000057659_Detail0.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">245,000원</span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
      <li>
        <a href="#n">
          <span class="prdImg_section"><img src="images/img_prd.jpg"></span>
          <span class="prdInfo_section">
            <strong>DIESEL</strong>
            <span class="prdInfo_name">DZ7376 / 57mm UBER CHIEF</span>
            <span class="prdInfo_price">
              <span class="orgin_price">400,000원</span>
              245,000원
            </span>
          </span>
        </a>
        <span class="prdHover">
          <a href="#n"><img src="images/ico_hoverWish.png" alt="상품 미리보기"></a>
          <a href="#n" class="btn_prdCart"><img src="images/ico_hoverCart.png" alt="상품 미리보기"></a>
        </span>
      </li>
    </ul>
    <!-- <a href="#n" class="btn_line_more mb100">더보기</a> -->
  </div>
  <!--// md_recommend -->
</div>
<!-- container E : -->

<%@ include file="./../../../include/footer.jsp" %>
