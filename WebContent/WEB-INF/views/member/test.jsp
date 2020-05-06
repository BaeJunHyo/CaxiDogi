<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<%@ include file="./../../../include/header.jsp" %>
<script src = "<%=request.getContextPath() %>/js/ckeditor/ckeditor.js"></script>
<!-- container S : -->
<div class="container" >
   <div class ="container_subWrap">
      <h1>Shop등록</h1>
      <form name ="shopForm" id ="shopForm" method ="post" enctype="multipart/form-data">
      <div class ="company_regi"  style = "margin-top : 10px;">
      
         <label style = "width:100px;">Shop명</label>
         <input type="text" placeholder="업체명을 입력해주세요" id = "shop_name" name="shop_name" size = "500">
      </div>
      <div class ="company_regi" style = "margin-top : 10px;">
         <label style = "width:100px;">대표자명</label>
         <input type="text" id = "shop_owner" name = "shop_owner" placeholder="대표자명을 입력해주세요" size = "150">
      </div>
      <div class ="company_regi"  style = "margin-top : 10px;">
         <label style = "width:100px;">사업자등록번호</label>
         <input type="text" id = "shop_number" name = "shop_number" placeholder="사업자 등록번호를 입력해주세요" size = "150">
      </div>
      <div class ="company_regi"  style = "margin-top : 10px;">
         <label style = "width:100px;">Shop주소</label>
         <input type="text" id="sample6_postcode" onclick="sample6_execDaumPostcode()" placeholder="우편번호" readonly >

         <input type="button" class = "btn_line_s"  onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
         <input style = "margin-top:10px; margin-left : 120px;" type="text" id="sample6_address" placeholder="주소" readonly ><br>
         <input style = "margin-top:10px; margin-left : 120px;" type="text" id="sample6_detailAddress" placeholder="상세주소" >
         <input style = "margin-top:10px;" type="text" id="sample6_extraAddress" placeholder="참고항목" readonly >
         <input type = "hidden" id ="shop_addr" name ="shop_addr">

      </div>
      <div class ="company_regi"  style = "margin-top : 10px;">
         <label style = "width:100px;">Shop전화번호</label>
         <input type="text" id = "shop_tel" name = "shop_tel" placeholder="전화번호 숫자만 입력해주세요" size = "150">
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
         <input type ="hidden" id = "shop_time" name = "shop_time">
      </div>
      <div class ="company_regi" style = "margin-top : 10px;">
         <label style = "width:100px;">Shop사진</label>
         <input type="file" name = "fileload">
      </div>
      <div class ="company_regi"  style = "margin-top : 10px;">
         <label style = "width:100px;">Shop 한마디</label>
         <input type="text" id = "shop_etc" name = "shop_etc" placeholder="한줄 홍보" size = "150">
      </div>
      <div class ="company_regi" style = "margin-top : 10px;">
         <label style = "width:100px;">소형 금액</label>
         <input type="text" id = "shop_small_price" name = "shop_small_price"  placeholder="소형견" size = "150">
      </div>
      <div class ="company_regi" style = "margin-top : 10px;">
         <label style = "width:100px;">중형 금액</label>
         <input type="text" id = "shop_medium_price"  name = "shop_medium_price" placeholder="중형견" size = "150">
      </div>
      <div class ="company_regi" style = "margin-top : 10px;">
         <label style = "width:100px;">대형 금액</label>
         <input type="text" id = "shop_large_price" name = "shop_large_price" placeholder="대형견" size = "150">
      </div>
      <div class ="company_regi" style = "margin-top : 10px;">
         <textarea id="content" ></textarea>
         <script>CKEDITOR.replace('content');</script>
         <input type="hidden" id ="shop_content" name ="shop_content" >
      </div>
      <input type="hidden" name = "id" value ="${login.id }">
      <div style ="margin-top:10px;" align ="center">
         <input class = "btn_line_m" type ="button" id = "shop_regi" value = "등록">      
         <input class ="btn_line_m" type ="button" id = "cancle" value = "취소">      
         
      </div>
      </form>
   </div>
</div>
<!-- container E : -->
<script type="text/javascript">
      $("#shop_regi").click(function(){
            var addr = $("#sample6_postcode").val()+"/"+$("#sample6_address").val()+" " +$("#sample6_detailAddress").val();
            var time = $("#open_hour").val()+":"+$("#open_min").val()+ " ~ " + $("#close_hour").val() + ":" + $("#close_min").val();
            $("#shop_time").val(time);
            $("#shop_addr").val(addr);
            var content = CKEDITOR.instances.content.getData();
            $("#shop_content").val(content);
            //alert($("#shop_content").val());
            var form = $('#shopForm')[0];
            var formData = new FormData(form);
            
            
               $.ajax({
                   url:"shopRegiAf.do",
                   type:'post',
                   data: formData,
                   enctype:'multipart/form-data',
                   processData: false,
                   contentType: false,
                   cache: false,
                   timeout: 600000,
                   success: function (data){
                      alert(data);
                   },
                   error: function (data){
                      alert(data);
              }
      });
         
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