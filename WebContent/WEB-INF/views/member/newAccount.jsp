<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ include file="./../../../include/header.jsp" %>
<style>
.kpaddr{
	margin-left: 10px;
}
.kraddr{
	margin-left: 10px;
	margin-top: 3px;
}
.basic_tableStyle td{
	text-align: left;
}
.select-hint{
	margin-left: 10px;
	width: 200px;
}
.hint-answer{
	margin-left: 10px;
}
.select-month{
	margin-bottom: 0px;
}

.frm_adr_btn{
	background: #000;
    color: #fff;
    padding: 3px 8px;
    vertical-align: middle;
}
.sbtn2{
	display: inline-block;
    height: 50px;
    padding: 0 17px;
    text-align: center;
    font-size: 18px;
    line-height: 50px;
    font-weight: normal;
    color: #fff;
    margin-left: 5px;
    background: #000000;
}
.sBtn{
	display: inline-block;
    height: 50px;
    padding: 0 17px;
    text-align: center;
    font-size: 18px;
    line-height: 50px;
    font-weight: normal;
    color: #fff;
    background: #7d8d57;
}

</style>
<!-- container S : -->
<div class="container">
	 <div class = "container_subWrap">
	<!-- 	<div class="new_regi">	
		   <form method="post" action="">
		      <div class="frm_cont border-btm">
		      
		         <div class="frm_line clfix">
		            <div class="tit">아이디</div>
		            <div class="cont idComentColor">
		               <input class="ttext memberId" type="text" maxlength="30" name="id" id="id" value="" placeholder="example@example.com">
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
		            <div class="tit">비밀번호 재확인</div>
		            <div class="cont pwdReCheckComentColor">
		               <input class="memberPwdReCheck"  type="password" maxlength="20" name="password" value="">
		               <span class="pwdEqualCheck"></span>
		            </div>            
		         </div>
		         
		         <div class="frm_line clfix">
		            <div class="tit">이름</div>
		            <div class="cont">
		               <input class="ttext" type="text" name="user_name" id="name" value="">
		            </div>            
		         </div>
		         
		          <div class="frm_line clfix">
		            <div class="tit">이름</div>
		            <div class="cont nameComentColor">
		               <input class="memberName" type="text" maxlength="4" name="user_name" id="name" value="" placeholder="한글만 입력가능">
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
		            <div class="cont">
		               <input class="byear" type="text" name="memberYear" value="" maxlength="4" placeholder="년(4자)">
		            </div>            
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
		            <div class="cont">
		               <input class="bday" type="text" name="memberDate" id="day"value="" maxlength="2" placeholder="일(01~31)">   
		               <span class="">태어난 년도 4자리를 정확하게 입력하세요.</span>            
		            </div>
		            
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
		               <input type="text" class="frm-address" value="서울특별시 서초구 서초4동 강남대로 459" readonly="readonly"><span class="frm_adr_btn">주소검색</span><br>
		               <input class="mt08" type="text" value="2층 2강의실" readonly="readonly">
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
		      </div>frm_cont      
		      <button class="reserv_btn sBtn" type="button">가입하기</button>
		      <button class="reserv_btn sBtn2" type="button">메인으로</button>
		   </form>insertFrm
		</div>formWrap -->

	<!--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->
	
   <div class="container_subWrap">
	<div class="cusSec_tableWrap">
      <h3>
         <span class="t_sbj">기본정보</span>
         <span class="fw_normal fs13 c_gray">*는 필수 입력입니다.</span>
      </h3>
      <form method="post" action="">
      <table class="basic_tableStyle td_p0 basic_tableStyle_vert">
         <colgroup>
            <col width="150px">
            <col width="*">
         </colgroup>
         <tbody>
            <tr class="cont nameComentColor">
               <th>이름 *</th>
               <td class="tl"><input type="text" class="memberName" name="user_name" id="name" value="" placeholder="한글만 입력가능">
               <span class="nameCheck"></span>
               </td>
            </tr>
             <tr class="cont idComentColor">
               <th>아이디 *</th>
               <td class="tl">
                  <input type="text" class="ttext memberId" name="id" id="id" value="" placeholder="example@example.com">
                  <button type="button" onclick="idCheck()" class="frm_adr_btn">중복체크</button>
                  <!-- <a href="#n" class="btn_dark_s" style="height: 33px; line-height: 33px;">중복확인</a> -->
                  <span class="idCheck"></span>
               </td>
            </tr>
            
            <tr class="cont nickComentColor">
               <th>닉네임 *</th>
               <td class="tl"><input type="text" class="memberNick" name="nick_name" id="nick_name" value="" placeholder="최대10글자">
               <button type="button" onclick="nickCheck()" class="frm_adr_btn">중복체크</button>
		       <span class="nickCheck"></span>
               </td>
            </tr>
           
            <tr class="cont pwdComentColor">
               <th>비밀번호 *</th>
               <td class="tl">
                  <input class="memberPwd" type="password" maxlength="20" name="memberPassword" value="" placeholder="6~20자 영문자, 숫자">
		          <span class="pwdCheck"></span>
                  <!-- <span class="secureTxt">보안등급</span> -->
                  <ul class="dot_list c_gray pt10">
                     <li>6~20자의 영문,숫자를 조합해서 입력해주세요.</li>
                      <li>한글과 여백은 입력이 불가합니다.</li>
                      <li>동일한 문자/숫자를 반복하여 3자리 이상 입력하거나 연속된 문자열을 3자리 이상 입력이 불가합니다.</li>
                      <li>아이디 및 개인정보와 같거나 포함하면 안됩니다.</li>
                      <li>기타 일반 정보 등으로부터 추측이 용이한 비밀번호는 피해주십시오.</li>
                  </ul>
               </td>
            </tr>
            <tr class="cont pwdReCheckComentColor">
               <th>비밀번호확인 *</th>
               <td class="tl"><input class="memberPwdReCheck"  type="password" maxlength="20" name="password" value="">
               <span class="pwdEqualCheck"></span></td>
            </tr>
            
            <tr class="cont phoneComentColor">
               <th>휴대폰 *</th>
               <td class="tl">
                  
                  <input type="text" class="mr0 memberPhone"  type="text" maxlength="11" name="phone" placeholder="(-)하이픈 제외하고 입력">
                  <!-- <input type="checkbox" name=""><label>문자(SMS) 수신동의</label> -->
                  <span class="phoneCheck"></span>
               </td>
            </tr>
            <tr>
            	<th>주소 *</th>
            	<td>
            		<input type="text" id="kakao_postcode" name="memberPostCode" readonly="readonly" placeholder="우편번호" class="kpaddr"> 
	                <span onclick="DaumPostcode()" class="frm_adr_btn">주소검색</span><br>
	                <input type="text" class="mt08 kraddr" id="kakao_roadAddress" name="memberStreetName" placeholder="도로명주소" readonly="readonly">
	                <input type="text" style="display:none;" id="kakao_jibunAddress" placeholder="지번주소">
	                <span id="guide" style="color:#999;display:none"></span>
	                <input type="text"  class="mt08" id="kakao_detailAddress" name="memberDetailStreetName" placeholder="상세주소">
	                <input type="text" style="display:none;" id="kakao_extraAddress" placeholder="참고항목">
	            	<input type="hidden" name="address" id="address" value="">
            	</td>
            </tr>
            <tr class=" dayComentColor">
               <th>생년월일 *</th>
               <td class="tl">
                   <input class="byear" type="text" name="memberYear" value="" maxlength="4" placeholder="년(4자)">년&nbsp;&nbsp;
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
		               </select>&nbsp;&nbsp;
                  <input class="memberDay" type="text" maxlength="2" name="memberDate" id="day" value="" placeholder="일(01~31)">
			               <span class="dayCheck"></span>&nbsp;&nbsp;
                  <span class="inputWrap">
                     <span class="pr0"><input type="radio" name="b"><label>양력</label></span>
                     <span><input type="radio" name="b"><label>음력</label></span>
                  </span>
                  <input type="hidden" name="birthday" id="birthday" value="">
               </td>
            </tr>
            <tr>
            	<th>비밀번호 찾기 질문 *</th>
            	<td>
            		<select class="select-hint" name="pass_question" id="pass_question" >
		                  <option value="1" selected>기억에 남는 추억의 장소는?</option>
		                  <option value="2">나의 보물 1호는?</option>
		                  <option value="3">나의 출신 초등학교는?</option>
		                  <option value="4">가장 좋아하는 색깔은?</option>
		                  <option value="5">아버지 성함은?</option>
		               </select><br>
		               <input class="hint-answer" type="text" name="pass_hint" id="pass_hint" placeholder="답을 입력해주세요">
            	</td>
            </tr>
            <tr>
               <th>마케팅 정보 수신동의</th>
               <td class="tl">
                  <span class="inputWrap">
                     <span class="pr0"><input type="checkbox" name=""><label>SMS</label></span>
                     <span><input type="checkbox" name=""><label>이메일</label></span>
                     <span><input type="checkbox" name=""><label>DM</label></span>
                     <span><input type="checkbox" name=""><label>TM</label></span>
                  </span>
               </td>
            </tr>
         </tbody>
      </table>
      <p class="btnWrap tc">
		<button class="reserv_btn sBtn" type="button">가입하기</button>
		      <button class="reserv_btn sBtn2" type="button">메인으로</button>
	</p>
      </form>
			
   </div>
  </div>
   
</div><!-- container -->

<%@ include file="./../../../include/footer.jsp" %>
<!-- 카카오 주소 검색 -->
<%-- <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

<script src="<%=request.getContextPath() %>/js/regi.js"></script> --%>
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

<script src="<%=request.getContextPath() %>/js/regi.js"></script>




