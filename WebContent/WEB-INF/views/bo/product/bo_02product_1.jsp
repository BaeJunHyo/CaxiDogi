<%@page import="cd.com.a.model.ProductParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<%@ include file="./../../../../include/bo/bo_header.jsp" %>

<%
ProductParam prdparam = (ProductParam)request.getAttribute("prdparam");

String category = (String)request.getAttribute("s_category");
if(category == null) category = "";
   
String keyword = (String)request.getAttribute("s_keyword");
if(keyword == null) keyword = "";
%>

<script>
var category = "<%=category %>";
var keyword = "<%=keyword %>";
$(document).ready(function () {
   $("#_s_category").val( category );
   //$("#_s_keyword").val( keyword );
   
   document.prdSrchFrm.s_keyword.value = keyword;
});
</script>

<%@ include file="./../../../../../../include/bo/bo_leftNav_product.jsp"%>

<div class="containerWrap">
   <%@ include file="./../../../../../../include/bo/bo_gnb_product.jsp"%>

   <form name="prdSrchFrm" id="_prdSrchFrm" method="post">
      <div class="container">
         <div class="top clearfix">
            <ul class="menu_dept clearfix">
               <li>상품관리</li>
               <li>상품리스트</li>
            </ul>
            <ul class="color_info clearfix">
               <li><img src="./images/bo/img_colorInfo_01.gif">입력정보</li>
               <li><img src="./images/bo/img_colorInfo_02.gif">조회정보</li>
               <li><img src="./images/bo/img_colorInfo_03.gif">링크</li>
               <li><img src="./images/bo/img_colorInfo_04.gif">신규/수정</li>
               <li><img src="./images/bo/img_colorInfo_05.gif">삭제</li>
            </ul>
         </div><!--// top -->
   
      
         <div class="cn_wrap">
            <div class="table_top">
               <span class="table_sbj">상품검색</span>
               <a href="productInsert.do" class="btn_r_red">+ 상품등록</a>
            </div><!--// table_top -->
            
            <!-- 검색 -->
            <table class="product_srchTable">
               <colgroup>
                  <col width="162px">
                  <col width="*">
                  <col width="162px">
                  <col width="*">
               </colgroup>
               <tbody>
                  <tr>
                     <th>검색어</th>
                     <td colspan="3">
                        <select id="_s_category" name="s_category">
                           <option value="all">통합검색</option>
                           <option value="product_name">상품명</option>
                           <option value="product_code">상품코드</option>
                           <option value="product_brand">공급사</option>
                        </select>
                        <input type="text" id="_s_keyword" name="s_keyword">
                     </td>
                  </tr>
                  
                  <tr>
                     <th>카테고리</th>
                     <td colspan="3">
                        <select id="_s_product_group" name="product_group">
                           <option value="0">카테고리 선택</option>
                           <option value="1"<c:if test="${product_group == 1 }">selected</c:if>>강아지 용품</option>
                           <option value="2"<c:if test="${product_group == 2 }">selected</c:if>>고양이 용품</option>
                           <option value="3"<c:if test="${product_group == 3 }">selected</c:if>>공용</option>
                        </select>
                        
                        <select id="_s_product_sub_group" name="product_sub_group">
                           <option value="0">카테고리 선택</option>
                           <option value="1">사료</option>
                           <option value="2">간식</option>
                           <option value="3">배변용품</option>
                           <option value="4">놀이용품</option>
                           <option value="5">미용용품</option>
                           <%-- <option value="5" <c:if test="${prdlist.product_sub_group == 5 }">selected></c:if>>미용용품</option> --%>
                        </select>
                     </td>
                  </tr>
                  <tr>
                      <th>품절 상태</th>
                      <td>
                          <span class="select_wrap">
                              <input type="radio" name="s_soldState" value="0" checked="checked">
                              <label>전체</label>
                              
                              <input type="radio" name="s_soldState" value="1" <c:if test="${s_soldState == 1 }">checked</c:if>>
                              <label>품절</label>
                              
                              <input type="radio" name="s_soldState" value="2" <c:if test="${s_soldState == 2 }">checked</c:if>>
                              <label>정상</label>
                          </span>
                          <!-- <span class="select_wrap">
                              
                          </span>
                          <span class="select_wrap">
                              
                          </span> -->
                      </td>
                  </tr>
                  <tr class="prdSearch">
                     <td colspan="4">
                        <a href="#n" id="_btnSearch">검 색</a>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
         <!-- //cn_wrap -->
   </form>
   
         <div class="cn_wrap srch_result">
            <div class="table_top clearfix">
               <p class="count">
                  총&nbsp;<span class="c_red">${totalRecordCount }</span>개
                  <!-- <img src="./images/bo/ico_bar02.gif" class="bar">
                  전체<span class="c_red">10</span>개 -->
               </p>
               <!-- 
               <p class="pageUnit">
                  <select id="s_sorting" name="sorting">
                     <option value="0" selected="selected">등록일 (오름차순)</option>
                     <option value="1">등록일 (내림차순)</option>
                  </select>
                  <select id="s_countList" name="countList">
                     <option value="10" selected="selected">10개 보기</option>
                     <option value="20">20개 보기</option>
                  </select>
               </p> 
               -->
            </div><!--// table_top -->
            
            <table class="prdlist">
               <colgroup>
                  <col width="55px">
                  <col width="107px">
                  <col width="107px">
                  <col width="107px">
                  <col width="25%">
                  <col width="107px">
                  <col width="107px">
                  <col width="107px">
                  <col width="107px">
                  <col width="107px">
                  <col width="107px">
                  <col width="107px">
               </colgroup>
               
               <thead>
                  <tr>
                     <th><input type="checkbox" name="chBox" class="chBox" onclick="deletechecks(this.checked)"></th>
                     <th>번호</th>
                     <th>상품코드</th>
                     <th>이미지</th>
                     <th>상품명</th>
                     <th>판매가</th>
                     <th>공급사</th>
                     <th>노출상태</th>
                     <th>판매상태</th>
                     <th>재고</th>
                     <th>등록일</th>
                     <th>수정</th>
                  </tr>
               </thead>
               
               <tbody>
                  <c:if test="${empty prdlist }">
                     <tr>
                        <td colspan="12">상품등록이 되지 않았습니다.</td>
                     </tr>
                  </c:if>
                  
                  <c:forEach items="${prdlist }" var="pr" varStatus="vs">
                  <tr>
                     <td><input type="checkbox" name="chBox" class="chBox" data-prdNum="${pr.product_num }"></td>
                     <td>${pr.product_num }</td>
                     <td>${pr.product_code }</td>
                     <td><img src="<%=request.getContextPath() %>/images/goodsImg/${pr.product_img }" width="40" height="40"></td>
                     <td>${pr.product_name }&nbsp;<c:if test="${pr.product_del eq 1 }"><span style="color: red;">[삭제 처리된 상품입니다]</span></c:if></td>
                     <td><fmt:formatNumber value="${pr.product_price}" pattern="###,###,###"/>원</td>
                     <td>${pr.product_brand }</td>
                     <td class="hid">${pr.product_hidden eq 0? '노출' : '미노출'}</td> <!-- 노출여부 -->
                     <td id="sal">${pr.product_sale eq 0? '판매' : '미판매' }</td> <!-- 판매상태 -->
                     <td>${pr.product_stock }</td>
                     <td>${fn:split(pr.product_regi_date, ' ')[0] }</td>
                     <td><a href="productUpdate.do?product_num=${pr.product_num }" class="btn_r_navy">수정</a></td>
                  </tr>
                  </c:forEach>
               </tbody>
            </table>
            
            <p class="table_optionBtn clearfix">
               <a href="" class="btn_r_navy selectDelete_btn">선택 삭제</a>
            </p>
   
            <!-- <div class="pagingWrap">
               <p class="paging">
                  <a href="#n" class="btn_first"></a>
                  <a href="#n" class="btn_prev"></a>
                  <a href="#n" class="current">1</a>
                  <a href="#n">2</a>
                  <a href="#n">3</a>
                  <a href="#n">4</a>
                  <a href="#n" class="btn_next"></a>
                  <a href="#n" class="btn_last"></a>
               </p>
            </div> -->
            <jsp:include page="/include/paging.jsp" flush="false">
               <jsp:param name="totalRecordCount" value="${totalRecordCount }" />
               <jsp:param name="pageNumber" value="${pageNumber }" />
               <jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
               <jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
            </jsp:include> 
         </div>
      </div><!--// container -->
      
	<form id="pagingFrm">
		<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
		<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber }">   
	</form>
	
</div><!--// containerWrap -->

<script>

$("#_s_product_group").change(function() {
   //var product_group = "${product_group}";
   /* $("#_s_product_group option:selected").val(product_group); */
});

$("#_s_product_sub_group").change(function() {
   var product_sub_group = $("#_s_product_sub_group option:selected").val();
});



$("#s_sorting").change(function() {
   var sorting = $("#s_sorting option:selected").val();
   location.href = "productList.do?sorting=" + sorting;
});


$("#s_countList").change(function() {
   var countList = $("#s_countList option:selected").val();
});

//-- 다중 선택 삭제
function deletechecks( ch ){
// alert(ch);
   var arrCheck = document.getElementsByName("chBox");  
     
   // -- true로 들어왔을 때 (체크되었을 때)
   for(i = 0; i < arrCheck.length; i++){
       // -- 클릭하면 전체 선택되게 해줌
       arrCheck[i].checked = ch; 
   }
}

$("#_s_category").val("<%=prdparam.getS_category()%>").prop("selected", true);
$("#_s_keyword").val("<%=prdparam.getS_keyword()%>");
$("#_s_product_group").val("<%=prdparam.getProduct_group()%>").prop("selected", true);
$("#_s_product_sub_group").val("<%=prdparam.getProduct_sub_group()%>").prop("selected", true);
$("input:radio[name='s_soldState']:radio[value="+<%=prdparam.getS_soldState()%>+"]").prop('checked', true);

function goPage( pageNumber ){
	var s_category = $("#_s_category option:selected").val();
	var s_keyword = $("#_s_keyword").val();
	var product_group = $("#_s_product_group option:selected").val();
	var product_sub_group = $("#_s_product_sub_group option:selected").val();
	var s_soldState = $("input[name=s_soldState]:checked").val();
	
   //$("#_pageNumber").val(pageNumber);
   //$("#pagingFrm").attr("action", "productList.do").submit();
   
   	location.href = "productList.do?s_category="+s_category+"&s_keyword="
   	+s_keyword+"&product_group="+product_group+"&product_sub_group="+product_sub_group+
   	"&s_soldState="+s_soldState+"&pageNumber="+pageNumber;  
}
 
$("#_btnSearch").click(function(){
//alert("_btnSearch");
   $("#_prdSrchFrm").attr("action", "productList.do").submit();
   //alert("product_group : " + $("select[name=product_group] option:selected").val() );
   //alert("radio : " + $("input[name=s_soldState]:checked").val() );
   //alert("product_sub_group : " + $("select[name=product_sub_group] option:selected").val());
});


// 선택 삭제
$(".selectDelete_btn").click(function(){
   var confirm_val = confirm("정말 삭제하시겠습니까?");
   
   if(confirm_val) {
      var checkArr = new Array();
      
      $("input[class='chBox']:checked").each(function(){
       checkArr.push($(this).attr("data-prdNum"));
      });
       
      $.ajax({
         url : "deletePrd.do",
         type : "post",
         data : { chbox : checkArr },
         success : function(result){
            if(result == "success") {
               location.href = "productList.do";
            } else{
               alert("삭제 실패");
            }
         }
      });
   } 
});
</script>

</body>
</html>