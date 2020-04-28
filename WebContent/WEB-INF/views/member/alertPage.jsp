<%@page import="cd.com.a.model.memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
<%
String login = (String)request.getAttribute("login");
String regi = (String)request.getAttribute("regi");
String update = (String)request.getAttribute("update");
String msg = (String)request.getAttribute("msg");
memberDto loginUser = (memberDto)request.getSession().getAttribute("loginUser");
memberDto memberDetail = (memberDto)request.getAttribute("memberDetail");
String sns = "";


// 로그인시 API구분 변수
// 로그인 MSG
if(login != null){
	if(login.equals("success")){
		if(loginUser!=null){
			if(loginUser.getUser_api() == 1){
				 sns ="[카카오계정]";
			}else if(loginUser.getUser_api() == 2){
				 sns ="[네이버계정]";
			}else if(loginUser.getUser_api() == 3){
				 sns ="[구글계정]";
			}else{
				 sns ="";
			}
		}

		if(loginUser.getUser_api() == 0){
		%>
		<script>
		$(document).ready(function(){
			Swal.fire({
          	  icon: 'success',
          	  title: '<%=sns%>',
	          text:'정상적으로 로그인 되었습니다.',
          	  showConfirmButton: true
          	}).then(function(){
      	  window.location="main.do";});
			});
		</script>
		<%		
	// sns 마이페이지 회원정보이동
		}else{
			if(memberDetail.getUser_name()==null || 
				memberDetail.getNick_name()==null ||
				memberDetail.getAddress() ==null ||
				memberDetail.getPhone()==null ||
				memberDetail.getBirthday()==null ){
			%>
			<script>
			$(document).ready(function(){
				Swal.fire({
		          	  icon: 'success',
		          	  title: '<%=sns%>',
			          text:'정상적으로 로그인 되었습니다.',
		          	  showConfirmButton: true
		          	}).then(function(){
		      	  window.location="snsFirstLogin.do";});
			});
				/* alert("원활한 이용을 위해 \n 미입력된 정보를 기입해주세요^^"); */
				/* location.href="snsFirstLogin.do"; */
			</script>
			<%
			}else{
			%>
			<script>
			$(document).ready(function(){
				Swal.fire({
		          	  icon: 'success',
		          	  title: '<%=sns%>',
			          text:'정상적으로 로그인 되었습니다.',
		          	  showConfirmButton: true
		          	}).then(function(){
		      	  window.location="main.do";});
			});
			</script>
			<%
			} 
		}
	}else if(login.equals("secession")){
%>
<script>
$(document).ready(function(){
	/* if(confirm("탈퇴 처리 된 계정 입니다.\n복구 처리 하시겠습니까?")){
		location.href="loginView.do?recovery=true";
	}else{
		location.href="loginView.do";
	} */
	Swal.fire({
		  title: '탈퇴 처리 된 계정 입니다.',
		  text: "복구 처리 하시겠습니까?",
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText:'아니요',
		  confirmButtonText: '예'
		}).then((result) => {
		  if (result.value) {
			  location.href="loginView.do?recovery=true";
		  }else{
			  location.href="loginView.do"
		  }
		})
})

</script>
<%
	}else{
%>
<script>
$(document).ready(function(){
	/* alert("잘못된 로그인 입니다. \n 다시 로그인 해주세요.");
	location.href="loginView.do"; */
	Swal.fire({
    	  icon: 'error',
    	  title: '잘못된 로그인 입니다.',
          text:'다시 로그인 해주세요.',
    	  showConfirmButton: true
    	}).then(function(){
	  window.location="loginView.do";});
});
</script>
<%
	}
}


// 자체 회원가입 MSG
if(regi != null){
	if(regi.equals("true")){
%>
<script>
$(document).ready(function(){
	/* if(confirm("정상적으로 회원가입되었습니다 \n 지금 바로 로그인 하시겠습니까?")){
		location.href="loginView.do";
	}else{
		location.href="main.do";
	} */
	Swal.fire({
		  title: '정상적으로 회원가입 되었습니다.',
		  text: "지금 바로 로그인 하시겠습니까?",
		  icon: 'success',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText:'아니요',
		  confirmButtonText: '예'
		}).then((result) => {
		  if (result.value) {
			  location.href="loginView.do";
		  }else{
			  location.href="main.do"
		  }
		})
})
</script>
<%
	}else{
%>
<script>
$(document).ready(function(){
	/* alert("회원가입에 실패하였습니다");
	location.href="newAccount.do"; */
	Swal.fire({
  	  icon: 'error',
  	  title: '회원가입에 실패하였습니다',
  	  showConfirmButton: true
  	}).then(function(){
	  window.location="newAccount.do";});
});
</script>
<%
	}
}

// 회원정보 업데이트 MSG
if(update != null){
	if(update.equals("true")){		
%>
		<script>
		$(document).ready(function(){
			/* alert("정상적으로 변경 되었습니다.")
			location.href="memberDetail.do"; */
		Swal.fire({
		  	  icon: 'success',
		  	  title: '정상적으로 변경 되었습니다.',
		  	  showConfirmButton: true
		  	}).then(function(){
			  window.location="memberDetail.do";});
		});
		</script>
<%
	}else{
%>
		<script>
			/* alert("회원정보 업데이트 간 문제 발생")
			location.href="mypageMove.do"; */
			$(document).ready(function(){
				/* alert("회원가입에 실패하였습니다");
				location.href="newAccount.do"; */
				Swal.fire({
			  	  icon: 'error',
			  	  title: '회원정보 업데이트 간 문제 발생',
			  	  showConfirmButton: true
			  	}).then(function(){
				  window.location="mypageMove.do";});
			});
		</script>	
<%	
	}
}

// 그외 MSG
if(msg != null){
%>
<script>
$(document).ready(function(){
	<%-- alert("<%=msg%>");
	location.href="main.do"; --%>
	Swal.fire({
	  	  icon: 'info',
	  	  title: '<%=msg%>',
	  	  showConfirmButton: true
	  	}).then(function(){
		  window.location="main.do";});
	
});
</script>
<%
}
%>
