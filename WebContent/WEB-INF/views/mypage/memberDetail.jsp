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
	/* if(confirm("세션이 만료되었습니다.\n 다시 로그인 하시겠습니까?")){
		location.href="loginView.do";
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
</script>
<%
}
%>

<%@ include file="./../../../include/left_frm.jsp" %>

	<!-- detail main -->
	<div class="cusSec_right">
	<div class="member_detail">
	      <%-- <div class="frm_cont border-btm">
	      
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
	</div><!--// contents --> --%>
	</div><!-- //cusSec_right -->
	
	
	
	
	
	<!--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
    

      <div class="cusSec_tableWrap tw_wFull">
         <h3>
            <span class="t_sbj">기본 정보</span>
            <span class="c_gray">*는 필수 입력입니다.</span>
         </h3>
         <table class="basic_tableStyle basic_tableStyle_vert td_p0">
            <colgroup>
               <col width="140px">
               <col width="*">
            </colgroup>
            <tbody>
               <tr>
                  <th>이름 *</th>
                  <td class="tl"><input class="memberName" type="text" maxlength="4" name="user_name" id="name" value="${memberDetail.user_name }" readonly="readonly"></td>
               </tr>
               <tr>
                  <th>아이디 *</th>
                  <td class="tl">
                  	<input class="ttext memberId" type="text" maxlength="30" name="id" id="id" value="${memberDetail.id }" readonly="readonly">
                  	<input type="hidden" id="mem_seq" value="${memberDetail.mem_seq }">
                  </td>
               </tr>
               <tr>
                  <th>닉네임*</th>
                  <td class="tl">
                  	<input class="memberNick" type="text" maxlength="10" name="nick_name" id="nick_name" value="${memberDetail.nick_name }" readonly="readonly">
                  </td>
               </tr>
              
               <tr>
                  <th>휴대폰 *</th>
                  <td class="tl">
                     <input class="memberPhone" type="text" maxlength="11" name="phone" value="${memberDetail.phone }" readonly="readonly">
                     <p class="inputWrap tl pt10 pl0">
                     </p>
                  </td>
               </tr>
               <tr>
                  <th>주소 *</th>
                  <td class="tl">
                  <label class="dis_inline" style="width: 80px;">도로명주소</label>
                     <input type="text" id="kakao_postcode" name="memberPostCode" readonly="readonly" value="<%=addr[0]%>">
					<input type="text" id="kakao_roadAddress" name="memberStreetName" readonly="readonly" value="<%=addr[1]%>">
					<input type="text" id="kakao_detailAddress" name="memberDetailStreetName" readonly="readonly" value="<%=addr[2]%>">
                  </td>
               </tr>
               
               <tr>
               <th>생일</th>
               <td class="tl">
                   <input type="text" value="<%=birthday %>" readonly="readonly">
                  <span class="inputWrap">
                     <span class="pr0"><input type="radio" name=""><label>양력</label></span>
                     <span><input type="radio" name=""><label>음력</label></span>
                  </span>
               </td>
            </tr>
            <tr>
               <th>비밀번호 찾기 질문 *</th>
               <td class="tl">
                 <input type="text" value="<%=question %>" readonly="readonly">
	               	<input type="text" value="${memberDetail.pass_hint }" readonly="readonly">
               </td>
            </tr>
             <tr>
               <th>비밀번호</th>
               <td class="tl">
	               	<input type="password" id="pwdCheck" name="pwdCheck" value="">
               </td>
            </tr>
            <tr>
               <th>개인정보 유효기간</th>
               <td class="tl">
                  개인정보를 파기 또는 분리 저장ㆍ관리하여야 하는 서비스 미 이용 기간을 선택하세요.
                  <p class="c_gray">(별도의 요청이 없을 경우 서비스 미이용 기간은 1년 입니다)</p>
                  <p class="inputWrap tl pt10">
                     <span class="pl0"><input type="radio" name=""><label>1년</label></span>
                     <span><input type="radio" name="1"><label>2년</label></span>
                     <span><input type="radio" name="1"><label>3년</label></span>
                     <span><input type="radio" name="1"><label>회원탈퇴시</label></span>
                  </p>
               </td>
            </tr>
            </tbody>
         </table>
      </div>
			<button type="button" onclick="memberUpdate()" style="width: 80px; height: 40px; background: #000000;ma rgin-top: 10px; color: #fff;">변경하기</button>
	      <button type="button" onclick="memberEscape()" style="width:80px;height:40px; background: #f2f2f2; margin-top: 10px;">탈퇴하기</button>
     <!--  <p class="btns_right">
         <a href="#n" class="btn_gray">회원탈퇴</a>
      </p>

      <p class="btnWrap">
         <a href="#n" class="btn_red_l">확인</a>
         <a href="#n" class="btn_dark_l">취소</a>
      </p> -->
	
</div><!-- //include left_frm  -->







<%@ include file="./../../../include/footer.jsp" %>
<script>

function memberUpdate(){
	if($('input[name=pwdCheck]').val().trim() == ""){
		/* alert("회원정보 재 확인을 위해 \n 패스워드를 입력해주세요");
		$("input[name=pwdCheck]").focus(); */
		Swal.fire({
        	  icon: 'warning',
        	  title: '회원정보 확인을 위해.',
        	  text:'패스워드를 입력해주세요',
        	  showConfirmButton: true
        	}).then(function(){
        		$("input[name=pwdCheck]").focus();
        	});
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
					/* alert("비밀번호 정보가 다릅니다.\n다시 입력해주세요");
					return; */
					Swal.fire({
			        	  icon: 'warning',
			        	  title: '비밀번호 정보가 다릅니다.',
			        	  text:'다시 입력해주세요',
			        	  showConfirmButton: true
			        	}).then(function(){
			        		return;
			        	});
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
		/* alert("회원정보 재 확인을 위해 \n 패스워드를 입력해주세요");
		$("input[name=pwdCheck]").focus(); */
		Swal.fire({
      	  icon: 'warning',
      	  title: '회원정보 확인을 위해.',
      	  text:'패스워드를 입력해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$("input[name=pwdCheck]").focus();
      	});
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
					/* alert("비밀번호 정보가 다릅니다.\n다시 입력해주세요");
					return; */
					Swal.fire({
			        	  icon: 'warning',
			        	  title: '비밀번호 정보가 다릅니다.',
			        	  text:'다시 입력해주세요',
			        	  showConfirmButton: true
			        	}).then(function(){
			        		return;
			        	});
				}else{
					/* if(confirm("정말 탈퇴 하시겠습니까?")){
						location.href="memberEscape.do";
					}else{
						return;
					} */
					Swal.fire({
						  title: '정말 탈퇴 하시겠습니까?',
						  icon: 'question',
						  showCancelButton: true,
						  confirmButtonColor: '#3085d6',
						  cancelButtonColor: '#d33',
						  cancelButtonText:'아니요',
						  confirmButtonText: '예'
						}).then((result) => {
						  if (result.value) {
							  location.href="memberEscape.do";
						  }else{
							  return;
						  }
						})
				};
			},
			error:function(request,status,error){
				alert(error);
			}
		});
		
	}
};
</script>

