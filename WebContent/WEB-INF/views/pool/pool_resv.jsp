<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="./../../../include/header.jsp"%>
<link href="<%=request.getContextPath()%>/css/pool.css" rel="stylesheet">
<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>Active</li>
		<li>수영장</li>
		<li>예약</li>
	</ul>
</div>
<div class="container_subWrap sub_detail">
	<div class="pool_infoWrap">
	<div class="poolInfo_section clearfix">
			<form id = "poolResv" name = "poolResv" method="post" >
		<div class="info">
		<h3>예약확인</h3>
			<ul>
				<li>
					<dl>
						<dt>상호명</dt>
						<dd class="c_green">${pool.pool_name}</dd>
					</dl>
						<input type = "hidden" name="pool_seq" value ="${pool.pool_seq }">
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
						<dd>${poolResv.pool_resv_sdate }</dd>
					</dl>
					<input type ="hidden" name ="pool_resv_sdate" value ="${poolResv.pool_resv_sdate }">
				</li>
				<li>
					<dl>
						<dt>예약 시간</dt>
						<dd>${poolResv.pool_resv_time}</dd>
					</dl>
					<input type ="hidden" name ="pool_resv_time" value ="${poolResv.pool_resv_time }">
				</li>
				<li>
					<dl>
						<dt>인원</dt>
						<dd>
						${poolResv.pool_resv_user}
						</dd>
					</dl>
					<input type ="hidden" name ="pool_resv_user" value ="${poolResv.pool_resv_user }">
				</li>
				<li>
					<dl>
						<dt>반려견</dt>
						<dd>
						${poolResv.pool_resv_pet}
						</dd>
					</dl>
					<input type ="hidden" name ="pool_resv_pet" value ="${poolResv.pool_resv_pet }">
				</li>
				<li>
					<dl>
						<dt>예상 총 금액</dt>
						<dd id="price">
						</dd>
					</dl>
					<input type ="hidden" name ="pool_resv_price" id ="pool_resv_price">
					
					<hr class="mt15">
				</li>
				<li>
					<dl>
						<dt>예약자명</dt>
						<dd>
							<input type ="text" id="pool_resv_name" name ="pool_resv_name" value ="${poolResv.pool_resv_name}">
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>연락처</dt>
						<dd>
							<input type ="text" id="pool_resv_tel" name ="pool_resv_tel" value ="${poolResv.pool_resv_tel}">
							<input type ="hidden" name ="mem_seq" value = "${poolResv.mem_seq }">
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>코멘트</dt>
						<dd>
							<input type ="text" id="pool_resv_comment" name ="pool_resv_comment" style="width:800px;" placeholder="코멘트란">
						</dd>
					</dl>
				</li>

			</ul>
			<p class="poolBtns clearfix" align="center">
				<a href="#" class="btn_dark_l" onclick="location.href='poolDetail.do?pool_seq=${poolResv.pool_seq }'">수정하기</a>
				<a href="#" class="btn_dark_l" id = "resvBtn">예약하기</a>
			</p>
		</div>
		</form>
</div>
</div>
</div>

<script type="text/javascript">
 	//1,000단위 콤마
 	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	 document.querySelector("#price").innerText = numberWithCommas(${poolResv.pool_resv_user}*${pool.pool_price});


	var tel = "${pool.pool_tel}";
	tel = tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	document.querySelector("#tel").innerText = tel;

	$("#resvBtn").click(function(){
		var rgEx = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
		if((!rgEx.test($("#pool_resv_tel").val()))){
			alert("올바른 전화번호가 아닙니다.");
			$("#pool_resv_tel").val("");
			$("#pool_resv_tel").focus();
			
		} else {
			$("#pool_resv_price").val(${poolResv.pool_resv_user}*${pool.pool_price});
			var formData = $("#poolResv").serialize();
				
			 $.ajax({
		        url:"./poolResvAf.do",
		        type:'post',
		        data: formData,
		        success: function (data){
		            if(data.status == "ok"){

		           Swal.fire({
		            	  icon: 'success',
		            	  title: '수영장 예약에 성공하셨습니다.',
		            	  showConfirmButton: true
		            	}).then(function(){
		        	  window.location="pool_reservation.do?pool_resv_seq="+data.rnum;});
		            }
		        },
		        error: function (e){
		           alert("통신실패");
		   		}
			}); 
		}
	});
  </script>

<%@ include file="./../../../include/footer.jsp"%>