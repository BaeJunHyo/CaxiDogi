<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../../../include/bo/bo_header.jsp" %>

<div class="container">
	<div class="login_box">
		<img src="../images/img_logo_login.gif">
		<p>관리자모드 로그인</p>
		<div class="login_form">
			<span class="user_id">
				<label>아이디</label>
				<input type="text">
			</span>
			<span class="user_pw">
				<label>비밀번호</label>
				<input type="password">
			</span>
		</div>
		<span class="select_wrap">
			<input type="checkbox">
			<label>계정정보 기억하기</label>
		</span>
		<a href="#n" class="btn_c02 mt15">로그인</a>
	</div>
</div><!--// container -->

</body>
</html>