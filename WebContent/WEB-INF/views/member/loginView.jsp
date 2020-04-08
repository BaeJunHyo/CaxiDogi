<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%@ include file="./../../../include/header.jsp" %>
<!-- container S : -->
<div class="container">
<div class = "container_subWrap">
		<div class="login">
			<h1>Login</h1>
		  
		    <form method="post" action="">
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
	</div>
	<!-- //subWrap -->
</div>
<%@ include file="./../../../include/footer.jsp" %>
<script src="<%=request.getContextPath() %>/js/login.js"></script>


