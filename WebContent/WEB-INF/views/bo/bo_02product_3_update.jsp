<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<script src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>

<%@ include file="./../../../include/bo_header.jsp"%>

<%@ include file="./../../../include/bo_leftNav.jsp"%>

<div class="containerWrap productRegi">
	<ul class="gnb">
		<li><a href="#n">기본설정</a></li>
		<li><a href="#n" class="current">상품관리</a></li>
		<li><a href="#n">주문/배송</a></li>
		<li><a href="#n">회원</a></li>
		<li><a href="#n">게시판</a></li>
		<li><a href="#n">프로모션</a></li>
		<li><a href="#n">디자인</a></li>
		<li><a href="#n">통계</a></li>
	</ul>
	<!--// gnb -->

	<div class="container">
		<div class="top clearfix">
			<ul class="menu_dept clearfix">
				<li>상품관리</li>
				<li>상품수정</li>
			</ul>
			<ul class="color_info clearfix">
				<li><img src="../images/bo/img_colorInfo_01.gif">입력정보</li>
				<li><img src="../images/bo/img_colorInfo_02.gif">조회정보</li>
				<li><img src="../images/bo/img_colorInfo_03.gif">링크</li>
				<li><img src="../images/bo/img_colorInfo_04.gif">신규/수정</li>
				<li><img src="../images/bo/img_colorInfo_05.gif">삭제</li>
			</ul>
		</div>
		<!--// top -->


		<div class="cn_wrap">
			<div class="table_top">
				<span class="table_sbj">상품수정</span>
			</div>
			<!--// table_top -->

			<form action="<%=request.getContextPath()%>/productUpdateAf.do" name="prdUpdeteForm" id="_prdUpdeteForm" method="post" enctype="multipart/form-data">

				<table class="product_srchTable" style="margin-bottom: 15px;">
					<colgroup>
						<col width="162px">
						<col width="*">
						<col width="162px">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>상품구분</th>
							<td>
                                <select id="_prdDivision" name="product_group" class="prd_group">
                                    <option value="" <c:if test="${prddto.product_group == null }"></c:if>>----- 상품 구분 -----</option>
                                    <option value="1" <c:if test="${prddto.product_group == 1 }">selected</c:if>>강아지 용품</option>
                                    <option value="2" <c:if test="${prddto.product_group == 2 }">selected</c:if>>고양이 용품</option>
                                    <option value="3" <c:if test="${prddto.product_group == 3 }">selected</c:if>>공용</option>
								</select>
							</td>
							<th>상품종류</th>
							<td>
								<select id="_prdKinds" name="product_sub_group" class="prd_sub_group">
									<option value="" selected="selected">----- 상품 종류 -----</option>
                                    <option value="1" <c:if test="${prddto.product_sub_group == 1 }">selected</c:if>>사료</option>
                                    <option value="2" <c:if test="${prddto.product_sub_group == 2 }">selected</c:if>>간식</option>
                                    <option value="3" <c:if test="${prddto.product_sub_group == 3 }">selected</c:if>>배변용품</option>
                                    <option value="4" <c:if test="${prddto.product_sub_group == 4 }">selected</c:if>>놀이</option>
                                    <option value="5" <c:if test="${prddto.product_sub_group == 5 }">selected</c:if>>미용용품</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>상호명</th>
							<td>
                                <input type="text" id="_prdBrand" name="product_brand" placeholder="상호명을 입력해주세요" size="500" value="${prddto.product_brand }">
							</td>
							
							<th>상품코드</th>
							<td>
                                <input type="text" id="_prdCode" name="product_code" placeholder="상품 코드를 입력해주세요" size="500" value="${prddto.product_code }">
							</td>
						</tr>
						<tr>
							<th>상품가격</th>
							<td>
                                <input type="text" id="_prdPrice" name="product_price" placeholder="가격을 입력해주세요" size="150" value="${prddto.product_price }">
							</td>
							
							<th>상품 재고</th>
							<td>
                                <input type="text" id="_prdStock" name="product_stock" placeholder="상품 수량을 입력해주세요" size="500" value="${prddto.product_stock }">
							</td>
						</tr>
						<tr>
							<th>상품노출 상태</th>
							<td>
								<span class="select_wrap"> 
                                    <input type="radio" name="product_hidden" value="0" <c:if test="${prddto.product_hidden == 0 }">checked</c:if>> 
									<label>노출</label>
								</span> 
								<span class="select_wrap"> 
                                    <input type="radio" name="product_hidden" value="1" <c:if test="${prddto.product_hidden == 1 }">checked</c:if>> 
									<label>미노출</label>
								</span>
							</td>
							
							
							<th>배송비 조건</th>
							<td colspan="3">
                                <input type="text" id="_prdDeliveryAuth" name="product_delivery_auth" placeholder="배송비 조건을 입력해주세요" size="500" value="${prddto.product_delivery_auth }">
								<label class="info_lavel">ex) 50,000원 입력 시 50,000원 부터 무료배송 적용</label>
							</td>
						</tr>
						<tr>
							<th>상품명</th>
							<td>
                                <input type="text" id="_prdName" name="product_name" placeholder="상품명을 입력해주세요" size="500" value="${prddto.product_name }">
							</td>
						
							<th>상품 대표 사진</th>
							<td>
								<input type="file" name="fileUpload">
							</td>
						</tr>
					</tbody>
				</table>


				<div class="company_regi" style="margin-top: 10px;">
                    <textarea id="content" name="content">${prddto.product_content }</textarea>
					<script>
						CKEDITOR.replace('content', {
							filebrowserUploadUrl : 'boimageUpload.do'
						});
						//config.height = '350px'; //Editor 높이
					</script>
					<input type="hidden" name="product_content" id="product_content">
					
                    <input type="hidden" name="product_img" value="${prddto.product_img }">
                    <input type="hidden" name="product_num" value="${prddto.product_num }">
				</div>

				<div style="margin-top: 10px;" align="center">
					<input name="updateHidden" type="hidden" value="">
					<input class="btn_line_m" type="submit" id="prdUpdate" value="등록">
                    <input class="btn_line_m" type="button" id="prdUpdateCancle" value="취소" onclick="location.href='productList.do'">
				</div>
			</form>
		</div>
		<!--// cn_wrap -->
	</div>
	<!-- container E : -->
</div>
<!-- containerWrap E : -->


<script type="text/javascript">
	$(document).ready(function() {
			$("#prdRegi").click(
					function() {
						//alert("등록버튼");
						

						if (($("#_prdDivision").val() == "" || $("#_prdDivision").val() == null 
								|| $( "#_prdDivision").val() == undefined)) {
							alert("상품 구분을 선택해 주세요.");
							$("#_prdDivision").focus();
							System.out.println("상품 구분을 선택해 주세요.");
						}

						else if ($("#_prdKinds").val() == "" || $("#_prdKinds").val() == null
								|| $("#_prdKinds").val() == undefined) {
							alert("상품 종류를 선택해 주세요.");
							$("#_prdKindse").focus();
						}

						else if ($("#_prdBrand").val() == "" || $("#_prdBrand").val() == null
								|| $("#_prdBrand").val() == undefined) {
							alert("상호명을 입력해 주세요.");
							$("#_prdBrand").focus();
						}

						else if ($("#_prdCode").val() == ""
								|| $("#_prdCode").val() == null
								|| $("#_prdCode").val() == undefined) {
							alert("상품 코드를 입력해 주세요.");
							$("#_prdCode").focus();
						}

						else if ($("#_prdPrice").val() == ""
								|| $("#_prdPrice").val() == null
								|| $("#_prdPrice").val() == undefined) {
							alert("상품 가격을 입력해 주세요.");
							$("#_prdPrice").focus();
						}

						else if ($("#_prdStock").val() == ""
								|| $("#_prdStock").val() == null
								|| $("#_prdStock").val() == undefined) {
							alert("재고 수량을 입력해 주세요.");
							$("#_prdStock").focus();
						}
						
						else if ($("#_prdName").val() == ""
								|| $("#_prdName").val() == null
								|| $("#_prdName").val() == undefined) {
							alert("상품명을 입력해 주세요.");
							$("#_prdName").focus();
						}

						else {
							var content = CKEDITOR.instances.content.getData();
							$("#product_content").val(content);
							alert("상품등록이 완료되었습니다.")
							$("#_prdForm").submit();
						}

					});

            // select 그룹
            $(.prd_group option).each(function(){
                if($(this).val()=="${prddto.product_group }"){
                  $(this).attr("selected","selected"); // attr & prop
                }
            }); 


			$("#prdUpdate").click(function(){
				
				$.ajax({
                    url: "./productUpdateAf.do",
					type: "post",
					data:
					success: function(){}
	                data: formData,
	                enctype:'multipart/form-data',
	                processData: false,
	                contentType: false,
	                cache: false,
	                timeout: 600000,
	                success: function(data){
	                    Swal.fire({
	                         icon: 'success',
	                         title: '상품 수정 성공!',
	                         showConfirmButton: true
	                        }).then(function(){
	                      window.location="productList.do";});
	                },
	                error: function(e){
	                    alert("통신실패");
	                }
				})
				
			});


		    //var opt = document.querySelectorAll("select.prd_group option");
		    //for (var i = 0; i < c_opt.length; i++) {
		    //    if (opt[i].value == '${prddto.product_group}') {
		    //        $(".prd_group option:eq("+i+")").attr("selected","selected");    
		    //        break;
		    //    }
		    //}
			
		});
</script>


</body>
</html>