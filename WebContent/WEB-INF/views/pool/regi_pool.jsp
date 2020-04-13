<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../../../include/header.jsp" %>
<script src = "<%=request.getContextPath() %>/js/ckeditor/ckeditor.js"></script>

<!-- container S : -->
<div class="container" >
	<div class ="container_subWrap">
		<h1>수영장등록</h1>
		<form name ="poolForm" id ="poolForm" method ="post" enctype="multipart/form-data">
		<div class ="company_regi"  style = "margin-top : 10px;">
			<label style = "width:100px;">수영장명</label>
			<input name = "pool_name" id = "pool_name" type="text" placeholder="수영장명을 입력해주세요" size = "500">
		</div>
		<div class ="company_regi" style = "margin-top : 10px;">
			<label style = "width:100px;">대표자명</label>
			<input type="text" name = "pool_owner" id = "pool_owner"  placeholder="대표자명을 입력해주세요" size = "150">
		</div>
		<div class ="company_regi"  style = "margin-top : 10px;">
			<label style = "width:100px;">사업자등록번호</label>
			<input type="text" id = "pool_number" name = "pool_number" placeholder="사업자 등록번호를 입력해주세요" size = "150">
		</div>
		<div class ="company_regi"  style = "margin-top : 10px;">
			<label style = "width:100px;">수영장 주소</label>
			<input type="text" id="sample6_postcode" onclick="sample6_execDaumPostcode()" placeholder="우편번호" readonly >

			<input type="button" class = "btn_line_s"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input style = "margin-top:10px; margin-left : 120px;" type="text" id="sample6_address" placeholder="주소" readonly ><br>
			<input style = "margin-top:10px; margin-left : 120px;" type="text" id="sample6_detailAddress" placeholder="상세주소" >
			<input style = "margin-top:10px;" type="text" id="sample6_extraAddress" placeholder="참고항목" readonly >
			<input type = "hidden" id ="pool_addr" name ="pool_addr">

		</div>
		<div class ="company_regi"  style = "margin-top : 10px;">
			<label style = "width:100px;">수영장 전화번호</label>
			<input id = "pool_tel" name = "pool_tel" type="text" placeholder="전화번호 입력해주세요" size = "150">
		</div>
		<div class ="time" style = "margin-top : 10px;">
			<label style = "width:100px;">영업시간</label>
			<select id="open_hour">
				<% for (int i =7; i<=24; i++){ %>
				<option><%=i %></option>
				<%} %>
			</select>시 
			<select id = "open_min">
				<%for(int i=0; i<=59; i++){ %>
					<option><%=(i<10)? "0"+i: i %></option>
				<%} %>
			</select>분 ~ 
			<select id="close_hour">
				<% for (int i =7; i<=24; i++){ %>
				<option><%=i %></option>
				<%} %>
			</select>시 
			<select id = "close_min">
				<%for(int i=0; i<=59; i++){ %>
					<option><%=(i<10)? "0"+i: i %></option>
				<%} %>
			</select>분
			<input type ="hidden" id = "pool_time" name = "pool_time">
		</div>
		<div class ="company_regi"  style = "margin-top : 10px;">
			<label style = "width:100px;">시간당 가격</label>
			<input type="text" id = "pool_price" name = "pool_price" placeholder="가격" size = "150">
		</div>
		<div class ="company_regi"  style = "margin-top : 10px;">
			<label style = "width:100px;">샤워실 여부</label>
			<input id = "chk_shower" type="checkbox">
			<input type="hidden" name = "pool_shower" id="pool_shower">
		</div>
		<div class ="company_regi"  style = "margin-top : 10px;">
			<label style = "width:100px;">대형견 이용 여부</label>
			<input id ="chk_large" type="checkbox">
			<input type="hidden" name = "pool_large" id="pool_large">
		</div>
		<div class ="company_regi"  style = "margin-top : 10px;">
			<label style = "width:100px;">주차장 여부</label>
			<input id="chk_parking" type="checkbox">
			<input type="hidden" name = "pool_parking" id ="pool_parking">
		</div>
		<div class ="company_regi" style = "margin-top : 10px;">
			<label style = "width:100px;">수영장 대표 사진</label>
			<input type="file" name = "fileload" accept=".gif, .jpg, .png">
			<p style = "font-size:8pt; color:blue; margin-left:120px;">500 X 500픽셀(Pixel) 이미지(.gif, .jpg, .png)파일만 업로드 가능</p>
		</div>
		<div class ="company_regi" style = "margin-top : 10px;">
			<textarea id="content" ></textarea>
			<script>CKEDITOR.replace('content',{filebrowserUploadUrl:'poolimageUpload.do'});</script>
			<input type="hidden" id ="pool_content" name ="pool_content" >
			<input type="hidden" name = "mem_seq" value ="${login.mem_seq }">
		
		</div>
		</form>
		<div style ="margin-top:10px;" align ="center">
			<input class = "btn_line_m" type ="button" id ="pool_regi" value = "등록">		
			
			<input class ="btn_line_m" type ="button" value = "취소">		
			
		</div>
		
	</div>
</div>
<!-- container E : -->
<script type="text/javascript">
	$("#pool_regi").click(function(){
		var rgEx = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
		if($("#pool_name").val().trim() == ''){
			alert("상호명을 입력해 주세요");
			$("#pool_name").focus();
		}  else if($("#pool_owner").val().trim() == ''){
			alert("대표자명을 입력해주세요");
			$("#pool_owner").focus();
		} else if($("#pool_number").val().trim() == ''){
			alert("사업자 등록번호를 입력해 주세요");
			$("#pool_number").focus();
		}else if($("#sample6_postcode").val() == ''){
			alert("주소를 입력해 주세요");
			sample6_execDaumPostcode();
		} else if($("#pool_tel").val().trim()==''){
			alert("전화번호를 입력해 주세요");
			$("#pool_tel").focus();
		} else if(!rgEx.test($("#pool_tel").val())){
			alert("올바른 전화번호가 아닙니다.");
			$("#pool_tel").val("");
			$("#pool_tel").focus();
		} else if($("#pool_price").val().trim()==''){
			alert("기본 금액을 입력해 주세요");
			$("#pool_price").focus();
		}  else {
			var addr = $("#sample6_postcode").val()+"/"+$("#sample6_address").val()+"/" +$("#sample6_detailAddress").val();
			var time = $("#open_hour").val()+":"+$("#open_min").val()+ " ~ " + $("#close_hour").val() + ":" + $("#close_min").val();
			$("#pool_time").val(time);
			$("#pool_addr").val(addr);
			var content = CKEDITOR.instances.content.getData();
			$("#pool_content").val(content);
			//alert($("#shop_content").val());
			
			if($("#chk_shower").is(":checked")==true){
				$("#pool_shower").val("0");
			} else {
				$("#pool_shower").val("1");
			}

			if($("#chk_large").is(":checked")==true){
				$("#pool_large").val("0");
			} else {
				$("#pool_large").val("1");
			}

			if($("#chk_parking").is(":checked")==true){
				$("#pool_parking").val("0");
			} else {
				$("#pool_parking").val("1");
			}
			
			var form = $('#poolForm')[0];
			var formData = new FormData(form);
			
		      $.ajax({
		          url:"./poolRegiAf.do",
		          type:'post',
		          data: formData,
		          enctype:'multipart/form-data',
		          processData: false,
		          contentType: false,
		          cache: false,
		          timeout: 600000,
		          //datatype:'text',
		          success: function (data){
		             alert("수영장 등록에 성공하셨습니다.");
		             location.href="getPoolList.do";
		          },
		          error: function (e){
		             alert("통신실패");
		     	}
			});
		}		
	});
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<%@ include file="./../../../include/footer.jsp" %>