<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/admin/bo_header.jsp" %>

<%@ include file="/include/admin/bo_left.jsp" %>



<input type="hidden" id="MenuConfirm" value="3">
<div  class="admin_containerWrap">
	<h1>여기가 공지사항 작성페이지</h1>
	<div class="admin_container">
		<form action="<%=request.getContextPath() %>/notice/writeAf.do" method="post" id="frm" enctype="multipart/form-data">
			<ul class="frm_ul">
				<li>
					제목: <input type="text" name="notice_title" size="100">
					<font style="margin-left: 50px;">적용 구분:</font> 
					<select name="notice_auth">
						<!-- '사이트 관리자' option  -->
						<c:if test="왕어드민일때">
							<option value="1">사이트 관리자</option>
						</c:if>
						<option value="2">업체 관리자</option>
						<option value="3">고객</option>
					</select>
				</li>
				<li>
					<font style="margin-right: 20px;">파일 업로드:</font>
					<a><label class="btn_r_navy" for="file0" id="upload_button">업로드</label></a>
				</li>
				<li><!-- 올라온 파일 목록  -->
					<div id="flieList_div" style="display:none;">
						<table border="1">
							<colgroup>
								<col width="50">
								<col width="200">
								<col width="100">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" id="allCheck"></th>
									<th>파일명</th>
									<th>파일 크기</th>
								</tr>
							</thead>
							<tbody id="fileList">

							</tbody>
						</table>
						<input type="button" value="삭제" id="del_button">
					</div>
				</li>
				<li></li>
				<li><!-- ckeditor -->
					<textarea class="ckeditor" id="contents" name="notice_content"></textarea>
				</li>
				<li><!-- 동작 버튼들  -->
					<button type="button" id="GO_btn">작성</button>
				</li>
			</ul>
			<input type="file" name="files" id="file0" style="display:none;"><br> 
			<input type="file" name="files" id="file1" style="display:none;"><br> 
			<input type="file" name="files" id="file2" style="display:none;"><br>
			<input type="file" name="files" id="file3" style="display:none;"><br> 
			<input type="file" name="files" id="file4" style="display:none;"><br> 
			<input type="file" name="files" id="file5" style="display:none;"> 
		</form> 
	</div>
</div>

<script>

	//label for를 바꾸어 주기 위한 변수 
	var file_num = 1;

	// [input 'file'] 에 데이터가 비어있는지 판단하려고 만든 변수
	// true -> fileupload 가능    |  false -> fileupload 불가능
	var confirmFileTag = [true,true,true,true,true,true];


	// byte 단위를 바꾸어 주는 함수
	function byteChange( data ){
		
		if(data < 1024){
			//데이터가 바이트 단위일때 그대로 반환
			alert('단위는 b');
			data = data + "  byte";
			
		}else if ( (data / 1024)/1024 < 1){
			//k바이트 일 때 
			alert("단위는 k");	
			data = (data/1024) + "";
			data = data.substr(0,3);
			data += "  Kbyte";
		}else{
			//m바이트 일 때
			alert('단위는 m');
			data = (data/1024)/1024 + "";
			data = data.substr(0,3);
			data +="  Mbyte";
		}

		return data;
	} 

	
	//ckeditor 적용 
	CKEDITOR.replace('contents',{
	
		filebrowserUploadUrl:'${pageContext.request.contextPath}/ckeditorFile/fileUpload.do',	//파일 업로드를 처리하는 서블릿 주소 등록 
		removePlugins:'resize',	//크기 조절 플러그인 제거 
		resize_enabled:false, // 크기 조절 막기 
		enterMode: CKEDITOR.ENTER_BR, // enter 키를 <br>로 대체 
		shiftEnterMode: CKEDITOR.ENTER_P, // 쉬프드 엔터를 <p>로 대체 
		width: 700
		
	});// CKEDITOR.replace END

	$('#GO_btn').on('click', function (){

		//작성 버튼 클릭시 서버로 이동  동작 하는 함수
		var form = $('#frm')[0];	//자기 자신을 변수에 담고 

		$('#contents').val(CKEDITOR.instances.contents.getData());	//ckeditor로 작성한 값은 따로 태그에 넣어줘야 formData로 넘길 수있다 

		//지금 폼에 있는 데이터를 오브젝트 형태로 담아서 ajax로 통신을 한다.
		var formData = new FormData(form);
		
		//alert(formdata);
		$.ajax({
			type:'POST',
			url:$('#frm').attr('action'),
			enctype:'multipart/form-data',
			data: formData,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
			datatype:'text',
			success: function (data){
				alert("통신성공");
				//alert(data);
			},
			error: function (e){
				alert("통신실패");
			}
		
			
		});	

	});// GO_btn END

	//파일 업로드시  [fileList] 를 가진 [div] 띄워주는 처리  와 [label] 의  'for' 속성을 바꾸어 주는 처리  
	$("#frm input[name=files]").on('change', function () {

		var file = this.files[0];  //바뀐 [ input 'file' ] 의 데이터 변수에 넣어주는 작업
		var fileName = file.name;	// 가져온 데이터 (file) 의  파일명과 확장자 명을 가져와서 변수에 넣어준다 
		var fileSize = file.size;	// 가져온 데이터 (file) 의  파일크기를 byte 단위로 변수에 넣어준다 
		
		//확인 작업을 위한 alert
		//alert(fileName);
		//alert(fileSize);

		//btye 단위를 k m 등으로 변환
		fileSize = byteChange(fileSize);
		//alert(fileSize);

		//label for 처리
		var labelFor = $('#upload_button').attr('for');
		labelFor = labelFor.substr(4); //for 뒤의 숫자를 가져옴 

		//위에서 구한 문자를 숫자형태로 자료형 변형
		labelFor = Number(labelFor);


		//fileList_div에 올라온 파일 추가 
		var fileListStr = "<tr>";
		fileListStr += "<td><input type='checkbox' index='" + labelFor + "'></td>";
		fileListStr += "<td>" + fileName + "</td>";
		fileListStr += "<td>" + fileSize + "</td>"; 
		
		$('#fileList').append(fileListStr);

		//파일이 올라오면 숨겨져 있던 fileList를 보여준다 
		$('#flieList_div').css('display','block');
		
		//파일이 있는지 없는지 판단하는 배열에 파일업로드 표시 
		confirmFileTag[labelFor] = false;
		//alert("배열 확인 = " + confirmFileTag[labelFor]);
		
		//for 다음숫자로 변환
		for(i = 0; i < confirmFileTag.length; i++){
			if(confirmFileTag[i] == true){
				$('#upload_button').attr('for','file' + i);
				break;
			}
			$('#upload_button').attr('for','file6');	
		}
			
	});

	//최대 파일 등록 수를 넘기면 알려주는 처리 
	$("#upload_button").on('click', function () {
		//파일을 한계까지 올리면 for의 file(숫자) 가 매치가 안되기 때문에 동작 X
		//누르면 판단 후 alert창 or 팝업창 
		
		var pass = false; //판단할 변수
		
		for(i = 0; i < confirmFileTag.length; i++){

			if(confirmFileTag[i] == true){
				pass = true;
				break;
				console.log('남는 file자리 있어요  로직 에러 ');
			}
		}

		if(!pass){
			alert('더 이상 업로드 하실 수 없습니다');
		}

	});
	
	//파일 삭제를 처리 
	$("#del_button").on('click', function () {

		//alert('삭제 버튼 클릭');  //버튼 동작 확인 

		//현재 눌러져 있는 버튼들 판단 
		var checkfind = $('#fileList input[type=checkbox]')
		
		//alert("length = " + checkfind.length);
		
		
		for(i=0; i < checkfind.length; i++){

			//alert(checkfind[i].checked);
			if(checkfind[i].checked == true){
				//선택되어 있으면 
				var index = checkfind[i].getAttribute('index');
				index = Number(index);

				//위에 파일 업로드를 판단하는 배열의 자리를 초기화
				confirmFileTag[index] = true;

				//해당 index 아이디인 [ input file ] 초기화
				$("#file" + index).val("");				

				
				//테이블 삭제 
				//alert(checkfind[i].parentElement);
				var tr = checkfind[i].parentElement;
				tr = tr.parentElement;
				tr.remove();
			}
		}

		$(":checkbox").prop('checked', false);
		
		//input 
		for(i = 0; i < confirmFileTag.length; i++){
			if(confirmFileTag[i] == true){
				$('#upload_button').attr('for','file' + i);
				break;
			}
		}
		
	});
	
	
	
	
	// thead 의 checkbox 클릭시 모든 checkbox가 눌러지는 처리 
	$('#allCheck').on('click', function (){

		if($('#allCheck').prop('checked')){
			//위에 ckeck박스가 선택되어있으면 모든 check박스가 선택되게 처리 
			$(":checkbox").prop('checked', true);
			
		}else{
			//위의 반대 처리 	
			$(":checkbox").prop('checked', false);
		}		
		
	});
		
	
</script>






</body>
</html>