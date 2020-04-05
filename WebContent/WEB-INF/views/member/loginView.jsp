<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

html { width: 100%; height:100%; overflow:hidden; }

body { 
	width: 100%;
	height:100%;
	font-family: 'Open Sans', sans-serif;
	background: #e6e6e6;
}
.login { 
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -150px 0 0 -150px;
	width:400px;
	height:400px;
	
}
.login h1 { color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center; }
.login ul{
	list-style: none;
	padding-left: 0px;
}
input { 
	width: 100%; 
	margin-bottom: 10px; 
	background: rgba(0,0,0,0.3);
	border: none;
	outline: none;
	padding: 10px;
	font-size: 13px;
	color: #fff;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
	border: 1px solid rgba(0,0,0,0.3);
	border-radius: 4px;
	box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
	-webkit-transition: box-shadow .5s ease;
	-moz-transition: box-shadow .5s ease;
	-o-transition: box-shadow .5s ease;
	-ms-transition: box-shadow .5s ease;
	transition: box-shadow .5s ease;
}
button {
	width:100%;
	height:50px;
	background: #f2f2f2";
	font:20px;
	border-radius: 10px;
	outline: none;
}
input:focus { box-shadow: inset 0 -5px 45px rgba(100,100,100,0.4), 0 1px 1px rgba(255,255,255,0.2); }

</style>
<div class="login">
	<h1>Login</h1>
  
    <form method="post">
     <ul>
       <li>
         <input type="text" name="u" placeholder="exam@example.com" required="required" />
       </li>
       <li>
        <input type="password" name="p" placeholder="Password" required="required" />
       </li>
       <li>
       	<div align="center">
	         <a href="#none" style="color: #6699ff;margin-right: 20px;">find id</a>
	         <a href="#none"style="color: #6699ff;">find pwd</a>
       	</div>
       </li>
      	<li>
        <button type="button" style="margin-top: 10px; margin-bottom: 5px;font-size: 20px">Login</button>
      	</li>
      	<li>
        <button type="button" style="margin-top: 5px; margin-bottom: 10px;font-size: 20px" onclick="newAccount()">Join us</button>
      	</li>
      	
      	</ul>
    </form>
     <div class="snsicon" align="center" >
       <a href="#none" id="_btnKakao" title="카카오">
         <img alt="" src="./images/iconKakao.png">
       </a>
       <a href="#none" id="_btnNaver" title="네이버">
         <img alt="" src="./images/iconNaver.png">
       </a>
       <a href="#none" id="_btnGoogle" title="구글">
         <img alt="" src="./images/iconGoogle.png">
       </a>
      </div>
</div>
<script>
function newAccount(){
	location.href="newAccount.do";
}

</script>
