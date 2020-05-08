<%@page import="cd.com.a.model.memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>    

<div class="category_dept">
	<ul>
		<li>HOME</li>
		<li>마이페이지</li>
	</ul>
</div>

<!-- container S : -->
<div class="container_subWrap clearfix">
	<div class="cusSec_left">
		<div class="customerMenu">
			<h3>마이페이지</h3>
			<ul class="csSubmenu">
				<li>
					<a href="#n">쇼핑정보</a>
					<ul>
						<li><a href="orderBasket.do">장바구니 보기</a></li>
						<li><a href="myBuyListAll.do">주문조회</a></li>
						<!--  <li><a href="#n">교환/반품/환불</a></li>-->
					</ul>
				</li>
				
				<li>
					<a href="#n">미용 예약정보</a>
					<ul>
						<li><a href="showShopResv.do">미용 예약 내역보기</a></li>
						<li><a href="shopResvCancelList.do">취소 내역보기</a></li>
					</ul>
				</li>
				<li>
					<a href="#n">수영장 예약정보</a>
					<ul>
						<li><a href="poolResvList.do">수영장 예약 내역보기</a></li>
						<li><a href="poolCancleList.do">취소 내역보기</a></li>
					</ul>
				</li>
				<!-- caxidogi@caxidogi.com	준효123 -->
				<li>
					<a href="#n">회원정보관리</a>
					<ul>
						<li><a href="memberDetail.do">회원 정보</a></li>
						<c:set var="auth" value="${loginUser.auth }"/>
						<c:if test="${auth == 1 }">
						<li><a href="#"onclick="sellerAccess()">판매자 등록하기</a></li>
						</c:if>
						<c:if test="${auth == 2 }">
						<li><a href="#"onclick="sellerAccess()">판매자 등록하기</a></li>
						</c:if>
					</ul>
				</li>
			</ul>
		</div>
	</div>

<!--</div>  //end wrap -->
<%
memberDto check = (memberDto)request.getSession().getAttribute("loginUser");

String user_name="null";
String nick_name="null";
if(check.getUser_name()!=null){
	user_name=check.getUser_name();
}
if(check.getNick_name()!=null){
	nick_name=check.getNick_name();
}
System.out.println("check="+check.toString());
System.out.println("user_name="+user_name);
System.out.println("nick_name="+nick_name);
%>
<script>
function sellerAccess(){
	const userAuth = ${loginUser.auth};
	const mem_seq = ${loginUser.mem_seq};
	const user_api = ${loginUser.user_api};
	var username = "<%=user_name %>";
	var nickname = "<%=nick_name %>";

 	if(userAuth == 1 ){
		if(username == "null" || nickname == "null"){
			location.href="myPageMove.do";
		}else{
			Swal.fire({
				  title: '판매자 등록 요청을 원하시나요?',
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '예',
				  cancelButtonText:'아니요'
				}).then((result) => {
				  if (result.value) {
					  $.ajax({
							url:"sellerAccess.do",
							type: "post",
							dataType:"text",
							data: {"mem_seq":mem_seq},
							success:function(data){
								if(data === "success"){
									Swal.fire({
								    	  icon: 'success',
								    	  title: '판매자 등록 요청이 완료 되었습니다',
								    	  showConfirmButton: true
								    	}).then(function(){
									  location.reload();
									  });
								}
							},
							error:function(request,status,error){
							}
						});
				  }
				})
			/* if(confirm("판매자 등록 요청을 원하시나요?")){
				$.ajax({
					url:"sellerAccess.do",
					type: "post",
					dataType:"text",
					data: {"mem_seq":mem_seq},
					success:function(data){
						if(data === "success"){
							alert("판매자 등록 요청이 완료 되었습니다");
							location.reload();
						}
					},
					error:function(request,status,error){
					}
				});
			} */
		}
	}else if(userAuth==2){
		/* alert("관리자 승인 대기 중입니다."); */
		Swal.fire({
	    	  icon: 'info',
	    	  title: '관리자 승인 대기 중입니다.',
	    	  showConfirmButton: true
	    	}).then(function(){
		  return;
		  });
	} 
}
</script>
