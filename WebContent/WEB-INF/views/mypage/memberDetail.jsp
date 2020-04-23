<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ include file="./../../../include/header.jsp" %>

<%
memberDto sessionUser = (memberDto)request.getSession().getAttribute("loginUser");
memberDto memberDetail = (memberDto)request.getAttribute("memberDetail");

String month = memberDetail.getBirthday().substring(0,2);
String day = memberDetail.getBirthday().substring(2);
String birthday = month + "-"+day;
String[] addr = memberDetail.getAddress().split("/");
String question="";

switch(memberDetail.getPass_question()){
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
	<div class="cusSec_right">
	<div class="member_detail">
	      <div class="frm_cont border-btm">
	      
	         <div class="frm_line clfix">
		         <div class ="company_regi" style="margin-top: 10px;">
	            	<label>아이디</label>
	            	<input class="ttext memberId" type="text" maxlength="30" name="id" id="id" value="${memberDetail.id }" readonly="readonly">
					<input type="hidden" id="mem_seq" value="${memberDetail.mem_seq }">
				</div>
	         </div>
	         
	          <div class="frm_line clfix">
          		<div class ="company_regi" style="margin-top: 10px;">
	            	<label>이름</label>
	               	<input class="memberName" type="text" maxlength="4" name="user_name" id="name" value="${memberDetail.user_name }" readonly="readonly">
         		</div>
	         </div>
	         
	         <div class="frm_line clfix">
	         	<div class ="company_regi" style="margin-top: 10px;">
	            	<label>닉네임</label>
	               <input class="memberNick" type="text" maxlength="10" name="nick_name" id="nick_name" value="${memberDetail.nick_name }" readonly="readonly">
	         	</div>
	         </div>
	         
	         <div class="frm_line clfix">
	         	<div class ="company_regi" style="margin-top: 10px;">
	            	<label>연락처</label>
	               <input class="memberPhone" type="text" maxlength="11" name="phone" value="${memberDetail.phone }" readonly="readonly">
	         	</div>
	         </div>
	         
	         <div class="frm_line clfix">
	         	<div class ="company_regi" style="margin-top: 10px;">
		            <label>생일</label>
		            <input type="text" value="<%=birthday %>" readonly="readonly">
		        </div>
	         </div>
	            
	     
	         
	         
	         <div class="frm_line clfix">
	         	<div class ="company_regi" style="margin-top: 10px;">
	            	<label>주소</label>
					<input type="text" id="kakao_postcode" name="memberPostCode" readonly="readonly" value="<%=addr[0]%>">
					<input type="text" id="kakao_roadAddress" name="memberStreetName" readonly="readonly" value="<%=addr[1]%>">
					<input type="text" id="kakao_detailAddress" name="memberDetailStreetName" readonly="readonly" value="<%=addr[2]%>">
	         	</div>
	         </div>
	         
	         <div class="frm_line clfix" >
	         	<div class ="company_regi" style="margin-top: 10px;">
	            	<label>비밀번호 찾기 질문</label>
	            	<input type="text" value="<%=question %>" readonly="readonly">
	               	<input type="text" value="${memberDetail.pass_hint }" readonly="readonly">
	            </div>
	         </div>
	         
	         <div class="frm_line clfix" style="padding:40px 0;">
	         	<div class ="company_regi" style="margin-top: 10px;">
	            	<label>비밀번호 </label>
	               	<input type="password" id="pwdCheck" name="pwdCheck" value="">
	            </div>
	         </div>      
	      <button type="button" onclick="memberUpdate()" style="width:80px;height:40px; background: #f2f2f2; margin-top: 10px;">변경하기</button>
	      <button type="button" onclick="memberEscape()" style="width:80px;height:40px; background: #f2f2f2; margin-top: 10px;">탈퇴하기</button>
	</div><!--// contents -->
	</div><!-- //cusSec_right -->
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
					location.href="memberUpdateMove.do";
				};
			},
			error:function(request,status,error){
				alert(error);
			}
		});
		
	}
};
// 탈퇴처리
function memberEscape(){
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
					if(confirm("정말 탈퇴 하시겠습니까?")){
						location.href="memberEscape.do";
					}else{
						return;
					}
				};
			},
			error:function(request,status,error){
				alert(error);
			}
		});
		
	}
};
</script>

