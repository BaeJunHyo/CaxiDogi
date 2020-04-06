<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../../../include/header.jsp" %>

<!-- container S : -->
<div class="container" >
	<div class ="container_subWrap">
		<h1>업체등록</h1>
		<div class ="company_regi"  style = "margin-top : 10px;">
		
			<label style = "width:100px;">업체명</label>
			<input  type="text" id = "company_name" placeholder="업체명을 입력해주세요" size = "500">
		</div>
		<div class ="company_regi"  style = "margin-top : 10px;">
			<label style = "width:100px;">주소</label>
			<input type="text" id="sample6_postcode" onclick="sample6_execDaumPostcode()" placeholder="우편번호" readonly >

			<input type="button" class = "btn_line_s"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input style = "margin-top:10px; margin-left : 120px;" type="text" id="sample6_address" placeholder="주소" readonly ><br>
			<input style = "margin-top:10px; margin-left : 120px;" type="text" id="sample6_detailAddress" placeholder="상세주소" >
			<input style = "margin-top:10px;" type="text" id="sample6_extraAddress" placeholder="참고항목" readonly >

		</div>
		<div class ="company_regi"  style = "margin-top : 10px;">
			<label style = "width:100px;">전화번호</label>
			<input type="text" id = "company_tel" placeholder="전화번호 입력해주세요" size = "150">
		</div>
		<div class ="company_regi" style = "margin-top : 10px;">
			<label style = "width:100px;">대표자명</label>
			<input type="text" id = "company_owner" placeholder="대표자명을 입력해주세요" size = "150">
		</div>
		<div class ="company_regi"  style = "margin-top : 10px;">
			<label style = "width:100px;">사업자등록번호</label>
			<input type="text" id = "company_number" placeholder="사업자 등록번호를 입력해주세요" size = "150">
		</div>
		<div class ="company_regi" style = "margin-top : 10px;">
			<label style = "width:100px;">사업구분</label>
			<select id = "company_category">
				<option value ="no" selected="selected">선택</option>
				<option value ="1">미용</option>
				<option value ="2">수영장</option>
				<option value ="3">운동장</option>
			</select>
		</div>
		<div style ="margin-top:10px;" align ="center">
			<input class = "btn_line_m" type = "button" id = "regi_company" value = "등록">		
			<input class = "btn_line_m" type = "button" id = "regi_cancle" value = "취소">					
		</div>
	</div>
</div>
<!-- container E : -->
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
<script type="text/javascript">
	$(document).ready(function(){
		$("#regi_company").click(function(){
			var rgEx = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
			if($("#company_name").val().trim() == ''){
				alert("업체명을 입력해 주세요");
				$("#company_name").focus();
			} else if($("#sample6_postcode").val() == ''){
				alert("주소를 입력해 주세요");
				sample6_execDaumPostcode();
			} else if($("#company_tel").val().trim()==''){
				alert("전화번호를 입력해 주세요");
				$("#company_tel").focus();
			} else if(!rgEx.test($("#company_tel").val())){
				alert("올바른 전화번호가 아닙니다.");
				$("#company_tel").val("");
				$("#company_tel").focus();
			}  else if($("#company_owner").val().trim() == ''){
				alert("대표자명을 입력해주세요");
				$("#company_owner").focus();
			} else if($("#company_number").val().trim() == ''){
				alert("사업자 등록번호를 입력해 주세요");
				$("#company_number").focus();
			} else if($("#company_category").val()=="no"){
				alert("업체 구분을 선택해 주세요");
				$("#company_category").focus();
			} else {
				var regiData = {
						company_name : $("#company_name").val(),
						company_addr : $("#sample6_postcode").val()+"/"+$("#sample6_address").val()+" " +$("#sample6_detailAddress").val(),
						company_tel : $("#company_tel").val(),
						company_owner : $("#company_owner").val(),
						company_number : $("#company_number").val(),
						company_category : $("#company_category").val(),
						company_seller : "${login.id}"
					};

				$.ajax({
					url : "./companyRegiAf.do",
					data : regiData,
					type : "post",
					async : true,
					success : function(resp) {
						if(resp.trim()=="ok"){
							alert("업체 등록에 성공하셨습니다!")
							location.href="main.do";

						} else {
							alert("업체 등록에 실패하셨습니다.");
							$("#company_name").val("");
							$("#sample6_postcode").val("");
							$("#sample6_address").val("");
							$("#sample6_detailAddress").val("");
							$("#sample6_extraAddress").val("");
							$("#company_tel").val("");
							$("#company_owner").val("");
							$("#company_number").val("");
						}
					},
					error : function() {
						alert("e");
					}
				});
			}
		});
	});
</script>

<%@ include file="./../../../include/footer.jsp" %>