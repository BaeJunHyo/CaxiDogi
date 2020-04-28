<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정복구</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
.recoveryId{width:300px;margin:0 auto;}
.recoveryId ul{list-style: none;margin:0 auto;}
.recoveryId li{width:250px;}
.recoveryId input{width:200px;margin-top: 5px;margin-bottom: 5px;background: #f2f2f2;border:none;outlin:none;padding:10px;color:black;}
.recoveryId button{width:150px;height:50px; margin-left: 35px; margin-top: 10px}
</style>
</head>
<body>

<div class="recoveryId">
	<h2>계정복구</h2>
    <form method="post" action="">
	    <ul>
		    <li>
			     <label>아이디</label>
			     <input type="text" class="user_id" name="id" id="id" value="${recoverId }"maxlength="30" readonly="readonly"/>
		    </li>
   		    <li>
			     <label>이름</label>
			     <input type="text" class="user_name" name="name" id="name" maxlength="4" required="required" />
		    </li>

	    	<li>
	    		<label>패스워드</label>
                <input type="password" class="password" name="password" id="password" value="">
	    	</li>
	    	
    		<li>
      			<button type="button" onclick="recoveryId()">계정 복구</button>
    		</li>
      	</ul>
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

function recoveryId(){
	if($("#name").val().trim() == ""){
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
	}else if($("#password").val().trim()==""){
		/* alert("패스워드를 입력하세요");
		$("#password").focus();
		return; */
		Swal.fire({
	      	  icon: 'warning',
	      	  title: '패스워드를 입력하세요',
	      	  showConfirmButton: true
	      	}).then(function(){
	      		$("#password").focus();
	      		return;
	      	});
	}else{
		$.ajax({
			url:"recoveryIdAf.do",
			type: "post",
			dataType:"text",
			data: {
				"id":$("#id").val(),
				"user_name":$("#name").val(),
				"password":$("#password").val(),
				},
			success:function(data){
				 if(data == "success"){
					/* alert("계정 복구 완료 되었습니다.");
					window.close(); */
					Swal.fire({
			        	  icon: 'success',
			        	  title: '계정 복구 완료 되었습니다.',
			        	  showConfirmButton: true
			        	}).then(function(){
			        		window.close()
			        	});
				}else{
					/* alert("잘못된 입력입니다.");
					return; */
					Swal.fire({
			        	  icon: 'success',
			        	  title: '잘못된 입력 입니다.',
			        	  showConfirmButton: true
			        	}).then(function(){
			        		return;
			        	});
				} 
				
			},
			error:function(request,status,error){
				alert(error);
			}
		});
	}
};
</script>