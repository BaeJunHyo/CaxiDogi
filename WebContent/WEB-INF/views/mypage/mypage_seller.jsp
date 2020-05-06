<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../../../include/header.jsp" %>
<%
memberDto sessionUser = (memberDto)request.getSession().getAttribute("loginUser");
if(sessionUser == null){
%>
<script>
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

<%@ include file="./../../../include/left_frm_seller.jsp" %>
		<!-- 마이페이지 메인 -->
	<div class="cusSec_right">
	
		<div class="cusSec_tableWrap tw_wFull">
			<h3>
				<span class="t_sbj">Shop등록</span>
				<span class="c_gray">(최근 주문 5건 / 1개월 내)</span>
				<a href="#n" class="btn_dark_s fr">더보기</a>
			</h3>

	
		</div> 

	
	</div><!--// contents -->

</div><!--container E : -->

<%@ include file="./../../../include/footer.jsp" %>

