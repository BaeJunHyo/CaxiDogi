<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../../../include/header.jsp" %>
<%
memberDto sessionUser = (memberDto)request.getSession().getAttribute("loginUser");
if(sessionUser == null){
%>
<script>
$(document).ready(function(){
	/* if(confirm("세션이 만료되었습니다.\n 다시 로그인 하시겠습니까?")){
		location.href="login.do";
	}else{
		location.href="main.do";
	} */
	Swal.fire({
		  title: '세션이 만료되었습니다.',
		  text: "다시 로그인 하시겠습니까?",
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText:'아니요',
		  confirmButtonText: '예'
		}).then((result) => {
		  if (result.value) {
			  location.href="loginView.do";
		  }else{
			  location.href="main.do";
		  }
		})
})
</script>
<%
}
String memberAuth ="";
if(loginUser.getAuth()==1 || loginUser.getAuth()==2){
	memberAuth = "일반회원";
}else if(loginUser.getAuth()==3){
	memberAuth = "업체회원";
}else if(loginUser.getAuth()==4 || loginUser.getAuth()==5){
	memberAuth = "관리자";
}else{
	memberAuth = "탈퇴회원";
}
%>

<%@ include file="./../../../include/left_frm.jsp" %>
		<!-- 마이페이지 메인 -->
	<div class="cusSec_right">
		<div class="box_cusMain clearfix">
			<div class="box_leftSec" style="border-right: none;">
				<h5 style="font-weight: normal;">
					<%=loginUser.getUser_name() %>님 안녕하세요
				</h5>
				
				<p><img src="./images/mypage/ico_user_s.gif"><strong class="pl5 pr20">회원유형</strong><%=memberAuth %></p>
			</div>
		</div>
	
<%@ include file="./myBuyList.jsp" %>
<%@ include file="./myShopResvList.jsp" %>
<%@ include file="./myPoolResvList.jsp" %>
	
	</div><!--// contents -->


<%@ include file="./../../../include/footer.jsp" %>

