<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
String login = (String)request.getAttribute("login");
String regi = (String)request.getAttribute("regi");
String msg = (String)request.getAttribute("msg");
// 로그인 MSG
if(login != null){
	if(login.equals("true")){
%>
<script>
	alert("정상적으로 로그인 되었습니다");
	location.href="main.do";
</script>
<%
	}else{
%>
<script>
	alert("잘못된 로그인 정보입니다");
	location.href="loginView.do"
</script>
<%
	}
}
// 회원가입 MSG
if(regi != null){
	if(regi.equals("true")){
%>
<script>
	if(confirm("정상적으로 회원가입되었습니다 \n 지금 바로 로그인 하시겠습니까?")){
		location.href="loginView.do";
	}else{
		location.href="main.do";
	}
	
</script>
<%
	}else{
%>
<script>
	alert("회원가입에 실패하였습니다");
	location.href="newAccount.do";
</script>
<%
	}
}

// 그외 MSG
if(msg != null){
%>
<script>
	alert("<%=msg%>");
	location.href="main.do";
</script>
<%
}
%>				