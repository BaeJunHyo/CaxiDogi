<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		<form method="post" action="">
		      <div class="frm_cont border-btm">
		      
		         <div class="frm_line clfix">
		            <div class="tit">아이디</div>
		            <div class="cont idComentColor">
		               <input class="ttext memberId" type="text" maxlength="30" name="id" id="id" value="${loginUser.id }" readonly="readonly">
		               <button type="button" onclick="idCheck()" class="frm_adr_btn">중복체크</button>
		               <span class="idCheck"></span>
		            </div>            
		         </div>
		         
		         <div class="frm_line clfix">
		            <div class="tit">비밀번호</div>
		            <div class="cont pwdComentColor">
		               <input class="memberPwd" type="password" maxlength="20" name="memberPassword" value="" placeholder="6~20자 영문자, 숫자">
		               <span class="pwdCheck"></span>
		            </div>            
		         </div>
		         
		         
		          <div class="frm_line clfix">
		            <div class="tit">이름</div>
		            <div class="cont nameComentColor">
		               <input class="memberName" type="text" maxlength="4" name="user_name" id="name" value="${loginUser.user_name }" readonly="readonly">
		               <span class="nameCheck"></span>
		            </div>            
		         </div>
		         
		         <div class="frm_line clfix">
		            <div class="tit">닉네임</div>
		            <div class="cont nickComentColor">
		               <input class="memberNick" type="text" maxlength="10" name="nick_name" id="nick_name" value="" placeholder="최대10글자">
		               <button type="button" onclick="nickCheck()" class="frm_adr_btn">중복체크</button>
		               <span class="nickCheck"></span>
		            </div>            
		         </div>
		         
		         <div class="frm_line clfix">
		            <div class="tit">연락처</div>
		            <div class="cont phoneComentColor">
		               <input class="memberPhone" type="text" maxlength="11" name="phone" placeholder="(-)하이픈 제외하고 입력">
		               <span class="phoneCheck"></span>
		            </div>            
		         </div>
		         
		         <div class="frm_line clfix">
		            <div class="tit">생일</div>
		            <!-- <div class="cont">
		               <input class="byear" type="text" name="memberYear" value="" maxlength="4" placeholder="년(4자)">
		            </div>  -->           
		            <div class="cont">
		               <select class="select-month" name="memberMonth" id="month">
		                  <option value="월">월</option>
		                  <option value="01">1</option>
		                  <option value="02">2</option>
		                  <option value="03">3</option>
		                  <option value="04">4</option>
		                  <option value="05">5</option>
		                  <option value="06">6</option>
		                  <option value="07">7</option>
		                  <option value="08">8</option>
		                  <option value="09">9</option>
		                  <option value="10">10</option>
		                  <option value="11">11</option>
		                  <option value="12">12</option>
		               </select>
		            </div>
		           <!--  <div class="cont">
		               <input class="bday" type="text" name="memberDate" id="day"value="" maxlength="2" placeholder="일(01~31)">   
		               <span class="">태어난 년도 4자리를 정확하게 입력하세요.</span>            
		            </div> -->
		            
		            <div class="frm_line clfix">
			            <div class="tit"></div>
			            <div class="cont dayComentColor">
			               <input class="memberDay" type="text" maxlength="2" name="memberDate" id="day" value="" placeholder="일(01~31)">
			               <span class="dayCheck"></span>
			            </div>            
		         	</div>                           
		            <input type="hidden" name="birthday" id="birthday" value="">
		         </div>
		         
		         
		         <div class="frm_line clfix">
		            <div class="tit">주소</div>
		            <div class="cont">
		               <!-- <input type="text" class="frm-address" value="서울특별시 서초구 서초4동 강남대로 459" readonly="readonly"><span class="frm_adr_btn">주소검색</span><br>
		               <input class="mt08" type="text" value="2층 2강의실" readonly="readonly"> -->
		               <input type="text" id="kakao_postcode" name="memberPostCode" readonly="readonly" placeholder="우편번호"> 
		                <span onclick="DaumPostcode()" class="frm_adr_btn">주소검색</span><br>
		                <input type="text" class="mt08" id="kakao_roadAddress" name="memberStreetName" placeholder="도로명주소" readonly="readonly">
		                <input type="text" style="display:none;" id="kakao_jibunAddress" placeholder="지번주소">
		                <span id="guide" style="color:#999;display:none"></span>
		                <input type="text"  class="mt08" id="kakao_detailAddress" name="memberDetailStreetName" placeholder="상세주소">
		                <input type="text" style="display:none;" id="kakao_extraAddress" placeholder="참고항목">
		            	<input type="hidden" name="address" id="address" value="">
		            </div>            
		         </div>
		         
		         <div class="frm_line clfix" style="padding:40px 0;">
		            <div class="tit floatNone">비밀번호 찾기 질문</div>
		            <div class="cont floatNone mt20">
		               <select class="select-hint" name="pass_question" id="pass_question">
		                  <option value="1" selected>기억에 남는 추억의 장소는?</option>
		                  <option value="2">나의 보물 1호는?</option>
		                  <option value="3">나의 출신 초등학교는?</option>
		                  <option value="4">가장 좋아하는 색깔은?</option>
		                  <option value="5">아버지 성함은?</option>
		               </select><br>
		               <input class="hint-answer" type="text" name="pass_hint" id="pass_hint" placeholder="답을 입력해주세요">
		            </div>            
		         </div>      
		      </div><!-- frm_cont -->      
		      <button class="reserv_btn sBtn2" type="button">메인으로</button>
		   </form><!-- insertFrm -->
	</div><!--// contents -->
</div><!-- //include left_frm  -->

<%@ include file="./../../../include/footer.jsp" %>


