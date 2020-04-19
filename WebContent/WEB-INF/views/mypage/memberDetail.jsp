<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ include file="./../../../include/header.jsp" %>

<%
memberDto sessionUser = (memberDto)request.getSession().getAttribute("loginUser");

String month = loginUser.getBirthday().substring(0,2);
String day = loginUser.getBirthday().substring(2);
String birthday = month + "-"+day;
String[] addr = loginUser.getAddress().split("/");
String question="";

switch(loginUser.getPass_question()){
case 1:	
	question="기억에 남는 추억의 장소는?";
	break;
case 2:	
	question="나의 보물 1호는?";
	break;
case 3:	
	question="나의 출신 초등학교는?";
	break;
case 4:	
	question="가장 좋아하는 색깔은?";
	break;
case 5:	
	question="아버지 성함은?";
	break;
}

if(sessionUser == null){
%>
<script>
	if(confirm("세션이 만료되었습니다.\n 다시 로그인 하시겠습니까?")){
		location.href="loginView.do";
	}else{
		location.href="main.do";
	}
</script>
<%
}
%>

<%@ include file="./../../../include/left_frm.jsp" %>

	<!-- detail main -->
	<div class="member_detail">
	      <div class="frm_cont border-btm">
	      
	         <div class="frm_line clfix">
	            <div class="tit">아이디</div>
	               <input class="ttext memberId" type="text" maxlength="30" name="id" id="id" value="${loginUser.id }" readonly="readonly">
					<input type="hidden" id="mem_seq" value="${loginUser.mem_seq }">
	         </div>
	         
	          <div class="frm_line clfix">
	            <div class="tit">이름</div>
	               <input class="memberName" type="text" maxlength="4" name="user_name" id="name" value="${loginUser.user_name }" readonly="readonly">
	         </div>
	         
	         <div class="frm_line clfix">
	            <div class="tit">닉네임</div>
	               <input class="memberNick" type="text" maxlength="10" name="nick_name" id="nick_name" value="${loginUser.nick_name }" readonly="readonly">
	         </div>
	         
	         <div class="frm_line clfix">
	            <div class="tit">연락처</div>
	               <input class="memberPhone" type="text" maxlength="11" name="phone" value="${loginUser.phone }" readonly="readonly">
	         </div>
	         
	         <div class="frm_line clfix">
	            <div class="tit">생일</div>
	            <input type="text" value="<%=birthday %>" readonly="readonly">
	         </div>
	            
	     
	         
	         
	         <div class="frm_line clfix">
	            <div class="tit">주소</div>
					<input type="text" id="kakao_postcode" name="memberPostCode" readonly="readonly" value="<%=addr[0]%>">
					<input type="text" id="kakao_roadAddress" name="memberStreetName" readonly="readonly" value="<%=addr[1]%>">
					<input type="text" id="kakao_detailAddress" name="memberDetailStreetName" readonly="readonly" value="<%=addr[2]%>">
	         </div>
	         
	         <div class="frm_line clfix" >
	            <div class="tit floatNone">비밀번호 찾기 질문</div>
	            	<input type="text" value="<%=question %>" readonly="readonly">
	               	<input type="text" value="${loginUser.pass_hint }" readonly="readonly">
	               
	         </div>
	         
	         <div class="frm_line clfix" style="padding:40px 0;">
	            <div class="tit floatNone">비밀번호 </div>
	               	<input type="password" id="pwdCheck" name="pwdCheck" value="">
	         </div>      
	      <button type="button" onclick="memberUpdate()">변경하기</button>
	      <button type="button" onclick="memberEscape()">탈퇴하기</button>
	</div><!--// contents -->
</div><!-- //include left_frm  -->

<%@ include file="./../../../include/footer.jsp" %>
<script>

function memberUpdate(){
	if($('input[name=pwdCheck]').val().trim() == ""){
		alert("회원정보 재 확인을 위해 \n 패스워드를 입력해주세요");
		$("input[name=pwdCheck]").focus();
	}else{
		$.ajax({
			url:"pwdCheck.do",
			type: "post",
			dataType:"text",
			data: {
				"mem_seq":$("#mem_seq").val(),
				"password":$("#pwdCheck").val()
				},
			success:function(data){
				if(data == null || data === "" || data =="false"){
					alert("비밀번호 정보가 다릅니다.\n다시 입력해주세요");
					return;
				}else{
					location.href="memberUpdateMove.do"
				};
			},
			error:function(request,status,error){
				alert(error);
			}
		});
		
	}
};
</script>

