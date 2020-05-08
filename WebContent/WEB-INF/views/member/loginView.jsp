<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ include file="./../../../include/header.jsp" %>
 <link href="./css/login.css" rel="stylesheet">
<%
String recovery = (String)request.getAttribute("recovery");
if(recovery!=null && !recovery.equals("")){
%>
<!--  <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css'>
<link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css'>
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  /> -->
<script>

<%-- alert("브라우저에서 팝업 차단 시 \n 팝업 허용을 해주셔야 원활한 복구 처리가 가능합니다.");
window.open(<%=request.getContextPath()%>/+"recoveryId.do", '', 'status=no, height=400, width=500'); --%>
Swal.fire({
	  icon: 'info',
	  text: '브라우저 팝업 허용을 해주셔야 원활한 복구 처리가 가능합니다.',
	  showConfirmButton: true
	}).then(function(){
	window.open(<%=request.getContextPath()%>/+"recoveryId.do", '', 'status=no, height=400, width=500');
});
</script>
<%
}
%>

<style>

</style>
<!-- container S : -->
<div class="container">
<div class = "container_subWrap">
		<div class="login">
		  
		  <!--   <form method="post" action="">
		     <ul>
		       <li>
		         <input type="text" id="id" class="memberId" name="id" placeholder="exam@example.com" required="required" />
		       </li>
		       <li>
		        <input type="password" id="password" name="password" placeholder="Password" required="required" />
		       </li>
		       <li>
		       	<div class ="find" align="center">
			         <a href="#" class="link_lp" onclick="findId()">find id</a>
			         <a href="#none"onclick="findPwd()">find pwd</a>
		       	</div>
		       </li>
		      	<li>
		        <button type="button"  onclick="login()">Login</button>
		      	</li>
		      	<li>
		        <button type="button"  onclick="newAccount()">Join us</button>
		      	</li>
		      	
		      	</ul>
		    </form> -->
		    
		    <form action="#" method="post">
				  <h2>Login</h2>
						<p>
							<label for="Email" class="floatLabel">Email</label>
							<input  id="id" name="id" type="text" class="memberId" placeholder="exam@example.com" required="required">
						</p>
						<p>
							<label for="password" class="floatLabel">Password</label>
							<input id="password" name="password" placeholder="Password" required="required" type="password">
						</p>
						
						<div class="login_sorting">
							<div class ="find" >
								<button type="button" class="link_lp" onclick="findId()">FIND ID</button>
								<button type="button" onclick="findPwd()">FIND PWD</button>
						     <!--     <a href="#" class="link_lp" onclick="findId()">find id</a>
						         <a href="#none"onclick="findPwd()">find pwd</a> -->
					       	</div>
					       	
					       	<div class="login_btn">
					       		<button type="button"  onclick="login()">LOGIN</button>
					        	<button type="button"  onclick="newAccount()">JOIN US</button>
					       	</div>
					    </div>
		       	
						<!-- <p>
					        <button type="button"  onclick="login()">Login</button>
					        <button type="button"  onclick="newAccount()">Join us</button>
						</p> -->
			</form>
			
			
			
			
		      <div class="snsicon" align="center" >
		       <a href="https://kauth.kakao.com/oauth/authorize
							?client_id=954754c02265363c5d9a6b60519b14d3
							&redirect_uri=http://34.64.221.161:8080/CaxiDogi/kakaoLogin.do
							&response_type=code" id="_btnKakao" title="카카오">
			   <!-- <a href="https://kauth.kakao.com/oauth/authorize
							?client_id=954754c02265363c5d9a6b60519b14d3
							&redirect_uri=http://192.168.2.85:8080/CaxiDogi/kakaoLogin.do
							&response_type=code" id="_btnKakao" title="카카오"> -->
		         <img alt="" src="./images/kakao_login.png">
		       </a>
		       
		      </div> 
		       
		      <div class="snsicon" align="center" >
		       <a href="https://nid.naver.com/oauth2.0/authorize
							?client_id=i11QdJzq8f_afJodIjCw
							&redirect_uri=http://34.64.221.161:8080/CaxiDogi/naverLogin.do
							&response_type=code" id="_btnNaver" title="네이버">
		         <img alt="" src="./images/naver__login.png">
		       </a>
		        </div> 
		       
		       <div class="snsicon" align="center" >
		       <a href="https://accounts.google.com/o/oauth2/v2/auth
							?client_id=957946411907-ufnltniu55q10le4b4io0tmrqgsbk8v1.apps.googleusercontent.com
							&scope=https://www.googleapis.com/auth/userinfo.email
							&approval_prompt=force
							&access_type=offline
							&redirect_uri=http://localhost:8080/CaxiDogi/googleLogin.do
							&response_type=code" id="_btnGoogle" title="구글" class="icon-button google-plus">
		          <img alt="" src="./images/google__login.png">
		       </a> 
		        </div> 
		       
		      <!-- <div class="snsicon" align="center" >
		       <a href="https://kauth.kakao.com/oauth/authorize
							?client_id=954754c02265363c5d9a6b60519b14d3
							&redirect_uri=http://34.64.221.161:8080/CaxiDogi/kakaoLogin.do
							&response_type=code" id="_btnKakao" title="카카오">
		         <img alt="" src="./images/iconKakao.png">
		       </a>
		       <a href="https://nid.naver.com/oauth2.0/authorize
							?client_id=i11QdJzq8f_afJodIjCw
							&redirect_uri=http://34.64.221.161:8080/CaxiDogi/naverLogin.do
							&response_type=code" id="_btnNaver" title="네이버">
		         <img alt="" src="./images/iconNaver.png">
		       </a>
		       <a href="https://accounts.google.com/o/oauth2/v2/auth
							?client_id=957946411907-ufnltniu55q10le4b4io0tmrqgsbk8v1.apps.googleusercontent.com
							&scope=https://www.googleapis.com/auth/userinfo.email
							&approval_prompt=force
							&access_type=offline
							&redirect_uri=http://34.64.221.161:8080/CaxiDogi/googleLogin.do
							&response_type=code" id="_btnGoogle" title="구글">
		         <img alt="" src="./images/iconGoogle.png">
		       </a>
		      </div> -->
		</div>
	</div>
	<!-- //subWrap -->
</div>
<%@ include file="./../../../include/footer.jsp" %>
<script src="<%=request.getContextPath() %>/js/login.js"></script>


