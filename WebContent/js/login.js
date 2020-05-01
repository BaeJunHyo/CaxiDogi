function getContextPath() {
   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

// 로그인 iD 정규식 체크
var memId = document.querySelector(".memberId");
memId.addEventListener("change", function(e){
var idReg = /^[0-9a-z][0-9a-z\_\-\.\+]+[0-9a-z]@[0-9a-z][0-9a-z\_\-]*[0-9a-z](\.[a-z]{2,6}){1,2}$/g;
	if($(".memberId").val() == ""){ // 빈칸일 때
	
	}else { // 빈칸이 아닐때
	    if( !idReg.test( $(".memberId").val() )) { // 정규식 조건에 맞지 않을때
	    	/*alert("이메일 형식이 아닙니다 .")*/
	    	Swal.fire({
          	  icon: 'warning',
          	  title: '이메일 형식이 아닙니다 .',
          	  showConfirmButton: true
          	}).then(function(){
          		$("#id").val("");
          		$("#id").focus();
          		return false;
          	});
	    	
	    	
	    }
	}
});
//회원가입창 이동
function newAccount(){
location.href="newAccount.do";
}
// 로그인 frm 빈칸확인
function login(){
	if($("#id").val().trim() == "" || $("#id").val().trim() === null){
		/*alert("id를 입력해주세요");*/
		Swal.fire({
        	  icon: 'warning',
        	  title: 'id를 입력해주세요.',
        	  showConfirmButton: true
        	}).then(function(){
        		$("#id").focus();
        		return false;
        	});
	}else if($("#password").val().trim() == "" || $("#password").val()=== null){
		/*alert("password를 입력해주세요");*/
		Swal.fire({
      	  icon: 'warning',
      	  title: 'password를 입력해주세요.',
      	  showConfirmButton: true
      	}).then(function(){
      		$("#password").focus();
      		return false;
      	});
	}else{
		/*if(confirm("로그인하시겠습니까?")){
		 $("form").attr("action","login.do").submit();
		}*/
		Swal.fire({
			  title: '로그인 하시겠습니까?',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText:'아니요',
			  confirmButtonText: '예'
			}).then((result) => {
			  if (result.value) {
				  $("form").attr("action","login.do").submit();
			  }else{
				  return;
			  }
			})
	}
}
//id찾기
function findId(){

	
	var popupX = (document.body.offsetWidth / 2) - (700 / 2);
	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height / 2) - (500 / 2);
	//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	window.open(getContextPath()+'/findId.do', '', 'status=no, height=500, width=700, left='+ popupX + ', top='+ popupY);
}
//pwd찾기
function findPwd(){
	var popupX = (document.body.offsetWidth / 2) - (700 / 2);
	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height / 2) - (500 / 2);
	//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	window.open(getContextPath()+'/findPwd.do', '', 'status=no, height=500, width=700, left='+ popupX + ', top='+ popupY);
}






