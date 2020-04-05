function getContextPath() {
   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

// 아이디 체크(정규식 + 멘트)
var memId = document.querySelector(".memberId");

memId.addEventListener("change", function(e){
	var idReg = /^[0-9a-z][0-9a-z\_\-\.\+]+[0-9a-z]@[0-9a-z][0-9a-z\_\-]*[0-9a-z](\.[a-z]{2,6}){1,2}$/g;

	if($(".memberId").val() == ""){ // 빈칸일 때
		if($('span.idCheck').hasClass('alert-green')) { 
    		$('.idComentColor span').removeClass('alert-red');
    		$('.idComentColor span').removeClass('alert-green');
    	} else if($('span.idCheck').hasClass('alert-red')) {
    		$('.idComentColor span').removeClass('alert-red');
    		$('.idComentColor span').removeClass('alert-green');
    	}
		document.querySelector(".idCheck").innerHTML = "";
	}else { // 빈칸이 아닐때
	    if( !idReg.test( $(".memberId").val() )) { // 정규식 조건에 맞지 않을때
	    	if($('span.idCheck').hasClass('alert-green')) { // alert-green이 있으면
	    		$('.idComentColor span').removeClass('alert-green');
	    	}
	    	$('.idComentColor span').addClass('alert-red');
	    	document.querySelector(".idCheck").innerHTML = "이메일 형식이 아닙니다 .";
	        return;
	    }  else {
	    	if($('span.idCheck').hasClass('alert-green')) { 
	    		$('.idComentColor span').removeClass('alert-green');
	    		$('.idComentColor span').addClass('alert-red');
	    		document.querySelector(".idCheck").innerHTML = "중복체크 전입니다.";
	    	} else {
	    		$('.idComentColor span').addClass('alert-red');
	    		document.querySelector(".idCheck").innerHTML = "중복체크 전입니다.";
	    	}
	    }
	}
});

//var idcheck = $("#id").val();
var idReg = /^[0-9a-z][0-9a-z\_\-\.\+]+[0-9a-z]@[0-9a-z][0-9a-z\_\-]*[0-9a-z](\.[a-z]{2,6}){1,2}$/g;
function idCheck(){
	$.ajax({
		url : `${getContextPath()}`+"/idCheck.do",
		type : "post",
		dataType:"text",
		data : "idcheck="+$("#id").val(),
		success:function(data){
			if(idReg.test( $(".memberId").val() )){
				if(data === "true"){
					$('.idComentColor span').removeClass('alert-green');
					$('.idComentColor span').addClass('alert-red');
					document.querySelector(".idCheck").innerHTML = "사용할 수 없는 아이디입니다.";

				} else {
					$('.idComentColor span').removeClass('alert-red');
					$('.idComentColor span').addClass('alert-green');
					document.querySelector(".idCheck").innerHTML = "사용가능한 아이디입니다.";
				}
			}
		},
		error:function(request,status,error){
			
		}
		
	});
};

 // 패스워드 체크(정규식 + 멘트)
    var memPwd = document.querySelector(".memberPwd");
    memPwd.addEventListener("change", function(e){
    	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
    	if($(".memberPwd").val() == ""){
    		if($('span.pwdCheck').hasClass('alert-red')) {
        		$('.pwdComentColor span').removeClass('alert-red');
        	}
    		document.querySelector(".pwdCheck").innerHTML = "";
    	} else {
        if( !idReg.test( $(".memberPwd").val() )) {
        	if($('span.pwdCheck').hasClass('alert-green')) {
        		$('.pwdComentColor span').removeClass('alert-green');
        	}
        	$('.pwdComentColor span').addClass('alert-red');
        
        	document.querySelector(".pwdCheck").innerHTML = "비밀번호는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.";
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
		alert("비밀번호 불일치");
		$('.memberPwdReCheck').val("");
		$('.memberPwdReCheck').focus();
    	/*$('.pwdReCheckComentColor span').addClass('alert-red');
		document.querySelector(".pwdEqualCheck").innerHTML = "비밀번호를 다시 확인해 주세요";*/
	}
	}
});

//닉네임 체크
var memNick = document.querySelector(".memberNick");
memNick.addEventListener("change", function(e){
	

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
    	if($('span.nickCheck').hasClass('alert-green')) { 
    		$('.nickComentColor span').removeClass('alert-green');
    		$('.nickComentColor span').addClass('alert-red');
    		document.querySelector(".nickCheck").innerHTML = "중복체크 전입니다.";
    	} else {
    		$('.nickComentColor span').addClass('alert-red');
    		document.querySelector(".nickCheck").innerHTML = "중복체크 전입니다.";
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
	var ph = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/g;
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
        	alert("형식 불일치 !!! \n 특수문자,하이픈 제외하고 입력하세요 \n ex)01x/xxxx/xxxx");
        	document.querySelector(".phoneCheck").innerHTML = "형식 불일치";
            return;
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
	  alert("test");
	if($('.idComentColor span').hasClass('alert-red') || $('.memberId').val().trim() == "") {
		alert("아이디를 확인해주세요");
		$('.memberId').focus();
		return false;
	} else if($('.pwdComentColor span').hasClass('alert-red') || $('.memberPwd').val().trim() == "") {
		alert("비밀번호를 확인해주세요");
		$('.memberPwd').focus();
		return false;
	} else if($('.pwdReCheckComentColor span').hasClass('alert-red') || $('.memberPwdReCheck').val().trim() == "") {
		alert("비밀번호 재확인을 확인해주세요");
		$('.memberPwdReCheck').focus();
		return false;
	} else if($('input[name=memberName]').val().trim() == "") {
		alert("이름을 입력해 주세요");
		$('input[name=memberName]').focus();
		return false;
	} else if($('input[name=memberNick]').val().trim() == "") {
		alert("닉네임를 확인해주세요");
		$('input[name=memberNickName]').focus();
		return false;
	} else if($('.phoneComentColor span').hasClass('alert-red') || $('.memberPhone').val().trim() == "") {
		alert("연락처를 확인해주세요");
		$('.memberPhone').focus();
		return false;
	} else if($('.select-month').val() == "월"){
		alert("생년월일을 확인해주세요");
		$('.select-month').focus();
		return false;
	} else if($('input[name=memberYear]').val().length < 4){
		alert("생년월일을 확인해주세요");
		$('input[name=memberYear]').focus();
		return false;
	} else if(parseInt($('input[name=memberDate]').val()) > 31){
		alert("생년월일을 확인해주세요");
		$('input[name=memberDate]').focus();
		return false;
	} else if($('input[name=memberPostCode]').val().trim() == ""){
		alert("주소를 확인해주세요");
		$('input[name=memberPostCode]').focus();
		return false;
	} else if($('input[name=memberDetailStreetName]').val().trim() == ""){
		alert("상세주소를 확인해주세요");
		$('input[name=memberDetailStreetName]').focus();
		return false;
	} else if($('input[name=memberAnswer]').val().trim() == ""){
		alert("비밀번호 찾기 질문을 확인해주세요");
		$('input[name=memberAnswer]').focus();
		return false;
	} else {
		alert("조건성공");
		var postCode = document.getElementById('kakao_postcode').value.trim();
		var roadAddr = document.getElementById('kakao_roadAddress').value.replace(/(\s*)/g,"");
		var detail = document.getElementById('kakao_detailAddress').value.trim();
		var addr = postCode+"/"+roadAddr+"/"+detail;
		console.log(addr);

		alert(addr);
		$("address").attr("value",addr);
		$("form").attr("action", "/memberInsert.do").submit();
	}
});

$('button.sBtn2').on("click",function(){
alert("test");
/*var postCode = $("#kakao_postcode").val();
console.log(postCode);
var roadAddr = $("#kakao_roadAddress").val();
console.log(roadAddr);
var sdetail = $("#kakao_detailAddress").val();
alert(sdetail);
console.log(detail);
return false;*/
var postCode = document.getElementById('kakao_postcode').value.trim();
var roadAddr = document.getElementById('kakao_roadAddress').value.replace(/(\s*)/g,"");
var detail = document.getElementById('kakao_detailAddress').value.trim();
var addr = postCode+"/"+roadAddr+"/"+detail;
console.log(addr);
/*$("#address").attr("value",addr).focus();*/
$("#address").html(addr);

alert("test");


	
});


















