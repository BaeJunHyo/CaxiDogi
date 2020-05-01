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
						<dd class="c_green">${pool.pool_name}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>주소</dt>
						<dd>${fn:split(pool.pool_addr, '/')[1] }</dd>
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
						<dd>${pool_resv.pool_resv_sdate }</dd>
					</dl>
					<input type ="hidden" name ="pool_resv_sdate" value ="${pool_resv.pool_resv_sdate }">
				</li>
				<li>
					<dl>
						<dt>예약 시간</dt>
						<dd>${pool_resv.pool_resv_time}</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>인원</dt>
						<dd>
						${pool_resv.pool_resv_user}
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>반려견</dt>
						<dd>
						${pool_resv.pool_resv_pet}
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
							${pool_resv.pool_resv_name}
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
						<dt>코멘트</dt>
						<dd>
						${pool_resv.pool_resv_comment }
						</dd>
					</dl>
				</li>
			</ul>
			<p class="poolBtns clearfix" align="center">
				<a href="#" class="btn_dark_l" onclick="location.href='main.do'">메인으로</a>
				<a href="#" class="btn_dark_l" onclick="location.href='myPageMove.do'">마이페이지</a>
				<a href="#" class="btn_dark_l" id = "cancleBtn">예약취소</a>
				<a href="#" class="btn_dark_l" id = "noCancleBtn">취소불가</a>
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

	 document.querySelector("#price").innerText = numberWithCommas(${pool_resv.pool_resv_price});


	var tel = "${pool.pool_tel}";
	var userTel = "${pool_resv.pool_resv_tel}";
	tel = tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	userTel = userTel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	document.querySelector("#tel").innerText = tel;
	document.querySelector("#userTel").innerText = userTel;

	$(document).ready(function(){
		$("#cancleBtn").hide();
		$("#noCancleBtn").hide();
		var today = new Date();
		var dateString = "${pool_resv.pool_resv_sdate}";
		var dateArray = dateString.split("-");
		var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);
		var betweenDay =(dateObj.getTime()-today.getTime())/1000/60/60/24;
			if(betweenDay < 2){
				if(${pool_resv.pool_resv_auth} != 7 && ${pool_resv.pool_resv_auth} !=3){
					$("#cancleBtn").hide();
					$("#noCancleBtn").show();
				}
			} else {

				if(${pool_resv.pool_resv_auth} != 7 && ${pool_resv.pool_resv_auth} !=3){
					$("#cancleBtn").show();			
					$("#noCancleBtn").hide();
				}
			}
		
	});
	
	$("#cancleBtn").click(function(){
		Swal.fire({
	        title: '정말 취소하시겠습니까?',
	        text: "재예약시 다시 신청하셔야합니다.",
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: 'Yes'
	      }).then((result) => {
	        if (result.value) {
	           $.ajax({
	               url:"./poolCancleAf.do",
	               type:'post',
	               data:{"pool_resv_seq" : "${pool_resv.pool_resv_seq}" },
	               success: function(data){
	                  if(data == 'ok'){
	                     Swal.fire({
	                    		 title: '예약 취소 되었습니다.',
	                              icon: 'success', 
	                              showConfirmButton: true
	                     }).then(function(){
	                                  window.location="myPageMove.do"});
	                  }else if(data == 'no'){
	                	  Swal.fire({
	                          icon: 'error',
	                          title: '업체에 문의해주세요.',
	                          showConfirmButton: true
	                        });
	                  }
	               },
	               error: function(e){
	            	   Swal.fire({
	                          icon: 'error',
	                          title: '업체에 문의해주세요.',
	                          showConfirmButton: true
	                        });
	               }
	            });
	        }
	      });

	});
	
	$("#noCancleBtn").click(function(){
		Swal.fire({
            icon: 'error',
            title: '업체에 문의해주세요.',
            showConfirmButton: true
          });
		
	});
  </script>
<%@ include file="./../../../include/footer.jsp"%>
