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
				<li>수영장 관리</li>
				<li>수영장 상세</li>
			</ul>
		</div><!--// top -->
		<div class="cn_wrap">
			<div class="prdInfo_section">
					<ul>
						<li>
							<dl>
								<dt>상호명</dt>
								<dd class="c_green">${pool.pool_name}</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>대표자명</dt>
								<dd>${pool.pool_owner}</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>사업자등록번호</dt>
								<dd>${pool.pool_number}</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>주소</dt>
								<dd>${pool.pool_addr}</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>연락처</dt>
								<dd>
								${pool.pool_tel}
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>영업시간</dt>
								<dd>
								${pool.pool_time}
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>시간당 가격</dt>
								<dd>
								${pool.pool_price}
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>샤워실</dt>
								<dd>
									<c:if test ="${pool.pool_shower == 0}">
										<span style="color:blue;">있음</span>
									</c:if>
									<c:if test ="${pool.pool_shower == 1}">
										<span style="color:red;">없음</span>
									</c:if>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>대형견사용 여부</dt>
								<dd>
									<c:if test ="${pool.pool_large == 0}">
										<span style="color:blue;">가능</span>
									</c:if>
									<c:if test ="${pool.pool_large == 1}">
										<span style="color:red;">불가</span>
									</c:if>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>주차장</dt>
								<dd>
									<c:if test ="${pool.pool_parking == 0}">
										<span style="color:blue;">있음</span>
									</c:if>
									<c:if test ="${pool.pool_parking == 1}">
										<span style="color:red;">없음</span>
									</c:if>
								</dd>
							</dl>
						</li>
					</ul>
					<p class="clearfix" align="center">
						<c:if test = "${pool.pool_auth == 0 ||pool.pool_auth == 4 }">
							<a href="#" class="btn_r_navy" id = "poolOkBtn">승인</a>
							<a href="#" class="btn_r_navy" id = "poolNoBtn">반려</a>
						</c:if>
						<a href="#" class="btn_r_navy" onclick="location.href='adminPoolList.do'">수영장 리스트</a>
					</p>
			</div>
		</div><!--// containerWrap -->
	</div>
</div>
<script>
	$("#poolOkBtn").click(function(){
		//alert("클릭");
		Swal.fire({
	        title: '${pool.pool_name}'+' 승인',
	        text: "수영장정보 확인하셨나요?",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: 'Yes'
	      }).then((result) => {
	        if (result.value) {
	           $.ajax({
	               url:"./adminPoolOk.do",
	               type:'post',
	               data:{"pool_seq" : '${pool.pool_seq}' },
	               success: function(data){
	                  if(data == 'ok'){
	                     Swal.fire({
	                    		 title: '승인 되었습니다.',
	                              icon: 'success', 
	                              showConfirmButton: true
	                     } ).then(function(){
	                             window.location="adminPoolList.do"});
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

	$("#poolNoBtn").click(function(){
		Swal.fire({
	        title: '${pool.pool_name}'+' 반려',
	        text: "수영장정보 확인하셨나요?",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: 'Yes'
	      }).then((result) => {
	        if (result.value) {
	           $.ajax({
	               url:"./adminPoolNo.do",
	               type:'post',
	               data:{"pool_seq" : '${pool.pool_seq}' },
	               success: function(data){
	                  if(data == 'ok'){
	                     Swal.fire({
	                    		 title: '반려 되었습니다.',
	                              icon: 'success', 
	                              showConfirmButton: true
	                     } ).then(function(){
	                             window.location="adminPoolList.do"});
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