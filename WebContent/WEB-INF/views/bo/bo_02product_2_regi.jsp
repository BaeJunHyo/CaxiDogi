<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./../../../include/bo_header.jsp"%>
<script src = "<%=request.getContextPath() %>/js/ckeditor/ckeditor.js"></script>
<div class="lnbWrap">
	<h2>상품관리</h2>
	<ul class="lnb">
		<li class="lnb_sbj"><a href="#n">상품관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n">상품리스트</a></li>
				<li><a href="#n">상품 등록</a></li>
				<li><a href="#n">상품 일괄 등록</a></li>
				<li><a href="#n">상품 이미지 일괄 처리</a></li>
				<li><a href="#n">삭제 상품 관리</a></li>
			</ul></li>
		<li class="lnb_sbj"><a href="#n">상품 설정 관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n">옵션 관리</a></li>
				<li><a href="#n">상품 아이콘 관리</a></li>
				<li><a href="#n">상품 필수정보 관리</a></li>
				<li><a href="#n">상품 가격 관리</a></li>
				<li><a href="#n">상품 품절/노출/재고 관리</a></li>
				<li><a href="#n">상품 이동/복사/삭제 관리</a></li>
				<li><a href="#n">상품 배송비 관리</a></li>
			</ul></li>
		<li class="lnb_sbj"><a href="#n">카테고리 관리</a>
			<ul class="sub_lnbmenu">
				<li><a href="#n">카테고리 관리</a></li>
				<li><a href="#n">브랜드 관리</a></li>
			</ul></li>
	</ul>
</div>
<!--// lnbWrap -->

<div class="containerWrap">
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
				<li>상품등록</li>
			</ul>
			<ul class="color_info clearfix">
				<li><img src="../images/img_colorInfo_01.gif">입력정보</li>
				<li><img src="../images/img_colorInfo_02.gif">조회정보</li>
				<li><img src="../images/img_colorInfo_03.gif">링크</li>
				<li><img src="../images/img_colorInfo_04.gif">신규/수정</li>
				<li><img src="../images/img_colorInfo_05.gif">삭제</li>
			</ul>
		</div>
		<!--// top -->

		<div class="cn_wrap">
			<div class="table_top">
				<span class="table_sbj">상품등록</span>
			</div>
			<!--// table_top -->
			
			<form action="<%=request.getContextPath() %>/productInsertAf.do" name="prdForm" id="_prdForm" method="post" enctype="multipart/form-data">
				
				<div class="company_regi" style="margin-top: 10px;">
					<label style="width: 100px;">상품 구분</label> 
					<select id="_prdDivision" name="product_group">
						<option value="" selected="selected">----- 상품 구분 -----</option>
						<option value="0">강아지</option>
						<option value="1">고양이</option>
					</select>
				</div>
	
				<div class="company_regi" style="margin-top: 10px;">
					<label style="width: 100px;">상품 종류</label> 
					<select id="_prdKinds" name="product_sub_group">
						<option value="" selected="selected">----- 상품 종류 -----</option>
						<option value="1">사료</option>
						<option value="2">미용용품</option>
						<option value="3">장난감</option>
					</select>
				</div>
	
				<div class="company_regi" style="margin-top: 10px;">
					<label style="width: 100px;">상품 코드</label> 
					<input type="text" id="_prdCode" name="product_code" placeholder="상품 코드를 입력해주세요" size="500">
				</div>
	
				<div class="company_regi" style="margin-top: 10px;">
					<label style="width: 100px;">상품명</label> 
					<input type="text" id="_prdName" name="product_name" placeholder="상품명을 입력해주세요" size="500">
				</div>
	
				<div class="company_regi" style="margin-top: 10px;">
					<label style="width: 100px;">가격</label> 
					<input type="text" id="_prdPrice" name="product_price" placeholder="가격을 입력해주세요" size="150">
				</div>
	
				<div class="company_regi" style="margin-top: 10px;">
					<label style="width: 100px;">상품 대표 사진</label> 
					<input type="file" name="fileUpload">
				</div>
	
				<div class="company_regi" style="margin-top: 10px;">
					<textarea id="content" name="content"></textarea>
					<script>CKEDITOR.replace('content',{filebrowserUploadUrl:'boimageUpload.do'});</script>
					<input type="hidden" name="product_content" id="product_content">

					
				</div>
	
				<div style="margin-top: 10px;" align="center">
					<input class="btn_line_m" type="submit" id="prdRegi" value="등록"> 
					<input class="btn_line_m" type="button" id="prdRegiCancle" value="취소">
				</div>
			</form>
		</div>
	</div>
	<!-- container E : -->

	<script type="text/javascript">

		$(function(){
			$("#prdRegi").click(function(){
				//alert("등록버튼");
				
				if( ($("#_prdDivision").val() == "" || $("#_prdDivision").val() == null || $("#_prdDivision").val() == undefined ) ){
                    alert("상품 구분을 선택해 주세요.");
                    $("#_prdDivision").focus();
                    System.out.println("상품 구분을 선택해 주세요.");
                }
                
                else if( $("#_prdKinds").val() == "" || $("#_prdKinds").val() == null || $("#_prdKinds").val() == undefined ){
                    alert("상품 종류를 선택해 주세요.");
                    $("#_prdKindse").focus();
                }

                else if( $("#_prdCode").val() == "" || $("#_prdCode").val() == null || $("#_prdCode").val() == undefined ){
                    alert("상품 코드를 입력해 주세요.");
                    $("#_prdCode").focus();
                }

                else if( $("#_prdName").val() == "" || $("#_prdName").val() == null || $("#_prdName").val() == undefined ){
                    alert("상품명을 입력해 주세요.");
                    $("#_prdName").focus();
                }

                else if( $("#_prdPrice").val() == "" || $("#_prdPrice").val() == null || $("#_prdPrice").val() == undefined ){
                    alert("상품 가격을 입력해 주세요.");
                    $("#_prdPrice").focus();
                }

                
                else{
                    //alert("상품등록이 완료되었습니다.")
                	var content = CKEDITOR.instances.content.getData();
                	$("#product_content").val(content);
                	$("#_prdForm").submit();
                }
 
				
			});
		});
	
	</script>


	</body>
	</html>