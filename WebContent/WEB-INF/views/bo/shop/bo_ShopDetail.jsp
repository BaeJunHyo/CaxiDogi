<%@page import="cd.com.a.model.adminShopParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 코어태그 -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<%@ include file="/include/bo/bo_header.jsp" %>

<%@ include file="/include/bo/bo_leftNav_product.jsp"%>

<div class="containerWrap">
	<div class="container">
		<div class="top clearfix">
			<ul class="menu_dept clearfix">
				<li>액티브 관리</li>
				<li>Shop 관리</li>
				<li>Shop 상세</li>
			</ul>
		</div><!--// top -->
		<div class="cn_wrap">
			<div class="prdInfo_section">
					<ul>
						<li>
							<dl>
								<dt>상호명</dt>
								<dd class="c_green">${shop.shop_name}</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>대표자명</dt>
								<dd>${shop.shop_owner}</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>사업자등록번호</dt>
								<dd>${shop.shop_number}</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>주소</dt>
								<dd>${shop.shop_addr}</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>연락처</dt>
								<dd>
								${shop.shop_tel}
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>영업시간</dt>
								<dd>
								${shop.shop_time}
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>홍보문구</dt>
								<dd>${shop.shop_etc}</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>소형가격</dt>
								<dd>${shop.shop_small_price}</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>중형가격</dt>
								<dd>${shop.shop_medium_price}</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>대형가격</dt>
								<dd>${shop.shop_large_price}</dd>
							</dl>
						</li>
		
					</ul>
					<p class="clearfix" align="center">
						<c:if test = "${shop.shop_auth == 0 ||shop.shop_auth == 4 }">
							<a href="#" class="btn_r_navy" id = "shopOkBtn">승인</a>
							<a href="#" class="btn_r_navy" id = "shopNoBtn">반려</a>
						</c:if>
						<a href="#" class="btn_r_navy" onclick="location.href='adminShopList.do'">Shop 리스트</a>
					</p>
			</div>
		</div><!--// containerWrap -->
	</div>
</div>
<script>
	$("#shopOkBtn").click(function(){
		//alert("클릭");
		Swal.fire({
	        title: '${shop.shop_name}'+' 승인',
	        text: "Shop정보 확인하셨나요?",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: 'Yes'
	      }).then((result) => {
	        if (result.value) {
	           $.ajax({
	               url:"./adminShopOk.do",
	               type:'post',
	               data:{"shop_seq" : '${shop.shop_seq}' },
	               success: function(data){
	                  if(data == 'ok'){
	                     Swal.fire({
	                    		 title: '승인 되었습니다.',
	                              icon: 'success', 
	                              showConfirmButton: true
	                     } ).then(function(){
	                             window.location="adminShopList.do"});
	                  }else if(data == 'no'){
	                	  Swal.fire({
	                          icon: 'error',
	                          title: 'IT운영팀에 문의해주세요.',
	                          showConfirmButton: true
	                        });
	                  }
	               },
	               error: function(e){
	            	   Swal.fire({
	                          icon: 'error',
	                          title: 'IT운영팀에 문의해주세요.',
	                          showConfirmButton: true
	                        });
	               }
	            });
	        }
	    });

	});

	$("#shopNoBtn").click(function(){
		Swal.fire({
	        title: '${shop.shop_name}'+' 반려',
	        text: "Shop정보 확인하셨나요?",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: 'Yes'
	      }).then((result) => {
	        if (result.value) {
	           $.ajax({
	               url:"./adminShopNo.do",
	               type:'post',
	               data:{"shop_seq" : '${shop.shop_seq}' },
	               success: function(data){
	                  if(data == 'ok'){
	                     Swal.fire({
	                    		 title: '반려 되었습니다.',
	                              icon: 'success', 
	                              showConfirmButton: true
	                     } ).then(function(){
	                             window.location="adminShopList.do"});
	                  }else if(data == 'no'){
	                	  Swal.fire({
	                          icon: 'error',
	                          title: 'IT운영팀에 문의해주세요.',
	                          showConfirmButton: true
	                        });
	                  }
	               },
	               error: function(e){
	            	   Swal.fire({
	                          icon: 'error',
	                          title: 'IT운영팀에 문의해주세요.',
	                          showConfirmButton: true
	                        });
	               }
	            });
	        }
	    });

	});
</script>

</body>
</html>