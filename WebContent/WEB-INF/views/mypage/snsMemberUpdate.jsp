<%@page import="cd.com.a.model.memberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
memberDto memberDetail = (memberDto)request.getAttribute("memberDetail");
String[] addr = memberDetail.getAddress().split("/");
%>

<%@ include file="./../../../include/left_frm.jsp" %>
	
	<!--  detail main -->
	<div class="cusSec_right">
	<div class="snsMemberDetail">	
	   <form method="post" action="">
		      <div class="frm_cont border-btm">
		      
		         <div class="frm_line clfix">
		         <div class ="company_regi" style="margin-top: 10px;">
		            <div class="cont idComentColor">
		            	<label>아이디</label>
		               <input class="ttext memberId" type="text" maxlength="30" name="id" id="id" value="${memberDetail.id }" readonly="readonly">
		               <input type="hidden" name="mem_seq" value="${memberDetail.mem_seq }" >
		               <input type="hidden" name="user_api" value="${memberDetail.user_api }" >
		            </div>
		         </div>            
		         </div>

		          <div class="frm_line clfix">
		          <div class ="company_regi" style="margin-top: 10px;">
		            <div class="cont nameComentColor">
			            <label>이름</label>
		               <input class="memberName" type="text" maxlength="4" name="user_name" id="name" value="${memberDetail.user_name }" readonly="readonly">
		            </div>
		         </div>            
		         </div>
		         
		         <div class="frm_line clfix">
		         <div class ="company_regi" style="margin-top: 10px;">
		            <div class="cont nickComentColor">
			            <label>닉네임</label>
		               <input class="memberNick" type="text" maxlength="10" name="nick_name" id="nick_name" value="${memberDetail.nick_name }" placeholder="최대10글자">
		               <button type="button" onclick="nickCheck()" class="frm_adr_btn" style="width:80px;height:40px; background: #f2f2f2; margin-top: 10px;">중복체크</button>
		               <span class="nickCheck"></span>
		            </div>
		         </div>            
		         </div>
		         
		         <div class="frm_line clfix">
		         <div class ="company_regi" style="margin-top: 10px;">
		            <div class="cont phoneComentColor">
			            <label>연락처</label>
		               <input class="memberPhone" type="text" maxlength="11" name="phone" value="${memberDetail.phone }"placeholder="(-)하이픈 제외하고 입력">
		               <span class="phoneCheck"></span>
		            </div> 
		         </div>           
		         </div>
		         
		         
		         <div class="frm_line clfix">
		         <div class ="company_regi" style="margin-top: 10px;">
		            <label>주소</label>
		            <div class="cont">
		               <!-- <input type="text" class="frm-address" value="서울특별시 서초구 서초4동 강남대로 459" readonly="readonly"><span class="frm_adr_btn">주소검색</span><br>
		               <input class="mt08" type="text" value="2층 2강의실" readonly="readonly"> -->
		               <input type="text" id="kakao_postcode" name="memberPostCode" value="<%=addr[0]%>"readonly="readonly" placeholder="우편번호"> 
		                <button type="button" onclick="DaumPostcode()" class="frm_adr_btn" style="width:80px;height:40px; background: #f2f2f2; margin-top: 10px;">주소검색</button><br>
		                <input type="text" class="mt08" id="kakao_roadAddress" name="memberStreetName" placeholder="도로명주소" value="<%=addr[1]%>"readonly="readonly">
		                <input type="text" style="display:none;" id="kakao_jibunAddress" placeholder="지번주소">
		                <span id="guide" style="color:#999;display:none"></span>
		                <input type="text"  class="mt08" id="kakao_detailAddress" name="memberDetailStreetName" value="<%=addr[2]%>"placeholder="상세주소">
		                <input type="text" style="display:none;" id="kakao_extraAddress" placeholder="참고항목">
		            	<input type="hidden" name="address" id="address" value="">
		            </div>
		         </div>            
		         </div>
		         
		      
		      </div><!-- frm_cont -->      
		      <button class="reserv_btn sBtn" type="button" style="width:80px;height:40px; background: #f2f2f2; margin-top: 10px;">변경</button>
		      <button class="reserv_btn sBtn2" type="button" style="width:80px;height:40px; background: #f2f2f2; margin-top: 10px;">메인으로</button>
		   </form><!-- insertFrm -->
	</div><!-- // frm_wrap -->
	</div><!-- //cusSec_right -->
</div> <!-- // include left_frm  -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('kakao_postcode').value = data.zonecode;
                document.getElementById("kakao_roadAddress").value = roadAddr;
                document.getElementById("kakao_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("kakao_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("kakao_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<%@ include file="./../../../include/footer.jsp" %>
<script src="<%=request.getContextPath() %>/js/sns_update.js"></script>

