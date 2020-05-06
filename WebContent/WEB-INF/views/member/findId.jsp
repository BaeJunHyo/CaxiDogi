<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link href="./css/login.css" rel="stylesheet">
<!-- <style>
.findId{width:300px;margin:0 auto;}
.findId ul{list-style: none;margin:0 auto;}
.findId li{width:250px;}
.findId input{width:200px;margin-bottom: 10px;background: #f2f2f2;border:none;outlin:none;padding:10px;color:black;}
.findId button{width:150px;height:50px; margin-left: 35px; margin-top: 10px}
</style> -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>

<div class="findId">
	<!-- <h2>아이디찾기</h2> -->
<!--     <form method="post" action="">
	    <ul>
		    <li>
			     <label>이름</label>
			     <input type="text" class="user_name" name="name" id="name" maxlength="4" required="required" />
		    </li>
		    <li>
			     <label>연락처</label>
			     <input type="text" class="user_phone"name="phone" id="phone" maxlength="11" placeholder="(-)하이픈 제외한 숫자" required="required" />
	    	</li>
    		<li>
      			<button type="button" onclick="findId()">아이디 찾기</button>
    		</li>
      	</ul>
    </form> -->
    
    		<form action="#" method="post">
				  <h2>아이디 찾기</h2>
						<p>
							<label for="Name" class="floatLabel">이름</label>
							<input  type="text" class="user_name" name="name" id="name" maxlength="4" required="required" />
						</p>
						<p>
							<label for="password" class="floatLabel">연락처</label>
							<input type="text" class="user_phone"name="phone" id="phone" maxlength="11" placeholder="(-)하이픈 제외한 숫자" required="required" />
						</p>
						
						<div class="login_sorting">
							<button type="button" onclick="findId()"><i class="xi-search"></i>아이디 찾기</button>
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
function findId(){
	if($("#name").val().trim() == ""){
		/* alert("이름을 입력하세요"); */
		Swal.fire({
      	  icon: 'warning',
      	  title: '이름을 입력하세요',
      	  showConfirmButton: true
      	}).then(function(){
      		$("#name").focus();
      		return;
      	});
	}else if($("#phone").val().trim() == ""){
		/* alert("연락처를 입력하세요"); */
		Swal.fire({
	      	  icon: 'warning',
	      	  title: '연락처를 입력하세요',
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$("#phone").focus();
	      		return;
	      	});
	}else{
		$.ajax({
			url:"findIdAf.do",
			type: "post",
			dataType:"text",
			data: {
				"user_name":$("#name").val(),
				"phone":$("#phone").val()
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
					/* alert("ID = "+data+"\n 확인버튼을 누르시면 창이 종료됩니다.");
					window.close(); */
					Swal.fire({
			        	  icon: 'info',
			        	  title:'버튼을 누르시면 창이 종료됩니다.',
			        	  text: "ID = "+data,
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