function getContextPath() {
   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};


 // 패스워드 체크(정규식 + 멘트)
    var memPwd = document.querySelector(".memberPwd");
    memPwd.addEventListener("change", function(e){
    	var pwdReg = /^[a-z0-9]+[a-z0-9]{5,19}$/g;
    	if($(".memberPwd").val() == ""){
    		if($('span.pwdCheck').hasClass('alert-red')) {
        		$('.pwdComentColor span').removeClass('alert-red');
        	}
    		document.querySelector(".pwdCheck").innerHTML = "";
    	} else {
        if( !pwdReg.test( $(".memberPwd").val() )) {
        	if($('span.pwdCheck').hasClass('alert-green')) {
        		$('.pwdComentColor span').removeClass('alert-green');
        	}
        	$('.pwdComentColor span').addClass('alert-red');
        
        	document.querySelector(".pwdCheck").innerHTML = "비밀번호는 6~20자 영문자 또는 숫자이어야 합니다.";
            return;
        } else {
        	if($('span.pwdCheck').hasClass('alert-red')) {
        		$('.pwdComentColor span').removeClass('alert-red');
        	}
        	$('.pwdComentColor span').addClass('alert-green');
        	
        	document.querySelector(".pwdCheck").innerHTML = "사용가능한 비밀번호 입니다";
        }
    	}
    });
    
// 패스워드 재확인 + 멘트
var pw = document.querySelector(".memberPwdReCheck");

pw.addEventListener("change", function(e){
	var pw1 = document.querySelector(".memberPwd").value;
	var pw2 = document.querySelector(".memberPwdReCheck").value;	
	if(pw1 == "" || pw2 == ""){
		if($('span.idCheck').hasClass('alert-green')) {
    		$('.idComentColor span').removeClass('alert-green');
    	}
		document.querySelector(".pwdEqualCheck").innerHTML = "";
	} else {
		if(pw1 == pw2){
			if($('span.pwdEqualCheck').hasClass('alert-red')) {
	    		$('.pwdReCheckComentColor span').removeClass('alert-red');
	    	}
	    	$('.pwdReCheckComentColor span').addClass('alert-green');
			document.querySelector(".pwdEqualCheck").innerHTML = "일치합니다.";
			
		} else {
			if($('span.pwdEqualCheck').hasClass('alert-green')) {
	    		$('.pwdReCheckComentColor span').removeClass('alert-green');
	    	}
			/*alert("비밀번호 불일치");
			$('.memberPwdReCheck').val("");
			$('.memberPwdReCheck').focus();*/
	    	/*$('.pwdReCheckComentColor span').addClass('alert-red');
			document.querySelector(".pwdEqualCheck").innerHTML = "비밀번호를 다시 확인해 주세요";*/
			Swal.fire({
	        	  icon: 'warning',
	        	  title: '비밀번호 불일치',
	        	  showConfirmButton: true
	        	}).then(function(){
	        		$('.memberPwdReCheck').val("");
	    			$('.memberPwdReCheck').focus();
	        	});
		}
	}
});

//닉네임 체크 (특수문자제외)
var memNick = document.querySelector(".memberNick");
memNick.addEventListener("change", function(e){
var mNick = /^[가-힣a-zA-Z0-9]+$/g;

	if($(".memberNick").val() == ""){ // 빈칸일 때
		if($('span.nickCheck').hasClass('alert-green')) { 
    		$('.nickComentColor span').removeClass('alert-red');
    		$('.nickComentColor span').removeClass('alert-green');
    	} else if($('span.nickCheck').hasClass('alert-red')) {
    		$('.nickComentColor span').removeClass('alert-red');
    		$('.nickComentColor span').removeClass('alert-green');
    	}
		document.querySelector(".nickCheck").innerHTML = "";
	} else { // 빈칸이 아닐때
		if(!mNick.test($(".memberNick").val())){
			if($('span.nickCheck').hasClass('alert-green')) { // alert-green이 있으면
	    		$('.nickComentColor span').removeClass('alert-green');
	    	}
	    	$('.nickComentColor span').addClass('alert-red');
	    	/*alert("닉네임에 특수문자가 포함되어있습니다.\n 닉네임을 확인해주세요")
	    	document.querySelector(".nickCheck").innerHTML = "특수문자 제외하고 입력해주세요";*/
	    	Swal.fire({
	        	  icon: 'warning',
	        	  title: '닉네임을 확인해주세요.',
	        	  text:'닉네임에 특수문자가 포함되어있습니다.',
	        	  showConfirmButton: true
	        	}).then(function(){
	        		document.querySelector(".nickCheck").innerHTML = "특수문자 제외하고 입력해주세요";
	        	});
		}else{
			if($('span.nickCheck').hasClass('alert-green')) { 
				$('.nickComentColor span').removeClass('alert-green');
				$('.nickComentColor span').addClass('alert-red');
				document.querySelector(".nickCheck").innerHTML = "중복체크 전입니다.";
			} else {
				$('.nickComentColor span').addClass('alert-red');
				document.querySelector(".nickCheck").innerHTML = "중복체크 전입니다.";
			}
		}
	    
	}

});

//var nickNamecheck = $("#nickName").val();
function nickCheck(){
	$.ajax({
		url : `${getContextPath()}`+"/nickCheck.do",
		type : "post",
		dataType:"text",
		data : "nickcheck="+$("#nick_name").val(),
		success:function(data){
			
			if(data === "true"){
				$('.nickComentColor span').removeClass('alert-green');
				$('.nickComentColor span').addClass('alert-red');
				document.querySelector(".nickCheck").innerHTML = "사용 중 인 닉네임입니다.";
			} else {
				$('.nickComentColor span').removeClass('alert-red');
				$('.nickComentColor span').addClass('alert-green');
				document.querySelector(".nickCheck").innerHTML = "사용가능한 닉네임입니다.";
			}

		},
		error:function(request,status,error){
			
		}
		
	});
};


// 연락처 정규식 + 멘트
var phone = document.querySelector(".memberPhone");
phone.addEventListener("blur", function(e){
	var ph = /^01([0|1|6|7|8|9])([1-9]{1}[0-9]{2,3})([0-9]{4})$/g;
	if($('.memberPhone').val() == ""){
		if($('span.memberPhone').hasClass('alert-red')){
			$('.phoneComentColor span').removeClass('alert-red');
		}
		document.querySelector(".phoneCheck").innerHTML = "";
	} else {
		if( !ph.test( $(".memberPhone").val() )) {
			if($('span.phoneCheck').hasClass('alert-green')) {
        		$('.phoneComentColor span').removeClass('alert-green');
        	}
        	$('.phoneComentColor span').addClass('alert-red');
        	document.querySelector(".phoneCheck").innerHTML = "형식 불일치";
        	
        	/*alert("연락처 형식 불일치 !!! \n 글자수가 다르거나 특수문자가 들어가있습니다. \n ex)01x-xxxx-xxxx");
            return;*/
        	Swal.fire({
            	  icon: 'warning',
            	  title: '숫자가 아니거나 특수문자존재.',
            	  text:'ex)01x-xxxx-xxxx',
            	  showConfirmButton: true
            	}).then(function(){
            		return;
            	});
		} else {
			if($('span.phoneCheck').hasClass('alert-red')) {
        		$('.phoneComentColor span').removeClass('alert-red');
        	}
        	$('.phoneComentColor span').addClass('alert-green');
        	document.querySelector(".phoneCheck").innerHTML = "";
        	
		}
	}
});

$('button.sBtn').click(function(){
	if($('.pwdComentColor span').hasClass('alert-red') || $('.memberPwd').val().trim() == "") {
		/*alert("비밀번호를 확인해주세요");
		$('.memberPwd').focus();
		return false;*/
		Swal.fire({
      	  icon: 'warning',
      	  title: '비밀번호를 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('.memberPwd').focus();
    		return false
      	});
	} else if($('.pwdReCheckComentColor span').hasClass('alert-red') || $('.memberPwdReCheck').val().trim() == "") {
		/*alert("비밀번호 재확인을 확인해주세요");
		$('.memberPwdReCheck').focus();
		return false;*/
		Swal.fire({
      	  icon: 'warning',
      	  title: '비밀번호 재확인을 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('.memberPwdReCheck').focus();
    		return false;
      	});
	} else if($('input[name=nick_name]').val().trim() == "" || $(".nickComentColor span").hasClass('alert-red')) {
		/*alert("닉네임를 확인해주세요");
		$('input[name=nick_name]').focus();
		return false;*/
		Swal.fire({
      	  icon: 'warning',
      	  title: '닉네임를 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('input[name=nick_name]').focus();
    		return false;
      	});
	} else if($('.phoneComentColor span').hasClass('alert-red') || $('.memberPhone').val().trim() == "") {
		/*alert("연락처를 확인해주세요");
		$('.memberPhone').val("");
		$('.memberPhone').focus();
		return false;*/
		Swal.fire({
      	  icon: 'warning',
      	  title: '연락처를 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('.memberPhone').val("");
    		$('.memberPhone').focus();
    		return false;
      	});
	} else if($('input[name=memberPostCode]').val().trim() == ""){
		/*alert("주소를 확인해주세요");
		$('input[name=memberPostCode]').focus();
		return false;*/
		Swal.fire({
      	  icon: 'warning',
      	  title: '주소를 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('input[name=memberPostCode]').focus();
    		return false;
      	});
	} else if($('input[name=memberDetailStreetName]').val().trim() == ""){
		/*alert("상세주소를 확인해주세요");
		$('input[name=memberDetailStreetName]').focus();
		return false;*/
		Swal.fire({
      	  icon: 'warning',
      	  title: '상세주소를 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('input[name=memberDetailStreetName]').focus();
    		return false;
      	});
	} else if($('input[name=pass_hint]').val().trim() == ""){
		/*alert("비밀번호 찾기 질문을 확인해주세요");
		$('input[name=pass_hint]').focus();
		return false;*/
		Swal.fire({
      	  icon: 'warning',
      	  title: '비밀번호 찾기 질문을 확인해주세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$('input[name=pass_hint]').focus();
    		return false;
      	});
	} else {
		/*if(confirm("입력하신 정보로 변경 하시겠습니까?")){
			var postCode = document.getElementById('kakao_postcode').value.trim();
			var roadAddr = document.getElementById('kakao_roadAddress').value;
			var detail = document.getElementById('kakao_detailAddress').value;
			var addr = postCode+"/"+roadAddr+"/"+detail;
			$("#address").val(addr);
			$("form").attr("action", "userUpdate.do").submit();
		}else{
			return false;
		}*/
		Swal.fire({
			  title: '입력하신 정보로 변경 하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText:'아니요',
			  confirmButtonText: '예'
			}).then((result) => {
			  if (result.value) {
				    var postCode = document.getElementById('kakao_postcode').value.trim();
					var roadAddr = document.getElementById('kakao_roadAddress').value;
					var detail = document.getElementById('kakao_detailAddress').value;
					var addr = postCode+"/"+roadAddr+"/"+detail;
					$("#address").val(addr);
					$("form").attr("action", "userUpdate.do").submit();
			  }else{
				  return false;
			  }
			})
	}
});

$('button.sBtn2').on("click",function(){
location.href="main.do";
});


















