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
	if(confirm("세션이 만료되었습니다.\n 다시 로그인 하시겠습니까?")){
		location.href="loginView.do";
	}else{
		location.href="main.do";
	}
</script>
<%
}
memberDto memberDetail = (memberDto)request.getAttribute("memberDetail");

%>

<%@ include file="./../../../include/left_frm.jsp" %>
	
	<!--  detail main -->
	<div class="cusSec_right">
	<div class="snsMemberDetail">	
	   <form method="post" action="">
	      <div class="frm_cont border-btm">
			<div>
				<div class ="company_regi">
				<label>아이디</label>
					<input type="text" name="id" value="${loginUser.id}" readonly="readonly">
					<input type="hidden" name="mem_seq" value="${loginUser.mem_seq}">
				</div>
			</div>
			
			<div class="frm_line clfix">
				<div class ="company_regi" style="margin-top: 10px;">
	            <div class="cont nameComentColor">
	            <label>이름</label>
			<%
			// SNS로 첫로그인시 초기setting
			if(memberDetail.getUser_name() == null || memberDetail.getUser_name().equals("")){
			%>
				<input class="memberName" type="text" maxlength="4" name="user_name" id="name" value="" placeholder="한글만 입력가능">
			<%
			// 초기세팅 이후
			}else{
			%>
				<input type="text" class="memberName" name="user_name" value="${memberDetail.user_name}" readonly="readonly">
			<%	
			}
			%>
				<span class="nameCheck"></span>
				</div>
				</div>
			</div>
			
			<div class="frm_line clfix">
	            <div class ="company_regi" style="margin-top: 10px;">
	            <div class="cont nickComentColor">
	            <label>닉네임</label>
			<%
			// SNS로 첫로그인시 초기setting
			if(memberDetail.getNick_name() == null || memberDetail.getNick_name().equals("")){
			%>
				<input class="memberNick" type="text" maxlength="10" name="nick_name" id="nick_name" value="" placeholder="최대10글자">
	            <button type="button" onclick="nickCheck()" class="frm_adr_btn" style="width:80px;height:40px; background: #f2f2f2; margin-top: 10px;">중복체크</button>
			<%
			// 초기세팅 이후
			}else{
			%>
				<input type="text" class="memberNick" name="nick_name" value="${memberDetail.nick_name}" readonly="readonly">
			<%	
			}
			%>
				<span class="nickCheck"></span>
				</div>
				</div>
			</div>
			
			<div class="frm_line clfix">
	            <div class ="company_regi" style="margin-top: 10px;">
	            <div class="cont phoneComentColor">
	            <label>연락처</label>
			<%
			// SNS로 첫로그인시 초기setting
			if(memberDetail.getPhone() == null || memberDetail.getPhone().equals("")){
			%>
				<input class="memberPhone" type="text" maxlength="11" name="phone" placeholder="(-)하이픈 제외하고 입력">
			<%
			// 초기세팅 이후
			}else{
			%>
				<input type="text" class="memberPhone" name="phone" value="${memberDetail.phone}" readonly="readonly">
			<%	
			}
			%>
				<span class="phoneCheck"></span>
				</div>
				</div>
			</div>
			
			<div class="frm_line clfix">
				<div class ="company_regi" style="margin-top: 10px;">
	           <label>생년월일</label>
			<%
			// SNS로 첫로그인시 초기setting
			if(memberDetail.getBirthday()== null || memberDetail.getBirthday().equals("")){
			%>
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
				
				<div class="frm_line clfix">
		            <div class="tit"></div>
		            <div class="cont dayComentColor">
		               <input class="memberDay" type="text" maxlength="2" name="memberDate" id="day" value="" placeholder="일(01~31)">
		               <span class="dayCheck"></span>
		            </div>            
	         	</div>                           
	            <input type="hidden" name="birthday" id="birthday" value="">
			<%
			// 초기세팅 이후
			}else{
				String month = memberDetail.getBirthday().substring(0,2);
				String day = memberDetail.getBirthday().substring(2);
				String birth = month + "-"+day;
			%>
				<div>
					<input type="text" name="birthday" value="<%=birth %>" readonly="readonly">
					<input type="hidden" class="memberDay" value=<%=day %>>
					<input type="hidden" class="memberYear" name="memberYear" value="00000">
					<span class="dayCheck">
						<input type="hidden" class="alert-green">
					</span>
				</div>
			<%	
			}
			%>
			</div>
			</div>
			
			<div class="frm_line clfix">
				<div class ="company_regi" style="margin-top: 10px;">
	           <div class="cont">
	           <label>주소</label>
			<%
			
			if(memberDetail.getAddress()== null || memberDetail.getAddress().equals("")){
			%>
	               <input type="text" id="kakao_postcode" name="memberPostCode" readonly="readonly" placeholder="우편번호"> 
	                <button type="button" onclick="DaumPostcode()" class="frm_adr_btn" style="width:80px;height:40px; background: #f2f2f2; margin-top: 10px;">주소검색</button><br>
	                <input type="text" class="mt08" id="kakao_roadAddress" name="memberStreetName" placeholder="도로명주소" readonly="readonly">
	                <input type="text" style="display:none;" id="kakao_jibunAddress" placeholder="지번주소">
	                <span id="guide" style="color:#999;display:none"></span>
	                <input type="text"  class="mt08" id="kakao_detailAddress" name="memberDetailStreetName" placeholder="상세주소">
	                <input type="text" style="display:none;" id="kakao_extraAddress" placeholder="참고항목">
	                <input type="hidden" name="address" id="address" value="">
	        <%
			}else{
			String[] addr = memberDetail.getAddress().split("/");
	        %>
					<input type="text" id="kakao_postcode" name="memberPostCode" readonly="readonly" value="<%=addr[0]%>">
					<input type="text" id="kakao_roadAddress" name="memberStreetName" readonly="readonly" value="<%=addr[1]%>">
					<input type="text" id="kakao_detailAddress" name="memberDetailStreetName" readonly="readonly" value="<%=addr[2]%>">
	            	<input type="hidden" name="address" id="address" value="${memberDetail.address}">
			<%
			}
			%>
				</div>
			</div>
			<%
			if(memberDetail.getUser_name() == null || memberDetail.getUser_name().equals("") ||
				memberDetail.getNick_name() == null || memberDetail.getNick_name().equals("") ||
				memberDetail.getPhone() == null || memberDetail.getPhone().equals("") ||
				memberDetail.getBirthday()== null || memberDetail.getBirthday().equals("") ||
				memberDetail.getAddress()== null || memberDetail.getAddress().equals("")){
			%>
				<div>
 	         		<button type="button" class="reserv_btn sBtn" style="width:80px;height:40px; background: #f2f2f2; margin-top: 10px;" >적용</button> 
	         	</div>
	         	<script>
					alert("원활한 이용을 위해 \n 미입력된 정보를 기입해주세요^^");
				</script>
			<%
			}else{
			%>	
				<div>
		         	<button type="button" class="reserv_btn sBtn2" style="width:80px;height:40px; background: #f2f2f2; margin-top: 10px;">변경</button>
		        </div>
		    <%
			}
		    %>
		    	<input type="hidden" name="user_api" value="${memberDetail.user_api }">			
	         </div>
	         </div>
		</form>
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
<script src="<%=request.getContextPath() %>/js/snsRegi.js"></script>

<%-- <%
String info = request.getAttribute("info")==null?"":(String)request.getAttribute("info");
if(info.equals("false")){
%>
<script>
alert("원활한 이용을 위해 \n 미입력된 정보를 기입해주세요^^");
</script>
<%
}
%>  --%>



