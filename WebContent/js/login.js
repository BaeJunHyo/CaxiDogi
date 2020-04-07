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
	    	alert("이메일 형식이 아닙니다 .")
	    	$("#id").val("");
	    	$("#id").focus();
	        return false;
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
		alert("id를 입력해주세요");
		$("#id").focus();
		return false;
	}else if($("#password").val().trim() == "" || $("#password").val()=== null){
		alert("password를 입력해주세요");
		$("#password").focus();
		return false;
	}else{
		if(confirm("로그인하시겠습니까?")){
		 $("form").attr("action","login.do").submit();
		}
		return;
	}
}
//id찾기
function findId(){
	var popWidth=500;
	var popHeight=300;
	
	var popX=(window.screen.width/2) - (popWidth/2);
	var popY=(window.screen.height/2) - (popHeight/2);
	/*window.open(getContextPath()+"/findId.do","findId","width="+popWidth+,height=300,left=200,top=50");
*/	
	window.open(getContextPath()+"/findId.do","findId","height=" + popHeight  + ", width=" + popWidth  + ", left="+ popX + ", top="+ popY);
}
//pwd찾기
function findPwd(){
	alert("test");
}






