<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드찾기</title>
<style>
.qpwd{
   	top: -39px;
    margin-left: -18px;
}
.spwd{
	width: 200px;
    height: 40px;
}
.txt-hint{
	margin-top: 10px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link href="./css/login.css" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- <style>
.findPwd{width:300px;margin:0 auto;}
.findPwd ul{list-style: none;margin:0 auto;}
.findPwd li{width:250px;}
.findPwd input{width:200px;margin-top: 5px;margin-bottom: 5px;background: #f2f2f2;border:none;outlin:none;padding:10px;color:black;}
.findPwd button{width:150px;height:50px; margin-left: 35px; margin-top: 10px}
</style> -->
</head>
<body>

<div class="findPwd">
<!--     <form method="post" action="">
	    <ul>
		    <li>
			     <label>아이디</label>
			     <input type="text" class="user_id" name="id" id="id" maxlength="30" required="required" placeholder="example@caxidogi.com"/>
		    </li>
   		    <li>
			     <label>이름</label>
			     <input type="text" class="user_name" name="name" id="name" maxlength="4" required="required" />
		    </li>
		    <li>
			     <label>연락처</label>
			     <input type="text" class="user_phone"name="phone" id="phone" maxlength="11" placeholder="(-)하이픈 제외한 숫자" required="required" />
	    	</li>
	    	
	    	<li>
	    		<label>패스워드찾기 질문</label>
	    		<select class="select-question" name="pass_question" id="pass_question">
                  <option value="1" selected>기억에 남는 추억의 장소는?</option>
                  <option value="2">나의 보물 1호는?</option>
                  <option value="3">나의 출신 초등학교는?</option>
                  <option value="4">가장 좋아하는 색깔은?</option>
                  <option value="5">아버지 성함은?</option>
               </select>
               <input type="text" class="txt-hint" name="pass_hint" id="pass_hint" value="" placeholder="회원가입시 기입한 내용">
	    	</li>
	    	
    		<li>
      			<button type="button" onclick="findPwd()">패스워드 찾기</button>
    		</li>
      	</ul>
    </form>
 -->    
    <form action="#" method="post" class="findpw">
		  <h2>비밀번호 찾기</h2>
				<p>
					<label for="Name" class="floatLabel">아이디</label>
					<input  type="text" class="user_id" name="id" id="id" maxlength="30" required="required" placeholder="example@caxidogi.com"/>
				</p>
				<p>
					<label for="password" class="floatLabel">연락처</label>
					<input type="text" class="user_phone"name="phone" id="phone" maxlength="11" placeholder="(-)하이픈 제외한 숫자" required="required" />
				</p>
				<p>
					<label for="password" class="floatLabel">이름</label>
					<input type="text"  class="user_name" name="name" id="name" maxlength="4" required="required" />
				</p>
				
				<p>
					<label class="qpwd">패스워드찾기 질문</label>
		    		<select class="spwd" name="pass_question" id="pass_question">
	                  <option value="1" selected>기억에 남는 추억의 장소는?</option>
	                  <option value="2">나의 보물 1호는?</option>
	                  <option value="3">나의 출신 초등학교는?</option>
	                  <option value="4">가장 좋아하는 색깔은?</option>
	                  <option value="5">아버지 성함은?</option>
	               </select>
	               <input type="text" class="txt-hint" name="pass_hint" id="pass_hint" value="" placeholder="회원가입시 기입한 내용">
				</p>
				
				<div class="login_sorting">
					<button type="button" onclick="findId()"><i class="xi-search"></i>아이디 찾기</button>
					<button type="button" onclick="findPwd()"><i class="xi-search"></i>패스워드 찾기</button>
			    </div>
       	
				<!-- <p>
			        <button type="button"  onclick="login()">Login</button>
			        <button type="button"  onclick="newAccount()">Join us</button>
				</p> -->
	</form>
</div>
</body>
</html>

<script>
var userId= document.querySelector(".user_id");
userId.addEventListener("change",function(e){
var idReg= /^[0-9a-z][0-9a-z\_\-\.\+]+[0-9a-z]@[0-9a-z][0-9a-z\_\-]*[0-9a-z](\.[a-z]{2,6}){1,2}$/g;
	 if(!idReg.test($("#id").val())){
		/* alert("이메일 형식이 아닙니다 !!");
		$("#id").val("");
		$("#id").focus();
		return; */
		Swal.fire({
			  icon: 'warning',
			  title: '이메일 형식이 아닙니다 !!',
			  showConfirmButton: true
			}).then(function(){
				$("#id").val("");
				$("#id").focus();
				return;
			});
	} 
})
var userName= document.querySelector(".user_name");
userName.addEventListener("change",function(e){
var nameReg= /^[가-힣]+$/g;
	 if(!nameReg.test($("#name").val())){
		/* alert("이름은 한글만 입력하세요!!");
		$("#name").val("");
		$("#name").focus();
		return; */
		Swal.fire({
	    	  icon: 'warning',
	    	  title: '이름은 한글만 입력하세요!!',
	    	  showConfirmButton: true
	    	}).then(function(){
	    		$("#name").val("");
	    		$("#name").focus();
	    		return;
	    	});
	} 
})
var userPhone = document.querySelector(".user_phone");
userPhone.addEventListener("change",function(e){
var phReg = /^01([0|1|6|7|8|9])([1-9]{1}[0-9]{2,3})([0-9]{4})$/g;
	 if(!phReg.test($("#phone").val())){
		/* alert("연락처 형식이 다릅니다 \n 특수문자를 제외한 숫자만 기입해주세요  \n 01x xxxx xxxx");
		$("#phone").val("");
		return; */
		Swal.fire({
			  icon: 'warning',
			  title: '숫자가 아니거나 특수문자존재.',
			  text:'ex)01x-xxxx-xxxx',
			  showConfirmButton: true
			}).then(function(){
				$("#phone").val("");
				return;
			});
	} 
})
function findPwd(){
	if($("#id").val().trim() == ""){
		/* alert("id를 입력하세요");
		$("#id").focus();
		return; */
		Swal.fire({
	      	  icon: 'warning',
	      	  title: 'id를 입력하세요',
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$("#id").focus();
	    		return;
	      	});
	}else if($("#name").val().trim() == ""){
		/* alert("이름을 입력하세요");
		$("name").focus();
		return; */
		Swal.fire({
	      	  icon: 'warning',
	      	  title: '이름을 입력하세요',
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$("#name").focus();
	      		return;
	      	});
	}else if($("#phone").val().trim()==""){
		/* alert("연락처를 입력하세요");
		$("#phone").focus();
		return; */
		Swal.fire({
	      	  icon: 'warning',
	      	  title: '연락처를 입력하세요',
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$("#phone").focus();
	      		return;
	      	});
	}else if($("#pass_hint").val().trim()==""){
		/* alert("패스워드찾기 질문의 답을 입력하세요");
		$("#pass_hint").focus();
		return; */
		Swal.fire({
	      	  icon: 'warning',
	      	  title: '패스워드찾기 질문의 답을 입력하세요',
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$("#pass_hint").focus();
	    		return;
	      	});
		
	}else{
		$.ajax({
			url:"findPwdAf.do",
			type: "post",
			dataType:"text",
			data: {
				"id":$("#id").val(),
				"user_name":$("#name").val(),
				"phone":$("#phone").val(),
				"pass_question":$("#pass_question").val(),
				"pass_hint":$("#pass_hint").val()
				},
			success:function(data){
				if(data == null || data === ""){
					/* alert("가입된 이력이 없습니다.");
					return; */
					Swal.fire({
			        	  icon: 'info',
			        	  title: '가입된 이력이 없습니다.',
			        	  showConfirmButton: true
			        	}).then(function(){
			        		return;
			        	});
				}else{
					/* alert("pwd = "+data+"\n 확인버튼을 누르시면 창이 종료됩니다.");
					window.close(); */
					Swal.fire({
			        	  icon: 'info',
			        	  title:'버튼을 누르시면 창이 종료됩니다.',
			        	  text: "PW = "+data,
			        	  confirmButtonText:'확인',
			        	  showConfirmButton: true
			        	}).then(function(){
			        		window.close();
			        	});
				};
			},
			error:function(request,status,error){
				alert(error);
			}
		});
	}
};
</script>